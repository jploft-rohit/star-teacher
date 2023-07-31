import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/annual_schedule_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class AnnualScheduleCtrl extends GetxController{
  final RxInt selectedTabIndex = 0.obs;
  final RxString selectedSchoolId = "".obs;
  final RxList<AnnualScheduleData>? list = <AnnualScheduleData>[].obs;
  final Rx<TextEditingController> schoolController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData(){
    list?.value = [];
    BaseAPI().get(url: ApiEndPoints().getAnnualScheduled,queryParameters: {
      "type":selectedTabIndex.value == 0 ? "holidays" : "exams",
      "school":selectedSchoolId.value
    }).then((value){
      if (value?.statusCode ==  200) {
        list?.value = AnnualScheduleResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }
}