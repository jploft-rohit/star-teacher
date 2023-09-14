import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/roles_delegation_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

import '../../../utility/sizes.dart';

class RolesDelegationController extends GetxController{

  RxList<RolesDelegationData?>? list = <RolesDelegationData>[].obs;
  TextEditingController schoolController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxString selectedSchoolId = "".obs;
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void onInit() {
    super.onInit();
    selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
    schoolController.text = baseCtrl.schoolListData.data?.data?.first.name??"";
    getData();
  }

  getData({String? refreshType}) async {
    if (refreshType == 'refresh' || refreshType == null) {
      list?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    BaseAPI().get(url: ApiEndPoints().getRolesDelegation, queryParameters: {
      "type":"delegatedToMe",
      "school":selectedSchoolId.value,
      "limit":apiItemLimit,
      "page":page.value.toString()
    },showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        // list?.value = RolesDelegationResponse.fromJson(value?.data).data??[];
        if(refreshType == 'refresh'){
          list?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((RolesDelegationResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        list?.addAll(RolesDelegationResponse.fromJson(value?.data).data??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  updateStatus({required String id, required String status}) async {
    var data = {
      "status":status,
      "reason":reasonController.text.trim(),
    };
    BaseAPI().post(url: ApiEndPoints().updateRolesDelegationStatus+id,data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
        getData();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
}