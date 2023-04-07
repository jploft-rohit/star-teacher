import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/base_dialogs.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/complaints_report_screen/add_comment_popup.dart';
import 'package:staff_app/view/complaints_report_screen/raise_complaint_report_screen.dart';

class AllComplaintsView extends StatefulWidget {
  const AllComplaintsView({Key? key}) : super(key: key);

  @override
  State<AllComplaintsView> createState() => _AllComplaintsViewState();
}

class _AllComplaintsViewState extends State<AllComplaintsView> {
  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', 'July 3,\n10:30AM', ''];

  final List<String> heading = [
    'Concern\nRaised',
    'InProgress',
    'Concern\nSolved',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addText("Behavior is not good", 16.sp, BaseColors.textBlackColor, FontWeight.w700),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              BaseDialogs().showConfirmationDialog(
                                  title: "Are you sure you want to delete this Complaint?",
                              );
                            },
                            child: Icon(
                              CupertinoIcons.delete,
                              color: BaseColors.primaryColor,
                              size: 18.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.to(RaiseComplaintReportScreen(isUpdating: true));
                            },
                            child: Image.asset(editPng, color: BaseColors.primaryColor,height: 18.sp,),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/user 1.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      addText("Star :", 15.sp, BaseColors.textBlackColor, FontWeight.w400),
                      const SizedBox(width: 3),
                      addText("Najma Suheil", 15.sp, BaseColors.primaryColor, FontWeight.w600),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/Vector (1).svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      addText("01/03/2022", 15.sp, BaseColors.textBlackColor, FontWeight.w400),
                      SizedBox(
                        width: 10.w,
                      ),
                      SvgPicture.asset("assets/images/time_icon.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      addText("09:13pm", 15.sp, BaseColors.textBlackColor, FontWeight.w400),
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
                      Flexible(child: buildInfoItems("Type", "Complaints"))
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
                      Flexible(child: buildInfoItems("Complain on", "Bus Driver"))
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/user.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(child: buildInfoItems("Person", "Ibrahim Khan"))
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
                      Flexible(child: buildInfoItems("Complain Type", "Bullying"))
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
                      Flexible(child: buildInfoItems("Description", "Please upload the feedback of all the stars in suggested class into the excel worksheet."))
                    ],
                  ),
                  const Divider(),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     SvgPicture.asset("assets/images/comment_img.svg"),
                  //     SizedBox(
                  //       width: 2.w,
                  //     ),
                  //     Flexible(child: buildInfoItems("Feedback", "We will take action on this."))
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 1.h,
                  // ),
                  // Row(
                  //   children: [
                  //     Flexible(
                  //       flex: 1,
                  //       child: BaseButton(text: "ESCALATE", onPressed: (){}, btnHeight: 35, boxShadow: [], borderRadius: 10.0, btnColor: Colors.white, borderColor: CustomColors.borderColor,textColor: CustomColors.textLightGreyColor, textSize: 16.sp,),
                  //     ),
                  //     SizedBox(
                  //       width: 2.w,
                  //     ),
                  //     Flexible(
                  //       flex: 1,
                  //       child: BaseButton(text: "COMMENTS", onPressed: (){
                  //         showGeneralDialog(
                  //           context: context,
                  //           pageBuilder:  (context, animation, secondaryAnimation) {
                  //             return const AddCommentPopup();
                  //           },
                  //         );
                  //       }, btnHeight: 35, boxShadow: [], borderRadius: 10.0, btnColor: Colors.white, borderColor: CustomColors.borderColor,textColor: CustomColors.textLightGreyColor, textSize: 16.sp,),
                  //     ),
                  //     SizedBox(
                  //       width: 2.w,
                  //     ),
                  //     Flexible(
                  //       flex: 1,
                  //       child: BaseButton(text: "ACCEPT", onPressed: (){}, btnHeight: 35, borderRadius: 10.0,textSize: 16.sp,),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 1.h,
                  // ),
                  // const Divider(),
                  SizedBox(
                    height: 1.h,
                  ),
                  StepProgressView(
                    width: MediaQuery.of(context).size.width,
                    curStep: index+1,
                    color: BaseColors.primaryColor,
                    titles: pendingMeetingdates,
                    statuses: heading,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
