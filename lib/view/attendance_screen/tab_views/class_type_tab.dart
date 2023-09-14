import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_ctrl.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/absent_screen_view.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/late_screen_view.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/persent_screen_view.dart';
import 'package:staff_app/view/attendance_screen/teacher_attendance_tile.dart';

class ClassTypeTab extends StatefulWidget {
  const ClassTypeTab({Key? key}) : super(key: key);

  @override
  State<ClassTypeTab> createState() => _ClassTypeTabState();
}

class _ClassTypeTabState extends State<ClassTypeTab> with SingleTickerProviderStateMixin{
  late TabController tabController;
  AttendanceScreenController controller = Get.find<AttendanceScreenController>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      if (!(tabController.indexIsChanging)) {
        controller.secondaryTabIndex.value = tabController.index;
        setState(() {});
        controller.getData();
      }
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
        Obx(()=>Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(child: const Padding(
                padding: EdgeInsets.only(right: 20,top: 6,bottom: 6,left: 6),
                child: Icon(Icons.arrow_back_ios,color: BaseColors.primaryColor,size: 22,),
              ),onTap: (){
                controller.goToPreviousDate();
              }),
              addText(convertDateFormat7(controller.selectedDate.value.toLocal().toString()), 16, Colors.black, FontWeight.w700),
              GestureDetector(child: const Padding(
                padding: EdgeInsets.only(right: 6,top: 6,bottom: 6,left: 20),
                child: Icon(Icons.arrow_forward_ios,color: BaseColors.primaryColor,size: 22,),
              ),onTap: (){
                controller.goToNextDate();
              }),
            ],
          )),
        SizedBox(height: 2.h),
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
              TeacherAttendanceTile(),
              TeacherAttendanceTile(),
              TeacherAttendanceTile(),
            ],
          ),
        )
      ],
    );
  }
}
