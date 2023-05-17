import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/login_response.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/otp_screen/otp_screen.dart';

class LoginCtrl extends GetxController{

  final formKey = GlobalKey<FormState>();
  TextEditingController mobileCtrl = TextEditingController();
  LoginResponse response = LoginResponse();

  loginApi({bool? isResend}){
    FocusScope.of(Get.context!).requestFocus(new FocusNode());
    if (formKey.currentState?.validate()??false) {
      Map<String, dynamic> data = {
        "mobile": mobileCtrl.text.trim(),
        "role" : "staff"
      };
      BaseAPI().post(url: ApiEndPoints().loginNewUser,data: data).then((value){
        if (value?.statusCode == 200) {
          response = LoginResponse.fromJson(value?.data);
            if ((response.data?.message??"").isNotEmpty) {
              BaseOverlays().showSnackBar(message: response.data?.message??"",title: response.message??"");
            }
            Get.to(OTPScreen(mobile: mobileCtrl.text.trim()));
        }
      });
    }
  }

}