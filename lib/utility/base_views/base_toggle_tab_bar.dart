import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/sizes.dart';

class BaseToggleTabBar extends StatelessWidget {
  final TabController controller;
  final double? bottomMargin,topMargin,rightMargin,leftMargin;
  final Function(int index)? onTap;
  final List<Widget> tabs;
  const BaseToggleTabBar({Key? key, required this.controller, this.onTap, required this.tabs, this.bottomMargin, this.topMargin, this.rightMargin, this.leftMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??0,right: rightMargin??0,left: leftMargin??0),
      child: SizedBox(
        height: 6.h,
        child: TabBar(
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          controller: controller,
          onTap: onTap,
          labelPadding: EdgeInsets.zero,
          indicatorWeight: 0.01,
          labelColor: Colors.transparent,
          labelStyle: TextStyle(color: Color(0xffC19444),fontSize: tabBarTs.sp,fontWeight: FontWeight.w700),
          unselectedLabelStyle: TextStyle(color: Colors.black,fontSize: tabBarTs.sp,fontWeight: FontWeight.w400),
          unselectedLabelColor: Colors.transparent,
          tabs: tabs,
        ),
      ),
    );
  }
}
