import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/performance_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class PerformanceController extends GetxController{
  RxInt selectedTabIndex = 0.obs;
  RxInt selectedRatingIndex = (-1).obs;
  RxDouble averageRating = 0.0.obs;
  RxList<PerformanceData?>? list = <PerformanceData>[].obs;
  List<double> ratingList = [1.0, 2.0, 3.0, 4.0, 5.0];

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    list?.clear();
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    BaseAPI().get(url: ApiEndPoints().getPerformance,queryParameters: {
      "rating":(selectedRatingIndex.value+1) > 0 ? (selectedRatingIndex.value+1).toString() : "",
      "limit":100,
      "role": selectedTabIndex.value == 0
          ? "manegement"
          : selectedTabIndex.value == 1
          ? "staff"
          : selectedTabIndex.value == 2
          ? "star"
          : selectedTabIndex.value == 3
          ? "parent"
          : "manegement"
    }).then((value){
      if (value?.statusCode ==  200) {
        averageRating.value = double.parse(PerformanceResponse.fromJson(value?.data).data?.avgRating.toString()??"0.0");
        list?.value = PerformanceResponse.fromJson(value?.data).data?.list??[];
      } else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
}