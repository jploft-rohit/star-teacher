import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleMeetingScreenCtrl extends GetxController{
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
}