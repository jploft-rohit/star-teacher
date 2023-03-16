import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_ctrl.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({Key? key}) : super(key: key);

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  AttendanceScreenCtrl controller = Get.find<AttendanceScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    final calendarCarouselNoHeader = CalendarCarousel<Event>(
      onDayPressed: (date, events) {},
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,

      weekendTextStyle: TextStyle(
          color: CustomColors.primaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 16),
      daysTextStyle: TextStyle(
          color: CustomColors.textBlackColor,
          fontWeight: FontWeight.normal,
          fontSize: 16),
      // thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      markedDatesMap: controller.markedDateMap,
      height: 45.h,

      selectedDayButtonColor: Colors.transparent,
      selectedDayBorderColor: Colors.transparent,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),

      leftButtonIcon: Icon(
        Icons.arrow_back_ios,
        color: CustomColors.primaryColor,
        size: 2.h,
      ),
      rightButtonIcon: Icon(
        Icons.arrow_forward_ios,
        color: CustomColors.primaryColor,
        size: 2.h,
      ),
      // markedDateMoreCustomTextStyle: const TextStyle(color: CustomColors.white),
      // markedDateMoreCustomDecoration: const BoxDecoration(color: CustomColors.gretTextColor, shape: BoxShape.circle),
      // markedDateCustomShapeBorder: const CircleBorder(side: BorderSide(color: CustomColors.blue,strokeAlign: StrokeAlign.inside)),
      markedDateCustomTextStyle: const TextStyle(
          color: CustomColors.textBlackColor,
          fontWeight: FontWeight.normal,
          fontSize: 16),
      // markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      markedDateMoreShowTotal: true,
      showHeader: true,
      headerTextStyle: TextStyle(
          color: CustomColors.textBlackColor,
          fontWeight: FontWeight.bold,
          fontSize: 1.9.h),
      showHeaderButton: true,
      weekDayFormat: WeekdayFormat.narrow,
      todayTextStyle: TextStyle(
          color: CustomColors.textBlackColor,
          fontWeight: FontWeight.normal,
          fontSize: 16),
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.transparent,
      selectedDayTextStyle: TextStyle(
          color: CustomColors.textLightGreyColor,
          fontWeight: FontWeight.normal,
          fontSize: 16),
      minSelectedDate: DateTime.now().subtract(const Duration(days: 360)),
      maxSelectedDate: DateTime.now().add(const Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
          color: CustomColors.textLightGreyColor,
          fontWeight: FontWeight.normal,
          fontSize: 16),
      nextDaysTextStyle: TextStyle(
          color: CustomColors.textLightGreyColor,
          fontWeight: FontWeight.normal,
          fontSize: 16),
      weekdayTextStyle: TextStyle(
          color: CustomColors.primaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 16),
      inactiveDaysTextStyle: TextStyle(
          color: CustomColors.textLightGreyColor,
          fontWeight: FontWeight.normal,
          fontSize: 16),
      onCalendarChanged: (DateTime date) {},
      onDayLongPressed: (DateTime date) {
        Get.log('long pressed date $date');
      },
    );


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithAction(context, translate(context).calender, [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
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
                visualDensity: VisualDensity(horizontal: -4),
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
                    SizedBox(
                      height: 2.0,
                    ),
                    Text("#12344534", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                    SizedBox(
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
                      child: Text(translate(context).present, style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
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
                      child: Text(translate(context).absent, style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
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
                      child: Text(translate(context).late, style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 2 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                    ),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              decoration: BoxDecoration(
                  color: const Color(0xFF0F8F8F8),
                  borderRadius: BorderRadius.circular(10.0)),
              // child: _calendarCarouselNoHeader,
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      buildColors(CustomColors.textLightGreyColor, translate(context).absent),
                      SizedBox(
                        width: 6.w,
                      ),
                      buildColors(CustomColors.lightBlueColor, translate(context).late),
                      SizedBox(
                        width: 6.w,
                      ),
                      buildColors(CustomColors.primaryColor, translate(context).holiday),
                    ],
                  ),
                  calendarCarouselNoHeader
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
  Widget buildColors(Color color, String name) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(name, style: Style.montserratRegularStyle().copyWith(fontSize: 15.sp),)
      ],
    );
  }
}
