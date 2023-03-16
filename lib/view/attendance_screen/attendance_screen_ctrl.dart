import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:get/get.dart';

class AttendanceScreenCtrl extends GetxController{
  final selectedIndex = 0.obs;
  final selectedIndex1 = 0.obs;
  EventList<Event> markedDateMap = EventList<Event>(
    events: {},
  );

  TabController? tabCtrl;
  TabController? tabCtrl1;

}