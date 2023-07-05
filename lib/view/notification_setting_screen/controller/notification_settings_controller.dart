import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/notification_setting_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class NotificationSettingsController extends GetxController{
  RxInt selectedTabIndex = 0.obs;
  RxList<NotificationSettingsData?>? list = <NotificationSettingsData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData(){
    list?.clear();
    BaseAPI().get(url: ApiEndPoints().getNotificationSettingsList,queryParameters: {
      "type":selectedTabIndex.value == 0 ? "school" : "transport",
      "userType":"staff",
    }).then((value){
      if (value?.statusCode ==  200) {
        list?.value = NotificationSettingsResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
}