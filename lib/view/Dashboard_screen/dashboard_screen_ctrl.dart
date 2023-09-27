import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/Utility/curved_navigation_bar/curved_navigation_bar.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/home_response.dart';
import 'package:staff_app/backend/responses_model/news_broadcast_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

import '../../utility/sizes.dart';

class DashboardScreenCtrl extends GetxController{
  RxBool isBroadCastLoading = false.obs;
  RxList<NewsBroadCastData>? list = <NewsBroadCastData>[].obs;
  RxString totalUnReadNewsBroadcastCount = "0".obs;
  RxList<TodaySchedule>? todayScheduledList = <TodaySchedule>[].obs;
  TextEditingController schoolController = TextEditingController();
  Rx<TextEditingController> dashboardSchoolController = TextEditingController().obs;
  RxString? numberOfClassesTaken = "0".obs;
  RxString? rationOfPerformance = "0".obs;
  RxString? notificationCount = "0".obs;
  final currentIndex = 2.obs;
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  RxInt selectedTabIndex = 0.obs;
  RxString isActivationRequestSent = "".obs;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  /// School
  RxString selectedSchoolId = "".obs;
  RxString selectedSchoolName = "".obs;
  RxString selectedDashboardSchoolId = "".obs;
  /// Class
  RxString selectedClassId = "".obs;
  RxString selectedClassName = "".obs;
  /// Section
  RxString selectedSectionId = "".obs;
  RxString selectedSectionName = "".obs;
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  getBroadCastData({bool? showLoader, String? refreshType}){
    isBroadCastLoading.value = true;
    if (refreshType == 'refresh' || refreshType == null) {
      list?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    var bodyData = {
      "school":selectedDashboardSchoolId.value,
      "section":selectedSectionId.value,
      "star":"",
      "classId":selectedClassId.value,
      "limit":apiItemLimit,
      "page":page.value.toString()
    };
    BaseAPI().post(
        showLoader: showLoader??(page.value == 1),
        url: ApiEndPoints().getNewsBroadCast,
        data: bodyData,
    ).then((value){
      if (value?.statusCode ==  200) {
        isBroadCastLoading.value = false;
        // list?.value = NewsBroadCastListData.fromJson(value?.data).data??[];
        totalUnReadNewsBroadcastCount.value = (NewsBroadCastListData.fromJson(value?.data).totalUnreadCount?.toString()??"0").toString();
        if(refreshType == 'refresh'){
          list?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((NewsBroadCastListData.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        list?.addAll(NewsBroadCastListData.fromJson(value?.data).data??[]);
      }else{
        isBroadCastLoading.value = false;
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
    isBroadCastLoading.value = false;
  }
  getHomeData(){
    todayScheduledList?.clear();
    BaseAPI().get(url: ApiEndPoints().getHomeData, queryParameters: {
      "school": selectedDashboardSchoolId.value
    }).then((value){
      if (value?.statusCode ==  200) {
        todayScheduledList?.value = HomeResponse.fromJson(value?.data).data?.todaySchedule??[];
        numberOfClassesTaken?.value = HomeResponse.fromJson(value?.data).data?.totalClassTaken.toString()??"";
        rationOfPerformance?.value = HomeResponse.fromJson(value?.data).data?.performance.toString()??"";
        notificationCount?.value = HomeResponse.fromJson(value?.data).data?.notificationCount.toString()??"";
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  agreeNewsBroadCast({required String id, required int index}){
    var data = {"isRead":1};
    BaseAPI().patch(url: ApiEndPoints().agreeNewsBroadCast+id, data: data).then((value){
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