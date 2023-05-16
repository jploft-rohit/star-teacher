import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/notification_list_data.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class NotificationCtrl extends GetxController{

  RxList<Data>? list = <Data>[].obs;
  RxInt tabIndex = 0.obs;

  getData({required String page, required String limit,required String type}){
    list?.value = [];
    BaseAPI().get(url: ApiEndPoints().getNotificationList,queryParameters: {"page":page,"limit":limit,"type":type}).then((value){
      if (value?.statusCode ==  200) {
        list?.value = NotificationListData.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
}