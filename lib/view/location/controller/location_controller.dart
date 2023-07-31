import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/location_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class LocationController extends GetxController{

  Rx<LocationUser?>? locationUser = LocationUser().obs;
  RxList<LocationData?>? list = <LocationData>[].obs;
  final formKey = GlobalKey<FormState>();
  Rx<File?>? selectedFile = File("").obs;
  RxInt selectedTabIndex = 0.obs;
  Rx<TextEditingController> addressLocationController = TextEditingController().obs;
  Rx<TextEditingController> sectorController = TextEditingController().obs;
  Rx<TextEditingController> areaController = TextEditingController().obs;
  Rx<TextEditingController> streetController = TextEditingController().obs;
  Rx<TextEditingController> buildingController = TextEditingController().obs;
  Rx<TextEditingController> flatController = TextEditingController().obs;
  Rx<TextEditingController> landmarkController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> landlineController = TextEditingController().obs;
  Rx<TextEditingController> latitudeController = TextEditingController().obs;
  Rx<TextEditingController> longitudeController = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  setData({bool? isUpdating, LocationData? data}) async {
    if(isUpdating??false){
      selectedFile?.value = File("");
      addressLocationController.value.text = data?.address??"";
      sectorController.value.text = data?.sector??"";
      areaController.value.text = data?.area??"";
      streetController.value.text = data?.street??"";
      buildingController.value.text = data?.buildingVilla??"";
      flatController.value.text =  data?.flatVillaNo??"";
      landmarkController.value.text = data?.landmark??"";
      mobileController.value.text =  data?.mobile??"";
      landlineController.value.text = data?.landline??"";
      latitudeController.value.text = data?.location?.coordinates?[1]??"";
      longitudeController.value.text = data?.location?.coordinates?[0]??"";
      uploadController.value.text =  (data?.document??"").split("/").last;
    }else{
      selectedFile?.value = File("");
      addressLocationController.value.text = "";
      sectorController.value.text = "";
      areaController.value.text = "";
      streetController.value.text = "";
      buildingController.value.text = "";
      flatController.value.text =  "";
      landmarkController.value.text = "";
      mobileController.value.text =  "";
      landlineController.value.text = "";
      latitudeController.value.text = "";
      longitudeController.value.text = "";
      uploadController.value.text =  "";
    }
  }

  getData() async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    BaseAPI().get(url: ApiEndPoints().getUserAddress, queryParameters: {"user":userId, "locationType":selectedTabIndex.value == 0 ? "home" : "emergency"}).then((value){
      if (value?.statusCode ==  200) {
        locationUser?.value = LocationResponse.fromJson(value?.data).data?.user;
        list?.value = LocationResponse.fromJson(value?.data).data?.addresses??[];
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
     },
   );
 }

  deleteData({required id}) async {
    BaseAPI().get(url: ApiEndPoints().deleteUserLocation+id).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
        getData();
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    },
    );
  }

  updateData() async {
    if (formKey.currentState?.validate()??false) {
      final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
      dio.FormData data;
      if ((selectedFile?.value?.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          "sector":sectorController.value.text.trim(),
          "area":areaController.value.text.trim(),
          "street":streetController.value.text.trim(),
          "buildingVilla":buildingController.value.text.trim(),
          "flatVillaNo":flatController.value.text.trim(),
          "landmark":landmarkController.value.text.trim(),
          "mobile":mobileController.value.text.trim(),
          "landline":landlineController.value.text.trim(),
          "user":userId,
          "locationType":selectedTabIndex.value == 0 ? "home" : "emergency",
          "address":addressLocationController.value.text.trim(),
          "latitude":latitudeController.value.text.trim(),
          "longitude":longitudeController.value.text.trim(),
          "document": await dio.MultipartFile.fromFile(selectedFile?.value?.path??"", filename: selectedFile?.value?.path.split("/").last??"")
        });
      }else{
        data = dio.FormData.fromMap({
          "sector":sectorController.value.text.trim(),
          "area":areaController.value.text.trim(),
          "street":streetController.value.text.trim(),
          "buildingVilla":buildingController.value.text.trim(),
          "flatVillaNo":flatController.value.text.trim(),
          "landmark":landmarkController.value.text.trim(),
          "mobile":mobileController.value.text.trim(),
          "landline":landlineController.value.text.trim(),
          "user":userId,
          "locationType":selectedTabIndex.value == 0 ? "home" : "emergency",
          "address":addressLocationController.value.text.trim(),
          "latitude":latitudeController.value.text.trim(),
          "longitude":longitudeController.value.text.trim(),
        });
      }
      BaseAPI().post(url: ApiEndPoints().createUserAddress, data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
          getData();
        } else {
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
       },
      );
    }
  }


}