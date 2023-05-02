import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/class_schedule_screen/day_schedule_view.dart';
import 'package:staff_app/view/class_schedule_screen/week_schedule_view.dart';

class ClassScheduleScreen extends StatefulWidget {
  const ClassScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ClassScheduleScreen> createState() => _ClassScheduleScreenState();
}

class _ClassScheduleScreenState extends State<ClassScheduleScreen> with SingleTickerProviderStateMixin{
  int index = 0;
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
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
        appBar: BaseAppBar(title: translate(context).schedule),
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              BaseToggleTabBar(controller: tabController, tabs: [
                BaseTabButton(title: translate(context).day, isSelected: tabController.index == 0,type: toggleLargeButton,),
                BaseTabButton(title: translate(context).week, isSelected: tabController.index == 1,type: toggleLargeButton,),
              ]),
              SizedBox(
                height: 1.5.h,
              ),
             CustomDropDown(
                    initialValue: DummyLists.initialSchool,
                    hintText: "Select School",
                    listData:DummyLists.schoolData,
                    onChange: (value) {
                     setState(() {
                       DummyLists.initialSchool=value;
                     });
                    },
                    topPadding: 5,
                    bottomPadding: 5,
                    icon: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25,),
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
