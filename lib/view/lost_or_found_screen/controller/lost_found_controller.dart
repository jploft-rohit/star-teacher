import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/all_lost_found_response.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/utility/base_views/base_overlays.dart';

class LostFoundController extends GetxController{
  RxList<LostFoundData>? list = <LostFoundData>[].obs;
  RxInt selectedTabIndex = 0.obs;
  RxString selectedSchoolId = "".obs;
  RxString selectedSchoolName = "".obs;
  Rx<File>? selectedFile = File("").obs;
  final formKey = GlobalKey<FormState>();
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> whereController = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;
  Rx<TextEditingController> schoolController = TextEditingController().obs;

  getData({required String type}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    list?.value = [];
    var data;
    selectedSchoolId.value.isEmpty
    ? data = {
      "type":type,
      "user":userId,
    } : data = {
      "type":type,
      "user":userId,
      "school":selectedSchoolId.value,
    };
    BaseAPI().post(url: ApiEndPoints().getAllLostFound, data: data).then((value){
      if (value?.statusCode ==  200) {
        list?.value = LostFoundListResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  requestReturn({required String id}) {
    BaseOverlays().dismissOverlay();
    BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
    BaseAPI().get(url: ApiEndPoints().returnLostFound+id).then((value){
      if (value?.statusCode ==  200) {
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: "Success");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  createLostFound() async {
    if (formKey.currentState?.validate()??false) {
      final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
      dio.FormData data;
      if ((selectedFile?.value.path??"").isEmpty) {
        data = dio.FormData.fromMap({
          "title":titleController.value.text.trim(),
          "date":dateController.value.text.trim(),
          "location":whereController.value.text.trim(),
          "school":selectedSchoolId.value,
          "type":selectedTabIndex.value == 0 ? "found" : "request",
          "user":userId,
        });
      }else{
        data = dio.FormData.fromMap({
          "title":titleController.value.text.trim(),
          "date":dateController.value.text.trim(),
          "location":whereController.value.text.trim(),
          "school":selectedSchoolId.value,
          "type":selectedTabIndex.value == 0 ? "found" : "request",
          "user":userId,
          "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"", filename: selectedFile?.value.path.split("/").last??"")
        });
      }
      BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
      BaseAPI().post(url: ApiEndPoints().createLostFound,data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
          BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: "Success");
          selectedSchoolId.value = "";
          selectedSchoolName.value = "";
          getData(type: selectedTabIndex.value == 0 ? "found" : "request");
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }
}