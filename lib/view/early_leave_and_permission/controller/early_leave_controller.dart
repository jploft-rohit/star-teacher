import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/early_leave_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

import '../../../utility/sizes.dart';

class EarlyLeaveController extends GetxController{

  RxList<EarlyLeaveData?>? list = <EarlyLeaveData>[].obs;
  RxString selectedSchoolId = "".obs;
  Rx<File>? selectedFile = File("").obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController schoolController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController outTimeController = TextEditingController();
  TextEditingController inTimeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController uploadController = TextEditingController();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
    schoolController.text = baseCtrl.schoolListData.data?.data?.first.name??"";
    getData();
  }

  setData({bool? isUpdating, EarlyLeaveData? data}){
    if(isUpdating??false){
      schoolController.text = data?.school?.name??"";
      dateController.text =  formatBackendDate(data?.date??"",getDayFirst: true);
      outTimeController.text = getFormattedTime3(data?.outTime??"")+":00";
      inTimeController.text = getFormattedTime3(data?.inTime??"")+":00";
      reasonController.text = data?.reason??"";
      uploadController.text = (data?.document??"").split("/").last??"";
      selectedSchoolId.value = data?.school?.sId??"";
    }else{
      schoolController.clear();
      dateController.clear();
      outTimeController.clear();
      inTimeController.clear();
      reasonController.clear();
      uploadController.clear();
      selectedSchoolId.value = "";
      selectedFile?.value = File("");
    }
  }

  getData({String? refreshType}){
    if (refreshType == 'refresh' || refreshType == null) {
      list?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    BaseAPI().get(url: ApiEndPoints().getEarlyLeaves, queryParameters: {
      "school" : selectedSchoolId.value,
      "limit":apiItemLimit,
      "page":page.value.toString()
    },showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        // list?.value = EarlyLeaveResponse.fromJson(value?.data).data??[];
        if(refreshType == 'refresh'){
          list?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((EarlyLeaveResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        list?.addAll(EarlyLeaveResponse.fromJson(value?.data).data??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  deleteData({required String id, required int index}){
    BaseOverlays().dismissOverlay();
    BaseSuccessResponse response = BaseSuccessResponse();
    BaseAPI().delete(url: ApiEndPoints().deleteEarlyLeave+id).then((value){
      if (value?.statusCode ==  200) {
        list?.removeAt(index);
        response = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: response.message??"",title: translate(Get.context!).success);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  createData() async {
    if (formKey.currentState?.validate()??false) {
      final String userId = await BaseSharedPreference().getString(SpKeys().userId);
      dio.FormData data;
      if ((selectedFile?.value.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          "school" : selectedSchoolId.value,
          "user[0]":userId,
          "typeOfRequest":"earlyLeave",
          "date":flipDate(date: dateController.text.trim()),
          "outTime":outTimeController.text.trim(),
          "inTime":inTimeController.text.trim(),
          "reason":reasonController.text.trim(),
          "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"", filename: selectedFile?.value.path.split("/").last??"")
        });
      }else{
        data = dio.FormData.fromMap({
          "school" : selectedSchoolId.value,
          "user[0]":userId,
          "typeOfRequest":"earlyLeave",
          "date":flipDate(date: dateController.text.trim()),
          "outTime":outTimeController.text.trim(),
          "inTime":inTimeController.text.trim(),
          "reason":reasonController.text.trim(),
        });
      }
      BaseAPI().post(url: ApiEndPoints().createEarlyLeave, data: data).then((value) async {
        if (value?.statusCode ==  200) {
          selectedSchoolId.value = "";
          schoolController.clear();
          Get.back();
          BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
          getData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }

  updateData({required String id}) async {
    if (formKey.currentState?.validate()??false) {
      final String userId = await BaseSharedPreference().getString(SpKeys().userId);
      dio.FormData data;
      if ((selectedFile?.value.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          "school" : selectedSchoolId.value,
          "user[0]":userId,
          "typeOfRequest":"earlyLeave",
          "date":flipDate(date: dateController.text.trim()),
          "outTime":outTimeController.text.trim(),
          "inTime":inTimeController.text.trim(),
          "reason":reasonController.text.trim(),
          "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"", filename: selectedFile?.value.path.split("/").last??"")
        });
      }else{
        data = dio.FormData.fromMap({
          "school" : selectedSchoolId.value,
          "user[0]":userId,
          "typeOfRequest":"earlyLeave",
          "date":flipDate(date: dateController.text.trim()),
          "outTime":outTimeController.text.trim(),
          "inTime":inTimeController.text.trim(),
          "reason":reasonController.text.trim(),
        });
      }
      BaseAPI().put(url: ApiEndPoints().updateEarlyLeave+id, data: data).then((value) async {
        if (value?.statusCode ==  200) {
          selectedSchoolId.value = "";
          schoolController.clear();
          Get.back();
          BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
          getData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }

  uploadEvidence({required String id}) async {
    if ((selectedFile?.value.path??"").isNotEmpty) {
      BaseOverlays().dismissOverlay();
      final String userId = await BaseSharedPreference().getString(SpKeys().userId);
      BaseSuccessResponse response = BaseSuccessResponse();
      dio.FormData data = dio.FormData.fromMap({
        "user[0]": userId,
        "typeOfRequest": "earlyLeave",
        "outTime":outTimeController.text.trim(),
        "inTime":inTimeController.text.trim(),
        "reason":reasonController.text.trim(),
        "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"",filename: selectedFile?.value.path.split("/").last??"")
      });
      BaseAPI().put(url: ApiEndPoints().uploadEvidence+id,data: data).then((value){
        if (value?.statusCode ==  200) {
          response = BaseSuccessResponse.fromJson(value?.data);
          BaseOverlays().showSnackBar(message: response.message??"", title: translate(Get.context!).success);
          getData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }
}