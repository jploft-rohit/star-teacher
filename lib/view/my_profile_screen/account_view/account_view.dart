import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/account_deactivation_screen/activation_request_detail_screen.dart';
import 'package:staff_app/view/account_deactivation_screen/deactivation_detail_screen.dart';
import 'package:staff_app/view/annual_schedule/annual_schedule.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen.dart';
import 'package:staff_app/view/cards_and_tags_screen/cards_and_tags_screen.dart';
import 'package:staff_app/view/class_schedule_screen/class_schedule_screen.dart';
import 'package:staff_app/view/complaints_report_screen/view/complaints_report_screen.dart';
import 'package:staff_app/view/early_leave_and_permission/early_leave_permission.dart';
import 'package:staff_app/view/feedback_help_screen/feedback_help_screen.dart';
import 'package:staff_app/view/leave_request_screen/leave_request_screen.dart';
import 'package:staff_app/view/location/location_screen.dart';
import 'package:staff_app/view/my_notes/my_notes_screen.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';
import 'package:staff_app/view/my_profile_screen/new_medical_report_screen/medical_record_view.dart';
import 'package:staff_app/view/notification_setting_screen/notification_setting_screen.dart';
import 'package:staff_app/view/performance_screen/performance_screen.dart';
import 'package:staff_app/view/request_online_classes/request_online_classes_detail.dart';
import 'package:staff_app/view/transportation_screen/transportation_screen.dart';
import 'package:staff_app/view/wallet/wallet_view.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  List<String> list = [];
  MyProfileCtrl myProfileController = Get.find<MyProfileCtrl>();

  @override
  Widget build(BuildContext context) {
    list = [
      translate(context).class_schedule,
      translate(context).attendance,
      translate(context).performance,
      translate(context).early_leave_permission,
      translate(context).leave_request,
      translate(context).my_notes,
      translate(context).annual_schedule,
      translate(context).online_class_request,
      translate(context).medical_records,
      translate(context).notification_settings,
      translate(context).complaints_reports,
      translate(context).feedback_help,
      translate(context).card_tags,
      translate(context).location,
      translate(context).wallet,
      translate(context).transportation,
      translate(context).account_activation_deactivation,
      translate(context).delete_account,
    ];
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              if(index == 0){
                Get.to(const ClassScheduleScreen());
              } else if(index == 1){
                Get.to(const AttendanceScreen());
              } else if(index == 2){
                Get.to(const PerformanceScreen(index: 0));
              } else if(index == 3){
                Get.to(const EarlyLeavePermission());
              } /* else if(index == 4){
                Get.to(const LeavePermissionScreen());
              } */ else if(index == 4){
                Get.to(const LeaveRequestScreen());
              } else if(index == 5){
                Get.to(const MyNotesScreen());
              } else if(index == 6){
                Get.to(const AnnualScheduleScreen());
              } else if(index == 7){
                Get.to(const RequestOnlineClassesDetail());
              } else if(index == 8){
                Get.to(MedicalRecordView(headerData: myProfileController.response.value.data));
              } else if(index == 9){
                Get.to(const NotificationSettingScreen());
              } else if(index == 10){
                Get.to(const ComplaintsReportScreen());
              } else if(index == 11){
                Get.to(const FeedbackHelpScreen());
              } else if(index == 12){
                Get.to(const CardsAndTagsScreen());
              } else if(index == 13){
                Get.to(const LocationScreen());
              } else if(index == 14){
                Get.to(const WalletView());
              }
              else if(index == 15){
                Get.to(const TransportationScreen());
              }
              else if(index == 16){
                if ((myProfileController.response.value.data?.isDeactivateRequestData?.toString()??"") == "0") {
                  /// History Of Sent Request
                  Get.to(ActivationRequestDetailScreen(
                      data: myProfileController.response.value.data?.deactivateData,
                      qrCode: myProfileController.response.value.data?.barcode??"",
                      bloodType: myProfileController.response.value.data?.bloodType??""),
                  );
                }else{
                  /// Send New Request For Activation
                  Get.to(DeactivationDetailScreen(
                      data: myProfileController.response.value.data?.deactivateData,
                      qrCode: myProfileController.response.value.data?.barcode??"",
                      bloodType: myProfileController.response.value.data?.bloodType??""),
                  );
                }
              } else if(index == 17){
                // Get.to(const WalletView());
                BaseOverlays().showConfirmationDialog(
                  title: translate(context).are_you_sure_you_want_to_delete_this_account,
                  onRightButtonPressed: (){
                    BaseOverlays().dismissOverlay();
                    myProfileController.deleteAccount();
                  }
                );
              }
            },
            child: Padding(padding: const EdgeInsets.only(bottom: 6),
            child: BaseButton(title: list[index], onPressed: null, btnType: "iconButton")),
          );
        },
      ),
    );
  }
}
