import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/view/create_task_or_assignment/parent_view.dart';
import 'package:staff_app/view/create_task_or_assignment/staff_view.dart';
import 'package:staff_app/view/create_task_or_assignment/star_view.dart';

class CreateTaskOrAssignmentScreenCtrl extends GetxController{
  final selectedIndex = 0.obs;

  List<Widget> screens = [
    CreateTaskStaffView(),
    CreateTaskStarView(),
    CreateTaskParentView(),
  ];

  final isChecked = false.obs;
}