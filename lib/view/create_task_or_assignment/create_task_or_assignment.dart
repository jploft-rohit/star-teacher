import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
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
              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: CustomColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: CustomColors.borderColor
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
                BaseTabButton(title: translate(context).staff, isSelected: tabController.index == 0),
                BaseTabButton(title: translate(context).stars, isSelected: tabController.index == 1),
                BaseTabButton(title: translate(context).parents, isSelected: tabController.index == 2),
              ]),
              SizedBox(
                height: 2.h,
              ),
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
