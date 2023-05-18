import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/class_type_screen.dart';
import 'package:staff_app/view/star_attendance_screen/controller/star_attendance_screen_ctrl.dart';

class StarAttendanceScreen extends StatefulWidget {
  const StarAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<StarAttendanceScreen> createState() => _StarAttendanceScreenState();
}

class _StarAttendanceScreenState extends State<StarAttendanceScreen> with SingleTickerProviderStateMixin{
  StarAttendanceScreenCtrl controller = Get.put(StarAttendanceScreenCtrl());

  late TabController tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.selectedAttendanceTabIndex.value = 0;
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      controller.selectedAttendanceTabIndex.value = 0;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        controller.selectedClassType.value = tabController.index;
        await controller.getStarsAttendanceList(selectedClassIndex: controller.selectedClassType.value, selectedAttendanceIndex: controller.selectedAttendanceTabIndex.value);
        if (mounted) {
          setState(() {});
        }
      });
    });
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: BaseAppBar(
          title: translate(context).stars_attendance,
          bottomChild: BaseToggleTabBar(controller: tabController, tabs: [
            BaseTabButton(title: translate(context).classroom, isSelected: tabController.index == 0),
            BaseTabButton(title: translate(context).online, isSelected: tabController.index == 1),
            BaseTabButton(title: translate(context).hybrid, isSelected: tabController.index == 2),
          ],bottomMargin: 1.5.h),
          bottomWidgetHeight: 8.h,
        ),
        body: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: TabBarView(
            controller: tabController,
            children: [
              const ClassTypeScreen(),
              const ClassTypeScreen(),
              const ClassTypeScreen(),
          ]),
        ),
      ),
    );
  }
}
