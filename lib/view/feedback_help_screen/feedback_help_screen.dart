import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_dropdown.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/view/feedback_help_screen/add_feedback_view.dart';
import 'package:staff_app/view/feedback_help_screen/add_help_view.dart';
import 'package:staff_app/view/feedback_help_screen/all_feedback_help_view.dart';
import 'package:staff_app/view/feedback_help_screen/feedback_view.dart';
import 'package:staff_app/view/feedback_help_screen/help_view.dart';

class FeedbackHelpScreen extends StatefulWidget {
  const FeedbackHelpScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackHelpScreen> createState() => _FeedbackHelpScreenState();
}

class _FeedbackHelpScreenState extends State<FeedbackHelpScreen> with TickerProviderStateMixin{
  TabController? tabCtrl;

  @override
  void initState() {
    tabCtrl = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Feedback & Help"),
      floatingActionButton: BaseFloatingActionButton(
        title: 'Feedback &\nHelp',
        onTap: () {
          showGeneralDialog(
            context: context,
            pageBuilder:  (context, animation, secondaryAnimation) {
              return tabCtrl?.index == 2 ? const AddFeedbackView() : const AddHelpView();
            },
          );
        },

      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            BaseDropDown(),
            BaseTabBar(
              controller: tabCtrl,
              tabs:  const [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Help',
                ),
                Tab(
                  text: 'Feedback',
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabCtrl,
                children: const [
                  AllFeedbackHelpView(),
                  HelpView(),
                  FeedbackView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
