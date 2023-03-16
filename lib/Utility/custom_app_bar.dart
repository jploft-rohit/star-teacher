import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';

appBarWithHeading(String title,){
  return AppBar(
    title: Text(title, style: Style.montserratBoldStyle().copyWith(fontSize: 20.sp),),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: false,
    leading: IconButton(
      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
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
appBarWithAction(context, String title, List<Widget> actions,{Function()? onPressed}){
  return AppBar(
    title: Text(title, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: CustomColors.appBarTextColor),),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    actions: actions,
    leading: IconButton(
      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      padding: EdgeInsets.zero,
      splashRadius: 1,
      onPressed: onPressed ?? (){
        Navigator.pop(context);
      },
      icon: const Icon(
        CupertinoIcons.back,
        color: Colors.black,
      ),
    ),
  );
}