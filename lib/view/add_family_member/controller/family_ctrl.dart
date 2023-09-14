import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/family_response_list_response.dart';
import 'package:staff_app/backend/responses_model/my_profile_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';

class FamilyCtrl extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController idExpiryController = TextEditingController();
  BaseSuccessResponse successResponse = BaseSuccessResponse();
  RxList<FamilyRelationData?>? familyRelationList = <FamilyRelationData>[].obs;
  MyProfileCtrl myProfileCtrl = Get.find<MyProfileCtrl>();
  final formKey = GlobalKey<FormState>();
  Rx<File?>? selectedFile = File("").obs;
  RxString selectedCountryCode = "971".obs;

  setData({required FamilyMembers? data}){
    nameController.text = data?.fullName??"";
    relationController.text = data?.relation??"";
    dobController.text = formatBackendDate(data?.dob??"",getDayFirst: true);
    mobileController.text = (data?.mobile??"").toString().split(" ").last;
    selectedCountryCode.value = ((data?.mobile??"").toString().split(" ").first).replaceAll("+", "");
    idController.text = "image1.png";
    idExpiryController.text = formatBackendDate(data?.emirateIdExpire??"");
  }

  getRelationList() async {
    familyRelationList?.clear();
    await BaseAPI().get(url: ApiEndPoints().getFamilyRelation).then((value){
      if (value?.statusCode ==  200) {
        familyRelationList?.value = FamilyRelationListResponse.fromJson(value?.data).data ?? <FamilyRelationData>[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  addFamilyMember() async {
    if (formKey.currentState?.validate()??false) {
      if (selectedCountryCode.value.isNotEmpty) {
        var data;
        if ((selectedFile?.value?.path??"").isNotEmpty) {
          data = dio.FormData.fromMap({
            "fullName": nameController.text.trim(),
            "relation": relationController.text.trim(),
            "dob": flipDate(date: dobController.text.trim()),
            "mobile": "+${selectedCountryCode} ${(mobileController.text.trim())}",
            "emirateId": myProfileCtrl.response.value.data?.emirateId??"",
            "emirateIdExpire": flipDate(date: idExpiryController.text.trim()),
            "language": myProfileCtrl.response.value.data?.nativeLanguage??"",
            "document": await dio.MultipartFile.fromFile(selectedFile?.value?.path ?? "", filename: selectedFile?.value?.path.split("/").last??""),
          });
        }else{
          data = dio.FormData.fromMap({
            "fullName": nameController.text.trim(),
            "relation": relationController.text.trim(),
            "dob": flipDate(date: dobController.text.trim()),
            "mobile": "+${selectedCountryCode} ${(mobileController.text.trim())}",
            "emirateId": myProfileCtrl.response.value.data?.emirateId??"",
            "emirateIdExpire": flipDate(date: idExpiryController.text.trim()),
            "language": myProfileCtrl.response.value.data?.nativeLanguage??"",
          });
        }
        BaseAPI().post(url: ApiEndPoints().createFamilyMember, data: data).then((value){
          if (value?.statusCode == 200) {
            successResponse = BaseSuccessResponse.fromJson(value?.data);
            Get.back();
            BaseOverlays().showSnackBar(message: successResponse.message??"",title: translate(Get.context!).success);
            myProfileCtrl.getData();
          }else{
            // BaseDialogs().showSnackBar(message: ,title: response.message??"");
          }
        });
      }else{
        baseToast(message: "Please Select Country Code");
      }
    }
  }

  updateFamilyMember({required String familyMemberId}) async {
    if (formKey.currentState?.validate() ?? false) {
      var data;
      if ((selectedFile?.value?.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          "fullName": nameController.text.trim(),
          "relation": relationController.text.trim(),
          "dob": flipDate(date: dobController.text.trim()),
          "mobile": "+${selectedCountryCode} ${(mobileController.text.trim())}",
          "emirateId": myProfileCtrl.response.value.data?.emirateId??"",
          "emirateIdExpire": flipDate(date: idExpiryController.text.trim()),
          "language": myProfileCtrl.response.value.data?.nativeLanguage??"",
          "document": await dio.MultipartFile.fromFile(selectedFile?.value?.path ?? "", filename: selectedFile?.value?.path.split("/").last??""),
        });
      }else{
        data = dio.FormData.fromMap({
          "fullName": nameController.text.trim(),
          "relation": relationController.text.trim(),
          "dob": flipDate(date: dobController.text.trim()),
          "mobile": "+${selectedCountryCode} ${(mobileController.text.trim())}",
          "emirateId": myProfileCtrl.response.value.data?.emirateId??"",
          "emirateIdExpire": flipDate(date: idExpiryController.text.trim()),
          "language": myProfileCtrl.response.value.data?.nativeLanguage??"",
        });
      }
      BaseAPI().patch(url: ApiEndPoints().editFamilyMember + familyMemberId, data: data).then((value){
        if (value?.statusCode == 200) {
          successResponse = BaseSuccessResponse.fromJson(value?.data);
          Get.back();
          BaseOverlays().showSnackBar(message: successResponse.message??"",title: translate(Get.context!).success);
          myProfileCtrl.getData();
        }else{
          // BaseDialogs().showSnackBar(message: ,title: response.message??"");
        }
      });
    }
  }
}