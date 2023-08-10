import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/early_leave_response.dart';
import 'package:staff_app/backend/responses_model/online_class_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class OnlineClassRequestController extends GetxController{


  RxString selectedSchoolId = "".obs;
  Rx<File>? selectedFile = File("").obs;
  final formKey = GlobalKey<FormState>();
  RxList<OnlineClassRequestData?>? list = <OnlineClassRequestData>[].obs;
  TextEditingController schoolController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController uploadController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  setData({bool? isUpdating, OnlineClassRequestData? data}){
    if(isUpdating??false){
      schoolController.text = data?.school?.name??"";
      fromDateController.text = formatBackendDate(data?.startDate??"",getDayFirst: true);
      toDateController.text = formatBackendDate(data?.endDate??"",getDayFirst: true);
      reasonController.text = data?.reason??"";
      uploadController.text = (data?.document??"").split("/").last??"";
      selectedSchoolId.value = data?.school?.sId??"";
      selectedFile?.value = File("");
    }else{
      schoolController.clear();
      fromDateController.clear();
      toDateController.clear();
      reasonController.clear();
      uploadController.clear();
      selectedSchoolId.value = "";
      selectedFile?.value = File("");

    }
  }

  getData(){
    list?.clear();
    BaseAPI().get(url: ApiEndPoints().getOnlineClassRequests, queryParameters: {"school" : selectedSchoolId.value,"limit":100}).then((value){
      if (value?.statusCode ==  200) {
        list?.value = OnlineClassResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
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
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
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
          "typeOfRequest":"onlineClass",
          "startDate":flipDate(date: fromDateController.text.trim()),
          "endDate":flipDate(date: toDateController.text.trim()),
          "reason":reasonController.text.trim(),
          "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"", filename: selectedFile?.value.path.split("/").last??"")
        });
      }else{
        data = dio.FormData.fromMap({
          "school" : selectedSchoolId.value,
          "user[0]":userId,
          "typeOfRequest":"onlineClass",
          "startDate":flipDate(date: fromDateController.text.trim()),
          "endDate":flipDate(date: toDateController.text.trim()),
          "reason":reasonController.text.trim(),
        });
      }
      BaseAPI().post(url: ApiEndPoints().createOnlineClassRequest, data: data).then((value) async {
        if (value?.statusCode ==  200) {
          selectedSchoolId.value = "";
          schoolController.clear();
          Get.back();
          BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
          getData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
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
          "typeOfRequest":"onlineClass",
          "startDate":flipDate(date: fromDateController.text.trim()),
          "endDate":flipDate(date: toDateController.text.trim()),
          "reason":reasonController.text.trim(),
          "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"", filename: selectedFile?.value.path.split("/").last??"")
        });
      }else{
        data = dio.FormData.fromMap({
          "school" : selectedSchoolId.value,
          "user[0]":userId,
          "typeOfRequest":"onlineClass",
          "startDate":flipDate(date: fromDateController.text.trim()),
          "endDate":flipDate(date: toDateController.text.trim()),
          "reason":reasonController.text.trim(),
        });
      }
      BaseAPI().put(url: ApiEndPoints().updateOnlineClassRequest+id, data: data).then((value) async {
        if (value?.statusCode ==  200) {
          fromDateController.clear();
          toDateController.clear();
          uploadController.clear();
          reasonController.clear();
          selectedSchoolId.value = "";
          Get.back();
          BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
          getData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
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
        "typeOfRequest": "onlineClass",
        "startDate":fromDateController.text.trim(),
        "endDate":toDateController.text.trim(),
        "reason":reasonController.text.trim(),
        "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"",filename: selectedFile?.value.path.split("/").last??"")
      });
      BaseAPI().put(url: ApiEndPoints().uploadEvidence+id,data: data).then((value){
        fromDateController.clear();
        toDateController.clear();
        uploadController.clear();
        reasonController.clear();
        selectedSchoolId.value = "";
        selectedFile?.value = File("");
        if (value?.statusCode ==  200) {
          response = BaseSuccessResponse.fromJson(value?.data);
          BaseOverlays().showSnackBar(message: response.message??"", title: translate(Get.context!).success);
          getData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
        }
      });
    }
  }
}