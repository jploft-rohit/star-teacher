import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/complaints_report_screen/controller/complaint_report_controller.dart';
import 'package:staff_app/view/complaints_report_screen/view/all_complaints_view.dart';
import 'package:staff_app/view/complaints_report_screen/view/complaints_view.dart';
import 'package:staff_app/view/complaints_report_screen/view/raise_complaint_report_screen.dart';
import 'package:staff_app/view/complaints_report_screen/view/report_view.dart';

class ComplaintsReportScreen extends StatefulWidget {
  const ComplaintsReportScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintsReportScreen> createState() => _ComplaintsReportScreenState();
}

class _ComplaintsReportScreenState extends State<ComplaintsReportScreen> with TickerProviderStateMixin{
  ComplainReportController controller = Get.put(ComplainReportController());
  TabController? tabCtrl;

  @override
  void initState() {
    tabCtrl = TabController(length: 3, vsync: this)..addListener(() {
      controller.getData(type: (tabCtrl?.index??0) == 0 ? "" : (tabCtrl?.index??0) == 1 ? "complaint" : "report");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).complaints_reports),
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {Get.to(const RaiseComplaintReportScreen());},
        title: translate(context).complain_or_report,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
          CustomDropDown(
          initialValue: DummyLists.initialSchool,
          hintText: "Select School",
          listData:DummyLists.schoolData,
          onChange: (value) {
            setState(() {
              DummyLists.initialSchool=value;
            });
          },
          topPadding: 5,
          bottomPadding: 5,
          icon: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25,),
        ),
            SizedBox(
              height: 1.h,
            ),
            buildTabBar(),
            SizedBox(
              height: 1.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabCtrl,
                children: const [
                  AllComplaintsView(),
                  ComplaintsView(),
                  ReportView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return BaseTabBar(
      controller: tabCtrl,
      tabs:  [
        Tab(
          text: translate(context).all,
        ),
        Tab(
          text: translate(context).complaints,
        ),
        Tab(
          text: translate(context).reports,
        ),
      ],
    );
  }
}
