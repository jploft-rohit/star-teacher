import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/assignments_screen/assignment_by_me_view/assignment_staff_view.dart';
import 'package:staff_app/view/assignments_screen/assignment_by_me_view/assignment_star_view.dart';
import 'package:staff_app/view/assignments_screen/assignment_screen_ctrl.dart';

class AssignedByMeView extends StatefulWidget {
  const AssignedByMeView({Key? key}) : super(key: key);

  @override
  State<AssignedByMeView> createState() => _AssignedByMeViewState();
}

class _AssignedByMeViewState extends State<AssignedByMeView> with SingleTickerProviderStateMixin{
  AssignmentScreenCtrl controller = Get.find<AssignmentScreenCtrl>();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this)..addListener(() {
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
      length: 3,
      child: Column(
        children: [
          BaseToggleTabBar(controller: tabController, tabs: [
            BaseTabButton(title: translate(context).staff, isSelected: tabController.index==0),
            BaseTabButton(title: translate(context).stars, isSelected: tabController.index==1),
            BaseTabButton(title: translate(context).parents, isSelected: tabController.index==2),
          ]),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
              AssignmentStaffView(),
              AssignmentStarView(),
              AssignmentStaffView()
            ]),
          )
        ],
      ),
    );
  }
}
