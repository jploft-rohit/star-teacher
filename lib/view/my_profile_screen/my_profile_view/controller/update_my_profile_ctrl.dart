import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';

class UpdateMyProfileCtrl extends GetxController{

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController countryCtrl = TextEditingController();
  TextEditingController nationalityCtrl = TextEditingController();
  TextEditingController maritalStatusCtrl = TextEditingController();
  TextEditingController emiratesCtrl = TextEditingController();
  TextEditingController expiryDateCtrl = TextEditingController();
  TextEditingController dobCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController nativeLanguageCtrl = TextEditingController();
  TextEditingController religionCtrl = TextEditingController();
  TextEditingController roleCtrl = TextEditingController();
  TextEditingController schoolCtrl = TextEditingController();
  TextEditingController alternativeMobileCtrl = TextEditingController();
  XFile? xFile;
  Rx<String> imageData = "".obs;
  RxString profilePath = "".obs;
  final formKey = GlobalKey<FormState>();
  BaseSuccessResponse response = BaseSuccessResponse();
  MyProfileCtrl myProfileCtrl = Get.find<MyProfileCtrl>();

  @override
  void onInit() {
    super.onInit();
    nameCtrl.text = "Rafiq Khan";
    mobileCtrl.text = myProfileCtrl.response.value.data?.mobile??"";
    dobCtrl.text = myProfileCtrl.response.value.data?.dob??"";
    emailCtrl.text = "rafiq_khan007@gmail.com";
    addressCtrl.text = "PO Box: 9440 Dubai United Arab Emirates";
    countryCtrl.text = "UAE";
    stateCtrl.text = "Dubai";
    nationalityCtrl.text = myProfileCtrl.response.value.data?.nationality??"";
    emiratesCtrl.text = myProfileCtrl.response.value.data?.emirateId??"";
    expiryDateCtrl.text = myProfileCtrl.response.value.data?.emirateIdExpire??"";
    alternativeMobileCtrl.text = myProfileCtrl.response.value.data?.alternativeMobile??"";
    maritalStatusCtrl.text = "Married";
  }

  updateProfileApi(){
    if (formKey.currentState?.validate()??false) {
      var data = dio.FormData.fromMap({
        "name": nameCtrl.text.trim(),
        "mobile": mobileCtrl.text.trim(),
        "dob": dobCtrl.text.trim(),
        "nationality": "6450a9e2e2719e102c7459cd",//nationalityCtrl.text.trim(),
        "emirateId": emiratesCtrl.text.trim(),
        "emirateIdExpire": expiryDateCtrl.text.trim(),
        "nativeLanguage": "6450a9e2e2719e102c7459cd",//nativeLanguageCtrl.text.trim(),
        "religion": "6450a9e2e2719e102c7459cd",//religionCtrl.text.trim(),
        "role": "staff",
        "school": "6450a9e2e2719e102c7459cd",//schoolCtrl.text.trim(),
        "profilePic": profilePath.value.trim(),
      });
      BaseAPI().patch(url: (ApiEndPoints().updateMyProfile),data: data,concatUserId: true).then((value){
        if (value?.statusCode == 200) {
          response = BaseSuccessResponse.fromJson(value?.data);
          if ((response.data?["message"]??"").isNotEmpty) {
            Get.back();
            BaseOverlays().showSnackBar(message: response.data?["message"]??"",title: "Success");
            myProfileCtrl.getData();
         }
        }
       },
      );
     }
   }
 }