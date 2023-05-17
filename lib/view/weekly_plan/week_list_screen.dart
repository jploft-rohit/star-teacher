import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_edit_delete.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/weekly_plan/create_week_plan.dart';

import '../../utility/images_icon_path.dart';

class WeekListScreen extends StatefulWidget {
  const WeekListScreen({Key? key}) : super(key: key);

  @override
  State<WeekListScreen> createState() => _WeekListScreenState();
}

class _WeekListScreenState extends State<WeekListScreen> {

  List<String> weekNameList = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).weekly_plan),
      body: ListView.builder(
          itemCount: weekNameList.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 2.h, bottom: 5.h, right: scaffoldPadding, left: scaffoldPadding),
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(bottom: 2.h),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: baseContainerShadow(),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BaseEditDelete(heading: weekNameList[index],editTitle: "plan", deleteTitle: "plan",onEditProceed: (){
                    BaseOverlays().dismissOverlay();
                    Get.to(CreateWeekPlan(isUpdating: true));
                  },),
                  BaseDetailData(topMargin: 2.h,prefixIcon: icReport,detailsLabel: translate(context).school,detailsValue: "Ignite Public School"),
                  BaseDetailData(prefixIcon: "assets/images/Vector (1).svg", detailsLabel: "01/03/2022 - 07/03/2022"),
                  BaseDetailData(prefixIcon: icReport, detailsLabel: "Class", detailsValue: "5th"),
                  BaseDetailData(prefixIcon: icReport, detailsLabel: "Section", detailsValue: "Grade 5"),
                  BaseDetailData(prefixIcon: icReport, detailsLabel: "Topic of Discussion", detailsValue: "Electrostatics, Magnetic Field"),
                ],
              ),
            );
          },
      ),
    );
  }
}
