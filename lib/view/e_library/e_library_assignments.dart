import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/view/e_library/controller/e_library_controller.dart';
import 'package:staff_app/view/e_library/create_e_library_assignment.dart';
import 'package:staff_app/view/e_library/e_library_list_tile.dart';

class ELibraryScreen extends StatefulWidget {
  final String? title;
  const ELibraryScreen({Key? key, this.title}) : super(key: key);

  @override
  State<ELibraryScreen> createState() => _ELibraryScreenState();
}

class _ELibraryScreenState extends State<ELibraryScreen> with SingleTickerProviderStateMixin{
  ELibraryController controller = Get.put(ELibraryController());
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    controller.screenType = widget.title??"";
    controller.getData();
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      if (!tabController.indexIsChanging) {
        controller.tabIndex.value = tabController.index;
        controller.getData();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          // floatingActionButton: BaseFloatingActionButton(title: 'Add New',onTap: (){
          //   Get.to(CreateELibraryAssignment(title: widget.title??""));
          // }),
          appBar: BaseAppBar(title: widget.title ?? "Awareness & Courses",
              bottomChild: BaseToggleTabBar(controller: tabController, tabs: [
                BaseTabButton(title: "Myself", isSelected: controller.tabIndex.value==0,type: toggleLargeButton),
                BaseTabButton(title: "Public", isSelected: controller.tabIndex.value==1,type: toggleLargeButton),
              ],rightMargin: scaffoldPadding,leftMargin: scaffoldPadding,bottomMargin: 1.h),bottomWidgetHeight: 8.h),
          body: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: TabBarView(
                controller: tabController,
                children: [
                  ELibraryListTile(title: widget.title??""),
                  ELibraryListTile(title: widget.title??""),
                ]),
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