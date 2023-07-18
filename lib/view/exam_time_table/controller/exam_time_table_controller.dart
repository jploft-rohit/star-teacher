import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/exam_time_table_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/utility/base_views/base_overlays.dart';

class ExamTimeTableController extends GetxController{

  RxList<ExamTimeTableData?>? list = <ExamTimeTableData>[].obs;
  TextEditingController selectedSchoolController = TextEditingController();
  RxString selectedSchoolId = "".obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    list?.clear();
    // final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    BaseAPI().get(url: ApiEndPoints().getExamTimeTable, queryParameters: {
      "school": selectedSchoolId.value,
    }).then((value){
      if (value?.statusCode ==  200) {
        list?.value = ExamTimeTableResponse.fromJson(value?.data).data??[];
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    },
    );
  }

}