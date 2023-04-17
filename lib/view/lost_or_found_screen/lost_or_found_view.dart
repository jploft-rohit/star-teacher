import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_dropdown.dart';
import 'package:staff_app/Utility/base_floating_action_button.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/base_tab_bar.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/lost_or_found_screen/report_lost_found_screen.dart';
import 'package:staff_app/view/lost_or_found_screen/tabs/found_tab.dart';
import 'package:staff_app/view/lost_or_found_screen/tabs/lost_tab.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';

class LostAndFoundScreen extends StatefulWidget {
  const LostAndFoundScreen({Key? key}) : super(key: key);

  @override
  State<LostAndFoundScreen> createState() => _LostAndFoundScreenState();
}

class _LostAndFoundScreenState extends State<LostAndFoundScreen> with TickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: BaseAppBar(title: translate(context).lost_found),
        floatingActionButton: BaseFloatingActionButton(
          onTap: () {Get.to(ReportLostFoundScreen(type: tabController.index == 1 ?'Lost':'Found'));},
          title: tabController.index == 1 ? 'Report Lost\nItem' : "Report Found\nItem",
        ),
        body: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            children: [
              BaseToggleTabBar(
              controller: tabController,
              bottomMargin: 2.h,
              tabs:  [
                BaseTabButton(title: 'Found', isSelected: tabController.index == 0 ? true : false),
                BaseTabButton(title: 'Request', isSelected: tabController.index == 1 ? true : false),
                ],
              ),
              BaseDropDown(),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                  FoundTab(),
                  LostTab(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
