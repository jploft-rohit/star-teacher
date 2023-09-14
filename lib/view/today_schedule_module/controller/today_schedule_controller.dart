import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/class_schedule_weekly_plan_response.dart';
import 'package:staff_app/backend/responses_model/staff_list_response.dart';
import 'package:staff_app/backend/responses_model/today_schedule_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

import '../../../utility/sizes.dart';

class TodayScheduleController extends GetxController{

  RxList<TodayScheduleData?>? list = <TodayScheduleData>[].obs;
  RxList<ClassScheduleWeeklyPlanData>? weekList = <ClassScheduleWeeklyPlanData>[].obs;
  RxString type = "".obs;
  TextEditingController schoolController = TextEditingController();
  RxString selectedSchoolId = "".obs;
  RxBool isStaffLoading = false.obs;
  RxString selectedTeacherId = "".obs;
  RxString selectedTeacherName = "Select Teacher".obs;
  RxString selectedInTime = "Select In Time".obs;
  RxString selectedOutTime = "Select Out Time".obs;
  RxString selectedOutTimeAPI = "Select Out Time".obs;
  RxString selectedInTimeAPI = "Select Out Time".obs;
  RxString selectedRescheduleDate = "Select Date".obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  List<StaffListData> staffData = [];
  /// Weekly Plan
  final calenderTimeTable = <Timetable>[].obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);
  RxInt page = 1.obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).obs;
  Rx<DateTime> endDate = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 5)).obs;

  void getNextWeekMondayDate() {
    fromDate.value = fromDate.value.add(const Duration(days: 7));
    endDate.value = endDate.value.add(const Duration(days: 7));
    getWeeklyClassScheduledData();
  }

  List<String>? getTopics(int myindex, int index) {
    List<String>? topics = [];

    switch (myindex) {
      case 0:
        topics = calenderTimeTable[index].dayTopics?.monday??[];
        break;
      case 1:
        topics = calenderTimeTable[index].dayTopics?.tuesday??[];
        break;
      case 2:
        topics = calenderTimeTable[index].dayTopics?.wednesday??[];
        break;
      case 3:
        topics = calenderTimeTable[index].dayTopics?.thursday??[];
        break;
      case 4:
        topics = calenderTimeTable[index].dayTopics?.friday??[];
        break;
      default:
        topics = [];
    }
    return topics;
  }

  String? getSubjectId(int myindex, int index) {
    String? subjectId = "";

    switch (myindex) {
      case 0:
        subjectId = calenderTimeTable[index].dayId?.monday??"";
        break;
      case 1:
        subjectId = calenderTimeTable[index].dayId?.tuesday??"";
        break;
      case 2:
        subjectId = calenderTimeTable[index].dayId?.wednesday??"";
        break;
      case 3:
        subjectId = calenderTimeTable[index].dayId?.thursday??"";
        break;
      case 4:
        subjectId = calenderTimeTable[index].dayId?.friday??"";
        break;
      default:
        subjectId = "";
    }
    return subjectId;
  }


  void getPreviousWeekMondayDate() {
    fromDate.value = fromDate.value.subtract(const Duration(days: 7));
    endDate.value = endDate.value.subtract(const Duration(days: 7));
    getWeeklyClassScheduledData();
  }

  void goToPreviousDate() {
    refreshController.loadComplete();
    list?.clear();
    selectedDate.value = selectedDate.value.subtract(const Duration(days: 1));
    type.value = "today";
    getDayData();
  }

  void goToNextDate() {
    refreshController.loadComplete();
    list?.clear();
    selectedDate.value = selectedDate.value.add(const Duration(days: 1));
    getDayData();
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

  getDayData({String? date, String? refreshType}) async {
    if (refreshType == 'refresh' || refreshType == null) {
      list?.clear();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    final String localType = type.value == "This Week" ? 'week' : type.value == "Classes Taken" ? "taken" : "today";
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    BaseAPI().get(url: ApiEndPoints().getTodayScheduledList,queryParameters: {
      "userId": userId,
      "school": selectedSchoolId.value,
      "type":localType,
      "date":formatFlutterDateTime(flutterDateTime: selectedDate.value,getDayFirst: false),
      "limit":apiItemLimit,
      "page":page.value.toString()
    },showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        if(refreshType == 'refresh'){
          list?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((TodayScheduleResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        list?.addAll(TodayScheduleResponse.fromJson(value?.data).data??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  notifyAdminClassSchedule({String? inTime,
    String? outTime,
    String? reason,
    String? comment,
    bool? isPermanentReschedule,
    String? startDate,
    String? endDate,
  }) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    dio.FormData data = dio.FormData.fromMap({
      "user[0]": userId,
      "reason": reason??"",
      "comment": comment??"",
      "typeOfRequest": "notifyAuthority",
      "permanentReschedule": (isPermanentReschedule??true),
      "startDate": flipDate(date: (startDate??"")),
      "endDate": flipDate(date: (endDate??"")),
      "inTime": selectedInTimeAPI.value,
      "outTime": selectedOutTimeAPI.value,
      "school": selectedSchoolId.value,
    });
    BaseAPI().post(url: ApiEndPoints().notifyAdmin, data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().showSnackBar(message: "Notified Successfully"/*(BaseSuccessResponse.fromJson(value?.data).message??"")*/,title: "Success");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  getWeeklyClassScheduledData() async {
    weekList?.clear();
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    BaseAPI().get(url: (ApiEndPoints().getWeeklyClassSchedule)+(userId),queryParameters: {
      "from":formatFlutterDateTime(flutterDateTime: fromDate.value, getDayFirst: false),
      "to":formatFlutterDateTime(flutterDateTime: endDate.value, getDayFirst: false),
    }).then((value){
      if (value?.statusCode ==  200) {
        weekList?.value = ClassScheduleWeeklyPlanResponse.fromJson(value?.data).data??[];
        weekPlanListToTimeTable();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  addTopics({required String subjectId, required String topics}) async {
    var data = {
      "topic":topics
    };
    BaseAPI().put(url: (ApiEndPoints().addTopics)+(subjectId), data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().dismissOverlay();
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: "Success");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  weekPlanListToTimeTable() async {
    calenderTimeTable.clear();
    List<Timetable> timeTableList = [];
    for (ClassScheduleWeeklyPlanData weekPlan in weekList??[]) {
      String starTime = getFormattedTime(weekPlan.startTime);
      String endTime = getFormattedTime(weekPlan.endTime);
      Timetable? timeTable = timeTableList.firstWhereOrNull((element) => element.starTime == starTime && element.endTime == endTime);
      if (timeTable == null) {
        timeTableList.add(
          Timetable(
            starTime: starTime,
            endTime: endTime,
            daySubject: DaySubject(
              monday: weekPlan.day == 1 ? weekPlan.subject?.name : null,
              tuesday: weekPlan.day == 2 ? weekPlan.subject?.name : null,
              wednesday: weekPlan.day == 3 ? weekPlan.subject?.name : null,
              thursday: weekPlan.day == 4 ? weekPlan.subject?.name : null,
              friday: weekPlan.day == 5 ? weekPlan.subject?.name : null,
              saturday: weekPlan.day == 6 ? weekPlan.subject?.name : null,
              sunday: weekPlan.day == 7 ? weekPlan.subject?.name : null,
            ),
            dayTopics: DayTopics(
              monday: weekPlan.day == 1 ? weekPlan.topics : null,
              tuesday: weekPlan.day == 2 ? weekPlan.topics : null,
              wednesday: weekPlan.day == 3 ? weekPlan.topics : null,
              thursday: weekPlan.day == 4 ? weekPlan.topics : null,
              friday: weekPlan.day == 5 ? weekPlan.topics : null,
              saturday: weekPlan.day == 6 ? weekPlan.topics : null,
              sunday: weekPlan.day == 7 ? weekPlan.topics : null,
            ),
            dayId: DaySubject(
              monday: weekPlan.day == 1 ? weekPlan.sId : null,
              tuesday: weekPlan.day == 2 ? weekPlan.sId : null,
              wednesday: weekPlan.day == 3 ? weekPlan.sId : null,
              thursday: weekPlan.day == 4 ? weekPlan.sId : null,
              friday: weekPlan.day == 5 ? weekPlan.sId : null,
              saturday: weekPlan.day == 6 ? weekPlan.sId : null,
              sunday: weekPlan.day == 7 ? weekPlan.sId : null,
            ),
          ),
        );
      } else {
        int index = timeTableList.indexOf(timeTable);
        if (weekPlan.day == 1) {
          timeTableList[index].daySubject?.monday = weekPlan.subject?.name;
          timeTableList[index].dayTopics?.monday = weekPlan.topics;
          timeTableList[index].dayId?.monday = weekPlan.sId;

        }
        if (weekPlan.day == 2) {
          timeTableList[index].daySubject?.tuesday = weekPlan.subject?.name;
          timeTableList[index].dayTopics?.tuesday = weekPlan.topics;
          timeTableList[index].dayId?.tuesday = weekPlan.sId;
        }
        if (weekPlan.day == 3) {
          timeTableList[index].daySubject?.wednesday = weekPlan.subject?.name;
          timeTableList[index].dayTopics?.wednesday = weekPlan.topics;
          timeTableList[index].dayId?.wednesday = weekPlan.sId;
        }
        if (weekPlan.day == 4) {
          timeTableList[index].daySubject?.thursday = weekPlan.subject?.name;
          timeTableList[index].dayTopics?.thursday = weekPlan.topics;
          timeTableList[index].dayId?.thursday = weekPlan.sId;
        }
        if (weekPlan.day == 5) {
          timeTableList[index].daySubject?.friday = weekPlan.subject?.name;
          timeTableList[index].dayTopics?.friday = weekPlan.topics;
          timeTableList[index].dayId?.friday = weekPlan.sId;
        }
        if (weekPlan.day == 6) {
          timeTableList[index].daySubject?.saturday = weekPlan.subject?.name;
          timeTableList[index].dayTopics?.saturday = weekPlan.topics;
          timeTableList[index].dayId?.saturday = weekPlan.sId;
        }
        if (weekPlan.day == 7) {
          timeTableList[index].daySubject?.sunday = weekPlan.subject?.name;
          timeTableList[index].dayTopics?.sunday = weekPlan.topics;
          timeTableList[index].dayId?.sunday = weekPlan.sId;
        }
      }
    }
    calenderTimeTable.addAll(timeTableList);
  }
  List<Map<String, dynamic>> headerList = [
    {
      'first': '08:00',
      'second': '09:00',
      'firstColor': const Color(0xff00A624),
      'secondColor': BaseColors.primaryColor,
    },
    {
      'first': '09:00',
      'second': '10:00',
      'firstColor': BaseColors.primaryColor,
      'secondColor': BaseColors.primaryColor,
    },
    {
      'first': '10:00',
      'second': '11:00',
      'firstColor': BaseColors.primaryColor,
      'secondColor': BaseColors.primaryColor,
    },
    {
      'first': '11:00',
      'second': '11:30',
      'firstColor': const Color(0xffE62626),
      'secondColor': const Color(0xffE62626),
    },
    {
      'first': '11:30',
      'second': '12:30',
      'firstColor': BaseColors.primaryColor,
      'secondColor': BaseColors.primaryColor,
    },
    {
      'first': '12:30',
      'second': '13:30',
      'firstColor': BaseColors.primaryColor,
      'secondColor': BaseColors.primaryColor,
    },
    {
      'first': '13:30',
      'second': '14:30',
      'firstColor': BaseColors.primaryColor,
      'secondColor': BaseColors.primaryColor,
    },
    {
      'first': '14:30',
      'second': '15:00',
      'firstColor': BaseColors.primaryColor,
      'secondColor': BaseColors.primaryColor,
    },
    {
      'first': '15:00',
      'second': '16:00',
      'firstColor': BaseColors.primaryColor,
      'secondColor': BaseColors.primaryColor,
    },
    {
      'first': '16:00',
      'second': '17:00',
      'firstColor': BaseColors.primaryColor,
      'secondColor': const Color(0xffE62626),
    },
  ];


  List<Map<String, dynamic>> times = [
    {
      'day': 'Mon',
      'date': '05/06/23',
    },
    {
      'day': 'Tue',
      'date': '06/06/23',
    },
    {
      'day': 'Wed',
      'date': '07/06/23',
    },
    {
      'day': 'Thu',
      'date': '08/06/23',
    },
    {
      'day': 'Fri',
      'date': '09/06/23',
    },
  ];
}
///
class Timetable {
  String? starTime;
  String? endTime;
  DaySubject? daySubject;
  DayTopics? dayTopics;
  DaySubject? dayId;

  Timetable(
      {this.starTime,
        this.endTime,
        this.daySubject,
        this.dayTopics,
        this.dayId});

  Timetable.fromJson(Map<String, dynamic> json) {
    starTime = json['star_time'];
    endTime = json['end_time'];
    daySubject = json['day_subject'] != null
        ? new DaySubject.fromJson(json['day_subject'])
        : null;
    dayTopics = json['day_topics'] != null
        ? new DayTopics.fromJson(json['day_topics'])
        : null;
    dayId =
    json['day_id'] != null ? new DaySubject.fromJson(json['day_id']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['star_time'] = this.starTime;
    data['end_time'] = this.endTime;
    if (this.daySubject != null) {
      data['day_subject'] = this.daySubject!.toJson();
    }
    if (this.dayTopics != null) {
      data['day_topics'] = this.dayTopics!.toJson();
    }
    if (this.dayId != null) {
      data['day_id'] = this.dayId!.toJson();
    }
    return data;
  }
}

class DaySubject {
  String? monday;
  String? tuesday;
  String? wednesday;
  String? thursday;
  String? friday;
  String? saturday;
  String? sunday;

  DaySubject(
      {this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.sunday});

  DaySubject.fromJson(Map<String, dynamic> json) {
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
    sunday = json['sunday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monday'] = this.monday;
    data['tuesday'] = this.tuesday;
    data['wednesday'] = this.wednesday;
    data['thursday'] = this.thursday;
    data['friday'] = this.friday;
    data['saturday'] = this.saturday;
    data['sunday'] = this.sunday;
    return data;
  }
}

class DayTopics {
  List<String>? monday;
  List<String>? tuesday;
  List<String>? wednesday;
  List<String>? thursday;
  List<String>? friday;
  List<String>? saturday;
  List<String>? sunday;

  DayTopics(
      {this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.sunday});

  DayTopics.fromJson(Map<String, dynamic> json) {
    monday = json['monday'].cast<String>();
    tuesday = json['tuesday'].cast<String>();
    wednesday = json['wednesday'].cast<String>();
    thursday = json['thursday'].cast<String>();
    friday = json['friday'].cast<String>();
    saturday = json['saturday'].cast<String>();
    sunday = json['sunday'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monday'] = this.monday;
    data['tuesday'] = this.tuesday;
    data['wednesday'] = this.wednesday;
    data['thursday'] = this.thursday;
    data['friday'] = this.friday;
    data['saturday'] = this.saturday;
    data['sunday'] = this.sunday;
    return data;
  }
}
