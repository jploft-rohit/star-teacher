import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/today_schedule_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class TodayScheduleController extends GetxController{

  RxList<TodayScheduleData?>? list = <TodayScheduleData>[].obs;
  RxString type = "".obs;
  TextEditingController schoolController = TextEditingController();
  RxString selectedSchoolId = "".obs;

  getData() async {
    list?.clear();
    final String localType = type.value == "This Week" ? 'week' : type.value == "Classes Taken" ? "taken" : "today";
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    BaseAPI().get(url: ApiEndPoints().getTodayScheduledList,queryParameters: {"userId": userId, "school": selectedSchoolId.value, "type":localType}).then((value){
      if (value?.statusCode ==  200) {
        list?.value = TodayScheduleResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
}