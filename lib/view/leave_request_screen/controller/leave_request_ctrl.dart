import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:image_picker/image_picker.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/leave_balance_response.dart';
import 'package:staff_app/backend/responses_model/leave_request_response.dart';
import 'package:staff_app/backend/responses_model/leave_type_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class LeaveRequestCtrl extends GetxController{

  RxList<LeaveRequestData>? list = <LeaveRequestData>[].obs;
  RxList<LeaveTypeData>? leaveTypeList = <LeaveTypeData>[].obs;
  RxList<LeaveBalanceData>? leaveBalanceList = <LeaveBalanceData>[].obs;
  RxList<String> statusTime = [""].obs;
  RxList<String> statusTitle = [""].obs;
  RxBool isLeaveBalanceLoading = true.obs;
  RxString selectedSchoolId = "".obs;
  RxString selectedLeaveTypeId = "".obs;
  Rx<File>? selectedFile = File("").obs;
  final formKey = GlobalKey<FormState>();
  Rx<XFile> xFile = XFile("").obs;
  Rx<TextEditingController> selectSchoolController = TextEditingController().obs;
  Rx<TextEditingController> leaveTypeController = TextEditingController().obs;
  Rx<TextEditingController> startDateController = TextEditingController().obs;
  Rx<TextEditingController> endDateController = TextEditingController().obs;
  Rx<TextEditingController> reasonController = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    get();
    getLeaveTypes();
  }

  setData({required bool isUpdating}){
    if(isUpdating){

    }else{
      selectSchoolController.value.clear();
      leaveTypeController.value.clear();
      startDateController.value.clear();
      endDateController.value.clear();
      reasonController.value.clear();
      uploadController.value.clear();
      xFile.value = XFile("");
      selectedFile?.value = File("");
      selectedSchoolId.value = "";
      selectedLeaveTypeId.value = "";
    }
  }

  get(){
    list?.value = [];
    BaseAPI().get(url: ApiEndPoints().getLeaveRequests,queryParameters: {
      "typeOfRequest":"leave",
      "school":selectedSchoolId.value,
      "leaveType":selectedLeaveTypeId.value,
    }).then((value){
      if (value?.statusCode ==  200) {
        list?.value = LeaveRequestResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  uploadEvidence({required String id}) async {
    if ((selectedFile?.value.path??"").isNotEmpty) {
      BaseOverlays().dismissOverlay();
      final String userId = await BaseSharedPreference().getString(SpKeys().userId);
      BaseSuccessResponse response = BaseSuccessResponse();
      dio.FormData data = dio.FormData.fromMap({
        "user[0]": userId,
        "typeOfRequest": "leave",
        "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"",filename: selectedFile?.value.path.split("/").last??"")
      });
    BaseAPI().put(url: ApiEndPoints().uploadEvidence+id,data: data).then((value){
      if (value?.statusCode ==  200) {
        response = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: response.message??"", title: "Success");
        get();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
    }
  }

  delete({required String id,required int index}){
    BaseOverlays().dismissOverlay();
    BaseSuccessResponse response = BaseSuccessResponse();
    BaseAPI().delete(url: ApiEndPoints().deleteLeaveRequest+id).then((value){
      if (value?.statusCode ==  200) {
        list?.removeAt(index);
        response = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: response.message??"",title: "Success");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  getLeaveTypes(){
    BaseAPI().get(url: ApiEndPoints().getLeaveTypes).then((value){
      if (value?.statusCode ==  200) {
        leaveTypeList?.value = LeaveTypeResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  create() async {
    if (formKey.currentState?.validate()??false) {
      BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
      dio.FormData data;
      final String userId = await BaseSharedPreference().getString(SpKeys().userId);
      if ((selectedFile?.value.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          "user[0]": userId,
          "school":selectedSchoolId.value,
          "leaveType":selectedLeaveTypeId.value,
          "startDate":getFormattedDate2(startDateController.value.text.trim()),
          "endDate":getFormattedDate2(endDateController.value.text.trim()),
          "reason":reasonController.value.text.trim(),
          "typeOfRequest":"leave",
          "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"",filename: selectedFile?.value.path.split("/").last??"")
        });
      }else{
        data = dio.FormData.fromMap({
          "user[0]": userId,
          "school":selectedSchoolId.value,
          "leaveType":selectedLeaveTypeId.value,
          "startDate":getFormattedDate2(startDateController.value.text.trim()),
          "endDate":getFormattedDate2(endDateController.value.text.trim()),
          "typeOfRequest":"leave",
          "reason":reasonController.value.text.trim(),
        });
      }
      BaseAPI().post(url: ApiEndPoints().createLeaveRequest, data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
          BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: "Success");
          selectedSchoolId.value = "";
          selectedLeaveTypeId.value = "";
          get();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
        selectedFile?.value = File("");
      });
    }
  }

  getLeaveBalance() async {
    leaveBalanceList?.clear();
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    var data = {
      "page":1,
      "limit":100,
      "userId":userId
    };
    BaseAPI().post(url: ApiEndPoints().getLeaveBalance,data: data,showLoader: false).then((value){
      if (value?.statusCode ==  200) {
        leaveBalanceList?.value = LeaveBalanceResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
    isLeaveBalanceLoading.value = false;
  }
}