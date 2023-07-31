import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/Utility/curved_navigation_bar/curved_navigation_bar.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/home_response.dart';
import 'package:staff_app/backend/responses_model/news_broadcast_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class DashboardScreenCtrl extends GetxController{
  RxBool isBroadCastLoading = false.obs;
  RxList<NewsBroadCastData>? list = <NewsBroadCastData>[].obs;
  RxList<TodaySchedule>? todayScheduledList = <TodaySchedule>[].obs;
  RxString? numberOfClassesTaken = "0".obs;
  RxString? rationOfPerformance = "0".obs;
  final currentIndex = 2.obs;
  RxInt selectedTabIndex = 0.obs;
  RxString isActivationRequestSent = "".obs;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  /// School
  RxString selectedSchoolId = "".obs;
  RxString selectedSchoolName = "".obs;
  /// Class
  RxString selectedClassId = "".obs;
  RxString selectedClassName = "".obs;
  /// Section
  RxString selectedSectionId = "".obs;
  RxString selectedSectionName = "".obs;

  @override
  void onInit() {
    super.onInit();
    getBroadCastData();
    getHomeData();
  }

  getBroadCastData({bool? showLoader}){
    isBroadCastLoading.value = true;
    list?.value = [];
    var bodyData = {
      "page":1,
      "limit":100,
      "school":selectedSchoolId.value,
      "section":selectedSectionId.value,
      "star":"",
      "classId":selectedClassId.value
    };
    BaseAPI().post(showLoader: showLoader??false,url: ApiEndPoints().getNewsBroadCast, data: bodyData).then((value){
      if (value?.statusCode ==  200) {
        isBroadCastLoading.value = false;
        list?.value = NewsBroadCastListData.fromJson(value?.data).data??[];
      }else{
        isBroadCastLoading.value = false;
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
    isBroadCastLoading.value = false;
  }
  getHomeData(){
    todayScheduledList?.clear();
    BaseAPI().get(url: ApiEndPoints().getHomeData).then((value){
      if (value?.statusCode ==  200) {
        todayScheduledList?.value = HomeResponse.fromJson(value?.data).data?.todaySchedule??[];
        numberOfClassesTaken?.value = HomeResponse.fromJson(value?.data).data?.totalClassTaken.toString()??"";
        rationOfPerformance?.value = HomeResponse.fromJson(value?.data).data?.performance.toString()??"";
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  agreeNewsBroadCast({required String id, required int index}){
    BaseAPI().patch(url: ApiEndPoints().agreeNewsBroadCast+id).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"", title: translate(Get.context!).success);
        list?[index].isRead = true;
        list?.refresh();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }
}