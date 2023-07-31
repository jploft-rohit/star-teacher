import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
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
  MyProfileCtrl myProfileCtrl = Get.find<MyProfileCtrl>();
  final formKey = GlobalKey<FormState>();
  Rx<File?>? selectedFile = File("").obs;

  setData({required FamilyMembers? data}){
    nameController.text = data?.fullName??"";
    relationController.text = data?.relation??"";
    dobController.text = formatBackendDate(data?.dob??"",getDayFirst: false);
    mobileController.text = data?.mobile??"";
    idController.text = "image1.png";
    idExpiryController.text = data?.emirateIdExpire??"";
  }

  addFamilyMember() async {
    if (formKey.currentState?.validate()??false) {
      var data;
      if ((selectedFile?.value?.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          "fullName": nameController.text.trim(),
          "relation": relationController.text.trim(),
          "dob": dobController.text.trim(),
          "mobile": mobileController.text.trim(),
          "emirateId": myProfileCtrl.response.value.data?.emirateId??"",
          "emirateIdExpire": idExpiryController.text.trim(),
          "language": myProfileCtrl.response.value.data?.nativeLanguage??"",
          "document": await dio.MultipartFile.fromFile(selectedFile?.value?.path ?? "", filename: selectedFile?.value?.path.split("/").last??""),
        });
      }else{
        data = dio.FormData.fromMap({
          "fullName": nameController.text.trim(),
          "relation": relationController.text.trim(),
          "dob": dobController.text.trim(),
          "mobile": mobileController.text.trim(),
          "emirateId": myProfileCtrl.response.value.data?.emirateId??"",
          "emirateIdExpire": idExpiryController.text.trim(),
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
    }
  }

  updateFamilyMember({required String familyMemberId}) async {
    if (formKey.currentState?.validate() ?? false) {
      var data;
      if ((selectedFile?.value?.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          "fullName": nameController.text.trim(),
          "relation": relationController.text.trim(),
          "dob": dobController.text.trim(),
          "mobile": mobileController.text.trim(),
          "emirateId": myProfileCtrl.response.value.data?.emirateId??"",
          "emirateIdExpire": idExpiryController.text.trim(),
          "language": myProfileCtrl.response.value.data?.nativeLanguage??"",
          "document": await dio.MultipartFile.fromFile(selectedFile?.value?.path ?? "", filename: selectedFile?.value?.path.split("/").last??""),
        });
      }else{
        data = dio.FormData.fromMap({
          "fullName": nameController.text.trim(),
          "relation": relationController.text.trim(),
          "dob": dobController.text.trim(),
          "mobile": mobileController.text.trim(),
          "emirateId": myProfileCtrl.response.value.data?.emirateId??"",
          "emirateIdExpire": idExpiryController.text.trim(),
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