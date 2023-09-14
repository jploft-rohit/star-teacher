import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_ctrl.dart';
import 'package:staff_app/view/attendance_screen/calender_view.dart';
import 'package:staff_app/view/attendance_screen/tab_views/class_type_tab.dart';
import 'package:staff_app/view/attendance_screen/tab_views/transportation_view.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> with TickerProviderStateMixin {
  AttendanceScreenController controller = Get.put(AttendanceScreenController());
  late TabController tabController,tabController2;
  
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      if (!tabController.indexIsChanging) {
        controller.primaryTabIndex.value = tabController.index;
        controller.secondaryTabIndex.value = 0;
        setState((){});
        controller.getData();
      }
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
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).attendance),
      floatingActionButton: BaseFloatingActionButton(
        onTap: () { Get.to(const CalenderView());},
        title: translate(context).view_on_calendar,
        isCalendar: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: BaseColors.borderColor
                  )
              ),
              child: Obx(()=>ListTile(
                  visualDensity: const VisualDensity(horizontal: -4),
                  contentPadding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 15.sp, bottom: 15.sp),
                  leading: Container(
                    height: double.infinity,
                    width: 16.w,
                    padding: EdgeInsets.only(top: 8.sp, bottom: 8.sp, left: 8.sp, right: 8.sp),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: BaseColors.primaryColor
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: BaseImageNetwork(
                      link: controller.teacherData.value.profilePic??"",
                      borderRadius: 10,
                      errorWidget: SvgPicture.asset(manSvg),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(controller.teacherData.value.name??"N/A", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      const SizedBox(height: 2.0),
                      Text("#${controller.teacherData.value.emirateId??"N/A"}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Text(toBeginningOfSentenceCase(controller.teacherData.value.role?["name"]??"N/A")??"N/A", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                    ],
                  ),
                  trailing: GestureDetector(child: SvgPicture.asset(qrCodeSvg),onTap: (){
                    showScanQrDialogue(context, false);
                 },
                ),
               ),
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
            SizedBox(height: 2.h),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  ClassTypeTab(),
                  ClassTypeTab(),
                  TransportationTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
