import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/utility.dart';
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
      appBar: appBarWithAction(context, "Feedback & Help", [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: (){
              showGeneralDialog(
                context: context,
                pageBuilder:  (context, animation, secondaryAnimation) {
                  return tabCtrl?.index == 2 ? const AddFeedbackView() : const AddHelpView();
                },
              );
            },
            backgroundColor: CustomColors.backgroundColor,
            shape: RoundedRectangleBorder(
                side: const BorderSide(
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
          Text("Feedback &\nHelp", style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),textAlign: TextAlign.center,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const AllFeedbackHelpView(),
                  const HelpView(),
                  const FeedbackView(),
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
        labelPadding: const EdgeInsets.only(left: 10, right: 10),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]
        ),
        labelColor: CustomColors.primaryColor,
        unselectedLabelColor: Colors.black,
        tabs:  [
          const Tab(
            text: 'All',
          ),
          const Tab(
            text: 'Help',
          ),
          const Tab(
            text: 'Feedback',
          ),
        ],
      ),
    );
  }
}
