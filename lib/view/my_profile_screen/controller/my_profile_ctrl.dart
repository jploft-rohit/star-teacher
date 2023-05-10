import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/my_profile_response.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class MyProfileCtrl extends GetxController{
  Rx<MyProfileResponse> response = MyProfileResponse().obs;
  BaseSuccessResponse successResponse = BaseSuccessResponse();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData(){
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    BaseAPI().get(url: ApiEndPoints().getMyProfile).then((value){
      if (value?.statusCode == 200) {
        response.value = MyProfileResponse.fromJson(value?.data);
      }else{
        // BaseDialogs().showSnackBar(message: ,title: response.message??"");
      }
    });
  }

  deleteFamilyMember({required String memberId,required int index}){
    BaseAPI().delete(url: ApiEndPoints().deleteFamilyMember+memberId).then((value){
      if (value?.statusCode == 200) {
        successResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: successResponse.message??"",title: "Success");
        getData();
        // response.value.data?.familyMembers?.removeAt(index);
        update();
      }else{
        // BaseDialogs().showSnackBar(message: ,title: response.message??"");
      }
    });
  }
}