import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_tab_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/assignments_screen/assignment_to_me_view/start_pending_assignment.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';
import 'package:staff_app/view/task_or_reminder_screen/add_task_or_reminder_screen.dart';

class SurveyView extends StatefulWidget {
  const SurveyView({Key? key}) : super(key: key);

  @override
  State<SurveyView> createState() => _SurveyViewState();
}

class _SurveyViewState extends State<SurveyView> with SingleTickerProviderStateMixin {
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
            controller: tabCtrl,
            children: [
              buildPendingView(),
              buildDoneView(),
              buildExpiredView()
            ],
          ),
        )
      ],
    );
  }
  Widget buildTabBar() {
    return BaseTabBar(
      controller: tabCtrl,
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
    );
  }

  Widget buildPendingView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText("Share your health information", 16.sp, CustomColors.textBlackColor, FontWeight.w700),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/report.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems(translate(context).description, "Please upload your medical information by attending this survey so we have the details about your health."))
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
                    Flexible(child: buildInfoItems(translate(context).assigned_by, "Rashid Khan (Nurse)"))
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
                    Flexible(child: buildInfoItems(translate(context).assign_type, "Assignment"))
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
                          buildInfoItems(translate(context).serial_no, "A01111"),
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
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: BaseButton(title: translate(context).set_reminder.toUpperCase(), onPressed: (){
                        Get.to(AddTaskOrReminderScreen());
                      }, isActive: false, textSize: 16.sp,),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: BaseButton(title: translate(context).start.toUpperCase(), onPressed: (){
                        Get.to(StartPendingAssignment());
                      },textSize: 16.sp,),
                    ),
                  ],
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
          elevation: 3.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText("Share your health information", 16.sp, CustomColors.textBlackColor, FontWeight.w700),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/report.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems(translate(context).description, "Please upload your medical information by attending this survey so we have the details about your health."))
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
                    Flexible(child: buildInfoItems(translate(context).assigned_by, "Rashid Khan (Nurse)"))
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
                    Flexible(child: buildInfoItems(translate(context).assign_type, "Assignment"))
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
                          buildInfoItems(translate(context).serial_no, "A01111"),
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
                Divider(),
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
          elevation: 3.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText("Share your health information", 16.sp, CustomColors.textBlackColor, FontWeight.w700),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/report.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems(translate(context).description, "Please upload your medical information by attending this survey so we have the details about your health."))
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
                    Flexible(child: buildInfoItems(translate(context).assigned_by, "Rashid Khan (Nurse)"))
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
                    Flexible(child: buildInfoItems(translate(context).assign_type, "Assignment"))
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
                          buildInfoItems(translate(context).serial_no, "A01111"),
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
}
