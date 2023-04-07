import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
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
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: BaseColors.borderColor
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                        child: Row(
                          children: [
                            SvgPicture.asset(classTakenSvg,height: 15,),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text("Role", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                            Spacer(),
                            Icon(
                              Icons.arrow_drop_down,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 25,
                      color: BaseColors.borderColor,
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(classTakenSvg,height: 15,),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text("Grade", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                            Spacer(),
                            Icon(
                              Icons.arrow_drop_down,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(height: 0.0,),
                CustomTextField(
                  controller: searchCtrl,
                  hintText: translate(context).search_star_id,
                  hintTextColor: BaseColors.textLightGreyColor,
                  borderColor: Colors.transparent,
                  contentPadding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Icon(
                      Icons.search,
                    ),
                  ),
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
                          InkWell(
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
                            InkWell(
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
                  BaseButton(removeHorizontalPadding: true,title: translate(context).view_submissions.toUpperCase(), onPressed: (){
                    Get.to(SubmittedAssignmentView());
                  }),
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
