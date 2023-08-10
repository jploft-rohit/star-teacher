import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/class_schedule_weekly_plan_response.dart';
import 'package:staff_app/backend/responses_model/today_schedule_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class TodayScheduleController extends GetxController{

  RxList<TodayScheduleData?>? list = <TodayScheduleData>[].obs;
  RxList<ClassScheduleWeeklyPlanData>? weekList = <ClassScheduleWeeklyPlanData>[].obs;
  RxString type = "".obs;
  TextEditingController schoolController = TextEditingController();
  RxString selectedSchoolId = "".obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  /// Weekly Plan
  final calenderTimeTable = <Timetable>[].obs;

  Rx<DateTime> fromDate = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).obs;
  Rx<DateTime> endDate = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 5)).obs;

  void getNextWeekMondayDate() {
    fromDate.value = fromDate.value.add(Duration(days: 7));
    endDate.value = endDate.value.add(Duration(days: 7));
    getWeeklyClassScheduledData();
  }

  void getPreviousWeekMondayDate() {
    fromDate.value = fromDate.value.subtract(Duration(days: 7));
    endDate.value = endDate.value.subtract(Duration(days: 7));
    getWeeklyClassScheduledData();
  }

  void goToPreviousDate() {
    selectedDate.value = selectedDate.value.subtract(Duration(days: 1));
    type.value = "today";
    getDayData();
  }

  void goToNextDate() {
    selectedDate.value = selectedDate.value.add(Duration(days: 1));
    getDayData();
  }

  getDayData({String? date}) async {
    list?.clear();
    final String localType = type.value == "This Week" ? 'week' : type.value == "Classes Taken" ? "taken" : "today";
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    BaseAPI().get(url: ApiEndPoints().getTodayScheduledList,queryParameters: {"userId": userId, "school": selectedSchoolId.value, "type":localType,"date":formatFlutterDateTime(flutterDateTime: selectedDate.value,getDayFirst: false)}).then((value){
      if (value?.statusCode ==  200) {
        list?.value = TodayScheduleResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  notifyAdminClassSchedule({String? reason, String? comment, bool? isPermanentReschedule, String? startDate, String? endDate}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    dio.FormData data = dio.FormData.fromMap({
      "user[0]": userId,
      "reason": reason??"",
      "comment": comment??"",
      "permanentReschedule": isPermanentReschedule??false,
      "startDate": flipDate(date: (startDate??"")),
      "endDate": flipDate(date: (endDate??"")),
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
    BaseAPI().get(url: (ApiEndPoints().getWeeklyClassSchedule)+(userId),queryParameters: {"from":formatFlutterDateTime(flutterDateTime: fromDate.value, getDayFirst: false), "to":formatFlutterDateTime(flutterDateTime: endDate.value, getDayFirst: false)}).then((value){
      if (value?.statusCode ==  200) {
        weekList?.value = ClassScheduleWeeklyPlanResponse.fromJson(value?.data).data??[];
        weekPlanListToTimeTable();
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
          ),
        );
      } else {
        int index = timeTableList.indexOf(timeTable);
        if (weekPlan.day == 1) {
          timeTableList[index].daySubject?.monday = weekPlan.subject?.name;
        }
        if (weekPlan.day == 2) {
          timeTableList[index].daySubject?.tuesday = weekPlan.subject?.name;
        }
        if (weekPlan.day == 3) {
          timeTableList[index].daySubject?.wednesday = weekPlan.subject?.name;
        }
        if (weekPlan.day == 4) {
          timeTableList[index].daySubject?.thursday = weekPlan.subject?.name;
        }
        if (weekPlan.day == 5) {
          timeTableList[index].daySubject?.friday = weekPlan.subject?.name;
        }
        if (weekPlan.day == 6) {
          timeTableList[index].daySubject?.saturday = weekPlan.subject?.name;
        }
        if (weekPlan.day == 7) {
          timeTableList[index].daySubject?.sunday = weekPlan.subject?.name;
        }
      }
    }
    calenderTimeTable.addAll(timeTableList);
  }
  List<Map<String, dynamic>> headerList = [
    {
      'first': '08:00',
      'second': '09:00',
      'firstColor': Color(0xff00A624),
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
      'firstColor': Color(0xffE62626),
      'secondColor': Color(0xffE62626),
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
      'secondColor': Color(0xffE62626),
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

  Timetable({this.starTime, this.endTime, this.daySubject});

  Timetable.fromJson(Map<String, dynamic> json) {
    starTime = json['star_time'];
    endTime = json['end_time'];
    daySubject = json['day_subject'] != null
        ? DaySubject?.fromJson(json['day_subject'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['star_time'] = starTime;
    data['end_time'] = endTime;
    if (daySubject != null) {
      data['day_subject'] = daySubject?.toJson();
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
    final data = <String, dynamic>{};
    data['monday'] = monday;
    data['tuesday'] = tuesday;
    data['wednesday'] = wednesday;
    data['thursday'] = thursday;
    data['friday'] = friday;
    data['saturday'] = saturday;
    data['sunday'] = sunday;
    return data;
  }
  
}
