import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/location_response.dart' as Location;
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
  RxDouble selectedRating = 4.0.obs;
  Rx<TripData> tripData = TripData().obs;
  RxList<String> statusTime = [""].obs;
  RxList<String> statusTitle = [""].obs;
  Rx<Location.LocationData?>? locationData = Location.LocationData().obs;
  Rx<TextEditingController> commentCtrl = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();
  RxList<LocalOptionModel> optionsList = <LocalOptionModel>[
    LocalOptionModel(),
    LocalOptionModel(),
    LocalOptionModel(),
  ].obs;
  Rx<TextEditingController> typeLocationController = TextEditingController().obs;
  Rx<TextEditingController> sectorController = TextEditingController().obs;
  Rx<TextEditingController> areaController = TextEditingController().obs;
  Rx<TextEditingController> streetController = TextEditingController().obs;
  Rx<TextEditingController> buildingController = TextEditingController().obs;
  Rx<TextEditingController> flatController = TextEditingController().obs;
  Rx<TextEditingController> landmarkController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> landlineController = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;


  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    var data = {
      "tripType": selectedIndex.value == 0 ? "departure" : "departure",
    };
    BaseAPI().get(url: ApiEndPoints().getTransportationData+userId, queryParameters: data).then((value){
      if (value?.statusCode ==  200) {
        tripData.value = TransportationResponse.fromJson(value?.data).data?.tripData ?? TripData();
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    },
    );
  }

  createLocation() async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    var data = {
      "user[0]": userId,
      "typeOfRequest": "changeLocation",
      "location": "changeLocation",
      "latitude": "",
      "longitude": "",
      "area": "",
      "sector": "",
      "street": "",
      "building": "",
      "flat": "",
      "landmark": "",
      "mobileNo": "",
      "landlineNo": "",
      "trip": "",
      "addressType": "",
    };
    BaseAPI().get(url: ApiEndPoints().getTransportationData+userId, queryParameters: data).then((value){
      if (value?.statusCode ==  200) {
        tripData.value = TransportationResponse.fromJson(value?.data).data?.tripData ?? TripData();
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    },
    );
  }

  updateLocation() async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    var data = {
      "tripType": selectedIndex.value == 0 ? "departure" : "departure",
    };
    BaseAPI().get(url: ApiEndPoints().getTransportationData+userId, queryParameters: data).then((value){
      if (value?.statusCode ==  200) {
        tripData.value = TransportationResponse.fromJson(value?.data).data?.tripData ?? TripData();
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    },
    );
  }

  getLocation() async {
    locationData?.value = Location.LocationData();
    statusTitle.clear();
    statusTime.clear();
    stepperIndex.value = -5;
    BaseAPI().get(url: ApiEndPoints().getLocationData, queryParameters: {
      "tripId": tripData.value.sId??""
    }).then((value){
      if (value?.statusCode ==  200) {
        locationData?.value = Location.LocationResponse.fromJson(value?.data).data ?? Location.LocationResponse().data;
        locationData?.value?.changeLocationRequestData?.requestStatus?.toList().asMap().forEach((loopIndex,element) {
          statusTitle.add(toBeginningOfSentenceCase(element.name??"")??"");
          statusTime.add(getFormattedTimeWithMonth(element.time??""));
          if (element.time.toString().isNotEmpty) {
            stepperIndex.value = loopIndex;
          }
        });
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    },
    );
  }

  notifyTransportAuthority() async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    var data = {
      "user":userId,
      "notifyData":optionsList
    };

    BaseAPI().post(url: ApiEndPoints().notifyTransportAuthority, data: data).then((value){
      if (value?.statusCode ==  200) {
        tripData.value = TransportationResponse.fromJson(value?.data).data?.tripData ?? TripData();
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    },
    );
  }

  rateBus() async {
      var data = {
        "id" : "6482ada3132b192040cec82f",
        "bus" : tripData.value.bus?.sId??"",
        "type" : selectedIndex.value == 0 ? "departure" : "departure",
        "rating" : selectedRating.value,
        "comment" : commentCtrl.value.text.trim(),
        "isAnonymous": isAnonymous.value
      };
      BaseAPI().post(url: ApiEndPoints().rateBus, data: data).then((value) async {
        if (value?.statusCode ==  200) {
          BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: "Success");
        } else {
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
        }
       },
      );
  }

  deleteLocation({required String id}) async {
    BaseAPI().delete(url: ApiEndPoints().deleteLocation+id).then((value) async {
      if (value?.statusCode ==  200) {
        Get.back();
        BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: "Success");
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
    },
    );
  }

  sendBusNotification({required String selectedOption}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    var data = {
      "sender":userId,
      "receiver":tripData.value.driverUser?.sId??"",
      "type":"transportation",
      "message":selectedOption,
    };
    BaseAPI().post(url: ApiEndPoints().createNotification, data: data).then((value) async {
      if (value?.statusCode ==  200) {
        BaseOverlays().showOkDialog(title: "Notify Successfully", onBtnPressed: (){
          BaseOverlays().dismissOverlay();
          Get.back();
        });
        BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: "Success");
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    },
    );
  }
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
