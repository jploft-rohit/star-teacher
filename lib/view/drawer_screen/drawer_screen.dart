import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/assignments_screen/assignment_screen.dart';
import 'package:staff_app/view/complaints_report_screen/Complaints_report_screen.dart';
import 'package:staff_app/view/create_task_or_assignment/create_task_or_assignment.dart';
import 'package:staff_app/view/delegation/delegation_screen.dart';
import 'package:staff_app/view/feedback_help_screen/feedback_help_screen.dart';
import 'package:staff_app/view/library_record/library_record_view.dart';
import 'package:staff_app/view/library_screen/library_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_detail_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen.dart';
import 'package:staff_app/view/lost_or_found_screen/lost_or_found_view.dart';
import 'package:staff_app/view/my_profile_screen/my_profile_screen.dart';
import 'package:staff_app/view/request_online_classes/request_online_classes.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen.dart';
import 'package:staff_app/view/shop_screen/shop_screen.dart';
import 'package:staff_app/view/star_attendance_screen/star_attendance_screen.dart';
import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen.dart';
import 'package:staff_app/view/star_reward_screen/star_reward_screen.dart';
import 'package:staff_app/view/task_or_reminder_screen/task_or_reminder_screen.dart';
import 'package:staff_app/view/wating_area_screen/wating_area_screen.dart';

import '../task_or_reminder_screen/add_task_or_reminder_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  // bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(appLogoSvg, height: 31.sp,),
                    IconButton(
                      onPressed: (){
                        Get.back();
                      },
                      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.topCenter,
                      icon: const Icon(
                        Icons.close,
                        color: CustomColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                buildExpensionTile(translate(context).my_profile, [
                  InkWell(
                    onTap: (){
                      Get.to(MyProfileScreen(isFromDrawer: true,index: 0,));
                    },
                    child: buildTile(translate(context).account),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(MyProfileScreen(isFromDrawer: true,index: 1,));
                    },
                    child: buildTile(translate(context).job_details),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(MyProfileScreen(isFromDrawer: true,index: 2,));
                    },
                    child: buildTile(translate(context).statistics),),
                  InkWell(
                    onTap: (){
                      Get.to(MyProfileScreen(isFromDrawer: true,index: 3,));
                    },
                    child: buildTile(translate(context).assigned_schools),),
                ]),
                buildExpensionTile(translate(context).stars, [
                  InkWell(
                    onTap: (){
                      Get.to(const StarAttendanceScreen());
                    },
                    child: buildTile(translate(context).stars_attendance),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(const StarEvaluationScreen());
                    },
                    child: buildTile(translate(context).star_evaluation),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(const AssignmentScreen());
                    },
                    child: buildTile(translate(context).assignments),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(const NoteBookScreen());
                    },
                    child: buildTile(translate(context).notebook),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(const LibraryScreen());
                    },
                    child: buildTile(translate(context).library),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(const StarRewardScreen());
                    },
                    child: buildTile(translate(context).star_rewards),
                  ),
                ]),
                buildExpensionTile(translate(context).roles_delegation, [
                  InkWell(
                    onTap: (){
                      Get.to(const DelegationScreen());
                    },
                    child: buildTile(translate(context).delegated_to_me),
                  ),
                ]),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: (){
                    Get.to(const ShopView());
                  },
                  child: buildTile1(translate(context).shop),),
                InkWell(
                  onTap: (){
                    Get.to(const LibraryRecordsView());
                  },
                  child: buildTile1(translate(context).school_library),),
                InkWell(
                  onTap: (){
                    Get.to(TaskOrReminderScreen(isFromBtmBar: false,));
                  },
                  child: buildTile1(translate(context).tasks_reminders),),
                // InkWell(
                //   onTap: (){
                //     Get.to(ComplaintsReportScreen());
                //   },
                //   child: buildTile1(translate(context).complaints_reports),),
                InkWell(
                  onTap: (){
                    Get.to(const ScheduleMeetingScreen());
                  },
                  child: buildTile1(translate(context).schedule_meeting),),
                InkWell(
                  onTap: (){
                    Get.to(const LostAndFoundScreen());
                  },
                  child: buildTile1(translate(context).lost_found),),
                InkWell(
                  onTap: (){
                    Get.to(const FeedbackHelpScreen());
                  },
                  child: buildTile1(translate(context).help_feedback),),
                InkWell(
                  onTap: (){
                    Get.to(const LostAndFoundScreen());
                  },
                  child: buildTile1(translate(context).about_app),),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildTile(String text){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor, fontSize: 17.sp),),
            Icon(CupertinoIcons.arrow_up_right, color: CustomColors.primaryColor,size: 17.sp,),
          ],
        ),
        const Divider(
          color: CustomColors.primaryColor,
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
  
  Widget buildTile1(String text){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor, fontSize: 20.sp),),
            Icon(CupertinoIcons.forward, color: CustomColors.primaryColor,size: 20.sp,),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
  Widget buildExpensionTile(String title, List<Widget> children){
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent,visualDensity: const VisualDensity(vertical: -2, horizontal: -4)),
      child: ExpansionTile(
        initiallyExpanded: false,
        title: Text(title, style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor, fontSize: 20.sp),),
        iconColor: CustomColors.primaryColor,
        // onExpansionChanged: (value){
        //   isOpen = value;
        //   setState(() {});
        // },
        tilePadding: EdgeInsets.zero,
        // trailing: isOpen ? Icon(Icons.keyboard_arrow_down_rounded, color: CustomColors.primaryColor,size: 24.sp,) : Icon(Icons.keyboard_arrow_right, color: CustomColors.primaryColor,size: 24.sp,),
        collapsedIconColor: CustomColors.primaryColor,
        childrenPadding: const EdgeInsetsDirectional.only(end: 20.0),
        children: children,
      ),
    );
  }
}
