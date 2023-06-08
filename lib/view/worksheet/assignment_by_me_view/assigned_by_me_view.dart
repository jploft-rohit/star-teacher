import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/view/worksheet/assignment_by_me_view/assignment_staff_view.dart';
import 'package:staff_app/view/worksheet/assignment_by_me_view/assignment_star_view.dart';
import 'package:staff_app/view/worksheet/worksheet_ctrl.dart';

import '../../../utility/sizes.dart';

class AssignedByMeView extends StatefulWidget {
  const AssignedByMeView({Key? key}) : super(key: key);

  @override
  State<AssignedByMeView> createState() => _AssignedByMeViewState();
}

class _AssignedByMeViewState extends State<AssignedByMeView> with SingleTickerProviderStateMixin{
  WorkSheetCtrl controller = Get.find<WorkSheetCtrl>();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this)..addListener(() {
      controller.selectedIndex1.value = tabController.index;
      setState(() {});
    });
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          BaseToggleTabBar(controller: tabController, tabs: [
            BaseTabButton(title: "Ongoing", isSelected: tabController.index==0),
            BaseTabButton(title: "Submitted", isSelected: tabController.index==1),
            BaseTabButton(title: "Overdue", isSelected: tabController.index==2),
          ],bottomMargin: 2.h),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
              AssignmentStaffView(),
              AssignmentStarView(),
              AssignmentStaffView(),
            ]),
          )
        ],
      ),
    );
  }
}
