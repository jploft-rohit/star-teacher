import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/scheduled_meeting_response.dart';
import 'package:staff_app/backend/responses_model/staff_list_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/intl/src/intl/date_format.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dio/dio.dart' as dio;

class ScheduleMeetingScreenCtrl extends GetxController{

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+1);
  DateTime focusedDay = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+1);
  RxString selectedSchoolId = "".obs;
  RxString selectedRoleId = "".obs;
  RxString selectedRoleName = "".obs;
  RxString selectedTime = "".obs;
  RxBool isStaffLoading = false.obs;
  RxString selectedPersonId = "".obs;
  RxInt selectedTabIndex = 0.obs;
  List<StaffListData> staffData = [];
  RxList<String> stepperTimeDate = ["","","",""].obs;
  final formKey = GlobalKey<FormState>();
  RxList<ScheduledMeetingData>? list = <ScheduledMeetingData>[].obs;
  Rx<TextEditingController> meetingTypeController = TextEditingController().obs;
  Rx<TextEditingController> selectRoleController = TextEditingController().obs;
  Rx<TextEditingController> selectSchoolController = TextEditingController().obs;
  Rx<TextEditingController> searchRoleDataController = TextEditingController().obs;
  Rx<TextEditingController> selectedPersonController = TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    getScheduledMeetingData(type: "request raised");
  }

  clearData(){
    meetingTypeController.value.clear();
    selectRoleController.value.clear();
    selectSchoolController.value.clear();
    searchRoleDataController.value.clear();
    selectedPersonController.value.clear();
    selectedSchoolId.value = "";
    selectedRoleId.value = "";
    selectedRoleName.value = "";
    selectedPersonId.value = "";
    selectedTime.value = "";
  }

  getScheduledMeetingData({type}){
    list?.clear();
    BaseAPI().get(url: ApiEndPoints().getScheduledMeetings, queryParameters: {"status" : selectedTabIndex.value == 0 ? "request raised" : selectedTabIndex.value == 1 ? "planned" : selectedTabIndex.value == 2 ? "cancelled" : "completed","typeOfRequest":"scheduleMeeting"}).then((value){
      if (value?.statusCode ==  200) {
        list?.value = ScheduledMeetingResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  createScheduledMeeting() async {
    if (formKey.currentState?.validate()??false) {
      if (selectedTime.value.isNotEmpty) {
        final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
        dio.FormData data = dio.FormData.fromMap({
          "school":selectedSchoolId.value,
          "user[0]":userId,
          "typeOfRequest":"scheduleMeeting",
          "date":"${(DateFormat('yyyy-MM-dd').format(selectedDay)).toString()}",
          "time":(selectedTime.value).toString(),
          "meetingType":meetingTypeController.value.text.trim()
        });
        BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
        BaseAPI().post(url: ApiEndPoints().scheduleNewMeeting,data: data).then((value){
          if (value?.statusCode ==  200) {
            Get.back();
            baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
            BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: "Success");
            getScheduledMeetingData();
          }else{
            BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
          }
        });
      }else{
        baseToast(message: "Please select time slot");
      }
    }
  }

  getStaffData({required String selectedRoleId, required String selectedSchoolId}){
    isStaffLoading.value = true;
    staffData = [];
    var data = {
      "school" : selectedSchoolId,
      "role" : selectedRoleId
    };
    BaseAPI().post(url: ApiEndPoints().getStaffData, data: data, showLoader: false).then((value){
      if (value?.statusCode ==  200) {
        isStaffLoading.value = false;
        staffData = StaffListResponse.fromJson(value?.data).data??[];
      }else{
        isStaffLoading.value = false;
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
    });
  }

  rescheduleMeeting({required id}) async {
    dio.FormData data = dio.FormData.fromMap({
      "date":selectedDay,
      "time":selectedTime.value,
    });
    BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
    BaseAPI().put(url: ApiEndPoints().rescheduleMeeting+id,data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().dismissOverlay();
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: "Success");
        getScheduledMeetingData(type: "request raised");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  updateStatus({required id,type,meetingFeedBackRating,meetingFeedBackDesc}) async {
    BaseOverlays().dismissOverlay();
    dio.FormData data = dio.FormData.fromMap({
      "statusType":"scheduleMeeting",
      "status":type,
      "meetingFeedBackRating":meetingFeedBackRating,
      "meetingFeedBackDesc":meetingFeedBackDesc
    });
    BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
    BaseAPI().put(url: ApiEndPoints().updateScheduledMeetingStatus+id,data: data).then((value){
      if (value?.statusCode ==  200) {
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: "Success");
        getScheduledMeetingData(type: selectedTabIndex.value == 0 ? "request raised" : selectedTabIndex.value == 1 ? "planned on" : selectedTabIndex.value == 2 ? "cancelled" : "completed");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
}