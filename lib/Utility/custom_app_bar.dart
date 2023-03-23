import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/Utility/utility.dart';

import 'sizes.dart';

appBarWithHeading(String title,){
  return AppBar(
    title: Text(title, style: Style.montserratBoldStyle().copyWith(fontSize: appBarHeadingTs),),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: false,
    leading: IconButton(
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      padding: EdgeInsets.zero,
      splashRadius: 1,
      onPressed: (){
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_outlined,
        color: Colors.black,
      ),
    ),
  );
}