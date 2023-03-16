import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';

class ClassroomViewCtrl extends GetxController{
  TextEditingController searchCtrl = TextEditingController();
  var fmoImageList = [
    nfcSvg,
    barcodeSvg,
    handSvg,
  ];

  final selectedFMOPos = 0.obs;

  TabController? tabCtrl;

  final isRulesChecked = false.obs;
  List<Map<String, dynamic>> statusList = [
    {
      "title" : "Present",
      "color" : CustomColors.green,
      "isSelected" : true
    },
    {
      "title" : "Late",
      "color" : Color(0xffEC9C00),
      "isSelected" : true
    },
    {
      "title" : "Absent",
      "color" : CustomColors.textRedColor,
      "isSelected" : true
    },
  ];
}