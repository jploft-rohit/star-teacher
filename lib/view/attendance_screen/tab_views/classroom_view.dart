import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/absent_screen_view.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/late_screen_view.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/persent_screen_view.dart';

class ClassRoomTab extends StatefulWidget {
  const ClassRoomTab({Key? key}) : super(key: key);

  @override
  State<ClassRoomTab> createState() => _ClassRoomTabState();
}

class _ClassRoomTabState extends State<ClassRoomTab> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      setState(() {});
    });
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 20.0,
              child: PageView.builder(
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Center(child: Text("Monday, 22/05/2022", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),));
                },
              ),
            ),
            Positioned(
              left: 0.0,
              child: IconButton(
                onPressed: (){},
                visualDensity: const VisualDensity(horizontal: -4,vertical: -4),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(maxHeight: 10),
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18.sp,
                  color: BaseColors.primaryColor,
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              child: IconButton(
                onPressed: (){},
                visualDensity: const VisualDensity(horizontal: -4,vertical: -4),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(maxHeight: 10),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 18.sp,
                  color: BaseColors.primaryColor,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        BaseTabBar(
          controller: tabController,
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
        ),
        SizedBox(height: 1.h),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              AttendancePresentView(),
              AttendanceAbsentView(),
              AttendanceLateView()
            ],
          ),
        )
      ],
    );
  }
}
