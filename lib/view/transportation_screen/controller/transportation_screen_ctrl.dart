import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/custom_models/notify_authority_model.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/transportation_location_response.dart' as Location;
import 'package:staff_app/backend/responses_model/transportation_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/intl/intl.dart';

class TransportationScreenCtrl extends GetxController{

  RxInt selectedIndex = 0.obs;
  RxInt stepperIndex = 0.obs;
  RxBool isFirstOptionSelected = false.obs;
  RxBool isSecondOptionSelected = false.obs;
  RxBool isThirdOptionSelected = false.obs;
  RxBool isAnonymous = false.obs;
  RxString selectedCountryCode = "971".obs;
  RxString selectedLandlineCode = "971".obs;
  RxString selectedAreaID = "".obs;
  RxDouble selectedRating = 4.0.obs;
  Rx<TripData?> tripData = TripData().obs;
  RxList<String> statusTime = [""].obs;
  RxList<String> statusTitle = [""].obs;
  Rx<Location.TransportationLocationData?>? locationData = Location.TransportationLocationData().obs;
  Rx<TextEditingController> commentCtrl = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();
  Rx<File?>? selectedFile = File("").obs;
  RxList<LocalOptionModel> optionsList = <LocalOptionModel>[
    LocalOptionModel(),
    LocalOptionModel(),
    LocalOptionModel(),
  ].obs;
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

