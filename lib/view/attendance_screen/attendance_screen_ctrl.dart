import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/teacher_attendance_response.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

import '../../utility/sizes.dart';

class AttendanceScreenController extends GetxController{
  final primaryTabIndex = 0.obs;
  final secondaryTabIndex = 0.obs;
  Rx<EventList<Event>> absentMarkers = EventList<Event>(events: {}).obs;
  Rx<EventList<Event>> presentMarkers = EventList<Event>(events: {}).obs;
  Rx<EventList<Event>> lateMarkers = EventList<Event>(events: {}).obs;
  Rx<File?>? selectedFile = File("").obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TeacherData> teacherData = TeacherData().obs;
  Rx<TextEditingController> reasonController = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;
  RxList<TeacherAttendanceData?>? list = <TeacherAttendanceData?>[].obs;
  RxList<TeacherAttendanceData?>? monthData = <TeacherAttendanceData?>[].obs;
  EventList<Event> markedDateMap = EventList<Event>(
    events: {},
  );
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future getData({bool? getMonthData, DateTime? date, String? refreshType}) async {
    // list?.clear();
    // monthData?.value = [];
    // lateMarkers.value.clear();
    // absentMarkers.value.clear();
    // presentMarkers.value.clear();
    if (refreshType == 'refresh' || refreshType == null) {
      list?.clear();
      monthData?.value = [];
      lateMarkers.value.clear();
      absentMarkers.value.clear();
      presentMarkers.value.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    var data;
    if (getMonthData??false) {
      data = {
        "user": userId,
        "monthYear": formatFlutterDateTimeWithoutDate(flutterDateTime: date??selectedDate.value, getDayFirst: false),
        "type": primaryTabIndex.value == 0 ? "classroom" : primaryTabIndex.value == 1 ? "online" : "transportation",
        "attendanceType": secondaryTabIndex.value == 0 ? primaryTabIndex.value == 2 ? "ontime" : "present" : secondaryTabIndex.value == 1 ? primaryTabIndex.value == 2 ? "late" : "absent" : "late",
      };
    }else{
      data = {
        "user": userId,
        "date": formatFlutterDateTime(flutterDateTime: selectedDate.value, getDayFirst: false),
        "type": primaryTabIndex.value == 0 ? "classroom" : primaryTabIndex.value == 1 ? "online" : "transportation",
        "attendanceType": secondaryTabIndex.value == 0 ? primaryTabIndex.value == 2 ? "ontime" : "present" : secondaryTabIndex.value == 1 ? primaryTabIndex.value == 2 ? "late" : "absent" : "late",
        "limit":apiItemLimit,
        "page":page.value.toString()
      };
    }
    await BaseAPI().get(url: ApiEndPoints().getTeacherAttendance, queryParameters: data, showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        if (getMonthData??false) {
          monthData?.value = TeacherAttendanceResponse.fromJson(value?.data).data?.attendanceData??[];
          monthData?.forEach((element) {
            addMarker(DateTime.parse(element?.date.toString().split("T")[0]??""), (element?.attendanceType??""));
          });
        }else{
          // list?.value = TeacherAttendanceResponse.fromJson(value?.data).data?.attendanceData??[];
          if(refreshType == 'refresh'){
            list?.clear();
            monthData?.value = [];
            lateMarkers.value.clear();
            absentMarkers.value.clear();
            presentMarkers.value.clear();
            refreshController.loadComplete();
            refreshController.refreshCompleted();
          }else if((TeacherAttendanceResponse.fromJson(value?.data).data?.attendanceData??[]).isEmpty && refreshType == 'load'){
            refreshController.loadNoData();
          }
          else if(refreshType == 'load'){
            refreshController.loadComplete();
          }
          list?.addAll(TeacherAttendanceResponse.fromJson(value?.data).data?.attendanceData??[]);
        }
        teacherData.value = TeacherAttendanceResponse.fromJson(value?.data).data?.user ?? TeacherData();
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
     },
   );
  }

  addMarker(DateTime startEventDateTime,String attendanceType) {
    var eventDateTime = startEventDateTime;
    if(attendanceType == "absent"){
      absentMarkers.value.add(
          eventDateTime,
          Event(
            date: eventDateTime,
            title: 'Event 1',
            icon: Container(
              decoration: BoxDecoration(
                  color: BaseColors.textLightGreyColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 9.w,
              width: 9.w,
              alignment: Alignment.center,
              child: Text(eventDateTime.day.toString(),style: TextStyle(
                  color: ColorConstants.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14)),
            ),
          ));
    }
    else if(attendanceType == "late"){
      lateMarkers.value.add(
        eventDateTime,
        Event(
          date: eventDateTime,
          title: 'Event 1',
          icon: Container(
            decoration: BoxDecoration(
                color: BaseColors.lightBlueColor,
                borderRadius: BorderRadius.circular(10)
            ),
            height: 9.w,
            width: 9.w,
            alignment: Alignment.center,
            child: Text(eventDateTime.day.toString(),style: TextStyle(
                color: ColorConstants.white,
                fontWeight: FontWeight.w400,
                fontSize: 14),),
          ),
        ),);
    }else if(attendanceType == "present"){
      presentMarkers.value.add(
        eventDateTime,
        Event(
          date: eventDateTime,
          title: 'Event 1',
          icon: Container(
            decoration: BoxDecoration(
                color: BaseColors.primaryColor,
                borderRadius: BorderRadius.circular(10)
            ),
            height: 9.w,
            width: 9.w,
            alignment: Alignment.center,
            child: Text(eventDateTime.day.toString(),style: TextStyle(
                color: ColorConstants.white,
                fontWeight: FontWeight.w400,
                fontSize: 14),),
          ),
        ),
      );
    }
  }

  updateReasonStatus({required String id}) async {
    dio.FormData data;
    if ((selectedFile?.value?.path??"").isEmpty) {
      data = dio.FormData.fromMap({
        "reason":reasonController.value.text.trim(),
      });
    }else{
      data = dio.FormData.fromMap({
        "reason":reasonController.value.text.trim(),
        "document": await dio.MultipartFile.fromFile(selectedFile?.value?.path??"", filename: selectedFile?.value?.path.split("/").last??"")
      });
    }
    BaseAPI().post(url: ApiEndPoints().updateAbsentReason+id, data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
        getData();
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    },
    );
  }

  void goToPreviousDate() {
    selectedDate.value = selectedDate.value.subtract(Duration(days: 1));
    getData();
  }

  void goToNextDate() {
    selectedDate.value = selectedDate.value.add(Duration(days: 1));
    getData();
  }
}