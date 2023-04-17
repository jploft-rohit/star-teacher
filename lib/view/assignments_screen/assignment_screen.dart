import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_floating_action_button.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';

import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/assignments_screen/assignment_by_me_view/assigned_by_me_view.dart';
import 'package:staff_app/view/assignments_screen/assignment_screen_ctrl.dart';
import 'package:staff_app/view/assignments_screen/assignment_to_me_view/assignment_to_me_view.dart';
import 'package:staff_app/view/create_task_or_assignment/create_task_or_assignment.dart';

import '../../Utility/base_colors.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> with SingleTickerProviderStateMixin{
  AssignmentScreenCtrl controller = Get.put(AssignmentScreenCtrl());
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
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
        appBar: BaseAppBar(title: translate(context).assignments),
        floatingActionButton: Obx(()=>BaseFloatingActionButton(
            onTap: () {Get.to(const CreateTaskOrAssignmentScreen());},
            title: controller.tabIndex.value == 1 ? translate(context).create_awareness_courses :translate(context).create_task,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: BaseColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: BaseColors.borderColor
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                    const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              BaseToggleTabBar(controller: tabController, tabs: [
                BaseTabButton(title: translate(context).assigned_by_me, isSelected: tabController.index == 0),
                BaseTabButton(title: translate(context).assigned_to_me, isSelected: tabController.index == 1),
              ]),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                  AssignedByMeView(),
                  AssignedByMeView(),
                  // AssignedToMeView()
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
