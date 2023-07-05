import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/new_assignments/controller/new_assignment_ctrl.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_edit_delete.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/view/assignments_screen/assignment_submission_screen.dart';

class NewAssignmentListTile extends StatefulWidget {
  final String title;
  const NewAssignmentListTile({Key? key, required this.title}) : super(key: key);

  @override
  State<NewAssignmentListTile> createState() => _NewAssignmentListTileState();
}

class _NewAssignmentListTileState extends State<NewAssignmentListTile> {
  TextEditingController searchCtrl = TextEditingController();
  NewAssignmentCtrl controller = Get.find<NewAssignmentCtrl>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 8.h,right: 1.w,left: 1.w),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            Get.to(AssignmentSubmissionScreen(title: widget.title));
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseEditDelete(heading: "Assignments 1", editTitle: controller.primaryTabIndex.value == 0 ? "assignment" : "", deleteTitle: controller.primaryTabIndex.value == 0 ? "Delete Assignment" : "",showSaveIcon: true,showDeleteReason: true,),
                  const Divider(),
                  BaseDetailData(detailsLabel: "Assignment Number",detailsValue: "1154",prefixIcon: "assets/images/report.svg"),
                  BaseDetailData(detailsLabel: "Assignment Type",detailsValue: "Worksheet",prefixIcon: "assets/images/report.svg"),
                  BaseDetailData(detailsLabel: "Assignment ${controller.primaryTabIndex.value == 1 ? "By" : "To"}",detailsValue: "Rashid Khan (Nurse)",prefixIcon: "assets/images/family_img.svg"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseDetailData(showDivider: false,detailsLabel: translate(context).post_date,detailsValue: "01/03/2022",prefixIcon: "assets/images/Vector (1).svg"),
                      Container(height: 20.0,width: 1, color: BaseColors.borderColor,),
                      BaseDetailData(showDivider: false,detailsLabel: translate(context).post_time,detailsValue: "9:30 AM",prefixIcon: "assets/images/time_icon.svg"),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseDetailData(showDivider: false,detailsLabel: "Submit Date",detailsValue: "01/03/2022",prefixIcon: "assets/images/Vector (1).svg"),
                      Container(height: 20.0,width: 1, color: BaseColors.borderColor,),
                      BaseDetailData(showDivider: false,detailsLabel: "Submit Time",detailsValue: "9:30 AM",prefixIcon: "assets/images/time_icon.svg"),
                    ],
                  ),
                  const Divider(),
                  BaseDetailData(detailsLabel: "Due Date",detailsValue: "01/03/2022",prefixIcon: "assets/images/Vector (1).svg"),
                  BaseDetailData(detailsLabel: "Assigned Time",detailsValue: "9:30 AM",prefixIcon: "assets/images/time_icon.svg"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("food_allergy.doc",style: TextStyle(fontWeight: FontWeight.w700,color: BaseColors.primaryColor,fontSize: 15.sp)),
                    Row(mainAxisSize: MainAxisSize.min,children: [
                      BaseIcons().view(rightMargin: 2.5.w),
                      BaseIcons().download(leftMargin: 2.5.w),
                    ])
                  ],),
                  const Divider(),
                  Text("https://website.com",style: TextStyle(fontWeight: FontWeight.w700,color: BaseColors.primaryColor,fontSize: 15.sp)),
                  // const Divider(),
                  // SizedBox(height: 1.h),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: BaseButton(removeHorizontalPadding: true,rightMargin: 2.w,title: "stop post".toUpperCase(), onPressed: (){
                  //         Get.to(const SubmittedAssignmentView());
                  //       },btnType: mediumButton,isActive: false),
                  //     ),
                  //     Expanded(
                  //       child: BaseButton(removeHorizontalPadding: true,leftMargin: 2.w,title: "Post".toUpperCase(), onPressed: (){
                  //         Get.to(const SubmittedAssignmentView());
                  //       },btnType: mediumButton,),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}