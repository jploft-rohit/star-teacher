import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen.dart';
import 'package:staff_app/view/cards_and_tags_screen/cards_and_tags_screen.dart';
import 'package:staff_app/view/class_schedule_screen/class_schedule_screen.dart';
import 'package:staff_app/view/complaints_report_screen/Complaints_report_screen.dart';
import 'package:staff_app/view/feedback_help_screen/feedback_help_screen.dart';
import 'package:staff_app/view/leave_request_screen/early_leave_screen.dart';
import 'package:staff_app/view/leave_request_screen/leave_permission_screen.dart';
import 'package:staff_app/view/leave_request_screen/leave_request_screen.dart';
import 'package:staff_app/view/my_profile_screen/medical_report_view/medical_report_view.dart';
import 'package:staff_app/view/notification_setting_screen/notification_setting_screen.dart';
import 'package:staff_app/view/performance_screen/performance_screen.dart';
import 'package:staff_app/view/request_online_classes/request_online_classes_detail.dart';
import 'package:staff_app/view/transportation_screen/location_screen.dart';
import 'package:staff_app/view/transportation_screen/transportation_screen.dart';
import 'package:staff_app/view/wallet/wallet_view.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    list = [
      translate(context).class_schedule,
      translate(context).attendance,
      translate(context).performance,
      "Early Leave",
      translate(context).leave_request,
      translate(context).online_class_request,
      translate(context).medical_records,
      translate(context).notification_settings,
      translate(context).complaints_reports,
      translate(context).feedback_help,
      translate(context).card_tags,
      translate(context).location,
      translate(context).wallet,
      translate(context).transportation,
      "Leave Permission",
    ];
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              if(index == 0){
                Get.to(const ClassScheduleScreen());
              } else if(index == 1){
                Get.to(const AttendanceScreen());
              } else if(index == 2){
                Get.to(PerformanceScreen(index: 1,));
              } else if(index == 3){
                Get.to(const EarlyLeaveScreen());
              } else if(index == 4){
                Get.to(const LeaveRequestScreen());
              } else if(index == 5){
                Get.to(RequestOnlineClassesDetail());
              } else if(index == 6){
                Get.to(const MedicalReportView());
              } else if(index == 7){
                Get.to(const NotificationSettingScreen());
              } else if(index == 8){
                Get.to(const ComplaintsReportScreen());
              } else if(index == 9){
                Get.to(const FeedbackHelpScreen());
              } else if(index == 10){
                Get.to(const CardsAndTagsScreen());
              } else if(index == 11){
                Get.to(const LocationScreen());
              } else if(index == 12){
                Get.to(const WalletView());
              } else if(index == 13){
                Get.to(const TransportationScreen());
              } else if(index == 14){
                Get.to(const LeavePermissionScreen());
              }
            },
            child: buildTile(list[index]),
          );
        },
      ),
    );
  }
  Widget buildTile(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: CustomColors.primaryColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor, fontSize: 17.sp),),
          Icon(
            Icons.arrow_forward,
            color: CustomColors.primaryColor,
            size: 20.sp,
          )
        ],
      ),
    );
  }
}
