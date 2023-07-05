import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:get/get.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/teacher_attendance_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class AttendanceScreenController extends GetxController{
  final primaryTabIndex = 0.obs;
  final secondaryTabIndex = 0.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TeacherData> teacherData = TeacherData().obs;
  RxList<TeacherAttendanceData?>? list = <TeacherAttendanceData?>[].obs;
  EventList<Event> markedDateMap = EventList<Event>(
    events: {},
  );

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    list?.clear();
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    var data = {
      "user": userId,
      "limit": 100,
      "date": formatFlutterDateTime(flutterDateTime: selectedDate.value, getDayFirst: false),
      "type": primaryTabIndex.value == 0 ? "classroom" : primaryTabIndex.value == 1 ? "online" : "transportation",
      "attendanceType": secondaryTabIndex.value == 0 ? primaryTabIndex.value == 2 ? "ontime" : "present" : secondaryTabIndex.value == 1 ? primaryTabIndex.value == 2 ? "late" : "absent" : "late",
    };
    BaseAPI().get(url: ApiEndPoints().getTeacherAttendance, queryParameters: data).then((value){
      if (value?.statusCode ==  200) {
        list?.value = TeacherAttendanceResponse.fromJson(value?.data).data?.attendanceData??[];
        teacherData.value = TeacherAttendanceResponse.fromJson(value?.data).data?.user ?? TeacherData();
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
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