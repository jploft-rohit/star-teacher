import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/class_schedule_screen/day_schedule_view.dart';
import 'package:staff_app/view/class_schedule_screen/week_schedule_view.dart';
import 'package:staff_app/view/today_schedule_module/controller/today_schedule_controller.dart';

import '../../utility/base_views/base_school_selection.dart';

class ClassScheduleScreen extends StatefulWidget {
  const ClassScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ClassScheduleScreen> createState() => _ClassScheduleScreenState();
}

class _ClassScheduleScreenState extends State<ClassScheduleScreen> with SingleTickerProviderStateMixin{
  int index = 0;
  late TabController tabController;
  TodayScheduleController controller = Get.put(TodayScheduleController());
  @override
  void initState() {
    super.initState();
    controller.type.value = "today";
    controller.getData(date: formatFlutterDateTime(flutterDateTime: DateTime.now(),getDayFirst: false));
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      if (!(tabController.indexIsChanging)) {
        if (tabController.index == 0) {
          controller.type.value = "today";
          controller.getData();
        }
        setState(() {});
      }
    });
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: BaseAppBar(title: translate(context).class_schedule),
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              BaseToggleTabBar(controller: tabController, tabs: [
                BaseTabButton(title: translate(context).day, isSelected: tabController.index == 0,type: toggleLargeButton),
                BaseTabButton(title: translate(context).week, isSelected: tabController.index == 1,type: toggleLargeButton),
              ]),
              SizedBox(
                height: 1.5.h
              ),
              BaseSchoolDropDown(
                controller: controller.schoolController,
                onChanged: (val){
                  controller.schoolController.text = val.name??"";
                  controller.selectedSchoolId.value = val.sId??"";
                  controller.getData();
                },
              ),
              SizedBox(height: 3.h),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                  const DayScheduleView(),
                  const WeekScheduleView(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
