import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/new_assignments/controller/new_assignment_ctrl.dart';
import 'package:staff_app/new_assignments/tabs/new_assignment_list_tile.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';

class AssessmentsAwarenessCourses extends StatefulWidget {
  const AssessmentsAwarenessCourses({Key? key}) : super(key: key);

  @override
  State<AssessmentsAwarenessCourses> createState() => _AssessmentsAwarenessCoursesState();
}

class _AssessmentsAwarenessCoursesState extends State<AssessmentsAwarenessCourses> with SingleTickerProviderStateMixin{
  NewAssignmentCtrl controller = Get.find<NewAssignmentCtrl>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      controller.secondaryTabIndex.value = tabController.index;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          BaseToggleTabBar(controller: tabController, tabs: [
            BaseTabButton(title: "Ongoing", isSelected: tabController.index==0),
            BaseTabButton(title: "Submitted", isSelected: tabController.index==1),
            BaseTabButton(title: "Overdue", isSelected: tabController.index==2),
          ],rightMargin: 1.w,leftMargin: 1.w,bottomMargin: 1.h),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: const [
                  NewAssignmentListTile(),
                  NewAssignmentListTile(),
                  NewAssignmentListTile()
                ]),
          ),
        ],
      ),
    );
  }
}
