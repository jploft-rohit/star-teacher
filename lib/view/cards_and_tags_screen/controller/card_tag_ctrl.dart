import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/card_tag_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:staff_app/view/star_evaluation_screen/success_dialog_screen.dart';

class CardTagCtrl extends GetxController{
  var shopStarShopList = [
    {
      'image': 'assets/delete/Rectangle 429.png',
      'name': 'NFC Tags',
      'price': '5 AED',
    },
    {
      'image': 'assets/delete/Rectangle 430.png',
      'name': 'NFC Card',
      'price': '15 AED',
    },
    {
      'image': 'assets/delete/Rectangle 434.png',
      'name': 'NFC Wristband',
      'price': '10 AED',
    },
    {
      'image': 'assets/delete/Rectangle 436.png',
      'name': 'NFC Card',
      'price': '15 AED',
    },
  ];
  var isHomeDelivery = true.obs;
  var isSchoolDelivery = false.obs;
  RxString selectedSchoolId = "".obs;
  TextEditingController selectedSchoolController = TextEditingController();
  RxList<Orders?>? ordersList = <Orders>[].obs;
  RxList<UserTags?>? userTagsList = <UserTags>[].obs;
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  RxList<String> statusTime = [""].obs;
  RxList<String> statusTitle = [""].obs;

  @override
  void onInit() {
    super.onInit();
    selectedSchoolId.value = baseCtrl.schoolListData.data?.data?[0].sId??"";
    getData();
  }

  getData() async {
    await BaseAPI().get(url: ApiEndPoints().getCardTag,queryParameters: {"school":selectedSchoolId.value}).then((value){
      if (value?.statusCode ==  200) {
        ordersList?.value = CardTagResponse.fromJson(value?.data).data?.orders??[];
        userTagsList?.value = CardTagResponse.fromJson(value?.data).data?.userTags??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  updateCardTagStatus({required bool status, required String id, required int index}) async {
    var data = {
      "status" : status ? "active" : "inactive",
      "id" : id, // user tag id
    };
    BaseAPI().post(url: ApiEndPoints().updateCardTagStatus, data: data).then((value) async {
      if (value?.statusCode ==  200) {
       await getData();
       if(value?.data["data"]["status"] == "active"){
         showGeneralDialog(
           context: Get.context!,
           pageBuilder:  (context, animation, secondaryAnimation) {
             return SuccessDialogScreen(msg: "New Card/Tags Activated");
           },
         );
       }
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  schoolDelivertSelected() {
    isHomeDelivery.value = false;
    isSchoolDelivery.value = true;
  }
  homeDelivertSelected() {
    isHomeDelivery.value = true;
    isSchoolDelivery.value = false;
  }
}