import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/classroom_view.dart';

class StarAttendanceScreenCtrl extends GetxController{
  final selectedIndex = 0.obs;

  List<Widget> list = [
    const ClassRoomView(),
    const ClassRoomView(),
    const ClassRoomView(),
  ];
  List<Map<String, dynamic>> reasonList = [
    {
      "title":translate(Get.context!).out_before_class_ends,
      "isSelected":true,
    },
    {
      "title":translate(Get.context!).reporting_to_admin,
      "isSelected":false,
    },
    {
      "title":translate(Get.context!).late,
      "isSelected":false,
    },
    {
      "title":translate(Get.context!).absent,
      "isSelected":false,
    },
    {
      "title":translate(Get.context!).present,
      "isSelected":false,
    },
    {
      "title":translate(Get.context!).other,
      "isSelected":false,
    },
  ];
  List<Map<String, dynamic>> statusList = [
    {
      "title" : translate(Get.context!).present,
      "color" : CustomColors.green,
      "isSelected" : true
    },
    {
      "title" : translate(Get.context!).late,
      "color" : const Color(0xffEC9C00),
      "isSelected" : true
    },
    {
      "title" : translate(Get.context!).absent,
      "color" : CustomColors.textRedColor,
      "isSelected" : true
    },
  ];
  TextEditingController searchCtrl = TextEditingController();
  var fmoImageList = [
    nfcSvg,
    barcodeSvg,
    handSvg,
  ];

  final selectedFMOPos = 0.obs;
  final selectedFMOPos1 = 0.obs;

  TabController? tabCtrl;

  final isRulesChecked = false.obs;
}