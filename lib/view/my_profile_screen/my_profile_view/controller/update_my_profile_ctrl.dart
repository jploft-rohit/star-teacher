import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/nationality_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_utility.dart';
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
  TextEditingController bloodCtrl = TextEditingController();
  TextEditingController emiratesCtrl = TextEditingController();
  TextEditingController expiryDateCtrl = TextEditingController();
  TextEditingController dobCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController nativeLanguageCtrl = TextEditingController();
  TextEditingController religionCtrl = TextEditingController();
  TextEditingController roleCtrl = TextEditingController();
  TextEditingController schoolCtrl = TextEditingController();
  TextEditingController alternativeMobileCtrl = TextEditingController();
  TextEditingController uploadController = TextEditingController();
  XFile? xFile;
  RxString selectedNationality = "".obs;
  RxList<NationalityData?>? nationalityList = <NationalityData>[].obs;
  Rx<File?>? selectedFile = File("").obs;
  Rx<File?>? selectedDocument = File("").obs;
  Rx<String> imageData = "".obs;
  RxString profilePath = "".obs;
  final formKey = GlobalKey<FormState>();
  BaseSuccessResponse response = BaseSuccessResponse();
  MyProfileCtrl myProfileCtrl = Get.find<MyProfileCtrl>();

  @override
  void onInit() {
    super.onInit();
    nameCtrl.text = myProfileCtrl.response.value.data?.name;
    mobileCtrl.text = myProfileCtrl.response.value.data?.mobile.toString()??"";
    dobCtrl.text = formatBackendDate(myProfileCtrl.response.value.data?.dob.toString()??"",getDayFirst: true);
    emailCtrl.text = myProfileCtrl.response.value.data?.email??"";
    addressCtrl.text = myProfileCtrl.response.value.data?.address??"";
    countryCtrl.text = myProfileCtrl.response.value.data?.country??"";
    stateCtrl.text = myProfileCtrl.response.value.data?.state??"";
    imageData.value = myProfileCtrl.response.value.data?.profilePic??"";
    nationalityCtrl.text = myProfileCtrl.response.value.data?.nationality??"";
    emiratesCtrl.text = getFormattedEmirateId(myProfileCtrl.response.value.data?.emirateId.toString()??"");
    expiryDateCtrl.text = formatBackendDate(myProfileCtrl.response.value.data?.emirateIdExpire.toString()??"",getDayFirst: true);
    alternativeMobileCtrl.text = myProfileCtrl.response.value.data?.alternativeMobile.toString()??"";
    maritalStatusCtrl.text = myProfileCtrl.response.value.data?.maritalStatus??"";
    bloodCtrl.text = myProfileCtrl.response.value.data?.bloodType??"";
    selectedNationality.value = myProfileCtrl.response.value.data?.nationalityId??"";
    getNationalities();
    // uploadController.text = myProfileCtrl.response.value.data?.idDocument.first??"";
  }

  updateProfileApi() async {
    if (formKey.currentState?.validate()??false) {
      dio.FormData data;
      if ((selectedFile?.value?.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          "name": nameCtrl.text.trim(),
          "mobile": mobileCtrl.text.trim(),
          "alternativeMobile": alternativeMobileCtrl.text.trim(),
          "dob": flipDate(date: dobCtrl.text.trim()),
          "email": emailCtrl.text.trim(),
          "address": addressCtrl.text.trim(),
          "country": countryCtrl.text.trim(),
          "state": stateCtrl.text.trim(),
          "bloodType": bloodCtrl.text.trim(),
          "nationality": selectedNationality.value,//"6450a9e2e2719e102c7459cd"
          "maritalStatus": maritalStatusCtrl.text.trim(),
          // "emirateId": emiratesCtrl.text.trim(),
          "emirateIdExpire": flipDate(date: expiryDateCtrl.text.trim()),
          "nativeLanguage": "6450a9e2e2719e102c7459cd",
          "religion": "6450a9e2e2719e102c7459cd",
          "role": "64467c68f871809066b4e219",
          "school": "6450a9e2e2719e102c7459cd",
          "profilePic": await dio.MultipartFile.fromFile(selectedFile?.value?.path??"", filename: selectedFile?.value?.path.split("/").last??""),
        });
       } else {
        data = dio.FormData.fromMap({
          "name": nameCtrl.text.trim(),
          "mobile": mobileCtrl.text.trim(),
          "alternativeMobile": alternativeMobileCtrl.text.trim(),
          "dob": flipDate(date: dobCtrl.text.trim()),
          "email": emailCtrl.text.trim(),
          "bloodType": bloodCtrl.text.trim(),
          "address": addressCtrl.text.trim(),
          "country": countryCtrl.text.trim(),
          "state": stateCtrl.text.trim(),
          "nationality": selectedNationality.value,//"6450a9e2e2719e102c7459cd"
          "maritalStatus": maritalStatusCtrl.text.trim(),
          // "emirateId": emiratesCtrl.text.trim(),
          "emirateIdExpire": flipDate(date: expiryDateCtrl.text.trim()),
          "nativeLanguage": "6450a9e2e2719e102c7459cd",
          "religion": "6450a9e2e2719e102c7459cd",
          "role": "64467c68f871809066b4e219",
          "school": "6450a9e2e2719e102c7459cd",
          // "mobile": mobileCtrl.text.trim(),
          // "emirateId": emiratesCtrl.text.trim(),
        });
      }

      // if((selectedDocument?.value?.path??"").isNotEmpty){
      //   data.files.add(MapEntry("idDocument", await dio.MultipartFile.fromFile((selectedDocument?.value?.path??""))));
      // }
      BaseAPI().patch(url: (ApiEndPoints().updateMyProfile),data: data,concatUserId: true).then((value){
        if (value?.statusCode == 200) {
          response = BaseSuccessResponse.fromJson(value?.data);
          if ((response.data?["message"]??"").isNotEmpty) {
            Get.back();
            BaseOverlays().showSnackBar(message: response.data?["message"]??"",title: translate(Get.context!).success);
            myProfileCtrl.getData();
         }
        }
       },
      );
     }
   }

  getNationalities(){
    nationalityList?.clear();
    BaseAPI().get(url: ApiEndPoints().getNationality).then((value){
      if (value?.statusCode ==  200) {
        nationalityList?.value = NationalityResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    },
    );
  }
 }