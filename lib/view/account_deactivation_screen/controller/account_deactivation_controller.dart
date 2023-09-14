import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/account_deactivation_response.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/my_profile_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/account_deactivation_screen/activation_request_detail_screen.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';

import '../../../utility/sizes.dart';

class AccountDeactivationController extends GetxController{
  TextEditingController dateController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController uploadController = TextEditingController();
  RxInt selectedTabIndex = 0.obs;
  RxList<AccountDeactivationData?>? list = <AccountDeactivationData>[].obs;
  List<String> statusTime = [""];
  List<String> statusTitle = [""];
  Rx<File?>? selectedFile = File("").obs;
  RxString selectedDateTime = "".obs;
  final formKey = GlobalKey<FormState>();
  MyProfileCtrl myProfileCtrl = Get.find<MyProfileCtrl>();
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  sendActivationRequest({final DeactivateData? deactivateData}) async {
    if (formKey.currentState?.validate()??false) {
      final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
      final String firstSchoolId = await BaseSharedPreference().getString(SpKeys().firstSchool)??"";
      dio.FormData data = dio.FormData.fromMap({
        "user[0]":userId,
        "typeOfRequest":"accountActivation",
        "medCertDateTime":selectedDateTime.value,
        "school":firstSchoolId,
        "medCertDesc":messageController.text.trim(),
        "medCertDocument": await dio.MultipartFile.fromFile(selectedFile?.value?.path??"", filename: selectedFile?.value?.path.split("/").last??"")
      });
      print("sdljkfs");
      print(data.files.toString());
      BaseAPI().post(url: ApiEndPoints().sendRequestForActivation,data: data).then((value){
        if (value?.statusCode ==  200) {
          // showGeneralDialog(
          //   context: Get.context!,
          //   pageBuilder: (context, animation, secondaryAnimation) {
          //     return ConfirmationDialog(msg: translate(context).your_request_for_account_activation_sent_to_School_admin_will_be_notified_soon,isShowBtn: false,);
          //   },
          // ).then((value){
          //   Get.to(const ActivationRequestDetailScreen());
          // });
          Get.off(ActivationRequestDetailScreen(data: deactivateData));
          myProfileCtrl.getData();
          BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"", title: translate(Get.context!).success);
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }

  getActivationRequests({String? refreshType}) async {
      // list?.clear();
    if (refreshType == 'refresh' || refreshType == null) {
      list?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
      BaseAPI().get(url: ApiEndPoints().getActivationRequests,queryParameters: {
        "typeOfRequest":"accountActivation",
        "status":selectedTabIndex.value == 0 ? "request raised" : "approved",
        "limit":apiItemLimit,
        "page":page.value.toString()
      },showLoader: page.value == 1).then((value){
        if (value?.statusCode ==  200) {
          // list?.value = AccountDeactivationResponse.fromJson(value?.data).data??[];
          if(refreshType == 'refresh'){
            list?.clear();
            refreshController.loadComplete();
            refreshController.refreshCompleted();
          }else if((AccountDeactivationResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
            refreshController.loadNoData();
          }
          else if(refreshType == 'load'){
            refreshController.loadComplete();
          }
          list?.addAll(AccountDeactivationResponse.fromJson(value?.data).data??[]);
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
  }
}