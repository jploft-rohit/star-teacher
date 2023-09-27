import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/all_feedback_help_response.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/staff_list_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class FeedbackHelpController extends GetxController{
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  /// Variables
  RxList<Data>? response = <Data>[].obs;
  RxList<String> statusTime = <String>[].obs;
  RxList<String> statusTitle = <String>[].obs;
  List<StaffListData> staffData = [];
  RxBool isStaffLoading = false.obs;
  RxString selectedPersonId = "".obs;
  RxString selectedSchoolId = "".obs;
  RxInt selectedTabIndex = 0.obs;
  Rx<File>? selectedFile = File("").obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);
  final formKey = GlobalKey<FormState>();
  /// Model Class Objects
  BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
  /// Text Controllers
  Rx<TextEditingController> schoolController = TextEditingController().obs;
  Rx<TextEditingController> typeController = TextEditingController().obs;
  Rx<TextEditingController> personController = TextEditingController().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> messageController = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;
  Rx<TextEditingController> deleteReasonController = TextEditingController().obs;

  /// Pagination
  RxInt page = 1.obs;


  @override
  void onInit() {
    super.onInit();
    selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
    schoolController.value.text = baseCtrl.schoolListData.data?.data?.first.name??"";
    getData();
  }

  setData({required bool isUpdating,Data? data}){
    if(isUpdating){
      selectedFile?.value = File("");
      baseCtrl.schoolListData.data?.data?.forEach((element) {
        if ((element.sId??"") == (data?.school??"")) {
          schoolController.value.text = element.name??"";
          selectedSchoolId.value = data?.school??"";
        }
      });
      typeController.value.text = data?.forEnquery??"";
      personController.value.text = data?.person?.name??"";
      titleController.value.text = data?.title??"";
      messageController.value.text = data?.description??"";
      uploadController.value.text = data?.document??"";
      selectedPersonId.value = data?.person?.sId??"";
    }else{
      typeController.value.text = "";
      personController.value.text = "";
      typeController.value.text = "";
      titleController.value.text = "";
      messageController.value.text = "";
      uploadController.value.text = "";
      selectedPersonId.value = "";
      schoolController.value.text = "";
      selectedSchoolId.value = "";
      selectedFile?.value = File("");
    }
  }

  getStaffData({required String selectedRoleId, required String selectedSchoolId}){
    isStaffLoading.value = true;
    staffData = [];
    var data = {
      "school" : selectedSchoolId,
      "roleName" : selectedRoleId
    };
    BaseAPI().get(url: ApiEndPoints().getStaffData, queryParameters: data, showLoader: false).then((value){
      if (value?.statusCode ==  200) {
        isStaffLoading.value = false;
        staffData = StaffListResponse.fromJson(value?.data).data??[];
        // selectedPersonId.value = staffData.first.sId??"";
        // selectedPersonName.value = staffData.first.user?.name??"";
      }else{
        isStaffLoading.value = false;
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
      }
    });
  }

  updateApi({required String itemId,school,forEnquiry,title,description,document,user}) async {
    if (formKey.currentState?.validate()??false) {
      dio.FormData data;
      if ((selectedFile?.value.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          'school': selectedSchoolId.value,
          'forEnquery': typeController.value.text.trim().toLowerCase(),
          'person': selectedPersonId.value,
          'title': titleController.value.text.trim(),
          'description': messageController.value.text.trim(),
          "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"", filename: selectedFile?.value.path.split("/").last??"")
        });
      }else{
        data = dio.FormData.fromMap({
          'school': selectedSchoolId.value,
          'forEnquery': typeController.value.text.trim().toLowerCase(),
          'person': selectedPersonId.value,
          'title': titleController.value.text.trim(),
          'description': messageController.value.text.trim()
        });
      }
      BaseAPI().post(url: ApiEndPoints().updateFeedbackHelp+itemId, data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: "Updated Successfully",title: translate(Get.context!).success);
          selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
          schoolController.value.text = baseCtrl.schoolListData.data?.data?.first.name??"";
          getData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
        }
      });
    }
  }

  create({school,forEnquiry,complaintUser,title,description,document,user}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    if (formKey.currentState?.validate()??false) {

      dio.FormData data;
      if ((selectedFile?.value.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          'school': school.toString(),
          'forEnquery': forEnquiry,
          'person': complaintUser.toString(),
          'title': title,
          'description': description,
          'user': userId.toString(),
          "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"", filename: selectedFile?.value.path.split("/").last??"")
        });
      }else{
        data = dio.FormData.fromMap({
          'school': school.toString(),
          'forEnquery': forEnquiry,
          'person': complaintUser.toString(),
          'title': title,
          'description': description,
          'user': userId.toString(),
        });
      }

      BaseAPI().post(url: ApiEndPoints().createFeedbackHelp,
          data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: "Created Successfully",title: translate(Get.context!).success);
          selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
          schoolController.value.text = baseCtrl.schoolListData.data?.data?.first.name??"";
          getData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
        }
      });
    }
  }

  getData({String? type}){
    if (type == 'refresh' || type == null) {
      response?.value = [];
      refreshController.loadComplete();
      page.value = 1;
    } else if (type == 'load') {
      page.value++;
    }
    BaseAPI().get(
        url: ApiEndPoints().getAllFeedbackHelp,
        queryParameters: {
          "type": selectedTabIndex.value == 0 ? "" : selectedTabIndex.value == 1 ? "help" : "feedback",
          "school":selectedSchoolId.value,
          "limit":apiItemLimit,
          "page":page.value.toString()
        },
        showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
          if(type == 'refresh'){
            response?.value = [];
            refreshController.loadComplete();
            refreshController.refreshCompleted();
          }else if((AllFeedbackHelpResponse.fromJson(value?.data).data??[]).isEmpty && type == 'load'){
            refreshController.loadNoData();
          }
          else if(type == 'load'){
            refreshController.loadComplete();
          }
          response?.addAll(AllFeedbackHelpResponse.fromJson(value?.data).data??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  deleteItem({required String id, required int index}){
    BaseOverlays().dismissOverlay();
    BaseAPI().delete(url: ApiEndPoints().deleteFeedbackHelp+id).then((value){
      if (value?.statusCode ==  200) {
        response?.removeAt(index);
        BaseOverlays().showSnackBar(message: "Deleted Successfully",title: translate(Get.context!).success);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  acceptItem({required String itemId}){
    BaseAPI().get(url: ApiEndPoints().acceptFeedbackHelp+itemId).then((value){
      if (value?.statusCode ==  200) {
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"", title: translate(Get.context!).success);
        getData();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
      }
    });
  }

  sendComment({required String itemId,required String comment}){
    var data = {
      "type" : "self",
      "reply" : comment.toString()
    };
    BaseAPI().post(url: ApiEndPoints().sendCommentFeedbackHelp+itemId,data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().dismissOverlay();
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"", title: translate(Get.context!).success);
        getData();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
      }
    });
  }

}