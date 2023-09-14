import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/star_reward_history_response.dart';
import 'package:staff_app/backend/responses_model/star_reward_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_debouncer.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:dio/dio.dart' as dio;

import '../../utility/sizes.dart';

class RewardScreenCtrl extends GetxController{
  RxString selectedSchoolId = "".obs;
  RxString selectedSchoolName = "".obs;
  RxString selectedImagePath = "".obs;
  RxString selectedStarId = "".obs;
  RxString uploadedImagePath = "".obs;
  Rx<TextEditingController> rewardTitleCtrl = TextEditingController().obs;
  Rx<TextEditingController> pointValueCtrl = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();
  final baseDebouncer = BaseDebouncer();
  /// Class
  RxString selectedClassId = "".obs;
  RxString selectedClassName = "".obs;
  /// Section
  RxString selectedSectionId = "".obs;
  RxString selectedSectionName = "".obs;
  RxList<MyRewards>? myRewards = <MyRewards>[].obs;
  RxList<RewardsList>? rewardList = <RewardsList>[].obs;
  RxList<StarRewardHistroryData?>? starRewardHistoryList = <StarRewardHistroryData>[].obs;
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);
  final RefreshController refreshController2 = RefreshController(initialRefresh: false);



  getRewards({String? refreshType}){
    if (refreshType == 'refresh' || refreshType == null) {
      rewardList?.clear();
      myRewards?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    BaseAPI().get(url: "${ApiEndPoints().getStarsReward}${selectedStarId.value}", queryParameters: {
      "limit":apiItemLimit,
      "page":page.value.toString()
    },showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        if(refreshType == 'refresh'){
          rewardList?.clear();
          myRewards?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((StarRewardResponse.fromJson(value?.data).data?.rewards??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        myRewards?.value = StarRewardResponse.fromJson(value?.data).data?.user??[];
        rewardList?.addAll(StarRewardResponse.fromJson(value?.data).data?.rewards??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  getRewardHistory({required String id, String? refreshType}){
    if (refreshType == 'refresh' || refreshType == null) {
      starRewardHistoryList?.clear();
      refreshController2.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    BaseAPI().get(url: (ApiEndPoints().viewRewardHistory)+id, queryParameters: {
      "limit":apiItemLimit,
      "page":page.value.toString()
    },showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        // starRewardHistoryList?.value = StarRewardHistoryResponse.fromJson(value?.data).data?.reward??[];
        if(refreshType == 'refresh'){
          starRewardHistoryList?.clear();
          refreshController2.loadComplete();
          refreshController2.refreshCompleted();
        }else if((StarRewardHistoryResponse.fromJson(value?.data).data?.reward??[]).isEmpty && refreshType == 'load'){
          refreshController2.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController2.loadComplete();
        }
        starRewardHistoryList?.addAll(StarRewardHistoryResponse.fromJson(value?.data).data?.reward??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  createReward({XFile? file}) async {
    if (formKey.currentState?.validate()??false) {
      dio.FormData data;
      if (file != null) {
        data = dio.FormData.fromMap({
          "school": selectedSchoolId.value,
          "title": rewardTitleCtrl.value.text.trim(),
          "points": pointValueCtrl.value.text.trim(),
          "image": await dio.MultipartFile.fromFile(file.path,filename: file.name)
        });
      }else{
        data = dio.FormData.fromMap({
          "school": selectedSchoolId.value,
          "title": rewardTitleCtrl.value.text.trim(),
          "points": pointValueCtrl.value.text.trim()
        });
      }
      BaseAPI().post(url: ApiEndPoints().createReward,data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: value?.data?['message']??"",title: translate(Get.context!).success);
          getRewards();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
        }
       },
      );
    }
  }

  giveReward({required int points, required String rewardId, required String selectedUserId}) async {
      final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
      var data = {
        "user":selectedUserId,
        "rewardedBy":userId,
        "reward":rewardId,
        "points":points
      };
      BaseAPI().post(url: ApiEndPoints().giveReward,data: data).then((value){
        if (value?.statusCode ==  200) {
          BaseOverlays().showSnackBar(message: value?.data?['message']??"",title: translate(Get.context!).success);
          getRewards();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
        }
      });
  }

  updateRewardImage({XFile? file,rewardId}) async {
    dio.FormData data;
    if ((file?.path??"").isNotEmpty) {
       data = dio.FormData.fromMap({
        "image": await dio.MultipartFile.fromFile(file?.path??"",filename: file?.name??"")
      });
    }else{
       data = dio.FormData.fromMap({
         "image":""
       });
    }
    BaseAPI().patch(url: ApiEndPoints().updateRewardImage+rewardId,data: data).then((value){
      if (value?.statusCode ==  200) {
        Get.back();
        BaseOverlays().showSnackBar(message: value?.data?['message']??"",title: translate(Get.context!).success);
        getRewards();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  @override
  void dispose() {
    rewardTitleCtrl.value.text = "";
    pointValueCtrl.value.text = "";
    selectedSchoolId.value = "";
    selectedSchoolName.value = "";
    selectedClassId.value = "";
    selectedClassName.value = "";
    selectedSectionId.value = "";
    selectedSectionName.value = "";
    selectedStarId.value = "";
    super.dispose();
  }
}