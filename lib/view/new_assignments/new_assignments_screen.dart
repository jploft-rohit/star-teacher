// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:staff_app/utility/base_views/base_app_bar.dart';
// import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
// import 'package:staff_app/utility/base_views/base_tab_button.dart';
// import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
// import 'package:staff_app/Utility/custom_dropdown_widget.dart';
// import 'package:staff_app/Utility/dummy_lists.dart';
// import 'package:staff_app/Utility/sizes.dart';
// import 'package:staff_app/language_classes/language_constants.dart';
// import 'package:staff_app/view/assignments_screen/assignment_by_me_view/assigned_by_me_view.dart';
// import 'package:staff_app/view/create_task_or_assignment/create_task_or_assignment.dart';
// import 'package:staff_app/view/new_assignments/controller/new_assignment_ctrl.dart';
// import 'package:staff_app/view/new_assignments/create_assignment.dart';
// import 'package:staff_app/view/new_assignments/tabs/new_assignment_list_tile.dart';
//
// class NewAssignmentScreen extends StatefulWidget {
//   const NewAssignmentScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NewAssignmentScreen> createState() => _NewAssignmentScreenState();
// }
//
// class _NewAssignmentScreenState extends State<NewAssignmentScreen> with SingleTickerProviderStateMixin{
//   NewAssignmentCtrl controller = Get.put(NewAssignmentCtrl());
//   late TabController tabController;
//
//   @override
//   void initState() {
//     tabController = TabController(length: 3, vsync: this)..addListener(() {
//       setState(() {});
//     });
//     super.initState();
//   }
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         floatingActionButton: BaseFloatingActionButton(title: 'Add New',onTap: (){
//           Get.to(CreateAssignment());
//         }),
//         appBar: BaseAppBar(title: translate(context).assignments,
//         bottomChild: BaseToggleTabBar(controller: tabController, tabs: [
//           BaseTabButton(title: translate(context).ongoing, isSelected: tabController.index==0),
//           BaseTabButton(title: translate(context).submitted, isSelected: tabController.index==1),
//           BaseTabButton(title: translate(context).overdue, isSelected: tabController.index==2),
//         ],rightMargin: scaffoldPadding,leftMargin: scaffoldPadding),bottomWidgetHeight: 8.h,),
//         body: Padding(
//           padding: EdgeInsets.all(scaffoldPadding),
//           child: TabBarView(
//               controller: tabController,
//               children: [
//                 NewAssignmentListTile(),
//                 NewAssignmentListTile(),
//                 NewAssignmentListTile()
//               ]),
//         ),
//       )
//     );
//   }
// }