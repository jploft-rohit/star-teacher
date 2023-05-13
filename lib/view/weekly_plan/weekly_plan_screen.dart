import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_edit_delete.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/custom_filter_dropdown.dart';
import 'package:staff_app/utility/dummy_lists.dart';
import 'package:staff_app/utility/filter_textformfield.dart';
import 'package:staff_app/view/weekly_plan/create_week_plan.dart';
import 'package:staff_app/view/weekly_plan/week_list_screen.dart';

import '../../utility/images_icon_path.dart';

class WeeklyPlanScreen extends StatefulWidget {
  const WeeklyPlanScreen({Key? key}) : super(key: key);

  @override
  State<WeeklyPlanScreen> createState() => _WeeklyPlanScreenState();
}

class _WeeklyPlanScreenState extends State<WeeklyPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BaseFloatingActionButton(onTap: () {
        Get.to(CreateWeekPlan());
      }, title: 'Add New',),
      appBar: BaseAppBar(title: translate(context).weekly_plan),
      body: Padding(
        padding: EdgeInsets.all(scaffoldPadding),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: ColorConstants.borderColor
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFilterDropDown(
                        initialValue: DummyLists.initialSchool,
                        hintText: DummyLists.initialSchool??"School",
                        listData: DummyLists.schoolData,
                        onChange: (value) {
                          setState(() {
                            DummyLists.initialSchool = value;
                          });
                        },
                        icon: classTakenSvg,
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFilterDropDown(
                        initialValue: "Section",
                        hintText: DummyLists.initialGrade??"Section",
                        listData: DummyLists.classRoomData,
                        onChange: (value) {
                          setState(() {
                            DummyLists.initialGrade = value;
                          });
                        },
                        icon: classTakenSvg,
                      ),
                      Container(
                        child: VerticalDivider(width: 1),
                        height: 4.h,
                        width: 1,
                      ),
                      CustomFilterDropDown(
                        initialValue: DummyLists.initialClass,
                        hintText: DummyLists.initialSchool??"Class",
                        listData: DummyLists.classData,
                        onChange: (value) {
                          setState(() {
                            DummyLists.initialClass = value;
                          });
                        },
                        icon: classTakenSvg,
                      ),
                    ],
                  ),
                  Divider(height: 1,
                    thickness: 1),
                  FilterTextFormField(
                    onChange: (String val) {},
                    hintText: "Search by name",
                    keyBoardType: TextInputType.name,
                  ),
                ],
              ),
            ),
            ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 2.h,bottom: 5.h),
                itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Get.to(WeekListScreen());
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 2.h),
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: baseContainerShadow(),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BaseEditDelete(heading: "Week ${index+1}",editTitle: "plan", deleteTitle: "plan",onEditProceed: (){
                        BaseOverlays().dismissOverlay();
                        Get.to(CreateWeekPlan(isUpdating: true));
                      },),
                      BaseDetailData(topMargin: 2.h,prefixIcon: icReport,detailsLabel: translate(context).school,detailsValue: "Ignite Public School"),
                      BaseDetailData(prefixIcon: "assets/images/Vector (1).svg", detailsLabel: "01/03/2022 - 07/03/2022"),
                      BaseDetailData(prefixIcon: icReport, detailsLabel: "Class", detailsValue: "5th"),
                      BaseDetailData(prefixIcon: icReport, detailsLabel: "Section", detailsValue: "Grade 5"),
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
