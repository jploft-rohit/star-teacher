import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/notification_list_data.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class NotificationCtrl extends GetxController{

  RxList<Data>? list = <Data>[].obs;
  RxInt tabIndex = 0.obs;
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  getData({String? refreshType}){
    if (refreshType == 'refresh' || refreshType == null) {
      list?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    BaseAPI().get(url: ApiEndPoints().getNotificationList,queryParameters: {
      "page":page.value,
      "limit":apiItemLimit,
      "type": tabIndex.value == 0 ? "school" : "transportation",
    }, showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        // list?.value = NotificationListData.fromJson(value?.data).data??[];
        if(refreshType == 'refresh'){
          list?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((NotificationListData.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        list?.addAll(NotificationListData.fromJson(value?.data).data??[]);

      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }
}