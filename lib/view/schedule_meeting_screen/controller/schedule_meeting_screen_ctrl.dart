import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/utility/base_utility.dart';
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
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dio/dio.dart' as dio;

import '../../../utility/sizes.dart';

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
  String? userId;
  List<StaffListData> staffData = [];
  RxList<String> stepperTimeDate = ["","","",""].obs;
  final formKey = GlobalKey<FormState>();
  final selectDateFormKey = GlobalKey<FormState>();
  RxList<ScheduledMeetingData>? list = <ScheduledMeetingData>[].obs;
  Rx<TextEditingController> meetingTypeController = TextEditingController().obs;
  Rx<TextEditingController> selectRoleController = TextEditingController().obs;
  Rx<TextEditingController> selectSchoolController = TextEditingController().obs;
  Rx<TextEditingController> searchRoleDataController = TextEditingController().obs;
  Rx<TextEditingController> selectedPersonController = TextEditingController().obs;
  Rx<TextEditingController> schoolController = TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> timeController = TextEditingController().obs;
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  onInit() async {
    super.onInit();
   selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
   schoolController.value.text = baseCtrl.schoolListData.data?.data?.first.name??"";
    getScheduledMeetingData();
    userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
  }

  clearData(){
    meetingTypeController.value.clear();
    selectRoleController.value.clear();
    searchRoleDataController.value.clear();
    selectedPersonController.value.clear();
    selectedRoleId.value = "";
    selectedRoleName.value = "";
    selectedPersonId.value = "";
    selectedTime.value = "";
    dateController.value.text = "";
  }

  getScheduledMeetingData({String? refreshType}){
    if (refreshType == 'refresh' || refreshType == null) {
      list?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    BaseAPI().get(url: ApiEndPoints().getScheduledMeetings, queryParameters: {
      "status" : selectedTabIndex.value == 0 ? "request raised" : selectedTabIndex.value == 1 ? "planned on" : selectedTabIndex.value == 2 ? "cancelled" : "completed","typeOfRequest":"scheduleMeeting",
      "school" : selectedSchoolId.value,
      "limit":apiItemLimit,
      "page":page.value.toString()
    },showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        // list?.value = ScheduledMeetingResponse.fromJson(value?.data).data??[];
        if(refreshType == 'refresh'){
          list?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((ScheduledMeetingResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        list?.addAll(ScheduledMeetingResponse.fromJson(value?.data).data??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
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
          "date":flipDate(date: dateController.value.text),
          "time":selectedTime.value,
          "meetingType":meetingTypeController.value.text.trim(),
          "teacher":selectedPersonId.value,
        });
        BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
        BaseAPI().post(url: ApiEndPoints().scheduleNewMeeting,data: data).then((value){
          if (value?.statusCode ==  200) {
            selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
            schoolController.value.text = baseCtrl.schoolListData.data?.data?.first.name??"";
            Get.back();
            baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
            BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: translate(Get.context!).success);
            getScheduledMeetingData();
          }else{
            BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
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
      "roleName" : selectedRoleId
    };
    BaseAPI().get(url: ApiEndPoints().getStaffData, queryParameters: data, showLoader: false).then((value){
      if (value?.statusCode ==  200) {
        isStaffLoading.value = false;
        staffData = StaffListResponse.fromJson(value?.data).data??[];
      }else{
        isStaffLoading.value = false;
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
      }
    });
  }

  rescheduleMeeting({required id}) async {
    dio.FormData data = dio.FormData.fromMap({
      "date":flipDate(date: dateController.value.text),
      "time":selectedTime.value,
      "isReschedule":"1",
    });
    BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
    BaseAPI().put(url: ApiEndPoints().rescheduleMeeting+id,data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().dismissOverlay();
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: translate(Get.context!).success);
        getScheduledMeetingData();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  Future<bool> updateStatus({required id,type,meetingFeedBackRating,meetingFeedBackDesc,reason, isScheduleMeetingStart, int? index, bool? shouldDismissDialog}) async {
    bool returnValue = false;
    if (shouldDismissDialog??true) {
      BaseOverlays().dismissOverlay();
    }
    dio.FormData data = dio.FormData.fromMap({
      "statusType":"scheduleMeeting",
      "status":type,
      "reason":reason,
      "meetingFeedBackRating":meetingFeedBackRating,
      "meetingFeedBackDesc":meetingFeedBackDesc,
      "isScheduleMeetingStart":isScheduleMeetingStart,
    });
    BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
    await BaseAPI().put(url: ApiEndPoints().updateScheduledMeetingStatus+id,data: data).then((value){
      if (value?.statusCode ==  200) {
        returnValue = true;
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: translate(Get.context!).success);
        getScheduledMeetingData();
      }else{
        returnValue = false;
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
    return returnValue;
  }

  updateRating({required id,required meetingFeedBackRating}) async {
    BaseOverlays().dismissOverlay();
    dio.FormData data = dio.FormData.fromMap({
      "statusType":"scheduleMeeting",
      "meetingFeedBackRating":meetingFeedBackRating,
    });
    BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
    BaseAPI().put(url: ApiEndPoints().rescheduleMeeting+id,data: data).then((value){
      if (value?.statusCode ==  200) {
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: "Success");
        getScheduledMeetingData();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  updateMeetingStatus({required id, required int index}) async {
    await BaseAPI().get(url: ApiEndPoints().updateMeetingStartStatus+id, showLoader: false).then((value){
      if (value?.statusCode ==  200) {
        list?[index].isScheduleMeetingStart = "1";
        list?.refresh();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }
}