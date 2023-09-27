import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/news_broadcast_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

import '../../../utility/sizes.dart';

class NewsController extends GetxController{
  RxList<NewsBroadCastData>? list = <NewsBroadCastData>[].obs;
  RxString totalUnReadNewsBroadcastCount = "0".obs;
  TextEditingController schoolController = TextEditingController();
  /// School
  RxString selectedSchoolId = "".obs;
  /// Class
  RxString selectedClassId = "".obs;
  RxString selectedClassName = "".obs;
  /// Section
  RxString selectedSectionId = "".obs;
  RxString selectedSectionName = "".obs;
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void onInit() {
    super.onInit();
    selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
    schoolController.text = baseCtrl.schoolListData.data?.data?.first.name??"";
    getBroadCastData();
  }

  getBroadCastData({bool? showLoader, String? refreshType}){
    if (refreshType == 'refresh' || refreshType == null) {
      list?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    var bodyData = {
      "school":selectedSchoolId.value,
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