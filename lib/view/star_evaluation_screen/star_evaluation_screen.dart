import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_student_filter.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_evaluation_screen/assesment_view.dart';
import 'package:staff_app/view/star_evaluation_screen/behavior_view.dart';
import 'package:staff_app/view/star_evaluation_screen/teacher_view.dart';

class StarEvaluationScreen extends StatefulWidget {
  const StarEvaluationScreen({Key? key}) : super(key: key);

  @override
  State<StarEvaluationScreen> createState() => _StarEvaluationScreenState();
}

class _StarEvaluationScreenState extends State<StarEvaluationScreen> with TickerProviderStateMixin {
  TextEditingController searchCtrl = TextEditingController();
  TabController? tabCtrl;

  @override
  void initState() {
    tabCtrl = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).star_evaluation),
      body: Padding(
        padding: EdgeInsets.all(scaffoldPadding),
        child: Column(
          children: [
            BaseStudentFilter(),
            BaseTabBar(
              controller: tabCtrl,
              bottomMargin: 2.h,
              tabs:  [
                Tab(text: translate(context).behaviour),
                Tab(text: translate(context).assessment),
                // Tab(text: translate(context).teacher),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabCtrl,
                children: const [
                  BehaviourView(),
                  AssesmentView(),
                  // TeacherView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
