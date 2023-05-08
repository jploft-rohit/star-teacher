import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/all_feedback_help_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class FeedbackHelpController extends GetxController{
  Rx<AllFeedbackHelpResponse> response = AllFeedbackHelpResponse().obs;

  @override
  void onInit() {
    super.onInit();
    getData(type: '');
  }

  getData({required String type}){
    response.value.data?.feedbackHelp = [];
    // BaseAPI().get(url: ApiEndPoints().getAllFeedbackHelp,/*queryParameters: type.isNotEmpty ? {"type":type} : null*/).then((value){
    //   if (value?.statusCode ==  200) {
    //     response.value = AllFeedbackHelpResponse.fromJson(value?.data);
    //   }else{
    //     BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
    //   }
    // });
  }
}