  setData({bool? isUpdating, Location.ChangeLocationRequestData? data}) async {
    if(isUpdating??false){
      selectedFile?.value = File("");
      addressLocationController.value.text = data?.location??"";
      sectorController.value.text = data?.sector??"";
      areaController.value.text = data?.areaForTransport?.name??"";
      selectedAreaID.value = data?.areaForTransport?.sId??"";
      streetController.value.text = data?.street??"";
      buildingController.value.text = data?.building??"";
      flatController.value.text =  data?.flat??"";
      landmarkController.value.text = data?.landmark??"";
      mobileController.value.text = (data?.mobileNo??"").toString().split(" ").last;
      selectedCountryCode.value = ((data?.mobileNo??"").toString().split(" ").first).replaceAll("+", "");
      landlineController.value.text = (data?.landlineNo??"").toString().split(" ").last;
      selectedLandlineCode.value = ((data?.landlineNo??"").toString().split(" ").first).replaceAll("+", "");
      latitudeController.value.text = data?.location?.coordinates?[1]??"";
      longitudeController.value.text = data?.location?.coordinates?[0]??"";
      uploadController.value.text = (data?.flatPhoto??"").split("/").last;
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
    var data = {
      "tripType": selectedIndex.value == 0 ? "departure" : "return",
      "userId":userId,
    };
    BaseAPI().get(url: ApiEndPoints().getTransportationDataNew, queryParameters: data).then((value){
      if (value?.statusCode ==  200) {
        tripData.value = TransportationResponse.fromJson(value?.data).data??TripData();
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    },
    );
  }

  createLocation() async {
    if (formKey.currentState?.validate()??false) {
      final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
      dio.FormData data;
      if ((selectedFile?.value?.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          "user[0]": userId,
          "typeOfRequest": "changeLocation",
          "location": addressLocationController.value.text.trim(),
          "latitude": latitudeController.value.text.trim(),
          "longitude": longitudeController.value.text.trim(),
          "areaForTransport":selectedAreaID.value,
          "sector": sectorController.value.text.trim(),
          "street": streetController.value.text.trim(),
          "building": buildingController.value.text.trim(),
          "flat": flatController.value.text.trim(),
          "landmark": landmarkController.value.text.trim(),
          "mobileNo": "+$selectedCountryCode ${(mobileController.value.text.trim())}",
          "landlineNo": "+$selectedLandlineCode ${(landlineController.value.text.trim())}",
          "trip": tripData.value?.trip?.sId??"",
          "addressType": "home",
          "flatPhoto": await dio.MultipartFile.fromFile(selectedFile?.value?.path??"", filename: selectedFile?.value?.path.split("/").last??""),
        });
      }else{
        data = dio.FormData.fromMap({
          "user[0]": userId,
          "typeOfRequest": "changeLocation",
          "location": addressLocationController.value.text.trim(),
          "latitude": latitudeController.value.text.trim(),
          "longitude": longitudeController.value.text.trim(),
          "areaForTransport":selectedAreaID.value,
          "sector": sectorController.value.text.trim(),
          "street": streetController.value.text.trim(),
          "building": buildingController.value.text.trim(),
          "flat": flatController.value.text.trim(),
          "landmark": landmarkController.value.text.trim(),
          "mobileNo": "+$selectedCountryCode ${(mobileController.value.text.trim())}",
          "landlineNo": "+$selectedLandlineCode ${(landlineController.value.text.trim())}",
          "trip": tripData.value?.trip?.sId??"",
          "addressType": "home",
        });
      }
      BaseAPI().post(url: ApiEndPoints().createLocation, data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"", title: translate(Get.context!).success);
          getLocation();
        } else {
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
        }
      },
      );
    }
  }

  updateLocation({required String id}) async {
    if (formKey.currentState?.validate()??false) {
      final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
      dio.FormData data;
      if ((selectedFile?.value?.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          "user[0]": userId,
          "typeOfRequest": "changeLocation",
          "location": addressLocationController.value.text.trim(),
          "latitude": latitudeController.value.text.trim(),
          "longitude": longitudeController.value.text.trim(),
          "areaForTransport":selectedAreaID.value,
          "sector": sectorController.value.text.trim(),
          "street": streetController.value.text.trim(),
          "building": buildingController.value.text.trim(),
          "flat": flatController.value.text.trim(),
          "landmark": landmarkController.value.text.trim(),
          "mobileNo": "+$selectedCountryCode ${(mobileController.value.text.trim())}",
          "landlineNo": "+$selectedLandlineCode ${(landlineController.value.text.trim())}",
          "trip": tripData.value?.trip?.sId??"",
          "addressType": "home",
          "flatPhoto": await dio.MultipartFile.fromFile(selectedFile?.value?.path??"", filename: selectedFile?.value?.path.split("/").last??""),
        });
      }else{
        data = dio.FormData.fromMap({
          "user[0]": userId,
          "typeOfRequest": "changeLocation",
          "location": addressLocationController.value.text.trim(),
          "latitude": latitudeController.value.text.trim(),
          "longitude": longitudeController.value.text.trim(),
          "areaForTransport":selectedAreaID.value,
          "sector": sectorController.value.text.trim(),
          "street": streetController.value.text.trim(),
          "building": buildingController.value.text.trim(),
          "flat": flatController.value.text.trim(),
          "landmark": landmarkController.value.text.trim(),
          "mobileNo": "+$selectedCountryCode ${(mobileController.value.text.trim())}",
          "landlineNo": "+$selectedLandlineCode ${(landlineController.value.text.trim())}",
          "trip": tripData.value?.trip?.sId??"",
          "addressType": "home",
        });
      }
      BaseAPI().put(url: ApiEndPoints().updateLocation+id, data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"", title: translate(Get.context!).success);
          getLocation();
        } else {
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
        }
      },
      );
    }
  }

  getLocation() async {
    locationData?.value = Location.TransportationLocationData();
    statusTitle.clear();
    statusTime.clear();
    stepperIndex.value = -5;
    BaseAPI().get(url: ApiEndPoints().getLocationData, queryParameters: {
      "tripId": tripData.value?.trip?.sId??""
    }).then((value){
      if (value?.statusCode ==  200) {
        locationData?.value = Location.TransportationLocationResponse.fromJson(value?.data).data ?? Location.TransportationLocationResponse().data;

        // locationData?.value?.changeLocationRequestData?.requestStatus?.toList().asMap().forEach((loopIndex,element) {
        //   if (element.name.toString().toLowerCase() != "rejected") {
        //     statusTitle.add(toBeginningOfSentenceCase(element.name??"")??"");
        //     statusTime.add(getFormattedTimeWithMonth(element.time??""));
        //     if (element.time.toString().isNotEmpty) {
        //       stepperIndex.value = loopIndex;
        //     }
        //   }else{
        //     if ((element.time??"").toString().isNotEmpty) {
        //       statusTime.value = [];
        //       statusTitle.value = [];
        //       statusTitle.add(toBeginningOfSentenceCase(locationData?.value?.changeLocationRequestData?.requestStatus?[0].name??"")??"");
        //       statusTitle.add(toBeginningOfSentenceCase(element.name??"")??"");
        //       statusTime.add(getFormattedTimeWithMonth(locationData?.value?.changeLocationRequestData?.requestStatus?[0].time??""));
        //       statusTime.add(getFormattedTimeWithMonth(element.time??""));
        //     }
        //   }
        //  });
        ///
        locationData?.value?.changeLocationRequestData?.requestStatus?.toList().asMap().forEach((loopIndex,element) {
          if (element.name.toString().toLowerCase() != "rejected") {
            statusTitle.add(toBeginningOfSentenceCase(element.name??"")??"");
            statusTime.add(getFormattedTimeWithMonth(element.time??""));
            if (element.time.toString().isNotEmpty) {
              stepperIndex.value = loopIndex;
            }
          }else{
            if ((element.time??"").toString().isNotEmpty) {
              statusTime.value = [];
              statusTitle.value = [];
              statusTitle.add(toBeginningOfSentenceCase(locationData?.value?.changeLocationRequestData?.requestStatus?[0].name??"")??"");
              statusTitle.add(toBeginningOfSentenceCase(element.name??"")??"");
              statusTime.add(getFormattedTimeWithMonth(locationData?.value?.changeLocationRequestData?.requestStatus?[0].time??""));
              statusTime.add(getFormattedTimeWithMonth(element.time??""));
              if (element.time.toString().isNotEmpty) {
                stepperIndex.value = loopIndex;
              }
            }
          }
        });
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    },
    );
  }

  notifyTransportAuthority({required List<NotifyAuthority> list}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    Map<String, dynamic> data = {
      'user': userId,
    };
    List<NotifyAuthority> localList = list.where((element) {
      return element.isYes ?? false;
    }).toList();
    List<NotifyAuthority> multipleList = localList.where((element) => element.dayType == 'multiple').toList();
    for (var i = 0; i < multipleList.length; i++) {
      if ((multipleList[i].fromDate?.isEmpty ?? true) ||
          (multipleList[i].toDate?.isEmpty ?? true)) {
        throw 'Please select from and to date';
      }
    }
    data['notifyData'] = localList.map((e) => {
      'option': e.option,
      'dayType': e.dayType,
      'fromDate': e.fromDateApi,
      'toDate': e.toDateApi,
    }).toList();

    BaseAPI().post(url: ApiEndPoints().notifyTransportAuthority, data: data).then((value){
      if (value?.statusCode ==  200) {
        Get.back();
        BaseOverlays().showSnackBar(message: TransportationResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    },
    );
  }

  rateBus({required String busId}) async {
      var data = {
        "id" : busId,
        "bus" : tripData.value?.bus?.sId??"",
        "type" : selectedIndex.value == 0 ? "departure" : "departure",
        "rating" : selectedRating.value,
        "comment" : commentCtrl.value.text.trim(),
        "isAnonymous": isAnonymous.value
      };
      BaseAPI().post(url: ApiEndPoints().rateBus, data: data).then((value) async {
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
        } else {
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
        }
       },
      );
  }

  rateSupervisor({required String supervisorId}) async {
    var data = {
      "user" : supervisorId,
      "rating" : selectedRating.value,
      "comment" : commentCtrl.value.text.trim(),
      "isAnonymous": isAnonymous.value
    };
    BaseAPI().post(url: ApiEndPoints().rateDriver, data: data).then((value) async {
      if (value?.statusCode ==  200) {
        Get.back();
        BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
      }
    },
    );
  }

  rateDriver({required String driverId}) async {
    var data = {
      "user" : driverId,
      "rating" : selectedRating.value,
      "comment" : commentCtrl.value.text.trim(),
      "isAnonymous": isAnonymous.value
    };
    BaseAPI().post(url: ApiEndPoints().rateDriver, data: data).then((value) async {
      if (value?.statusCode ==  200) {
        Get.back();
        BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
      }
    },
    );
  }

  deleteLocation({required String id}) async {
    BaseAPI().delete(url: ApiEndPoints().deleteLocation+id).then((value) async {
      if (value?.statusCode ==  200) {
        Get.back();
        BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
      }
    },
    );
  }

  sendBusNotification({required String selectedOption, required String id}) async {
    // final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    dio.FormData data = dio.FormData.fromMap({
      "status":getApiKeyForStatusOption(value: selectedOption),
      "comment":"",
      "lateTime":selectedOption == "Wait 5 mins" ? "wait 5 min" :"",
      "_id":id,
    });
    BaseAPI().post(url: ApiEndPoints().createNotification, data: data).then((value) async {
      if (value?.statusCode ==  200) {
        BaseOverlays().showOkDialog(title: "Notify Successfully", onBtnPressed: (){
          BaseOverlays().dismissOverlay();
          Get.back();
        });
        BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    },
    );
  }
}

String getApiKeyForStatusOption({required String value}){
  String returnValue = "";
  switch (value) {
    case "Wait 5 mins":
      {
        returnValue = "late";
        break;
      }
    case "Absent Today":
      {
        returnValue = "absent";
        break;
      }
    case "Ready":
      {
        returnValue = "ready";
        break;
      }
    case "Going By Own Vehicle":
      {
        returnValue = "ownVehicle";
        break;
      }
  }
  return returnValue;
}


class LocalOptionModel {
  String? option;
  String? dayType;
  String? fromDate;
  String? toDate;

  LocalOptionModel({this.option, this.dayType, this.fromDate, this.toDate});

  LocalOptionModel.fromJson(Map<String, dynamic> json) {
    option = json['option'];
    dayType = json['dayType'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option'] = this.option;
    data['dayType'] = this.dayType;
    data['fromDate'] = this.fromDate;
    data['toDate'] = this.toDate;
    return data;
  }
}
