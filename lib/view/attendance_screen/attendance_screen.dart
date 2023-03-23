import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_floating_action_button.dart';
import 'package:staff_app/Utility/base_tab_bar.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_ctrl.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/absent_screen_view.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/late_screen_view.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/on_time_view.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/persent_screen_view.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/transportation_late_view.dart';
import 'package:staff_app/view/attendance_screen/calender_view.dart';
import 'package:staff_app/view/attendance_screen/tab_views/classroom_view.dart';
import 'package:staff_app/view/attendance_screen/tab_views/online_view.dart';
import 'package:staff_app/view/attendance_screen/tab_views/transportation_view.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> with TickerProviderStateMixin {
  AttendanceScreenCtrl controller = Get.put(AttendanceScreenCtrl());
  late TabController tabController,tabController2;
  
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      controller.selectedIndex.value = tabController.index;
      setState(() {});
    });
    tabController2 = TabController(length: 3, vsync: this)..addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).attendance),
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {Get.to(const CalenderView());},
        title: translate(context).view_on_calender,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: CustomColors.borderColor
                  )
              ),
              child: ListTile(
                visualDensity: const VisualDensity(horizontal: -4),
                contentPadding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 15.sp, bottom: 15.sp),
                leading: Container(
                  height: double.infinity,
                  padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: CustomColors.primaryColor
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: SvgPicture.asset(manSvg),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nawaj Alam", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text("#12344534", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text("English Teacher", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                  ],
                ),
                trailing: SvgPicture.asset(qrCodeSvg),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            BaseToggleTabBar(controller: tabController, tabs: [
              BaseTabButton(title: translate(context).classroom, isSelected: tabController.index == 0),
              BaseTabButton(title: translate(context).online, isSelected: tabController.index == 1),
              BaseTabButton(title: translate(context).transportation, isSelected: tabController.index == 2)
            ]),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ClassRoomTab(),
                  OnlineTab(),
                  TransportationTab()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    tabController.dispose();
    tabController2.dispose();
    super.dispose();
  }
  Widget buildTabBar() {
    return BaseTabBar(
      controller: tabController2,
      tabs:  [
        Tab(
          text: translate(context).present,
        ),
        Tab(
          text: translate(context).absent,
        ),
        Tab(
          text: translate(context).late,
        ),
      ],
    );
  }
  Widget buildTransportationTabBar() {
    return BaseTabBar(
      controller: tabController2,
      tabs:  [
        Tab(
          text: translate(context).on_time,
        ),
        Tab(
          text: translate(context).late,
        ),
      ],
    );
  }
}
