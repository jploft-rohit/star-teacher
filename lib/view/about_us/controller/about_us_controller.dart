import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/about_us_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class AboutUsController extends GetxController{

  Rx<AboutUsData?>? aboutUsData = AboutUsData().obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    aboutUsData?.value = AboutUsData();
    BaseAPI().get(url: ApiEndPoints().aboutUs).then((value){
      if (value?.statusCode ==  200) {
        aboutUsData?.value = AboutUsResponse.fromJson(value?.data).data;
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
}