import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/backend/responses_model/class_response.dart';
import 'package:staff_app/backend/responses_model/roles_list_response.dart';
import 'package:staff_app/new_assignments/controller/new_assignment_ctrl.dart';
import 'package:staff_app/new_assignments/tabs/new_assignment_list_tile.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/custom_filter_dropdown.dart';
import 'package:staff_app/utility/filter_textformfield.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class AssessmentsAwarenessCourses extends StatefulWidget {
  final String title;
  const AssessmentsAwarenessCourses({Key? key, required this.title}) : super(key: key);

  @override
  State<AssessmentsAwarenessCourses> createState() => _AssessmentsAwarenessCoursesState();
}

class _AssessmentsAwarenessCoursesState extends State<AssessmentsAwarenessCourses> with SingleTickerProviderStateMixin{
  NewAssignmentCtrl controller = Get.find<NewAssignmentCtrl>();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      if (!(tabController.indexIsChanging)) {
        controller.secondaryTabIndex.value = tabController.index;
        setState(() {});
        controller.getData();
      }
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
          /// Filter
          Container(
            margin: EdgeInsets.only(bottom: 2.h,right: 2.w,left: 2.w,top: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: BaseColors.borderColor
              ),
            ),
            child: Obx(()=>Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomFilterDropDown(
                      hintText: controller.roleController.value.text.isEmpty ? 'Role' : controller.roleController.value.text.trim(),
                      item: baseCtrl.rolesListResponse.data?.map((RolesData data){
                        return DropdownMenuItem<RolesData>(
                          value: data,
                          child: addText(data.displayName??"", 15.sp, Colors.black, FontWeight.w400),
                        );
                      }).toList(),
                      onChange: (value) {
                        controller.searchCtrl.value.clear();
                        controller.roleController.value.text = value.displayName??"";
                        controller.selectedRollId.value = value.sId??"";
                        controller.getData();
                        setState(() {});
                      },
                      icon: classTakenSvg,
                    ),
                    SizedBox(
                      height: 4.h,
                      width: 1,
                      child: const VerticalDivider(width: 1),
                    ),
                    CustomFilterDropDown(
                      hintText: controller.classController.value.text.isEmpty ? 'Class' : controller.classController.value.text,
                      item: baseCtrl.classList?.map((ClassData data){
                        return DropdownMenuItem<ClassData>(
                          value: data,
                          child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                        );
                      }).toList(),
                      onChange: (value) {
                        controller.searchCtrl.value.clear();
                        controller.classController.value.text = value.name;
                        controller.selectedClassId.value = value.sId;
                        controller.getData();
                      },
                      icon: classTakenSvg,
                    )
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
                FilterTextFormField(
                  onChange: (val)=> controller.baseDebouncer.run(()=> controller.getData()),
                  hintText: "Search Star, ID...",
                  keyBoardType: TextInputType.name,
                  controller: controller.searchCtrl.value,
                ),
              ],
            ),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: [
                  NewAssignmentListTile(title: widget.title),
                  NewAssignmentListTile(title: widget.title),
                  NewAssignmentListTile(title: widget.title),
                ]),
          ),
        ],
      ),
    );
  }
}
