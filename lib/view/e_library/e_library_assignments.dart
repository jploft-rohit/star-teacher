import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/e_library/controller/e_library_controller.dart';
import 'package:staff_app/view/e_library/create_e_library_assignment.dart';
import 'package:staff_app/view/e_library/e_library_list_tile.dart';
import 'package:staff_app/view/new_assignments/create_assignment.dart';

class ELibraryScreen extends StatefulWidget {
  const ELibraryScreen({Key? key}) : super(key: key);

  @override
  State<ELibraryScreen> createState() => _ELibraryScreenState();
}

class _ELibraryScreenState extends State<ELibraryScreen> with SingleTickerProviderStateMixin{
  ELibraryController controller = Get.put(ELibraryController());
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      controller.tabIndex.value = tabController.index;
      setState(() {});
    });
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: BaseFloatingActionButton(title: 'Add New',onTap: (){
            Get.to(CreateELibraryAssignment());
          }),
          appBar: BaseAppBar(title: translate(context).assignments,
            bottomChild: BaseToggleTabBar(controller: tabController, tabs: [
              BaseTabButton(title: "Myself", isSelected: tabController.index==0),
              BaseTabButton(title: "Public", isSelected: tabController.index==1),
            ],rightMargin: scaffoldPadding,leftMargin: scaffoldPadding),bottomWidgetHeight: 8.h),
          body: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: TabBarView(
                controller: tabController,
                children: [
                  ELibraryListTile(),
                  ELibraryListTile(),
                ]),
          ),
        )
    );
  }
}