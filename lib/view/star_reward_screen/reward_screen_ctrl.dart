import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/star_reward_history_response.dart';
import 'package:staff_app/backend/responses_model/star_reward_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:dio/dio.dart' as dio;

class RewardScreenCtrl extends GetxController{
  RxString selectedSchoolId = "".obs;
  RxString selectedSchoolName = "".obs;
  RxString selectedImagePath = "".obs;
  RxString selectedStarId = "".obs;
  RxString uploadedImagePath = "".obs;
  Rx<TextEditingController> rewardTitleCtrl = TextEditingController().obs;
  Rx<TextEditingController> pointValueCtrl = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();
  /// Class
  RxString selectedClassId = "".obs;
  RxString selectedClassName = "".obs;
  /// Section
  RxString selectedSectionId = "".obs;
  RxString selectedSectionName = "".obs;
  RxList<MyRewards>? myRewards = <MyRewards>[].obs;
  RxList<RewardsList>? rewardList = <RewardsList>[].obs;
  RxList<StarRewardHistroryData?>? starRewardHistoryList = <StarRewardHistroryData>[].obs;



  getRewards(){
    BaseAPI().get(url: "${ApiEndPoints().getStarsReward}${selectedStarId.value}").then((value){
      if (value?.statusCode ==  200) {
        myRewards?.value = StarRewardResponse.fromJson(value?.data).data?.user??[];
        rewardList?.value = StarRewardResponse.fromJson(value?.data).data?.rewards??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  getRewardHistory({required String id}){
    BaseAPI().get(url: (ApiEndPoints().viewRewardHistory)+id).then((value){
      if (value?.statusCode ==  200) {
        starRewardHistoryList?.value = StarRewardHistoryResponse.fromJson(value?.data).data?.reward??[];
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

  var rewardsList = [
    {
      'icon': 'assets/images/dance_img.svg',
      'title': 'Dance Party',
      'value': '25',
    },
    {
      'icon': 'assets/images/candy_img.svg',
      'title': 'Candy',
      'value': '5',
    },
    {
      'icon': 'assets/images/guitar_img.svg',
      'title': 'Guitar Lessons',
      'value': '30',
    },
    {
      'icon': 'assets/images/high_five.svg',
      'title': 'High Five',
      'value': '5',
    },
    {
      'icon': 'assets/images/dance_img.svg',
      'title': 'Dance Party',
      'value': '25',
    },
    {
      'icon': 'assets/images/candy_img.svg',
      'title': 'Candy',
      'value': '5',
    },
    {
      'icon': 'assets/images/guitar_img.svg',
      'title': 'Guitar Lessons',
      'value': '30',
    },
    {
      'icon': 'assets/images/high_five.svg',
      'title': 'High Five',
      'value': '5',
    },
    {
      'icon': 'assets/images/dance_img.svg',
      'title': 'Dance Party',
      'value': '25',
    },
    {
      'icon': 'assets/images/candy_img.svg',
      'title': 'Candy',
      'value': '5',
    },
    {
      'icon': 'assets/images/guitar_img.svg',
      'title': 'Guitar Lessons',
      'value': '30',
    },
    {
      'icon': 'assets/images/high_five.svg',
      'title': 'High Five',
      'value': '5',
    },
    {
      'icon': 'assets/images/dance_img.svg',
      'title': 'Dance Party',
      'value': '25',
    },
    {
      'icon': 'assets/images/candy_img.svg',
      'title': 'Candy',
      'value': '5',
    },
    {
      'icon': 'assets/images/guitar_img.svg',
      'title': 'Guitar Lessons',
      'value': '30',
    },
    {
      'icon': 'assets/images/high_five.svg',
      'title': 'High Five',
      'value': '5',
    },

  ];
  var rewardsList2 = [
    {
      'icon': 'assets/images/candy_img.svg',
      'title': 'Candy',
      'by': 'Guardians',
      'time': '09:13pm',
      'date': '10/02/2022'
    },
    {
      'icon': 'assets/images/dance_img.svg',
      'title': 'Dance Party',
      'by': 'Parent',
      'time': '09:13pm',
      'date': '01/03/2022'
    },
    {
      'icon': 'assets/images/guitar_img.svg',
      'title': 'Guitar Lessons',
      'by': 'Guardians',
      'time': '09:13pm',
      'date': '10/02/2022'
    },
  ];
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