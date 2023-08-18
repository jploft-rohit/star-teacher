import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/chat_history_response.dart';
import 'package:staff_app/backend/responses_model/chat_message_model.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/intl/src/intl/date_format.dart';

class ChatScreenCtrl extends GetxController{
  io.Socket? socket;
  RxInt primarySelectedIndex = 0.obs;
  RxInt secondarySelectedIndex = 0.obs;
  RxBool isInitialLoading = true.obs;
  Map<String, dynamic> joinRoomData = {};
  RxList<ChatData>? messageList = <ChatData>[].obs;
  ScrollController scrollController = ScrollController();
  RxList<ChatHistoryData?>? chatHistoryList = <ChatHistoryData>[].obs;

  String formatDateToTodayOrYesterday(String inputDate) {
    DateTime date = DateTime.parse(inputDate);
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(Duration(days: 1));

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

  getChatHistory() async {
    chatHistoryList?.clear();
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    var data = {
      "school":"",
      "type": primarySelectedIndex.value == 0 ? "star" : primarySelectedIndex.value == 1 ? "parent" : primarySelectedIndex.value == 2 ? "staff" : "admin",
      "keyword":""
    };
    BaseAPI().get(url: (ApiEndPoints().getChatList)+(userId), queryParameters: data).then((value){
      if (value?.statusCode ==  200) {
        chatHistoryList?.value = ChatHistoryResponse.fromJson(value?.data).data??[];
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  getGroupChatHistory() async {
    chatHistoryList?.clear();
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    var data = {
      "school":"",
      "type": primarySelectedIndex.value == 0 ? "star" : primarySelectedIndex.value == 1 ? "parent" : primarySelectedIndex.value == 2 ? "staff" : "admin",
      "keyword":""
    };
    BaseAPI().get(url: (ApiEndPoints().getGroupChatList)+(userId), queryParameters: data).then((value){
      if (value?.statusCode ==  200) {
        chatHistoryList?.value = ChatHistoryResponse.fromJson(value?.data).data??[];
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  connectSocket({required String receiverId, required String schoolId}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    socket = io.io("https://stars.tasksplan.com:4000",
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
        if(joinRoomData == null || joinRoomData.isEmpty) {
          joinRoomData = json.decode(data);
          socket?.emitWithAck("CHAT_DETAIL_NEW",
              {joinRoomData["data"]["roomId"], userId,receiverId},
              ack: (data) {
                print("CHAT_DETAIL_NEW:- $data");
              });
          socket?.on("CHAT_DETAIL_RESPONSE_NEW", (data) {
            print("CHAT_DETAIL_RESPONSE_NEW:- $data");
            messageList?.clear();
            messageList?.value = MessageListResponse.fromJson(jsonDecode(data)).data?.chatData?.toList()  ?? [];
            print(messageList?.length??0);
            if (isInitialLoading.value) {
              BaseOverlays().dismissOverlay();
              isInitialLoading.value = false;
            }
            Future.delayed(const Duration(milliseconds: 500), () {
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 300),
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
    socket = io.io("https://stars.tasksplan.com:4000",
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
        // if(joinRoomData == null || joinRoomData.isEmpty) {
        //   joinRoomData = json.decode(data);
          // socket?.emitWithAck("GROUP_CHAT_DETAIL_NEW",
          //     {joinRoomData["data"]["roomId"], userId,receiverId},
          //     ack: (data) {
          //       print("GROUP_CHAT_DETAIL_NEW:- $data");
          //     });
          // socket?.on("CHAT_DETAIL_RESPONSE_NEW", (data) {
          //   print("CHAT_DETAIL_RESPONSE_NEW:- $data");
          //
          // });
          messageList?.clear();
          messageList?.value = MessageListResponse.fromJson(jsonDecode(data)).data?.chatData?.toList()  ?? [];
          print(messageList?.length??0);
          if (isInitialLoading.value) {
            BaseOverlays().dismissOverlay();
            isInitialLoading.value = false;
          }
          Future.delayed(const Duration(milliseconds: 500), () {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          });
      },
      );
    },
    );
    socket?.onDisconnect((_) {
      print("Socket Disconnect");
      connectGroupSocket(reqRoomId: reqRoomId);
    });
    socket?.onConnectError((_) {
      print("Socket Connection Error: $_");
      // connectSocket();
    });
    socket?.on('error', (data) {
      print(data+"_________");
    });
  }

  sendGroupMessage({String? roomId, String? message, String? type,String? groupId }) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    try {
      socket?.emitWithAck("NEW_GROUP_MESSAGE", {
        "userGroups": groupId,
        "senderId": userId,
        "roomId": roomId,
        "message": message,
        "type": "text"
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