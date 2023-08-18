import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/otp_screen/otp_screen.dart';

class AccountActivationController extends GetxController{
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController employeeIdController = TextEditingController();
  RxString codeOfConduct = "".obs;
  RxString responsibilities = "".obs;
  RxString selectedCountryCode = "971".obs;
  final formKey = GlobalKey<FormState>();

  sendAccountActivationRequest(){
    if (formKey.currentState?.validate()??false) {
      final data = {
        "name":fullNameController.text.trim(),
        "uniqueId":employeeIdController.text.trim(),
        "mobile":"+${selectedCountryCode} ${(mobileController.value.text.trim())}"
      };
        BaseAPI().post(url: ApiEndPoints().sendAccountActivationRequest, data: data).then((value){
          BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
          if (value?.statusCode ==  200) {
            Get.to(OTPScreen(mobile: mobileController.text.trim(), isFromActivation: true,employeeId: employeeIdController.text.trim()));
          }else{
            BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).error);
          }
        });
    }
  }

  getCodeOfConduct(){
      BaseAPI().get(url: ApiEndPoints().getCodeOfConduct).then((value){
        if (value?.statusCode ==  200) {
          var document = parse(value?.data["data"][0]["description"]??"");
          codeOfConduct.value = document.outerHtml;
        }else{
          BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).error);
        }
        },
      );
  }

  getResponsibilities(){
    BaseAPI().get(url: ApiEndPoints().getResponsibilities).then((value){
      if (value?.statusCode ==  200) {
        var document = parse(value?.data["data"][0]["description"]??"");
        responsibilities.value = document.outerHtml;
      }else{
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).error);
      }
    },
    );
  }
}