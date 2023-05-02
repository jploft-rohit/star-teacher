import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/otp_response.dart';
import 'package:staff_app/route_manager/route_name.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class OtpCtrl extends GetxController{

  String? selectedLanguageCode;
  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  OtpResponse response = OtpResponse();

  @override
  Future<void> onInit() async {
    super.onInit();
    selectedLanguageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
  }

  otpApi({required String mobile}){
    FocusScope.of(Get.context!).requestFocus(new FocusNode());
    if (formKey.currentState?.validate()??false) {
      Map<String, dynamic> data = {
        "userInput": mobile.trim(),
        "otp": otpController.text.trim(),
        "role" : "staff",
        "deviceToken" : "deviceToken",
        "deviceType" : Platform.isAndroid ? "android" : "ios",
        "deviceVoip" : "fdsfad"
      };
      BaseAPI().post(url: ApiEndPoints().otp,data: data,headers: {'Accept-Language': selectedLanguageCode??"en",}).then((value){
        response = OtpResponse.fromJson(value?.data);
        if (response.statusCode == 200) {
          BaseSharedPreference().setBool(SpKeys().isLoggedIn, true);
          BaseSharedPreference().setString(SpKeys().apiToken, response.data?.token??"");
          if ((response.data?.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: response.data?.message??"",title: response.message??"");
          }
          Get.offAllNamed(dashboardScreenRoute);
        }else{
          if ((response.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: response.message??"",title: "Error");
          }
        }
      });
    }
  }
}