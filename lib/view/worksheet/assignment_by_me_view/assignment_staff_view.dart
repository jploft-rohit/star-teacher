import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/step_progress.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';
import 'package:staff_app/view/worksheet/assignment_submission_screen.dart';
import 'package:staff_app/view/worksheet/submitted_assignment_view.dart';
import 'package:staff_app/view/worksheet/worksheet_ctrl.dart';

class AssignmentStaffView extends StatefulWidget {
  const AssignmentStaffView({Key? key}) : super(key: key);

  @override
  State<AssignmentStaffView> createState() => _AssignmentStaffViewState();
}

class _AssignmentStaffViewState extends State<AssignmentStaffView> {
  TextEditingController searchCtrl = TextEditingController();
  WorkSheetCtrl controller = Get.find<WorkSheetCtrl>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10.0),
          //     border: Border.all(
          //         color: ColorConstants.borderColor
          //     ),
          //   ),
          //   child: Column(
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           CustomFilterDropDown(
          //             initialValue: DummyLists.initialRole,
          //             hintText: DummyLists.initialRole??'Role',
          //             listData: DummyLists.roleData,
          //             onChange: (value) {
          //               setState(() {
          //                 DummyLists.initialRole = value;
          //               });
          //             },
          //             icon: classTakenSvg,
          //           ),
          //           Container(
          //             child: const VerticalDivider(
          //               width: 1,
          //             ),
          //             height: 4.h,
          //             width: 1,
          //           ),
          //           CustomFilterDropDown(
          //             initialValue: DummyLists.initialGrade,
          //             hintText: DummyLists.initialGrade??'Grade',
          //             listData: DummyLists.gradeData,
          //             onChange: (value) {
          //               setState(() {
          //                 DummyLists.initialGrade = value;
          //               });
          //             },
          //             icon: classTakenSvg,
          //           ),
          //         ],
          //       ),
          //       const Divider(
          //         height: 1,
          //         thickness: 1,
          //       ),
          //       FilterTextFormField(
          //         onChange: (String val) {},
          //         hintText: "Search Star,ID...",
          //         keyBoardType: TextInputType.name,
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 2.h,
          // ),
          GestureDetector(
            onTap: (){
              Get.to(const AssignmentSubmissionScreen());
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        addText("Share your feedback for Grade", 16.sp, BaseColors.textBlackColor, FontWeight.w700),
                        Visibility(
                          visible: controller.primaryTabIndex.value == 0,
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.delete,
                                color: BaseColors.primaryColor,
                                size: 18.sp,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              GestureDetector(
                                onTap: (){

                                },
                                child: Image.asset(editPng, color: BaseColors.primaryColor,height: 18.sp,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/report.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        Flexible(child: buildInfoItems(translate(context).description, "Please upload the feedback of all the stars in suggested class into the excel worksheet."))
                      ],
                    ),
                    const Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/family_img.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        Obx(()=> Flexible(child: buildInfoItems(controller.primaryTabIndex.value == 0
                            ? translate(context).assigned_to
                            : translate(context).assigned_by,
                            "Teacher (5)"),
                         ),
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/document 1.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        Flexible(child: buildInfoItems("Worksheet No", "A0111"))
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/Vector (1).svg"),
                            SizedBox(
                              width: 2.w,
                            ),
                            buildInfoItems(translate(context).post_date, "01/03/2022")
                          ],
                        ),
                        Container(height: 20.0,width: 1, color: BaseColors.borderColor,),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/time_icon.svg"),
                            SizedBox(
                              width: 2.w,
                            ),
                            buildInfoItems(translate(context).post_time, "9:30 AM")
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/Vector (1).svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Assigned Date", "01/03/2022")
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/time_icon.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Assigned Time", "9:30 AM")
                      ],
                    ),
                    const Divider(),
                    StepProgressView(
                      width: MediaQuery.of(context).size.width,
                      curStep: stepperTitle.length+1,
                      color: BaseColors.primaryColor,
                      statuses: stepperTitle,
                      titles: ["",""],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  List<String> stepperTitle = [
    "Assigned",
    "Completed",
  ];
}
