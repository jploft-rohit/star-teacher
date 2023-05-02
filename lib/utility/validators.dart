import 'package:get/get.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class Validators {

  String? mobileValidator(String? mobile){
    if((mobile??"").length < 7 || (mobile??"").length > 15){
      return translate(Get.context!).invalid_mobile;
    }
    return null;
  }

  String? otpValidator(String? otp){
    if((otp??"").isEmpty){
    return translate(Get.context!).empty_otp;
    }else if((otp??"").length < 4){
      return translate(Get.context!).invalid_otp;
    }
    return null;
  }

  String? unselectedDropDownValidator(value){
    if((value??"").isEmpty){
      return translate(Get.context!).empty_otp;
    }
    return null;
  }
}