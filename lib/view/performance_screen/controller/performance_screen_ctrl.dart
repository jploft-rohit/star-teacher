import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/performance_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

import '../../../utility/sizes.dart';

class PerformanceController extends GetxController{
  RxInt selectedTabIndex = 0.obs;
  RxInt selectedRatingIndex = (-1).obs;
  RxDouble averageRating = 0.0.obs;
  RxList<PerformanceData?>? list = <PerformanceData>[].obs;
  List<double> ratingList = [1.0, 2.0, 3.0, 4.0, 5.0];
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData({String? refreshType}) async {
    if (refreshType == 'refresh' || refreshType == null || (refreshType??"").isEmpty) {
      list?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    BaseAPI().get(url: ApiEndPoints().getPerformance, queryParameters: {
      "rating":(selectedRatingIndex.value+1) > 0 ? (selectedRatingIndex.value+1).toString() : "",
      "role": selectedTabIndex.value == 0
          ? "manegement"
          : selectedTabIndex.value == 1
          ? "staff"
          : selectedTabIndex.value == 2
          ? "star"
          : selectedTabIndex.value == 3
          ? "parent"
          : "manegement",
      "limit":apiItemLimit,
      "page":page.value.toString()
    },showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        averageRating.value = double.parse(PerformanceResponse.fromJson(value?.data).data?.avgRating.toString()??"0.0");
        // list?.value = PerformanceResponse.fromJson(value?.data).data?.list??[];
        if(refreshType == 'refresh'){
          list?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((PerformanceResponse.fromJson(value?.data).data?.list??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        list?.addAll(PerformanceResponse.fromJson(value?.data).data?.list??[]);
      } else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
}