import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/login_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/otp_screen/otp_screen.dart';

class LoginCtrl extends GetxController{


  RxBool isLocalAuth = false.obs;
  TextEditingController mobileCtrl = TextEditingController();
  LoginResponse response = LoginResponse();
  RxString selectedCountryCode = "971".obs;

  loginApi({bool? isResend}){
    FocusScope.of(Get.context!).requestFocus(FocusNode());
      Map<String, dynamic> data = {
        "mobile": "+$selectedCountryCode ${(mobileCtrl.text.trim())}",
        "role" : "staff"
      };
      BaseAPI().post(url: ApiEndPoints().loginNewUser,data: data).then((value){
        if (value?.statusCode == 200) {
          response = LoginResponse.fromJson(value?.data);
            if ((response.data?.message??"").isNotEmpty) {
              BaseOverlays().showSnackBar(message: response.data?.message??"",title: response.message??"");
            }
            Get.to(OTPScreen(mobile: "+$selectedCountryCode ${(mobileCtrl.text.trim())}", isFromActivation: false));
        }
      });
  }

  localAuthEnable() async {

    try {
      final LocalAuthentication auth = LocalAuthentication();
      final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
        if (availableBiometrics.isNotEmpty) {
          final bool didAuthenticate = await auth.authenticate(
            localizedReason: translate(Get.context!).local_auth_message,
            options: const AuthenticationOptions(
              stickyAuth: true,
              useErrorDialogs: true,
              biometricOnly: false,
            ),
          );
          if (!didAuthenticate) {
            showSnackBar(
              message: translate(Get.context!).authentication_failed,
              success: false,
            );
            isLocalAuth.value = false;
          } else {
            BaseSharedPreference().setBool(SpKeys().isBiometricEnable, true);
            showSnackBar(
              message: translate(Get.context!).local_authentication_enabled,
              success: true,
            );
            isLocalAuth.value = true;
          }
        } else {
          BaseOverlays().showConfirmationDialog(
            title: "No biometric enrolled, do you want to enrolled ?",
            onRightButtonPressed: (){
              BaseOverlays().dismissOverlay();
              AppSettings.openAppSettings(type: AppSettingsType.device);
            },
          );
        }
    } on PlatformException {
      showSnackBar(
        message: translate(Get.context!).authentication_failed,
        success: false,
      );
      isLocalAuth.value = false;
    }
  }

}