import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/new_assignments/assessments_awareness_courses.dart';
import 'package:staff_app/new_assignments/controller/new_assignment_ctrl.dart';
import 'package:staff_app/new_assignments/create_assignment.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class NewAssignmentScreen extends StatefulWidget {
  final String title;
  const NewAssignmentScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<NewAssignmentScreen> createState() => _NewAssignmentScreenState();
}

class _NewAssignmentScreenState extends State<NewAssignmentScreen> with SingleTickerProviderStateMixin{
  NewAssignmentCtrl controller = Get.put(NewAssignmentCtrl());
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      controller.primaryTabIndex.value = tabController.index;
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
      length: 2,
      child: Scaffold(
        floatingActionButton: controller.primaryTabIndex.value == 0
            ? BaseFloatingActionButton(title: 'Add New',onTap: (){
                Get.to(CreateAssignment(title: widget.title));
            }) : const SizedBox.shrink(),
        appBar: BaseAppBar(title: widget.title,
        bottomChild: Visibility(
          visible: widget.title == "Awareness & Courses",
          child: BaseToggleTabBar(controller: tabController, tabs: [
            BaseTabButton(title: translate(context).assigned_by_me, isSelected: tabController.index == 0,type: toggleLargeButton,),
            BaseTabButton(title: translate(context).assigned_to_me, isSelected: tabController.index == 1,type: toggleLargeButton,),
          ],bottomMargin: 1.h),
        ),bottomWidgetHeight: widget.title == "Awareness & Courses" ? 8.h : 0,
        ),
        body: TabBarView(
          controller: tabController,
          physics: widget.title == "Awareness & Courses" ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
          children: [
            AssessmentsAwarenessCourses(title: widget.title),
            AssessmentsAwarenessCourses(title: widget.title),
          ],
        )
      )
    );
  }
}