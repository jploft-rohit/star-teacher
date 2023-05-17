import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/custom_dropdown_widget.dart';
import 'package:staff_app/utility/dummy_lists.dart';
import 'package:staff_app/view/feedback_help_screen/add_feedback_view.dart';
import 'package:staff_app/view/feedback_help_screen/all_feedback_help_view.dart';
import 'package:staff_app/view/feedback_help_screen/controller/feedback_help_controller.dart';

import '../../utility/sizes.dart';


class FeedbackHelpScreen extends StatefulWidget {
  const FeedbackHelpScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackHelpScreen> createState() => _FeedbackHelpScreenState();
}

class _FeedbackHelpScreenState extends State<FeedbackHelpScreen> with TickerProviderStateMixin{
  FeedbackHelpController controller = Get.put(FeedbackHelpController());
  TabController? tabCtrl;

  @override
  void initState() {
    tabCtrl = TabController(length: 3, vsync: this)..addListener(() {
      controller.getData(type: (tabCtrl?.index??0) == 0 ? "" : (tabCtrl?.index??0) == 1 ? "help" : "feedback");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).feedback_help),
      floatingActionButton: BaseFloatingActionButton(
        title: 'Feedback &\nHelp',
        onTap: () {
          Get.to(const AddFeedbackView());
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(scaffoldPadding),
        child: Column(
          children: [
            CustomDropDown(
              initialValue: DummyLists.initialSchool,
              hintText: DummyLists.initialSchool??"Select School",
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
                  AllFeedbackHelpView(),
                  AllFeedbackHelpView(),
                  AllFeedbackHelpView(),
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
          text: translate(context).help,
        ),
        Tab(
          text: translate(context).feedback,
        ),
      ],
    );
  }
}
