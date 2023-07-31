import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_edit_delete.dart';
import 'package:staff_app/view/mcq_screen/controller/mcq_controller.dart';
import 'package:staff_app/view/mcq_screen/mcq_screen.dart';

class QuestionSummaryScreen extends StatefulWidget {
  final String totalMarks;
  const QuestionSummaryScreen({Key? key, required this.totalMarks}) : super(key: key);

  @override
  State<QuestionSummaryScreen> createState() => _QuestionSummaryScreenState();
}

class _QuestionSummaryScreenState extends State<QuestionSummaryScreen> {

  MCQController controller = Get.find<MCQController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Create Assignments"),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        margin: EdgeInsets.all(scaffoldPadding),
        child: Padding(
          padding: EdgeInsets.all(17.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BaseEditDelete(heading: "Assignment Detail",editTitle: "", deleteTitle: ""),
              Divider(),
              BaseDetailData(detailsLabel: "Assignment Number",detailsValue: controller.assignmentNumber.toString()),
              BaseDetailData(detailsLabel: "Total Number of Questions",detailsValue: controller.currentQuestionNumber.value.toString()),
              BaseDetailData(detailsLabel: "Assignment Type",detailsValue: controller.screenType),
              BaseDetailData(detailsLabel: "Term",detailsValue: controller.term),
              BaseDetailData(detailsLabel: "Subject",detailsValue: controller.subject),
              BaseDetailData(detailsLabel: "Total Marks",detailsValue: controller.totalMarks.toString()),
              Row(children: [
                // Expanded(child: BaseButton(title: "SAVE", onPressed: (){},rightMargin: 1.w)),
                Expanded(child: BaseButton(title: "POST", onPressed: (){
                  Get.back();
                },rightMargin: 1.w,leftMargin: 1.w)),
                Expanded(
                    child: BaseButton(
                        title: "REVIEW",
                        onPressed: (){
                          // Get.to(MCQScreen(title: "", id: id));
                          },
                        leftMargin: 1.w,
                    ),
                ),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
