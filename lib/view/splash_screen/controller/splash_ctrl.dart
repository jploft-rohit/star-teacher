import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/comlaint_type_reponse.dart';
import 'package:staff_app/backend/responses_model/roles_list_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class SplashCtrl extends GetxController{

  SchoolListResponse schoolListData = SchoolListResponse();
  ComplaintTypeResponse complaintTypeResponse = ComplaintTypeResponse();
  RolesListResponse rolesListResponse = RolesListResponse();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   final String token = await BaseSharedPreference().getString(SpKeys().apiToken)??"";
    //   if ((token).isNotEmpty) {
    //     getSchoolData(showLoader: false);
    //     getComplaintTypeData(showLoader: false);
    //     getRolesList(showLoader: false);
    //   }
    // });
  }

  getSchoolData({bool? showLoader}){
    schoolListData = SchoolListResponse();
    BaseAPI().get(url: ApiEndPoints().getSchoolList, showLoader: showLoader??true).then((value){
      if (value?.statusCode ==  200) {
        schoolListData = SchoolListResponse.fromJson(value?.data);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
     },
   );
  }

  getComplaintTypeData({bool? showLoader}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    complaintTypeResponse = ComplaintTypeResponse();
    BaseAPI().get(url: ApiEndPoints().getComplaintType+userId,showLoader: showLoader).then((value){
      if (value?.statusCode ==  200) {
        complaintTypeResponse = ComplaintTypeResponse.fromJson(value?.data);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  getRolesList({bool? showLoader}) async {
    rolesListResponse = RolesListResponse();
    BaseAPI().get(url: ApiEndPoints().getAllRoles,showLoader: showLoader).then((value){
      if (value?.statusCode ==  200) {
        rolesListResponse = RolesListResponse.fromJson(value?.data);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
}