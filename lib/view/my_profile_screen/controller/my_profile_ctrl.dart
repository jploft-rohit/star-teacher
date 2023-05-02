import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/my_profile_response.dart';

class MyProfileCtrl extends GetxController{
  Rx<MyProfileResponse> response = MyProfileResponse().obs;
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
}