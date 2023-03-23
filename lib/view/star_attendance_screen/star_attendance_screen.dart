import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/classroom_view.dart';
import 'package:staff_app/view/star_attendance_screen/star_attendance_screen_ctrl.dart';

class StarAttendanceScreen extends StatefulWidget {
  const StarAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<StarAttendanceScreen> createState() => _StarAttendanceScreenState();
}

class _StarAttendanceScreenState extends State<StarAttendanceScreen> with SingleTickerProviderStateMixin{
  StarAttendanceScreenCtrl controller = Get.put(StarAttendanceScreenCtrl());

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: BaseAppBar(title: translate(context).stars_attendance),
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              BaseToggleTabBar(controller: tabController, tabs: [
                BaseTabButton(title: translate(context).classroom, isSelected: tabController.index == 0),
                BaseTabButton(title: translate(context).online, isSelected: tabController.index == 1),
                BaseTabButton(title: translate(context).hybrid, isSelected: tabController.index == 2),
              ]),
              SizedBox(
                height: 1.5.h,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                    children: [
                  const ClassRoomView(),
                  const ClassRoomView(),
                  const ClassRoomView(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
