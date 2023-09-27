import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/otp_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/route_manager/route_name.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/video_call_zego_utility/login_service.dart';
import 'package:staff_app/view/account_activation_screen/rules_screen.dart';
import 'package:staff_app/view/account_activation_screen/rules_screen2.dart';

class OtpCtrl extends GetxController{
  String? selectedLanguageCode;
  String? token;
  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  OtpResponse response = OtpResponse();

  @override
  Future<void> onInit() async {
    super.onInit();
    selectedLanguageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
    FirebaseMessaging.instance.getToken().then((value) {
      token = value;
      print("FireBase Token \n $token");
    });
  }

  otpApi({required String mobile, bool? isFromActivation}){
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (formKey.currentState?.validate()??false) {
      Map<String, dynamic> data = {
        "userInput": mobile.trim(),
        "otp": otpController.text.trim(),
        "role" : "staff",
        "deviceToken" : token,
        "deviceType" : Platform.isAndroid ? "android" : "ios",
        "deviceVoip" : "fdsfad"
      };
      BaseAPI().post(url: ApiEndPoints().otp,data: data,headers: {'Accept-Language': selectedLanguageCode??"en",}).then((value){
        response = OtpResponse.fromJson(value?.data);
        if (response.statusCode == 200) {
          otpController.clear();
          otpController.text = "";
          BaseSharedPreference().setString(SpKeys().apiToken, response.data?.token??"");
          BaseSharedPreference().setString(SpKeys().userId, response.data?.user?.sId??"");
          BaseSharedPreference().setString(SpKeys().userName, response.data?.user?.name??"");
          if ((response.data?.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: response.data?.message??"",title: response.message??"");
          }
          currentUser.id = response.data?.user?.sId??"";
          currentUser.name = response.data?.user?.name??"";
          onUserLogin();
        if ((response.data?.user?.isReadCodeOfConduct??false) == false) {
          if((response.data?.user?.isReadResponsibility??false) == false){
            Get.offAll(RulesScreen(isFromActivation: isFromActivation??false));
          }else{
            Get.offAll(RulesScreen2(isFromActivation: isFromActivation??false));
          }
        }else{
          if((response.data?.user?.isReadResponsibility??false) == false){
            Get.offAll(RulesScreen2(isFromActivation: isFromActivation??false,));
          }else{
            BaseSharedPreference().setBool(SpKeys().isLoggedIn, true);
            Get.offAllNamed(dashboardScreenRoute);
          }
        }
        }else{
          if ((response.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: response.message??"",title: translate(Get.context!).error);
          }
        }
      });
    }
  }

  verifyActivationRequest({required String employeeId ,required String mobile, required String otp, bool? isFromActivation}){
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (formKey.currentState?.validate()??false) {
      Map<String, dynamic> data = {
        "uniqueId" : employeeId,
        "mobile" : mobile,
        "otp":otp
      };
      BaseAPI().post(url: ApiEndPoints().verifyAccountActivationRequest, data: data,headers: {'Accept-Language': selectedLanguageCode??"en",}).then((value){
        if (value?.statusCode ==  200) {
          otpController.clear();
          otpController.text = "";
          BaseSharedPreference().setString(SpKeys().apiToken, value?.data["data"]["token"]??"");
          Get.off(RulesScreen(isFromActivation: isFromActivation??false));
          // Get.toNamed(ruleScreenRoute);
          BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"", title: translate(Get.context!).success);
        }else{
          BaseOverlays().showSnackBar(message: response.message??"", title: translate(Get.context!).error);
        }
      });
    }
  }
}