import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/my_profile_response.dart';
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

  setData({required FamilyMembers? data}){
    nameController.text = data?.fullName??"";
    relationController.text = data?.relation??"";
    dobController.text = data?.dob??"";
    mobileController.text = data?.mobile??"";
    idController.text = "rohit.doc";
    idExpiryController.text = data?.emirateIdExpire??"";
  }

  addFamilyMember(){
    if (formKey.currentState?.validate()??false) {
      var data = dio.FormData.fromMap({
        "fullName": nameController.text.trim(),
        "relation": relationController.text.trim(),
        "dob": dobController.text.trim(),
        "mobile": mobileController.text.trim(),//nationalityCtrl.text.trim(),
        "emirateId": "6450a9e2e2719e102c7459cd"/*emiratesCtrl.text.trim()*/,
        // "emirateIdExpire": expiryDateCtrl.text.trim(),
        "document": "6450a9e2e2719e102c7459cd",//nativeLanguageCtrl.text.trim(),
        "language": "6450a9e2e2719e102c7459cd",//religionCtrl.text.trim(),
      });
      BaseAPI().post(url: ApiEndPoints().createFamilyMember, data: data).then((value){
        if (value?.statusCode == 200) {
          successResponse = BaseSuccessResponse.fromJson(value?.data);
          Get.back();
          BaseOverlays().showSnackBar(message: successResponse.message??"",title: "Success");
          myProfileCtrl.getData();
        }else{
          // BaseDialogs().showSnackBar(message: ,title: response.message??"");
        }
      });
    }
  }

  updateFamilyMember({required String familyMemberId}){
    if (formKey.currentState?.validate()??false) {
      var data = dio.FormData.fromMap({
        "fullName": nameController.text.trim(),
        "relation": relationController.text.trim(),
        "dob": dobController.text.trim(),
        "mobile": mobileController.text.trim(),//nationalityCtrl.text.trim(),
        "emirateId": "6450a9e2e2719e102c7459cd"/*emiratesCtrl.text.trim()*/,
        // "emirateIdExpire": expiryDateCtrl.text.trim(),
        "document": "6450a9e2e2719e102c7459cd",//nativeLanguageCtrl.text.trim(),
        "language": "6450a9e2e2719e102c7459cd",//religionCtrl.text.trim(),
      });
      BaseAPI().patch(url: ApiEndPoints().editFamilyMember+familyMemberId, data: data).then((value){
        if (value?.statusCode == 200) {
          successResponse = BaseSuccessResponse.fromJson(value?.data);
          Get.back();
          BaseOverlays().showSnackBar(message: successResponse.message??"",title: "Success");
          myProfileCtrl.getData();
        }else{
          // BaseDialogs().showSnackBar(message: ,title: response.message??"");
        }
      });
    }
  }
}