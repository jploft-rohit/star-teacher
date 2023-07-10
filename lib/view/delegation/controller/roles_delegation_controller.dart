import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/roles_delegation_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class RolesDelegationController extends GetxController{

  RxList<RolesDelegationData?>? list = <RolesDelegationData>[].obs;
  TextEditingController schoolController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxString selectedSchoolId = "".obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    BaseAPI().get(url: ApiEndPoints().getRolesDelegation, queryParameters: {
      "limit":300,
      "type":"delegatedToMe",
      "school":selectedSchoolId.value,
    }).then((value){
      if (value?.statusCode ==  200) {
        list?.value = RolesDelegationResponse.fromJson(value?.data).data??[];
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
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: "Success");
        getData();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
}