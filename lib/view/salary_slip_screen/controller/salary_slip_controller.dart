import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/salary_slip_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

import '../../../utility/sizes.dart';

class SalarySlipController extends GetxController{
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  RxList<SalarySlipData>? list = <SalarySlipData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData({String? refreshType}) async {
    if (refreshType == 'refresh' || refreshType == null) {
      refreshController.loadComplete();
      page.value = 1;
      list?.clear();
    } else if (refreshType == 'load') {
      page.value++;
    }
    final String? userID = await BaseSharedPreference().getString(SpKeys().userId)??"";
    BaseAPI().get(url: ApiEndPoints().getSalarySlip+(userID??""), queryParameters: {
      "limit":apiItemLimit,
      "page":page.value.toString()
    },showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        if(refreshType == 'refresh'){
          list?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((SalarySlipResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        list?.addAll(SalarySlipResponse.fromJson(value?.data).data??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }
}