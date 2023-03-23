import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_tab_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
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
    return BaseTabBar(
      controller: tabCtrl,
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
    );
  }
}
