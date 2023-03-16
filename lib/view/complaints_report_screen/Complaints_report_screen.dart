import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/complaints_report_screen/add_comment_popup.dart';
import 'package:staff_app/view/complaints_report_screen/all_complaints_view.dart';
import 'package:staff_app/view/complaints_report_screen/complaints_view.dart';
import 'package:staff_app/view/complaints_report_screen/raise_complaint_report_screen.dart';
import 'package:staff_app/view/complaints_report_screen/report_view.dart';

class ComplaintsReportScreen extends StatefulWidget {
  const ComplaintsReportScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintsReportScreen> createState() => _ComplaintsReportScreenState();
}

class _ComplaintsReportScreenState extends State<ComplaintsReportScreen> with TickerProviderStateMixin{
  TabController? tabCtrl;

  @override
  void initState() {
    tabCtrl = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(context, translate(context).complaints_reports, [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: (){
              Get.to(RaiseComplaintReportScreen());
            },
            backgroundColor: CustomColors.backgroundColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: CustomColors.primaryColor
                ),
                borderRadius: BorderRadius.circular(50.0)
            ),
            child: Icon(
              Icons.add,
              size: 25.sp,
              color: CustomColors.primaryColor,
            ),
          ),
          Text(translate(context).complain_or_report, style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),textAlign: TextAlign.center,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                color: CustomColors.backgroundColor,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: CustomColors.borderColor
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                  const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            buildTabBar(),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabCtrl,
                children: [
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
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: TabBar(
        controller: tabCtrl,
        isScrollable: false,
        padding: const EdgeInsets.all(4),
        labelPadding: EdgeInsets.only(left: 10, right: 10),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]
        ),
        labelColor: CustomColors.primaryColor,
        unselectedLabelColor: Colors.black,
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
      ),
    );
  }
}
