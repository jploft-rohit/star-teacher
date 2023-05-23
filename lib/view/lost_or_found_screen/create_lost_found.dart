import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/lost_or_found_screen/controller/lost_found_controller.dart';
import 'package:staff_app/view/lost_or_found_screen/report_lost_found_screen.dart';
import 'package:staff_app/view/lost_or_found_screen/tabs/lost_found_tab.dart';

class LostAndFoundScreen extends StatefulWidget {
  const LostAndFoundScreen({Key? key}) : super(key: key);

  @override
  State<LostAndFoundScreen> createState() => _LostAndFoundScreenState();
}

class _LostAndFoundScreenState extends State<LostAndFoundScreen> with TickerProviderStateMixin {
  LostFoundController controller = Get.put(LostFoundController());
  late TabController tabController;

  @override
  void initState() {
    controller.getData(type: "found");
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      controller.selectedTabIndex.value = tabController.index;
      controller.getData(type: tabController.index == 0 ? "found" : "request");
      if (mounted) {
        setState(() {});
      }
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
          onTap: () {
            Get.to(CreateLostFound(type: tabController.index == 1 ? 'Lost' : 'Found'));
          },
          title: tabController.index == 1
              ? 'Report Lost\nItem'
              : "Report Found\nItem",
        ),
        body: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            children: [
              BaseToggleTabBar(
                controller: tabController,
                bottomMargin: 2.h,
                tabs: [
                  BaseTabButton(
                      title: 'Found',
                      isSelected: tabController.index == 0 ? true : false,type: toggleLargeButton),
                  BaseTabButton(
                      title: 'Request',
                      isSelected: tabController.index == 1 ? true : false,type: toggleLargeButton),
                ],
              ),
              CustomDropDown(
                initialValue: DummyLists.initialSchool,
                hintText: "Select School",
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
              SizedBox(height: 1.h,),
              Expanded(
                child: TabBarView(controller: tabController, children: [
                  LostFoundTab(),
                  LostFoundTab(),
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
