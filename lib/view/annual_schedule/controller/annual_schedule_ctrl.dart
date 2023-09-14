import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/annual_schedule_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

import '../../../utility/sizes.dart';

class AnnualScheduleCtrl extends GetxController{
  final RxInt selectedTabIndex = 0.obs;
  final RxString selectedSchoolId = "".obs;
  final RxList<AnnualScheduleData>? list = <AnnualScheduleData>[].obs;
  final Rx<TextEditingController> schoolController = TextEditingController().obs;
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
    schoolController.value.text = baseCtrl.schoolListData.data?.data?.first.name??"";
    getData();
  }

  getData({String? refreshType}){
    // list?.value = [];
    if (refreshType == 'refresh' || refreshType == null) {
      refreshController.loadComplete();
      page.value = 1;
      list?.clear();
    } else if (refreshType == 'load') {
      page.value++;
    }
    BaseAPI().get(url: ApiEndPoints().getAnnualScheduled,queryParameters: {
      "type":selectedTabIndex.value == 0 ? "holidays" : "exams",
      "school":selectedSchoolId.value,
      "limit":apiItemLimit,
      "page":page.value.toString()
    },showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        // list?.value = AnnualScheduleResponse.fromJson(value?.data).data??[];
        if(refreshType == 'refresh'){
          list?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((AnnualScheduleResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        list?.addAll(AnnualScheduleResponse.fromJson(value?.data).data??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }
}