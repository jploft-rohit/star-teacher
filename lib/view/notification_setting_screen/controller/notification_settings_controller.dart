import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/notification_setting_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

import '../../../utility/sizes.dart';

class NotificationSettingsController extends GetxController{
  RxInt selectedTabIndex = 0.obs;
  RxList<NotificationSettingsData?>? list = <NotificationSettingsData>[].obs;
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    getData();
  }
//controller.list?[index]?.userNotificationData?.isActive = controller.list?[index]?.userNotificationData?.isActive.toString().toLowerCase() == "true" ? true : false;
  getData({String? refreshType}){
    // list?.clear();
    if (refreshType == 'refresh' || refreshType == null) {
      list?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    BaseAPI().get(url: ApiEndPoints().getNotificationSettingsList,queryParameters: {
      "type":selectedTabIndex.value == 0 ? "school" : "transport",
      "userType":"staff",
      "limit":apiItemLimit,
      "page":page.value.toString()
    },showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        // list?.value = NotificationSettingsResponse.fromJson(value?.data).data??[];
        if(refreshType == 'refresh'){
          list?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((NotificationSettingsResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        list?.addAll(NotificationSettingsResponse.fromJson(value?.data).data??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  changeNotificationSetting({required int index}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    var data = {
      "user": userId,
      "notificationSetting" : list?[index]?.sId??"",
      "isActive" : list?[index]?.userNotificationData?.isActive.toString().toLowerCase() == "true" ? false : true,
      "type":selectedTabIndex.value == 0 ? "school" : "transport",
    };
    BaseAPI().post(url: ApiEndPoints().changeNotificationSetting,data: data).then((value){
      if (value?.statusCode ==  200) {
        list?[index]?.userNotificationData?.isActive = list?[index]?.userNotificationData?.isActive.toString().toLowerCase() == "true" ? false : true;
        getData();
        list?.refresh();
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"", title: translate(Get.context!).success);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
    });
  }
}