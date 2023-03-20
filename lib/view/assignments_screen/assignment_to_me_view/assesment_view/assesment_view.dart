import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/assignments_screen/assignment_to_me_view/start_pending_assignment.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';
import 'package:staff_app/view/task_or_reminder_screen/add_task_or_reminder_screen.dart';

class AssesmentView extends StatefulWidget {
  const AssesmentView({Key? key}) : super(key: key);

  @override
  State<AssesmentView> createState() => _AssesmentViewState();
}

class _AssesmentViewState extends State<AssesmentView> with SingleTickerProviderStateMixin {
  TabController? tabCtrl;
  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', 'July 3,\n10:30AM', 'July 3,\n10:30AM'];

  final List<String> heading = [
    'Accepted',
    'Submitted',
    'Completed',
  ];

  @override
  void initState() {
    tabCtrl = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTabBar(),
        SizedBox(
          height: 2.h,
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabCtrl,
            children: [
              buildPendingView(),
              buildDoneView(),
              buildExpiredView(),
            ],
          ),
        )
      ],
    );
  }
  Widget buildTabBar() {
    return Container(
      height: 35,
      width: 100.w,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: TabBar(
        controller: tabCtrl,
        isScrollable: false,
        labelStyle: Style.montserratRegularStyle().copyWith(fontSize: 12),
        onTap: (value){

        },
        padding: const EdgeInsets.all(4),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]
        ),
        labelColor: CustomColors.primaryColor,
        unselectedLabelColor: Colors.black,
        tabs:  [
          Tab(
            text: translate(context).pending,
          ),
          Tab(
            text: translate(context).done,
          ),
          Tab(
            text: translate(context).expired,
          ),
        ],
      ),
    );
  }

  Widget buildPendingView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText("Share your feedback for Grade H Stars", 16.sp, CustomColors.textBlackColor, FontWeight.w700),
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
                    Flexible(child: buildInfoItems(translate(context).assigned_by, "Rashid Khan (Admin)"))
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
                    Flexible(child: buildInfoItems(translate(context).assign_type, "Course"))
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
                              color: CustomColors.primaryColor,
                              size: 19.sp,
                            ),
                          )
                        ],
                      ),
                    )
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
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         SvgPicture.asset("assets/images/Vector (1).svg"),
                //         SizedBox(
                //           width: 2.w,
                //         ),
                //         buildInfoItems(translate(context).due_date, "01/03/2022")
                //       ],
                //     ),
                //     Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
                //     Row(
                //       children: [
                //         SvgPicture.asset("assets/images/time_icon.svg"),
                //         SizedBox(
                //           width: 2.w,
                //         ),
                //         buildInfoItems(translate(context).due_time, "9:30 AM")
                //       ],
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 3.h,
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/document 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems(translate(context).total_question, "5"))
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
                        buildInfoItems(translate(context).total_stars, "15")
                      ],
                    ),
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/time_icon.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems(translate(context).stars_earned, "8")
                      ],
                    ),
                    const SizedBox.shrink(),
                    const SizedBox.shrink(),
                  ],
                ),
                const Divider(),
                // Row(
                //   children: [
                //     Flexible(
                //       flex: 1,
                //       child: CustomButton(text: translate(context).set_reminder.toUpperCase(), onPressed: (){
                //         Get.to(const AddTaskOrReminderScreen());
                //       }, btnHeight: 35, boxShadow: [], borderRadius: 10.0, btnColor: Colors.white, borderColor: CustomColors.borderColor,textColor: CustomColors.textLightGreyColor, textSize: 16.sp,),
                //     ),
                //     SizedBox(
                //       width: 2.w,
                //     ),
                //     Flexible(
                //       flex: 1,
                //       child: CustomButton(text: translate(context).start.toUpperCase(), onPressed: (){
                //         Get.to(const StartPendingAssignment());
                //       }, btnHeight: 35, borderRadius: 10.0,textSize: 16.sp,),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 1.h,
                ),
                StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: 3,
                  color: CustomColors.primaryColor,
                  titles: pendingMeetingdates,
                  statuses: heading,
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildDoneView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText("Share your feedback for Grade H Stars", 16.sp, CustomColors.textBlackColor, FontWeight.w700),
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
                    Flexible(child: buildInfoItems(translate(context).assigned_by, "Rashid Khan (Admin)"))
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
                    Flexible(child: buildInfoItems(translate(context).assign_type, "Course"))
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
                              color: CustomColors.primaryColor,
                              size: 19.sp,
                            ),
                          )
                        ],
                      ),
                    )
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
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/document 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems(translate(context).total_question, "5"))
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/document 1.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems(translate(context).total_stars, "15")
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
                    SizedBox(
                      width: 10.w,
                    ),
                    buildInfoItems(translate(context).stars_earned, "8"),
                  ],
                ),
                const Divider(),
                StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: 3,
                  color: CustomColors.primaryColor,
                  titles: pendingMeetingdates,
                  statuses: heading,
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildExpiredView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText("Share your feedback for Grade H Stars", 16.sp, CustomColors.textBlackColor, FontWeight.w700),
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
                    Flexible(child: buildInfoItems(translate(context).assigned_by, "Rashid Khan (Admin)"))
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
                    Flexible(child: buildInfoItems(translate(context).assign_type, "Course"))
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
                              color: CustomColors.primaryColor,
                              size: 19.sp,
                            ),
                          )
                        ],
                      ),
                    )
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
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
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
                    Container(height: 20.0,width: 1, color: CustomColors.borderColor,),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
