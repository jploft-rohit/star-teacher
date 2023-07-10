import 'package:get/get.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/today_schedule_module/controller/today_schedule_controller.dart';

class ClassScheduleScreenCtrl extends GetxController{
  List<String> timeList = [
    "07:30",
    "08:30",
    "09:30",
    "10:30",
    "11:30",
    "12:30",
    "13:30",
    "14:30",
  ];

  List<String> weekList = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  List<String> monList = [
    "G1-H3",
    "Break",
    "G4-H2",
    "G3-H1",
    "G8-H2",
    "G9-H3",
    "G10-H13",
    // "G2-H1",
  ];
  List<String> tueList = [
    "G1-H3",
    "-",
    "G4-H2",
    "G3-H1",
    "G8-H2",
    "G9-H3",
    "G10-H13",
    // "G2-H1"
  ];
  List<String> wedList = [
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    // "-"
  ];
  List<String> thuList = [
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    // "-"
  ];
  List<String> friList = [
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    // "-"
  ];
  List<String> satList = [
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    // "-"
  ];
  List<String> sunList = [
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    "-",
    // "-"
  ];
}