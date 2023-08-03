import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/my_profile_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class MyProfileCtrl extends GetxController{
  Rx<MyProfileResponse> response = MyProfileResponse().obs;
  RxList<FamilyMembers?>? familyMemberList = <FamilyMembers>[].obs;
  BaseSuccessResponse successResponse = BaseSuccessResponse();
  RxList<String> staticsCountList = <String>[
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData(){
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    BaseAPI().get(url: ApiEndPoints().getMyProfile).then((value){
      if (value?.statusCode == 200) {
        response.value = MyProfileResponse.fromJson(value?.data);
        familyMemberList?.value = MyProfileResponse.fromJson(value?.data).data?.familyMembers??[];
        setStatics();
      }else{
        // BaseDialogs().showSnackBar(message: ,title: response.message??"");
      }
    });
  }

  setStatics(){
    staticsCountList[0] = (response.value.data?.statistics?.pendingTask??"0").toString();
    staticsCountList[1] = (response.value.data?.statistics?.unclosedComplaint??"0").toString();
    staticsCountList[2] = (response.value.data?.statistics?.starsEvaluationPending??"0").toString();
    staticsCountList[3] = (response.value.data?.statistics?.assignmentToReview??"0").toString();
    staticsCountList[4] = (response.value.data?.statistics?.attendanceRecord??"0").toString();
    staticsCountList[5] = (response.value.data?.statistics?.performance??"0").toString();
    staticsCountList[6] = (response.value.data?.statistics?.linkedStars??"0").toString();
    staticsCountList[7] = (response.value.data?.statistics?.allocatedSchools??"0").toString();
    staticsCountList[8] = (response.value.data?.statistics?.totalClassesAttendedThisWeek??"0").toString();
    staticsCountList[9] = (response.value.data?.statistics?.avgOfInteractingWithChatting??"0").toString();
    // staticsCountList.refresh();
    // update();
  }

  deleteFamilyMember({required String memberId,required int index}){
    BaseAPI().delete(url: ApiEndPoints().deleteFamilyMember+memberId).then((value){
      if (value?.statusCode == 200) {
        successResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: successResponse.message??"",title: translate(Get.context!).success);
        familyMemberList?.removeAt(index);
        familyMemberList?.refresh();
        update();
      }else{
        // BaseDialogs().showSnackBar(message: ,title: response.message??"");
      }
    });
  }
}