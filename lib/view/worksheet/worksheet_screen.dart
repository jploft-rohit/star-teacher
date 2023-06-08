import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/create_task_or_assignment/create_task_or_assignment.dart';
import 'package:staff_app/view/worksheet/assignment_by_me_view/assigned_by_me_view.dart';
import 'package:staff_app/view/worksheet/create_worksheet/create_worksheet_screen.dart';
import 'package:staff_app/view/worksheet/worksheet_ctrl.dart';

class WorkSheetScreen extends StatefulWidget {
  const WorkSheetScreen({Key? key}) : super(key: key);

  @override
  State<WorkSheetScreen> createState() => _WorkSheetScreenState();
}

class _WorkSheetScreenState extends State<WorkSheetScreen> with SingleTickerProviderStateMixin{
  WorkSheetCtrl controller = Get.put(WorkSheetCtrl());
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
        appBar: const BaseAppBar(title: "Worksheet"),
        floatingActionButton: Visibility(
          visible: tabController.index == 0 ? true : false,
          child: BaseFloatingActionButton(
              onTap: () {Get.to(const CreateWorkSheet());},
              title: translate(context).create_task,
            ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              // CustomDropDown(
              //   initialValue: DummyLists.initialSchool,
              //   hintText: "Select School",
              //   listData:DummyLists.schoolData,
              //   onChange: (value) {
              //     setState(() {
              //       DummyLists.initialSchool=value;
              //     });
              //   },
              //   topPadding: 5,
              //   bottomPadding: 5,
              //   icon: const Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25,),
              // ),
              // SizedBox(
              //   height: 1.h,
              // ),
              BaseToggleTabBar(controller: tabController, tabs: [
                BaseTabButton(title: translate(context).assigned_by_me, isSelected: tabController.index == 0,type: toggleLargeButton,),
                BaseTabButton(title: translate(context).assigned_to_me, isSelected: tabController.index == 1,type: toggleLargeButton,),
              ]),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                  AssignedByMeView(),
                  AssignedByMeView(),
                  //AssignedToMeView()
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
