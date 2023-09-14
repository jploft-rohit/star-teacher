import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

import '../../../utility/images_icon_path.dart';

class StarRatingController extends GetxController{
  RxBool isSelectAll = false.obs;
  final selectedFMOPos = 0.obs;
  RxInt selectedTabIndex = 0.obs;
  RxList<String> selectedStarsId = <String>[].obs;
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  var fmoImageList = [
    nfcSvg,
    barcodeSvg,
    handSvg,
  ];
  String getRatingForKey({required String title}){
    switch (title) {
      case "Listening":{
        return "listening";
      }
      case "Brush teeth":{
        return "brushTeeth";
      }
      case "Ready for sch..":{
        return "readyForSchool";
      }
      case "Reading":{
        return "reading";
      }
      case "Ready for bed":{
        return "readyToBed";
      }
      case "Out of bed":{
        return "outOfBed";
      }
      case "Helping":{
        return "helping";
      }
      case "Learning time":{
        return "learningTime";
      }
      case "Outside time":{
        return "outsideTime";
      }
      default:{
        return "";
      }
    }
  }
  RxList<Map<String, dynamic>> list = <Map<String, dynamic>>[
    {
      "count":1.obs,
      "isSelected":false.obs,
    },
    {
      "count":1.obs,
      "isSelected":false.obs,
    },
    {
      "count":1.obs,
      "isSelected":false.obs,
    },
  ].obs;
  List<Map<String, dynamic>> ratingList = <Map<String, dynamic>>[
    {
      "rating":2,
      "img":earSvg,
      "title":"Listening",
    },
    {
      "rating":2,
      "img":teethSvg,
      "title":"Brush teeth",
    },
    {
      "rating":3,
      "img":schoolBagSvg,
      "title":"Ready for sch..",
    },
    {
      "rating":2,
      "img":booksSvg,
      "title":"Reading",
    },
    {
      "rating":3,
      "img":bedSvg,
      "title":"Ready for bed",
    },
    {
      "rating":2,
      "img":bedSvg1,
      "title":"Out of bed",
    },
    {
      "rating":3,
      "img":handSvg1,
      "title":"Helping",
    },
    {
      "rating":2,
      "img":numberBlocksSvg,
      "title":"Learning time",
    },
    {
      "rating":2,
      "img":parkSvg,
      "title":"Outside time",
    },
  ];
  final selectedIndex = 0.obs;

  rateStar({required String title}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    var data = {
      "user" : selectedStarsId.join(","),
      "ratedBy" : userId,
      "rating" : 2,
      "ratingFor" : getRatingForKey(title: title),
      "type" : selectedTabIndex.value == 0 ? "positive" : "need",
      "ratingType" : "school"
    };
    BaseAPI().post(url: (ApiEndPoints().giveStarRating),data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: "Success");
        baseCtrl.starsList?.forEach((element) {
          element.isSelected = false;
        });
        baseCtrl.starsList?.refresh();
        isSelectAll.value = false;
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
}