// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:staff_app/utility/base_views/base_button.dart';
//
// import 'package:staff_app/utility/base_views/base_colors.dart';
// import 'package:staff_app/Utility/custom_filter_dropdown.dart';
// import 'package:staff_app/Utility/custom_text_field.dart';
// import 'package:staff_app/Utility/dummy_lists.dart';
// import 'package:staff_app/Utility/filter_textformfield.dart';
// import 'package:staff_app/Utility/images_icon_path.dart';
// import 'package:staff_app/Utility/sizes.dart';
// import 'package:staff_app/utility/base_utility.dart';
// import 'package:staff_app/constants-classes/color_constants.dart';
// import 'package:staff_app/language_classes/language_constants.dart';
// import 'package:staff_app/utility/base_views/base_detail_data.dart';
// import 'package:staff_app/utility/base_views/base_edit_delete.dart';
// import 'package:staff_app/utility/base_views/base_icons.dart';
// import 'package:staff_app/view/assignments_screen/submitted_assignment_view.dart';
// import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';
//
// import '../../assignments_screen/assignment_submission_screen.dart';
//
// class NewAssignmentListTile extends StatefulWidget {
//   const NewAssignmentListTile({Key? key}) : super(key: key);
//
//   @override
//   State<NewAssignmentListTile> createState() => _NewAssignmentListTileState();
// }
//
// class _NewAssignmentListTileState extends State<NewAssignmentListTile> {
//   TextEditingController searchCtrl = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: EdgeInsets.only(bottom: 8.h),
//       shrinkWrap: true,
//       itemCount: 10,
//       itemBuilder: (BuildContext context, int index) {
//         return GestureDetector(
//           onTap: (){
//             Get.to(AssignmentSubmissionScreen(title: ''));
//           },
//           child: Card(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0)
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(15.sp),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   BaseEditDelete(heading: "Assignments 1", editTitle: "assignment", deleteTitle: "Delete Assignment",showSaveIcon: true,showDeleteReason: true,),
//                   Divider(),
//                   BaseDetailData(detailsLabel: "Assignment Number",detailsValue: "1154",prefixIcon: "assets/images/report.svg"),
//                   BaseDetailData(detailsLabel: "Assignment Type",detailsValue: "Worksheet",prefixIcon: "assets/images/report.svg"),
//                   BaseDetailData(detailsLabel: "Assignment To",detailsValue: "Rashid Khan (Nurse)",prefixIcon: "assets/images/family_img.svg"),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       BaseDetailData(showDivider: false,detailsLabel: translate(context).post_date,detailsValue: "01/03/2022",prefixIcon: "assets/images/Vector (1).svg"),
//                       Container(height: 20.0,width: 1, color: BaseColors.borderColor,),
//                       BaseDetailData(showDivider: false,detailsLabel: translate(context).post_time,detailsValue: "9:30 AM",prefixIcon: "assets/images/time_icon.svg"),
//                     ],
//                   ),
//                   Divider(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       BaseDetailData(showDivider: false,detailsLabel: "Submit Date",detailsValue: "01/03/2022",prefixIcon: "assets/images/Vector (1).svg"),
//                       Container(height: 20.0,width: 1, color: BaseColors.borderColor,),
//                       BaseDetailData(showDivider: false,detailsLabel: "Submit Time",detailsValue: "9:30 AM",prefixIcon: "assets/images/time_icon.svg"),
//                     ],
//                   ),
//                   Divider(),
//                   BaseDetailData(detailsLabel: "Due Date",detailsValue: "01/03/2022",prefixIcon: "assets/images/Vector (1).svg"),
//                   BaseDetailData(detailsLabel: "Assigned Time",detailsValue: "9:30 AM",prefixIcon: "assets/images/time_icon.svg"),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                     Text("food_allergy.doc",style: TextStyle(fontWeight: FontWeight.w700,color: BaseColors.primaryColor,fontSize: 15.sp)),
//                     Row(mainAxisSize: MainAxisSize.min,children: [
//                       BaseIcons().view(rightMargin: 2.5.w),
//                       BaseIcons().download(leftMargin: 2.5.w),
//                     ])
//                   ],),
//                   Divider(),
//                   Text("https://website.com",style: TextStyle(fontWeight: FontWeight.w700,color: BaseColors.primaryColor,fontSize: 15.sp)),
//                   Divider(),
//                   SizedBox(height: 1.h),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: BaseButton(removeHorizontalPadding: true,rightMargin: 2.w,title: "stop post".toUpperCase(), onPressed: (){
//                           Get.to(SubmittedAssignmentView());
//                         },btnType: mediumButton,isActive: false),
//                       ),
//                       Expanded(
//                         child: BaseButton(removeHorizontalPadding: true,leftMargin: 2.w,title: "Post".toUpperCase(), onPressed: (){
//                           Get.to(SubmittedAssignmentView());
//                         },btnType: mediumButton,),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 2.h,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }