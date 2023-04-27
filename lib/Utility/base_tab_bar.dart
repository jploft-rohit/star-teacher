import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';

class BaseTabBar extends StatelessWidget {
  final TabController? controller;
  final Function(int index)? onTap;
  final List<Widget> tabs;
  final double? bottomMargin, topMargin, rightMargin, leftMargin;
  BaseTabBar({Key? key, this.controller, this.onTap,required this.tabs, this.bottomMargin, this.topMargin, this.rightMargin, this.leftMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin??0,top: topMargin??0,right: rightMargin??0,left: leftMargin??0),
      height: 5.h,
      width: Get.width,
      decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(10)
      ),
      child: TabBar(
        controller:controller,
        padding: EdgeInsets.all(0.5.h),
        labelPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFF8F4E9),
            boxShadow: [BoxShadow(
              color: Colors.black38,
              offset: Offset(
                0.0,
                1.0,
              ),
              blurRadius: 2.0,
              spreadRadius: 0.0,
            )]
        ),
        onTap: onTap,
        labelColor: Color(0xffC19444),
        labelStyle: TextStyle(color: Color(0xffC19444),fontSize: tabBarTs,fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(color: Colors.black,fontSize: tabBarTs,fontWeight: FontWeight.w400),
        unselectedLabelColor: Colors.black,
        tabs: tabs,
      ),
    );
  }
}
