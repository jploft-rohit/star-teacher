import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_edit_delete.dart';

class QuestionSummaryScreen extends StatefulWidget {
  const QuestionSummaryScreen({Key? key}) : super(key: key);

  @override
  State<QuestionSummaryScreen> createState() => _QuestionSummaryScreenState();
}

class _QuestionSummaryScreenState extends State<QuestionSummaryScreen> {
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
              BaseDetailData(detailsLabel: "Assignment Number",detailsValue: "12"),
              BaseDetailData(detailsLabel: "Total Number of Questions",detailsValue: "12"),
              BaseDetailData(detailsLabel: "Assignment Type",detailsValue: "Assessment"),
              BaseDetailData(detailsLabel: "Term",detailsValue: "2"),
              BaseDetailData(detailsLabel: "Subject",detailsValue: "Arabic"),
              BaseDetailData(detailsLabel: "Total Marks",detailsValue: "160"),
              Row(children: [
                Expanded(child: BaseButton(title: "SAVE", onPressed: (){},rightMargin: 1.w)),
                Expanded(child: BaseButton(title: "POST", onPressed: (){},rightMargin: 1.w,leftMargin: 1.w,)),
                Expanded(child: BaseButton(title: "REVIEW", onPressed: (){},leftMargin: 1.w)),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
