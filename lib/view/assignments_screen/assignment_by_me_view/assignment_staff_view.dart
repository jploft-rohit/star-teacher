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
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/assignments_screen/submitted_assignment_view.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';

class AssignmentStaffView extends StatefulWidget {
  const AssignmentStaffView({Key? key}) : super(key: key);

  @override
  State<AssignmentStaffView> createState() => _AssignmentStaffViewState();
}

class _AssignmentStaffViewState extends State<AssignmentStaffView> {
  TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      initialValue: DummyLists.initialRole,
                      hintText: 'Role',
                      listData: DummyLists.roleData,
                      onChange: (value) {
                        setState(() {
                          DummyLists.initialRole = value;
                        });
                      },
                      icon: classTakenSvg,
                    ),
                    Container(
                      child: VerticalDivider(
                        width: 1,
                      ),
                      height: 4.h,
                      width: 1,
                    ),
                    CustomFilterDropDown(
                      initialValue: DummyLists.initialGrade,
                      hintText: 'Grade',
                      listData: DummyLists.gradeData,
                      onChange: (value) {
                        setState(() {
                          DummyLists.initialGrade = value;
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
                FilterTextFormField(
                  onChange: (String val) {},
                  hintText: "Search Star,ID...",
                  keyBoardType: TextInputType.name,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Card(
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
                      Row(
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
                    ],
                  ),
                  Divider(),
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
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/family_img.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(child: buildInfoItems(translate(context).assigned_to, "Teacher (5)"))
                    ],
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/document 1.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(child: buildInfoItems(translate(context).assign_type, "Course"))
                    ],
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/document 1.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            buildInfoItems(translate(context).serial_no, "C01111"),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: (){
                                showGeneralDialog(
                                  context: context,
                                  pageBuilder:  (context, animation, secondaryAnimation) {
                                    return OpenPdfPopup(title: "");
                                  },
                                );
                              },
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: BaseColors.primaryColor,
                                size: 19.sp,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(),
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
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/Vector (1).svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          buildInfoItems(translate(context).due_date, "01/03/2022")
                        ],
                      ),
                      Container(height: 20.0,width: 1, color: BaseColors.borderColor,),
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/time_icon.svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          buildInfoItems(translate(context).due_time, "9:30 AM")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: BaseButton(title: "View Submissions".toUpperCase(), onPressed: (){
                          Get.to(SubmittedAssignmentView());
                        },btnType: mediumButton,),
                      ),
                      SizedBox(width: 10.w,),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
