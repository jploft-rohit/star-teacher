import 'package:get/get.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/new_assignments/new_assignments_screen.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/about_us/about_us.dart';
import 'package:staff_app/view/annual_schedule/annual_schedule.dart';
import 'package:staff_app/view/assignments_screen/assignment_screen.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen.dart';
import 'package:staff_app/view/cards_and_tags_screen/cards_and_tags_screen.dart';
import 'package:staff_app/view/class_schedule_screen/class_schedule_screen.dart';
import 'package:staff_app/view/complaints_report_screen/view/complaints_report_screen.dart';
import 'package:staff_app/view/custody/custody_view.dart';
import 'package:staff_app/view/delegation/delegation_screen.dart';
import 'package:staff_app/view/e_library/e_library_assignments.dart';
import 'package:staff_app/view/early_leave_and_permission/early_leave_permission.dart';
import 'package:staff_app/view/events/events_screen.dart';
import 'package:staff_app/view/exam_time_table/exam_time_table_screen.dart';
import 'package:staff_app/view/feedback_help_screen/feedback_help_screen.dart';
import 'package:staff_app/view/leave_request_screen/leave_request_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen.dart';
import 'package:staff_app/view/login_screen/login_screen.dart';
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
import 'package:staff_app/view/transportation_screen/location_screen.dart';
import 'package:staff_app/view/transportation_screen/transportation_screen.dart';
import 'package:staff_app/view/wallet/wallet_view.dart';
import 'package:staff_app/view/worksheet/worksheet_screen.dart';

class SearchScreenCtrl extends GetxController{
  final selectedIndex = 0.obs;
  var fmoImageList = [
    nfcSvg,
    barcodeSvg,
    handSvg,
  ];
  final selectedFMOPos = 0.obs;
  RxList<SearchList> searchedList = <SearchList>[].obs;
  List<SearchList> modulesList = [
    /// Profile
    SearchList(title: translate(Get.context!).class_schedule, onTap: (){Get.to(const ClassScheduleScreen());}),
    SearchList(title: translate(Get.context!).attendance, onTap: (){Get.to(const AttendanceScreen());}),
    SearchList(title: translate(Get.context!).performance, onTap: (){Get.to(PerformanceScreen(index: 0));}),
    SearchList(title: "Early Leave & Permission", onTap: (){Get.to(const EarlyLeavePermission());}),
    SearchList(title: translate(Get.context!).leave_request, onTap: (){Get.to(const LeaveRequestScreen());}),
    SearchList(title: "My Notes", onTap: (){Get.to(MyNotesScreen());}),
    SearchList(title: "Annual Schedule", onTap: (){Get.to(AnnualScheduleScreen());}),
    SearchList(title: translate(Get.context!).online_class_request, onTap: (){Get.to(RequestOnlineClassesDetail());}),
    SearchList(title: translate(Get.context!).medical_records, onTap: (){Get.to(const MedicalReportView());}),
    SearchList(title: translate(Get.context!).notification_settings, onTap: (){Get.to(const NotificationSettingScreen());}),
    SearchList(title: translate(Get.context!).complaints_reports, onTap: (){Get.to(const ComplaintsReportScreen());}),
    SearchList(title: translate(Get.context!).feedback_help, onTap: (){Get.to(const FeedbackHelpScreen());}),
    SearchList(title: translate(Get.context!).card_tags, onTap: (){Get.to(const CardsAndTagsScreen());}),
    SearchList(title: translate(Get.context!).location, onTap: (){Get.to(const LocationScreen());}),
    SearchList(title: translate(Get.context!).wallet, onTap: (){Get.to(const WalletView());}),
    SearchList(title: translate(Get.context!).transportation, onTap: (){Get.to(const TransportationScreen());}),
    /// Drawer
    SearchList(title: "Profile - Account", onTap: (){Get.to(MyProfileScreen(isFromDrawer: true,index: 0));}),
    SearchList(title: "Profile - Job Details", onTap: (){Get.to(MyProfileScreen(isFromDrawer: true,index: 1,));}),
    SearchList(title: "Profile - Statics", onTap: (){Get.to(MyProfileScreen(isFromDrawer: true,index: 2,));}),
    SearchList(title: "Profile - Assigned Schools", onTap: (){Get.to(MyProfileScreen(isFromDrawer: true,index: 3,));}),
    SearchList(title: "Stars - Attendance", onTap: (){Get.to(const StarAttendanceScreen());}),
    SearchList(title: "Stars - Evaluation", onTap: (){Get.to(const StarEvaluationScreen());}),
    SearchList(title: "Stars - Assignments", onTap: (){Get.to(const AssignmentScreen());}),
    SearchList(title: "Stars - Notebook", onTap: (){Get.to(const NoteBookScreen());}),
    SearchList(title: "Stars - Reward", onTap: (){Get.to(const StarRewardScreen());}),
    SearchList(title: "Roles Delegation - Delegated to me", onTap: (){Get.to(const DelegationScreen());}),
    SearchList(title: "Assignment - Awareness & Courses", onTap: (){Get.to(const NewAssignmentScreen(title: 'Awareness & Courses',));}),
    SearchList(title: "Assignment - Worksheet", onTap: (){Get.to(const WorkSheetScreen());}),
    SearchList(title: "Assignment - Assessment", onTap: (){Get.to(const NewAssignmentScreen(title: "Assessment",));}),
    SearchList(title: "Assignment - Lab", onTap: (){Get.to(const NewAssignmentScreen(title: "Lab",));}),
    SearchList(title: "E-Library - Awareness & Courses", onTap: (){Get.to(const ELibraryScreen());}),
    SearchList(title: "E-Library - Worksheet", onTap: (){Get.to(const ELibraryScreen(title: "Worksheet",));}),
    SearchList(title: "E-Library - Assessment", onTap: (){Get.to(const ELibraryScreen(title: "Assessment",));}),
    SearchList(title: "E-Library - Lab", onTap: (){Get.to(const ELibraryScreen(title: "Lab",));}),
    SearchList(title: "Shop", onTap: (){Get.to(const ShopView());}),
    SearchList(title: "Task & Reminders", onTap: (){Get.to(TaskOrReminderScreen(isFromBtmBar: false,));}),
    SearchList(title: "Schedule Meeting", onTap: (){Get.to(const ScheduleMeetingScreen());}),
    SearchList(title: "Lost & Found", onTap: (){Get.to(const LostAndFoundScreen());}),
    SearchList(title: "Help & Feedback", onTap: (){Get.to(const FeedbackHelpScreen());}),
    SearchList(title: "Events", onTap: (){Get.to(const EventsScreen());}),
    SearchList(title: "Custody", onTap: (){Get.to(const CustodyView());}),
    SearchList(title: "Exam Time Table", onTap: (){Get.to(const ExamTimeTableScreen());}),
    SearchList(title: "About App", onTap: (){Get.to(const AboutUs());}),
    SearchList(title: "Logout", onTap: (){
      Get.back(closeOverlays: true);
      BaseOverlays().showLoader();
      Future.delayed(const Duration(seconds: 2), () async {
        await BaseSharedPreference().clearLoginSession();
        Get.offAll(LoginScreen());
      });
    }),
  ];

  List<String> demoModuleList = ["Hello","Hi","How","You"];

  RxList<String> demoSearchedList = <String>[].obs;
}

class SearchList {
  final String title;
  final Function()? onTap;

  SearchList({required this.title, required this.onTap});
  @override
  String toString() =>'title--$title';
}