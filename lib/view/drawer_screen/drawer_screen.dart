import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/new_assignments/new_assignments_screen.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/about_us/about_us.dart';
import 'package:staff_app/view/custody/custody_view.dart';
import 'package:staff_app/view/delegation/delegation_screen.dart';
import 'package:staff_app/view/e_library/e_library_assignments.dart';
import 'package:staff_app/view/events/events_screen.dart';
import 'package:staff_app/view/exam_time_table/exam_time_table_screen.dart';
import 'package:staff_app/view/feedback_help_screen/feedback_help_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen.dart';
import 'package:staff_app/view/login_screen/login_screen.dart';
import 'package:staff_app/view/lost_or_found_screen/lost_found.dart';
import 'package:staff_app/view/my_profile_screen/my_profile_screen.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen.dart';
import 'package:staff_app/view/shop_screen/shop_screen.dart';
import 'package:staff_app/view/star_attendance_screen/star_attendance_screen.dart';
import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen.dart';
import 'package:staff_app/view/star_reward_screen/star_reward_screen.dart';
import 'package:staff_app/view/task_or_reminder_screen/task_or_reminder_screen.dart';


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
      backgroundColor: BaseColors.backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: SafeArea(
          bottom: false,
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
                        color: BaseColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                // Visibility(
                //   visible: kDebugMode,
                //   child: GestureDetector(
                //     onTap: () async {
                //       Locale locale = await setLocalePref('ar');
                //       Get.updateLocale(locale);
                //     },
                //     onDoubleTap: () async {
                //       Locale locale = await setLocalePref('en');
                //       Get.updateLocale(locale);
                //     },
                //     child: buildTile1("Change Language"),
                //   ),
                // ),
                buildExpensionTile(translate(context).my_profile,
                    [
                      GestureDetector(
                        onTap: (){
                          Get.to(MyProfileScreen(isFromDrawer: true,index: 0));
                          },
                        child: buildTile(translate(context).account),
                      ),
                  GestureDetector(
                    onTap: (){
                      Get.to(MyProfileScreen(isFromDrawer: true, index: 1));
                    },
                    child: buildTile(translate(context).job_details),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(MyProfileScreen(isFromDrawer: true,index: 2,));
                    },
                    child: buildTile(translate(context).statistics),),
                  GestureDetector(
                    onTap: (){
                      Get.to(MyProfileScreen(isFromDrawer: true,index: 3,));
                    },
                    child: buildTile(translate(context).assigned_schools)),
                ]),
                // buildExpensionTile(translate(context).add_new, [
                //   GestureDetector(
                //     onTap: (){
                //       Get.to(const NewAssignmentScreen());
                //     },
                //     child: buildTile("New Assignment"),
                //   ),
                // ]),
                buildExpensionTile(translate(context).stars, [
                  GestureDetector(
                    onTap: (){
                      Get.to(const StarAttendanceScreen());
                    },
                    child: buildTile(translate(context).stars_attendance),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(const StarEvaluationScreen());
                    },
                    child: buildTile(translate(context).star_evaluation),
                  ),
                  // GestureDetector(
                  //   onTap: (){
                  //     Get.to(const AssignmentScreen());
                  //   },
                  //   child: buildTile(translate(context).assignments),
                  // ),
                  GestureDetector(
                    onTap: (){
                      Get.to(const NoteBookScreen());
                    },
                    child: buildTile(translate(context).notebook),
                  ),
                  // GestureDetector(
                  //   onTap: (){
                  //     Get.to(const LibraryScreen());
                  //   },
                  //   child: buildTile(translate(context).library),
                  // ),
                  GestureDetector(
                    onTap: (){
                      Get.to(const StarRewardScreen());
                    },
                    child: buildTile(translate(context).star_rewards),
                  ),
                ]),
                buildExpensionTile(translate(context).roles_delegation, [
                  GestureDetector(
                    onTap: (){
                      Get.to(const DelegationScreen());
                    },
                    child: buildTile(translate(context).delegated_to_me),
                  ),
                ]),
                buildExpensionTile("Assignment", [
                  GestureDetector(
                    onTap: (){
                      Get.to(const NewAssignmentScreen(title: 'Awareness & Courses'));
                    },
                    child: buildTile("Awareness & Courses"),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(const NewAssignmentScreen(title: 'Worksheet'));
                    },
                    child: buildTile("Worksheet"),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(const NewAssignmentScreen(title: "Assessment"));
                    },
                    child: buildTile("Assessment"),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(const NewAssignmentScreen(title: "Lab"));
                    },
                    child: buildTile("Lab"),
                  ),
                ]),
                buildExpensionTile("E-Library", [
                  GestureDetector(
                    onTap: (){
                      Get.to(const ELibraryScreen(title: "Awareness & Courses"));
                    },
                    child: buildTile("Awareness & Courses"),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(const ELibraryScreen(title: "Worksheet",));
                    },
                    child: buildTile("Worksheet"),
                  ),
                  GestureDetector(
                    onTap: (){
                      /// New
                      Get.to(const ELibraryScreen(title: "Assessment",));
                    },
                    child: buildTile("Assessment"),
                  ),
                  GestureDetector(
                    onTap: (){
                      /// New
                      Get.to(const ELibraryScreen(title: "Lab",));
                    },
                    child: buildTile("Lab"),
                  ),
                ]),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(const ShopView(initialTabIndex: 0,));
                  },
                  child: buildTile1(translate(context).shop),),
                // GestureDetector(
                //   onTap: (){
                //     Get.to(const LibraryRecordsView());
                //   },
                //   child: buildTile1(translate(context).school_library),),
                GestureDetector(
                  onTap: (){
                    Get.to(TaskOrReminderScreen(isFromBtmBar: false,));
                  },
                  child: buildTile1(translate(context).tasks_reminders)),
                // GestureDetector(
                //   onTap: (){
                //     Get.to(ComplaintsReportScreen());
                //   },
                //   child: buildTile1(translate(context).complaints_reports),),
                GestureDetector(
                  onTap: (){
                    Get.to(const ScheduleMeetingScreen());
                  },
                  child: buildTile1(translate(context).schedule_meeting),),
                GestureDetector(
                  onTap: (){
                    Get.to(const LostAndFoundScreen());
                  },
                  child: buildTile1(translate(context).lost_found),),
                GestureDetector(
                  onTap: (){
                    Get.to(const FeedbackHelpScreen());
                  },
                  child: buildTile1(translate(context).help_feedback),),
                GestureDetector(
                    onTap: (){
                      Get.to(const EventsScreen());
                    },
                    child: buildTile1("Events")),
                // GestureDetector(
                //     onTap: (){
                //       Get.to(const RouteView());
                //     },
                //     child: buildTile1("Route")),
                GestureDetector(
                    onTap: (){
                      Get.to(const CustodyView());
                    },
                    child: buildTile1("Custody")),
                GestureDetector(
                    onTap: (){
                      Get.to(const ExamTimeTableScreen());
                    },
                    child: buildTile1("Exam Time Table")),
                GestureDetector(
                    onTap: (){
                      Get.to(const AboutUs());
                    },
                    child: buildTile1(translate(context).about_app)),
                GestureDetector(
                    onTap: (){
                      Get.back();
                      BaseOverlays().showConfirmationDialog(
                        title: "Are you sure do you want to logout this app?",
                        rightButtonTitle: "YES",
                        leftButtonTitle: "NO",
                        onRightButtonPressed: (){
                          Get.back(closeOverlays: true);
                          BaseOverlays().showLoader();
                          Future.delayed(const Duration(seconds: 2), () async {
                            await BaseSharedPreference().clearLoginSession();
                            Get.offAll(LoginScreen());
                          });
                        }
                      );
                    },
                    child: buildTile1(translate(context).logout)),
                SizedBox(height: 10.h)
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
            Text(text, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: drawerSubHeadingTs)),
            Icon(CupertinoIcons.arrow_up_right, color: BaseColors.primaryColor,size: 17.sp,),
          ],
        ),
        const Divider(
          color: BaseColors.primaryColor,
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
            Text(text, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 20.sp),),
            Icon(CupertinoIcons.forward, color: BaseColors.primaryColor,size: 20.sp,),
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
        title: Text(title, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: drawerHeadingTs),),
        iconColor: BaseColors.primaryColor,
        // onExpansionChanged: (value){
        //   isOpen = value;
        //   setState(() {});
        // },
        tilePadding: EdgeInsets.zero,
        // trailing: isOpen ? Icon(Icons.keyboard_arrow_down_rounded, color: CustomColors.primaryColor,size: 24.sp,) : Icon(Icons.keyboard_arrow_right, color: CustomColors.primaryColor,size: 24.sp,),
        collapsedIconColor: BaseColors.primaryColor,
        childrenPadding: const EdgeInsetsDirectional.only(end: 20.0),
        children: children,
      ),
    );
  }
}
