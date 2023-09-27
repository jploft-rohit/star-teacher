import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/new_assignments/new_assignments_screen.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/view/about_us/about_us.dart';
import 'package:staff_app/view/annual_schedule/annual_schedule.dart';
import 'package:staff_app/view/assignments_screen/assignment_screen.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen.dart';
import 'package:staff_app/view/cards_and_tags_screen/cards_and_tags_screen.dart';
import 'package:staff_app/view/class_schedule_screen/class_schedule_screen.dart';
import 'package:staff_app/view/complaints_report_screen/view/complaints_report_screen.dart';
import 'package:staff_app/view/custody/custody_view.dart';
import 'package:staff_app/view/delegation/delegation_screen.dart';
import 'package:staff_app/view/early_leave_and_permission/early_leave_permission.dart';
import 'package:staff_app/view/events/events_screen.dart';
import 'package:staff_app/view/exam_time_table/exam_time_table_screen.dart';
import 'package:staff_app/view/feedback_help_screen/feedback_help_screen.dart';
import 'package:staff_app/view/leave_request_screen/leave_request_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen.dart';
import 'package:staff_app/view/lost_or_found_screen/lost_found.dart';
import 'package:staff_app/view/my_notes/my_notes_screen.dart';
import 'package:staff_app/view/my_profile_screen/medical_report_view/medical_report_view.dart';
import 'package:staff_app/view/my_profile_screen/my_profile_screen.dart';
import 'package:staff_app/view/notification_setting_screen/notification_setting_screen.dart';
import 'package:staff_app/view/performance_screen/performance_screen.dart';
import 'package:staff_app/view/request_online_classes/request_online_classes_detail.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen.dart';
import 'package:staff_app/view/shop_screen/shop_screen.dart';
import 'package:staff_app/view/star_attendance_screen/star_attendance_screen.dart';
import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen.dart';
import 'package:staff_app/view/star_reward_screen/star_reward_screen.dart';
import 'package:staff_app/view/task_or_reminder_screen/task_or_reminder_screen.dart';
import 'package:staff_app/view/transportation_screen/transportation_location_screen.dart';
import 'package:staff_app/view/transportation_screen/transportation_screen.dart';
import 'package:staff_app/view/wallet/wallet_view.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize() {
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings()
    );
    _notificationsPlugin.initialize(initializationSettings,onDidReceiveNotificationResponse: (payload)async{
      print("on clivk ");
      if (payload.payload != null) {
        // Open the PDF file
        if (await canLaunch(payload.payload!)) {
      await launch(payload.payload!);
      } else {
      throw 'Could not launch $payload';
      }
      }

    });
  }

  static void display(int id,String title,String body,filePath) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = const NotificationDetails(
          android: AndroidNotificationDetails(
            "Star Teacher",
            "pushnotificationappchannel",
            icon: '@mipmap/ic_launcher',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          ),
        iOS: DarwinNotificationDetails(presentAlert: true,presentSound: true)
      );

      await _notificationsPlugin.show(
        id,
        title,
        body,
        notificationDetails,
        payload: filePath,
      );
      const InitializationSettings initializationSettings =
      InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings()
      );
      _notificationsPlugin.initialize(initializationSettings,onDidReceiveNotificationResponse: (payload)async{
        print("on click ${payload.payload}");
        if (payload.payload != null) {
          final result = await OpenFile.open(filePath);
          if (result.type==ResultType.done) {
          } else {
            showDialog(
              context: Get.context!,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      addText("Error", 17, Colors.black, FontWeight.bold),
                      SizedBox(height: 2.h,),
                      addAlignedText("Unable to open the file. Please download pdf viewer.", 16, Colors.black, FontWeight.normal),
                      SizedBox(height: 3.h,),
                      BaseButton(
                        title: 'Ok',
                        btnType: 'medium',
                        verticalPadding: 1.0.h,
                        // isActive: false,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  static void normaldisplay(int id,String title,String body, {String? screenName}) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = const NotificationDetails(
          android: AndroidNotificationDetails(
            "Star Teacher",
            "pushnotificationappchannel",
            icon: '@mipmap/ic_launcher',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          ),
          iOS: DarwinNotificationDetails()
      );

      await _notificationsPlugin.show(
        id,
        title,
        body,
        notificationDetails,
      );
      const InitializationSettings initializationSettings = InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings()
      );
      _notificationsPlugin.initialize(
          initializationSettings,
          onDidReceiveNotificationResponse: (payload)async{
        if (payload.payload != null) {
          // if ((screenName??"").isNotEmpty) {
          //   switch (screenName) {
          //     case "classSchedule":
          //       Get.to(const ClassScheduleScreen());
          //       break;
          //     case "attendance":
          //       Get.to(const AttendanceScreen());
          //       break;
          //     case "performance":
          //       Get.to(const PerformanceScreen(index: 0,));
          //       break;
          //     case "earlyLeave":
          //       Get.to(const EarlyLeavePermission());
          //       break;
          //     case "leaveRequest":
          //       Get.to(const LeaveRequestScreen());
          //       break;
          //     case "myStickyNotes":
          //       Get.to(const MyNotesScreen());
          //       break;
          //     case "annualSchedule":
          //       Get.to(const AnnualScheduleScreen());
          //       break;
          //     case "onlineClassRequest":
          //       Get.to(const RequestOnlineClassesDetail());
          //       break;
          //     case "medicalRecord":
          //       Get.to(const MedicalReportView());
          //       break;
          //     case "notificationScreen":
          //       Get.to(const NotificationSettingScreen());
          //       break;
          //     case "complaintReport":
          //       Get.to(const ComplaintsReportScreen());
          //       break;
          //     case "feedbackHelp":
          //       Get.to(const FeedbackHelpScreen());
          //       break;
          //     case "cardsAndTags":
          //       Get.to(const CardsAndTagsScreen());
          //       break;
          //     case "transportationLocation":
          //       Get.to(const TransportationLocationScreen());
          //       break;
          //     case "wallet":
          //       Get.to(const WalletView());
          //       break;
          //     case "transport":
          //       Get.to(const TransportationScreen());
          //       break;
          //     case "myProfile":
          //       Get.to(MyProfileScreen(isFromDrawer: true,index: 0));
          //       break;
          //     case "starAttendance":
          //       Get.to(const StarAttendanceScreen());
          //       break;
          //     case "starEvaluation":
          //       Get.to(const StarEvaluationScreen());
          //       break;
          //     case "assignment_awarenessCourses":
          //       Get.to(const NewAssignmentScreen(title: 'Awareness & Courses'));
          //       break;
          //     case "assignment_worksheet":
          //       Get.to(const NewAssignmentScreen(title: 'Worksheet'));
          //       break;
          //     case "assignment_assessment":
          //       Get.to(const NewAssignmentScreen(title: 'Assessment'));
          //       break;
          //     case "assignment_lab":
          //       Get.to(const NewAssignmentScreen(title: 'Lab'));
          //       break;
          //     case "eLibrary_awarenessCourses":
          //       Get.to(const NewAssignmentScreen(title: 'Awareness & Courses'));
          //       break;
          //     case "eLibrary_worksheet":
          //       Get.to(const NewAssignmentScreen(title: 'Worksheet'));
          //       break;
          //     case "eLibrary_assessment":
          //       Get.to(const NewAssignmentScreen(title: 'Assessment'));
          //       break;
          //     case "eLibrary_lab":
          //       Get.to(const NewAssignmentScreen(title: 'Lab'));
          //       break;
          //     case "shop":
          //       Get.to(const ShopView(initialTabIndex: 0));
          //       break;
          //     case "notebook":
          //       Get.to(const NoteBookScreen());
          //       break;
          //     case "rolesDelegation":
          //       Get.to(const DelegationScreen());
          //       break;
          //     case "taskReminder":
          //       Get.to(const TaskOrReminderScreen(isFromBtmBar: false));
          //       break;
          //     case "scheduleMeeting":
          //       Get.to(const ScheduleMeetingScreen());
          //       break;
          //     case "lostAndFound":
          //       Get.to(const LostAndFoundScreen());
          //       break;
          //     case "events":
          //       Get.to(const EventsScreen());
          //       break;
          //     case "custody":
          //       Get.to(const CustodyView());
          //       break;
          //     case "examTimeTable":
          //       Get.to(const ExamTimeTableScreen());
          //       break;
          //     case "aboutUs":
          //       Get.to(const AboutUs());
          //       break;
          //   }
          // }
        }
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  static void showMessage(int id,String title,String body) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = const NotificationDetails(
          android: AndroidNotificationDetails(
            "Star Teacher",
            "pushnotificationappchannel",
            icon: '@mipmap/ic_launcher',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          ),
          iOS: DarwinNotificationDetails(presentAlert: true,presentSound: true)
      );

      await _notificationsPlugin.show(
        id,
        title,
        body,
        notificationDetails,
      );
      const InitializationSettings initializationSettings =
      InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings()
      );
      _notificationsPlugin.initialize(initializationSettings,onDidReceiveNotificationResponse: (payload)async{
        print("on onclick ${payload.payload}");
        if (payload.payload != null) {}
      });
    } on Exception catch (e) {
      print(e);
    }
  }
}








