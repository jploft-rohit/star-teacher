import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_ctrl.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/absent_screen_view.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/late_screen_view.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/on_time_view.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/persent_screen_view.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_view/transportation_late_view.dart';
import 'package:staff_app/view/attendance_screen/calender_view.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> with TickerProviderStateMixin {
  AttendanceScreenCtrl controller = Get.put(AttendanceScreenCtrl());

  @override
  void initState() {
    controller.tabCtrl = TabController(length: 3, vsync: this);
    controller.tabCtrl1 = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(context, translate(context).attendance, [
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
              // controller.isShowCalender.value = true;
              Get.to(const CalenderView());
            },
            backgroundColor: CustomColors.backgroundColor,
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: CustomColors.primaryColor
                ),
                borderRadius: BorderRadius.circular(50.0)
            ),
            child: SvgPicture.asset(calenderDateSvg, color: CustomColors.primaryColor,),
          ),
          Text(translate(context).view_on_calender, style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),)
        ],
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
            Row(
              children: [
                Obx(() => Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      controller.selectedIndex.value = 0;
                    },
                    child: Container(
                      height: 40.0,
                      width: getWidth(context) * 50 / 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                          border: Border.all(
                              color: controller.selectedIndex.value == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                          ),
                          boxShadow: [
                            if(controller.selectedIndex.value == 0)
                              const BoxShadow(
                                  color: CustomColors.darkShadowColor,
                                  spreadRadius: 1.0,
                                  blurRadius: 2.0,
                                  offset: Offset(0, 3)
                              )
                          ],
                          borderRadius: BorderRadius.circular(15.sp)
                      ),
                      child: Text(translate(context).classroom, style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                    ),
                  ),
                )),
                SizedBox(
                  width: 2.w,
                ),
                Obx(() => Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      controller.selectedIndex.value = 1;
                    },
                    child: Container(
                      height: 40.0,
                      width: getWidth(context) * 50 / 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                          border: Border.all(
                              color: controller.selectedIndex.value == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                          ),
                          boxShadow: [
                            if(controller.selectedIndex.value == 1)
                              const BoxShadow(
                                  color: CustomColors.darkShadowColor,
                                  spreadRadius: 1.0,
                                  blurRadius: 2.0,
                                  offset: Offset(0, 3)
                              )
                          ],
                          borderRadius: BorderRadius.circular(15.sp)
                      ),
                      child: Text(translate(context).online, style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                    ),
                  ),
                )),
                SizedBox(
                  width: 2.w,
                ),
                Obx(() => Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      controller.selectedIndex.value = 2;
                    },
                    child: Container(
                      height: 40.0,
                      width: getWidth(context) * 50 / 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: controller.selectedIndex.value == 2 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                          border: Border.all(
                              color: controller.selectedIndex.value == 2 ? Colors.transparent : CustomColors.txtFiledBorderColor
                          ),
                          boxShadow: [
                            if(controller.selectedIndex.value == 2)
                              const BoxShadow(
                                  color: CustomColors.darkShadowColor,
                                  spreadRadius: 1.0,
                                  blurRadius: 2.0,
                                  offset: Offset(0, 3)
                              )
                          ],
                          borderRadius: BorderRadius.circular(15.sp)
                      ),
                      child: Text(translate(context).transportation, style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 2 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                    ),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 20.0,
                  child: PageView.builder(
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Center(child: Text("Monday, 22/05/2022", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 16.sp),));
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
                      color: CustomColors.primaryColor,
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
                      color: CustomColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Obx(() {
              return controller.selectedIndex.value ==0 || controller.selectedIndex.value == 1 ? Expanded(
                child: Column(
                  children: [
                    buildTabBar(),
                    SizedBox(
                      height: 2.h,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: controller.tabCtrl,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          AttendancePresentView(),
                          AttendanceAbsentView(),
                          AttendanceLateView()
                        ],
                      ),
                    )
                  ],
                ),
              ) : Expanded(child: Column(
                children: [
                  buildTransportationTabBar(),
                  SizedBox(
                    height: 2.h,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabCtrl1,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        OnTimeView(),
                        TransportationLateView(),
                      ],
                    ),
                  )
                ],
              ));
            }),
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return Container(
      height: 40,
      width: Get.width,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: TabBar(
        controller: controller.tabCtrl,
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
    );
  }
  Widget buildTransportationTabBar() {
    return Container(
      height: 40,
      width: Get.width,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: TabBar(
        controller: controller.tabCtrl1,
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
          Tab(
            text: translate(context).on_time,
          ),
          Tab(
            text: translate(context).late,
          ),
        ],
      ),
    );
  }
}
