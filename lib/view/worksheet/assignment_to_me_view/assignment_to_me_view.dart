import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/view/worksheet/assignment_to_me_view/survey_view/awareness_courses_view.dart';
import 'package:staff_app/view/worksheet/assignment_to_me_view/survey_view/survey_view.dart';
import 'package:staff_app/view/worksheet/worksheet_ctrl.dart';
import '../../../language_classes/language_constants.dart';
import '../../assignments_screen/assignment_to_me_view/assesment_view/assesment_view.dart';

class AssignedToMeView extends StatefulWidget {
  const AssignedToMeView({Key? key}) : super(key: key);

  @override
  State<AssignedToMeView> createState() => _AssignedToMeViewState();
}

class _AssignedToMeViewState extends State<AssignedToMeView> with TickerProviderStateMixin{

  WorkSheetCtrl ctrl = Get.find<WorkSheetCtrl>();
  TabController? tabCtrl;
  @override
  void initState() {
    tabCtrl = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
