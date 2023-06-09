import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/home_class_schedule/home_class_schedule_screen.dart';
import 'package:staff_app/view/assignments_screen/assignment_screen.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen.dart';
import 'package:staff_app/view/chat_screen/chat_screen.dart';
import 'package:staff_app/view/complaints_report_screen/view/complaints_report_screen.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';
import 'package:staff_app/view/performance_screen/performance_screen.dart';
import 'package:staff_app/view/star_attendance_screen/star_attendance_screen.dart';
import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen.dart';
import 'package:staff_app/view/task_or_reminder_screen/task_or_reminder_screen.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({Key? key}) : super(key: key);

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  MyProfileCtrl controller = Get.find<MyProfileCtrl>();

  List<Map<String, dynamic>> list = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    list = [
      {
        "subTitle": "Pending Task",
      },
      {
        "subTitle": "Unclosed Compliant",
      },
      {
        "subTitle": "Stars Evaluation Pending",
      },
      {
        "subTitle": "Assignment to Review",
      },
      {
        "subTitle": "Attendance Record",
      },
      {
        "subTitle": "Performance",
      },
      {
        "subTitle": "Linked Stars",
      },
      {
        "subTitle": "Allocated Schools",
      },
      {
        "subTitle": "Total Classes Attended This Week",
      },
      {
        "subTitle": "Average of Interacting with chatting",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGrids(),
    );
  }
  Widget buildGrids(){
    return Obx(()=>GridView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(5),
          child: buildItem(index),
        ),
        itemCount: controller.staticsCountList.length,
      ),
    );
  }
  buildItem(int index) {
    return GestureDetector(
      onTap: (){
        switch (list[index]['subTitle']) {
          case "Pending Task": Get.to(TaskOrReminderScreen(isFromBtmBar: false)); break;
          case "Unclosed Compliant":Get.to(ComplaintsReportScreen()); break;
          case "Stars Evaluation Pending": Get.to(StarEvaluationScreen()); break;
          case "Assignment to Review": Get.to(AssignmentScreen()); break;
          case "Attendance Record": Get.to(AttendanceScreen()); break;
          case "Performance": Get.to(PerformanceScreen(index: 0)); break;
          case "Linked Stars": Get.to(StarAttendanceScreen()); break;
          case "Allocated Schools": break;
          case "Total Classes Attended This Week": Get.to(HomeClassScheduleScreen(index: 1)); break;
          case "Average of Interacting with chatting": Get.to(ChatScreen(isFromBtmBar: false)); break;
          default: break;
        }
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: BaseColors.darkShadowColor,
                spreadRadius: 1.0,
                blurRadius: 10.0,
                offset: Offset(0, 3)
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.staticsCountList[index], style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 25.sp),),
            SizedBox(height: 1.h),
            Text(list[index]["subTitle"], style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
