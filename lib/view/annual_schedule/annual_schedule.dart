import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/view/annual_schedule/annual_schedule_list_tile.dart';
import 'package:staff_app/view/annual_schedule/controller/annual_schedule_ctrl.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';


class AnnualScheduleScreen extends StatefulWidget {
  const AnnualScheduleScreen({Key? key}) : super(key: key);

  @override
  State<AnnualScheduleScreen> createState() => _AnnualScheduleScreenState();
}

class _AnnualScheduleScreenState extends State<AnnualScheduleScreen> with TickerProviderStateMixin{
  AnnualScheduleCtrl controller = Get.put(AnnualScheduleCtrl());
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  int selectedIndex = 0;
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: selectedIndex)..addListener(() {
      controller.selectedTabIndex.value = tabController.index;
      controller.getData();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar:BaseAppBar(title: 'Annual Schedule'),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              BaseSchoolDropDown(
                controller: controller.schoolController.value,
                onChanged: (value){
                  controller.schoolController.value.text = value.name??"";
                  controller.selectedSchoolId.value = value.sId??"";
                  controller.getData();
                },
              ),
              BaseToggleTabBar(
                controller: tabController, tabs: [
                BaseTabButton(title: 'Holidays', isSelected: tabController.index==0,type: toggleLargeButton),
                BaseTabButton(title: 'Exams', isSelected: tabController.index==1,type: toggleLargeButton),
              ],bottomMargin: 1.5.h),
              Expanded(child: TabBarView(
                controller: tabController,
                children: [
                  AnnualScheduleListTile(),
                  AnnualScheduleListTile(),
                 ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

