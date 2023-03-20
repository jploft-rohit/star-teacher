import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/assignments_screen/assignment_screen_ctrl.dart';
import 'package:staff_app/view/assignments_screen/assignment_to_me_view/assesment_view/assesment_view.dart';
import 'package:staff_app/view/assignments_screen/assignment_to_me_view/survey_view/awareness_courses_view.dart';
import 'package:staff_app/view/assignments_screen/assignment_to_me_view/survey_view/survey_view.dart';
import 'package:staff_app/view/awareness_courses_screen/awareness_courses_screen.dart';

import '../../../language_classes/language_constants.dart';

class AssignedToMeView extends StatefulWidget {
  const AssignedToMeView({Key? key}) : super(key: key);

  @override
  State<AssignedToMeView> createState() => _AssignedToMeViewState();
}

class _AssignedToMeViewState extends State<AssignedToMeView> with TickerProviderStateMixin{

  AssignmentScreenCtrl ctrl = Get.find<AssignmentScreenCtrl>();
  TabController? tabCtrl;
  @override
  void initState() {
    tabCtrl = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          buildTabBar(),
          SizedBox(
            height: 1.h,
          ),
          Expanded(
            child: TabBarView(
              controller: tabCtrl,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                AssesmentView(),
                AwarenesCoursesView(),
                AssesmentView(),
                SurveyView()
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buildTabBar() {
    return Container(
      height: 35,
      width: 100.w,
      decoration: BoxDecoration(
          color: CustomColors.white,
          boxShadow: [getBoxShadow()],
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: TabBar(
        controller: tabCtrl,
        isScrollable: true,
        onTap: (index){
          ctrl.tabIndex.value = index;
        },
        padding: const EdgeInsets.all(2),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]
        ),
        labelColor: CustomColors.primaryColor,
        labelStyle: Style.montserratRegularStyle().copyWith(fontSize: 11),
        unselectedLabelColor: Colors.black,
        tabs:  [
          Tab(
            text: translate(context).worksheet,
          ),
          Tab(
            text: translate(context).awareness_courses,
          ),
          Tab(
            text: translate(context).assessment,
          ),
          Tab(
            text: translate(context).survey,
          ),
        ],
      ),
    );
  }
}
