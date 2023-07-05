import 'package:get/get.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/language_classes/language_constants.dart';

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
    SearchList(title: translate(Get.context!).class_schedule, onTap: (){}),
    SearchList(title: translate(Get.context!).attendance, onTap: (){}),
    SearchList(title: translate(Get.context!).performance, onTap: (){}),
    SearchList(title: "Early Leave & Permission", onTap: (){}),
    SearchList(title: translate(Get.context!).leave_request, onTap: (){}),
    SearchList(title: "My Notes", onTap: (){}),
    SearchList(title: "Annual Schedule", onTap: (){}),
    SearchList(title: translate(Get.context!).online_class_request, onTap: (){}),
    SearchList(title: translate(Get.context!).medical_records, onTap: (){}),
    SearchList(title: translate(Get.context!).notification_settings, onTap: (){}),
    SearchList(title: translate(Get.context!).complaints_reports, onTap: (){}),
    SearchList(title: translate(Get.context!).feedback_help, onTap: (){}),
    SearchList(title: translate(Get.context!).card_tags, onTap: (){}),
    SearchList(title: translate(Get.context!).location, onTap: (){}),
    SearchList(title: translate(Get.context!).wallet, onTap: (){}),
    SearchList(title: translate(Get.context!).transportation, onTap: (){}),
    /// Drawer
    SearchList(title: "Profile - Account", onTap: (){}),
    SearchList(title: "Profile - Job Details", onTap: (){}),
    SearchList(title: "Profile - Statics", onTap: (){}),
    SearchList(title: "Profile - Assigned Schools", onTap: (){}),
    SearchList(title: "Stars - Attendance", onTap: (){}),
    SearchList(title: "Stars - Evaluation", onTap: (){}),
    SearchList(title: "Stars - Assignments", onTap: (){}),
    SearchList(title: "Stars - Notebook", onTap: (){}),
    SearchList(title: "Stars - Reward", onTap: (){}),
    SearchList(title: "Roles Delegation - Delegated to me", onTap: (){}),
    SearchList(title: "Assignment - Awareness & Courses", onTap: (){}),
    SearchList(title: "Assignment - Worksheet", onTap: (){}),
    SearchList(title: "Assignment - Assessment", onTap: (){}),
    SearchList(title: "Assignment - Lab", onTap: (){}),
    SearchList(title: "E-Library - Awareness & Courses", onTap: (){}),
    SearchList(title: "E-Library - Worksheet", onTap: (){}),
    SearchList(title: "E-Library - Assessment", onTap: (){}),
    SearchList(title: "E-Library - Lab", onTap: (){}),
    SearchList(title: "Shop", onTap: (){}),
    SearchList(title: "Task & Reminders", onTap: (){}),
    SearchList(title: "Schedule Meeting", onTap: (){}),
    SearchList(title: "Lost & Found", onTap: (){}),
    SearchList(title: "Help & Feedback", onTap: (){}),
    SearchList(title: "Events", onTap: (){}),
    SearchList(title: "Custody", onTap: (){}),
    SearchList(title: "Exam Time Table", onTap: (){}),
    SearchList(title: "About App", onTap: (){}),
    SearchList(title: "Logout", onTap: (){}),
  ];
}

class SearchList {
  final String title;
  final Function()? onTap;

  SearchList({required this.title, required this.onTap});
}