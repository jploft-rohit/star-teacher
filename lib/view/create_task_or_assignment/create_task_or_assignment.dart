import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_dropdown.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/create_task_or_assignment/create_task_or_assignment_screen_ctrl.dart';
import 'package:staff_app/view/create_task_or_assignment/parent_view.dart';
import 'package:staff_app/view/create_task_or_assignment/staff_view.dart';
import 'package:staff_app/view/create_task_or_assignment/star_view.dart';

class CreateTaskOrAssignmentScreen extends StatefulWidget {
  const CreateTaskOrAssignmentScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskOrAssignmentScreen> createState() => _CreateTaskOrAssignmentScreenState();
}

class _CreateTaskOrAssignmentScreenState extends State<CreateTaskOrAssignmentScreen> with SingleTickerProviderStateMixin{
  CreateTaskOrAssignmentScreenCtrl controller = Get.put(CreateTaskOrAssignmentScreenCtrl());
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      controller.selectedIndex.value = tabController.index;
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
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const BaseAppBar(title: "Create Task & Assignments"),
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              BaseDropDown(),
              BaseToggleTabBar(controller: tabController, tabs: [
                BaseTabButton(title: translate(context).staff, isSelected: tabController.index == 0),
                BaseTabButton(title: translate(context).stars, isSelected: tabController.index == 1),
                BaseTabButton(title: translate(context).parents, isSelected: tabController.index == 2),
              ],bottomMargin: 2.h),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                    children: [
                  const CreateTaskStaffView(),
                  const CreateTaskStarView(),
                  const CreateTaskParentView(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
