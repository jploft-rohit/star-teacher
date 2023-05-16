import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/Utility/curved_navigation_bar/curved_navigation_bar.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/news_broadcast_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class DashboardScreenCtrl extends GetxController{
  RxBool isBroadCastLoading = false.obs;
  RxList<NewsBroadCastData>? list = <NewsBroadCastData>[].obs;
  final currentIndex = 2.obs;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    getBroadCastData();
  }

  getBroadCastData(){
    isBroadCastLoading.value = true;
    list?.value = [];
    var bodyData = {
      "page":1,
      "limit":10,
      "school":"",
      "section":"",
      "star":"",
      "classId":""
    };
    BaseAPI().post(showLoader: false,url: ApiEndPoints().getNewsBroadCast, data: bodyData).then((value){
      if (value?.statusCode ==  200) {
        isBroadCastLoading.value = false;
        list?.value = NewsBroadCastListData.fromJson(value?.data).data??[];
      }else{
        isBroadCastLoading.value = false;
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
    isBroadCastLoading.value = false;
  }
}