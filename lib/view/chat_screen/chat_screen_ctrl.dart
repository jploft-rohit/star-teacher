import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/chat_history_response.dart';
import 'package:staff_app/backend/responses_model/chat_message_model.dart';
import 'package:staff_app/backend/responses_model/group_info_response.dart';
import 'package:staff_app/backend/responses_model/staff_list_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/intl/src/intl/date_format.dart';

import '../../utility/sizes.dart';

class ChatScreenCtrl extends GetxController{
  io.Socket? socket;
  RxBool showEmojiPicker = false.obs;
  final FocusNode focusNode = FocusNode();
  RxBool isStaffLoading = false.obs;
  RxInt primarySelectedIndex = 0.obs;
  RxInt secondarySelectedIndex = 0.obs;
  RxBool isInitialLoading = true.obs;
  RxString selectedRoleId = "".obs;
  RxString selectedRoleName = "".obs;
  RxList<String> selectedGroupUserID = <String>[].obs;
  RxList<String> selectedGroupUserNames = <String>[].obs;
  Map<String, dynamic> joinRoomData = {};
  RxList<StaffListData> staffData = <StaffListData>[].obs;
  RxList<ChatData>? messageList = <ChatData>[].obs;
  RxList<ChatData>? copiedMessageList = <ChatData>[].obs;
  final formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController uploadController = TextEditingController();
  TextEditingController personController = TextEditingController();
  Rx<File>? selectedFile = File("").obs;
  RxString selectedSchoolId = "".obs;
  RxString selectedSchoolName = "".obs;
  RxList<ChatHistoryData?>? chatHistoryList = <ChatHistoryData>[].obs;
  RxList<GroupDataList>? groupData = <GroupDataList>[].obs;
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showEmojiPicker.value = false;
        scrollToEnd();
      }
    });
  }

  scrollToEnd() {
    Future.delayed(const Duration(milliseconds: 0), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    });
  }

  setData({ChatHistoryData? data}){
    if (data != null) {
      selectedSchoolId.value = data.school?.sId??"";
      schoolController.text = data.school?.name??"";
      selectedRoleId.value = data.role?.sId??"";
      selectedRoleName.value = data.role?.name??"";
      if ((data.groupUsers??[]).isNotEmpty) {
        data.groupUsers.forEach((element) {
          selectedGroupUserID.add(element);
        });
      }
      selectedGroupUserNames.value = [];
      (data.groupUserData??[]).forEach((element) {
        selectedGroupUserNames.add(element["name"]);
      });
      titleController.text = data.message?.message??"";
      personController.text = selectedGroupUserNames.join(",");
    }else{
      selectedFile?.value = File("");
      selectedRoleId.value = "";
      selectedRoleName.value = "";
      selectedGroupUserID.value = [];
      selectedGroupUserNames.value = [];
      titleController.clear();
      uploadController.clear();
      personController.clear();
      isStaffLoading.value = false;
    }
  }

  String formatDateToTodayOrYesterday(String inputDate) {
    DateTime date = DateTime.parse(inputDate);
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));

    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return 'Today';
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday';
    } else {
      // Format the date using intl package if it's not today or yesterday
      return DateFormat('MMMM d, y').format(date);
    }
  }

  getStaffData({required String selectedRoleId}){
    isStaffLoading.value = true;
    staffData.value = [];
    var data = {
      "school" : selectedSchoolId.value,
      "roleName" : selectedRoleId
    };
    BaseAPI().get(url: ApiEndPoints().getStaffData, queryParameters: data, showLoader: false).then((value){
      if (value?.statusCode ==  200) {
        isStaffLoading.value = false;
        staffData.value = StaffListResponse.fromJson(value?.data).data??[];
      }else{
        isStaffLoading.value = false;
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
      }
     },
    );
  }

  deleteGroup({required String groupID}){
    BaseOverlays().dismissOverlay();
    BaseAPI().post(url: (ApiEndPoints().deleteGroup)+(groupID)).then((value){
      if (value?.statusCode ==  200) {
        Get.back();
        Get.back();
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message, title: "Success");
        getGroupChatHistory();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
      }
    });
  }

  removeGroupUser({required String groupId, required int index, required String userId}){
    BaseOverlays().dismissOverlay();
    var data = {
      "userId":userId
    };
    BaseAPI().post(url: (ApiEndPoints().removeGroupUser)+(groupId),data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message, title: "Success");
        groupData?.removeAt(index);
        groupData?.refresh();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
    });
  }

  updateGroup({required String groupId}) async {
    BaseOverlays().dismissOverlay();
    dio.FormData data;
    if ((selectedFile?.value.path??"").isNotEmpty) {
      data = dio.FormData.fromMap({
        "title": titleController.text.trim(),
        "groupUsers": selectedGroupUserID.join(","),
        "groupProfile": await dio.MultipartFile.fromFile(
          selectedFile?.value.path ?? "",
          filename: selectedFile?.value.path.split("/").last??"",
        ),
      });
    }else{
      data = dio.FormData.fromMap({
        "title": titleController.text.trim(),
        "groupUsers": selectedGroupUserID.join(","),
      });
    }
    BaseAPI().post(url: (ApiEndPoints().updateGroup)+(groupId),data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message, title: "Success");
        getGroupInfo(groupID: groupId);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
    });
  }

  getChatHistory({String? refreshType}) async {
    // chatHistoryList?.clear();
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    if (refreshType == 'refresh' || refreshType == null) {
      chatHistoryList?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    var data = {
      "school":selectedSchoolId.value,
      "type": primarySelectedIndex.value == 0 ? "star" : primarySelectedIndex.value == 1 ? "parent" : primarySelectedIndex.value == 2 ? "staff" : "admin",
      "keyword":"",
      "limit":apiItemLimit,
      "page":page.value.toString()
    };
    BaseAPI().get(
        url: (ApiEndPoints().getChatList)+(userId),
        queryParameters: data,
        showLoader: page.value == 1
    ).then((value){
      if (value?.statusCode ==  200) {
        // chatHistoryList?.value = ChatHistoryResponse.fromJson(value?.data).data??[];
        if(refreshType == 'refresh'){
          chatHistoryList?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((ChatHistoryResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        chatHistoryList?.addAll(ChatHistoryResponse.fromJson(value?.data).data??[]);
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  getGroupInfo({required String groupID}) async {
    groupData?.clear();
    BaseAPI().get(url: (ApiEndPoints().getGroupInfo)+(groupID)).then((value){
      if (value?.statusCode ==  200) {
        groupData?.value = GroupInfoResponse.fromJson(value?.data).data?.groupDataList??[];
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  getGroupChatHistory({String? refreshType}) async {
    // chatHistoryList?.clear();
    if (refreshType == 'refresh' || refreshType == null) {
      chatHistoryList?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    var data = {
      "school":selectedSchoolId.value,
      // "type": primarySelectedIndex.value == 0 ? "star" : primarySelectedIndex.value == 1 ? "parent" : primarySelectedIndex.value == 2 ? "staff" : "admin",
      "type": "",
      "keyword":"",
      "limit":apiItemLimit,
      "page":page.value.toString()
    };
    BaseAPI().get(url: (ApiEndPoints().getGroupChatList)+(userId), queryParameters: data).then((value){
      if (value?.statusCode ==  200) {
        // chatHistoryList?.value = ChatHistoryResponse.fromJson(value?.data).data??[];
        // chatHistoryList?.refresh();
        if(refreshType == 'refresh'){
          chatHistoryList?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((ChatHistoryResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        chatHistoryList?.addAll(ChatHistoryResponse.fromJson(value?.data).data??[]);
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
     },
    );
  }

  createGroup() async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    dio.FormData data;
    if ((selectedFile?.value.path??"").isNotEmpty) {
      data = dio.FormData.fromMap({
        "title": titleController.text.trim(),
        "groupUsers": selectedGroupUserID.join(","),
        "createdBy": userId,
        "type": "staff",
        "school": selectedSchoolId.value,
        "groupProfile": await dio.MultipartFile.fromFile(
            selectedFile?.value.path ?? "",
            filename: selectedFile?.value.path.split("/").last??"",
        ),
      });
    }else{
      data = dio.FormData.fromMap({
        "title": titleController.text.trim(),
        "groupUsers": selectedGroupUserID.join(","),
        "createdBy": userId,
        "type": "staff",
        "school": selectedSchoolId.value,
      });
    }

    BaseAPI().post(url: (ApiEndPoints().createGroup), data: data).then((value) {
      if (value?.statusCode ==  200) {
        Get.back();
        getGroupChatHistory();
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
     },
    );
  }

  connectSocket({required String receiverId, required String schoolId}) async {
    joinRoomData.clear();
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    socket = io.io(ApiEndPoints().concatBaseUrl,
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
        "force new connection": true,
        "reconnectionAttempt": "Infinity",
        "timeout": 10000,
      },
    );
    socket?.connect();
    socket?.onConnect((data) {
      socket?.emitWithAck("JOIN_ROOM", {userId,receiverId,schoolId}, ack: (data){
        print("JOIN_ROOM:- $data");
      });
      socket?.on("JOIN_ROOM_RESPONSE", (data){
        print("JOIN_ROOM_RESPONSE:- ${json.decode(data)}");
        if(joinRoomData.isEmpty) {
          joinRoomData = json.decode(data);
          socket?.emitWithAck("CHAT_DETAIL_NEW",
              {joinRoomData["data"]["roomId"], userId, receiverId},
              ack: (data) {
                print("CHAT_DETAIL_NEW:- $data");
              },
          );
          socket?.on("CHAT_DETAIL_RESPONSE_NEW", (data) {
            print("CHAT_DETAIL_RESPONSE_NEW:- $data");
            messageList?.clear();
            copiedMessageList?.clear();
            messageList?.value = MessageListResponse.fromJson(jsonDecode(data)).data?.chatData?.toList()  ?? [];
            copiedMessageList?.value = MessageListResponse.fromJson(jsonDecode(data)).data?.chatData?.toList()  ?? [];
            messageList?.refresh();
            copiedMessageList?.refresh();
            if (isInitialLoading.value) {
              isInitialLoading.value = false;
            }
            Future.delayed(const Duration(milliseconds: 500), () {
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            });
            });
        }
      },
     );
    },
  );
    socket?.onDisconnect((_) {
      print("Socket Disconnect");
      connectSocket(receiverId: receiverId, schoolId: schoolId);
    });
    socket?.onConnectError((_) {
      print("Socket Connection Error: $_");
      // connectSocket();
    });
    socket?.on('error', (data) {
      print(data+"_________");
    });
  }

  sendMessage(receiverId, String message, String type) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    try {
      socket?.emitWithAck("NEW_MESSAGE", {
        "roomId": joinRoomData["data"]["roomId"],
        "senderId": userId,
        "receiverId": receiverId,
        "message": message,
        "type": type
      }, ack: (data) {
        print("NEW_MESSAGE:- $data");
      });
      socket?.on("NEW_MESSAGE_RESPONSE", (data) {
        print("NEW_MESSAGE_RESPONSE:- $data");
        if (jsonDecode(data)['status'] == true) {
          socket?.emitWithAck("CHAT_DETAIL_NEW",{joinRoomData["data"]["roomId"], userId,receiverId}, ack: (data) {
            print("CHAT_DETAIL_NEW:- $data");
          });
        } else {
          baseToast(message: (jsonDecode(data)['message'] ?? ""));
        }
      });
    }catch(_){
      print("Exception....$_....");
    }
  }

  /// Group
  connectGroupSocket({required String reqRoomId}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    socket = io.io(ApiEndPoints().concatBaseUrl,
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
        "force new connection": true,
        "reconnectionAttempt": "Infinity",
        "timeout": 10000,
      },
    );
    socket?.connect();
    socket?.onConnect((data) {
      socket?.emitWithAck("GROUP_CHAT_DETAIL_NEW", {reqRoomId, userId}, ack: (data){
        print("GROUP_CHAT_DETAIL_NEW:- $data");
      });
      socket?.on("GROUP_CHAT_DETAIL_RESPONSE_NEW", (data){
        print("GROUP_CHAT_DETAIL_RESPONSE_NEW:- ${json.decode(data)}");
        messageList?.clear();
        copiedMessageList?.clear();
        messageList?.value = MessageListResponse.fromJson(jsonDecode(data)).data?.chatData?.toList()  ?? [];
        copiedMessageList?.value = MessageListResponse.fromJson(jsonDecode(data)).data?.chatData?.toList()  ?? [];
        messageList?.refresh();
        copiedMessageList?.refresh();
          // BaseOverlays().dismissOverlay();
        Future.delayed(const Duration(milliseconds: 500), () {
            // scrollController.animateTo(
            //   scrollController.position.maxScrollExtent,
            //   duration: const Duration(milliseconds: 300),
            //   curve: Curves.easeIn,
            // );
          });
       },
      );
     },
    );
    socket?.onDisconnect((_) {
      // BaseOverlays().dismissOverlay();
      print("Socket Disconnect");
      // connectGroupSocket(reqRoomId: reqRoomId);
    });
    socket?.onConnectError((_) {
      // BaseOverlays().dismissOverlay();
      print("Socket Connection Error: $_");
      // connectSocket();
    });
    socket?.on('error', (data) {
      // BaseOverlays().dismissOverlay();
      print(data+"_________");
    });
  }

  getUploadedMediaUrl({required String type, String? roomId, String? groupId}) async {
    dio.FormData data = dio.FormData.fromMap({
      "media": await dio.MultipartFile.fromFile(
        selectedFile?.value.path ?? "",
        filename: selectedFile?.value.path.split("/").last??"",
      ),
    });
    await BaseAPI().post(url: (ApiEndPoints().getUploadedMediaUrl), data: data).then((value){
      if (value?.statusCode ==  200) {
        sendGroupMessage(message: (value?.data["data"]??""), type: type, roomId: roomId, groupId: groupId);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
    });
  }

  sendGroupMessage({String? roomId, String? message, String? type, String? groupId }) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    try {
      socket?.emitWithAck("NEW_GROUP_MESSAGE", {
        "userGroups": groupId,
        "senderId": userId,
        "roomId": roomId,
        "message": message,
        "type": type??"text"
      }, ack: (data) {
        print("NEW_GROUP_MESSAGE:- $data");
      });
      socket?.on("NEW_GROUP_MESSAGE_RESPONSE", (data) {
        print("NEW_GROUP_MESSAGE_RESPONSE:- $data");
        if (jsonDecode(data)['status'] == true) {
          socket?.emitWithAck("GROUP_CHAT_DETAIL_NEW", {roomId, userId}, ack: (data){
            print("GROUP_CHAT_DETAIL_NEW:- $data");
          });
        } else {
          baseToast(message: (jsonDecode(data)['message'] ?? ""));
        }
      });
    }catch(_){
      print("Exception....$_....");
    }
  }
}