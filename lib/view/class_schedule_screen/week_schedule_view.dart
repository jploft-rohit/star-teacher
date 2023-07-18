import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/view/class_schedule_screen/controller/class_schedule_screen_ctrl.dart';
import 'package:staff_app/view/today_schedule_module/controller/today_schedule_controller.dart';

class WeekScheduleView extends StatefulWidget {
  const WeekScheduleView({super.key});

  @override
  State<WeekScheduleView> createState() => _WeekScheduleViewState();
}

class _WeekScheduleViewState extends State<WeekScheduleView> {
  TodayScheduleController controller = Get.put(TodayScheduleController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(()=>Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 20.0,
                  child: PageView.builder(
                    itemCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(calenderDateSvg),
                          SizedBox(
                            width: 2.w,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '${translate(context).from} : ',
                              style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),
                              children: <TextSpan>[
                                TextSpan(text: "05/06/2023", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          SvgPicture.asset(calenderDateSvg),
                          SizedBox(
                            width: 2.w,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '${translate(context).to} : ',
                              style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),
                              children: <TextSpan>[
                                TextSpan(text: "09/06/2023", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp)),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: IconButton(
                    onPressed: (){},
                    visualDensity: VisualDensity(horizontal: -4,vertical: -4),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(maxHeight: 10),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 18.sp,
                      color: BaseColors.primaryColor,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: IconButton(
                    onPressed: (){},
                    visualDensity: VisualDensity(horizontal: -4,vertical: -4),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(maxHeight: 10),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: BaseColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 7.h),
            timetable(),
          ],
        ),
      ),
    );
  }
  timetable() {
    return (controller.weekList?.length??0) == 0
        ? BaseNoData()
        : RotatedBox(
          quarterTurns: 1,
          child: Container(
      width: 480,
      height: double.maxFinite,
      child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10),
                width: 40,
                child: Table(
                  border: TableBorder.all(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  children: controller.times.map((e) => TableRow(
                      children: [
                        SizedBox(
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              addText(
                                e['day'],
                                12,
                                BaseColors.primaryColor,
                                FontWeight.bold,
                              ),
                              addText(
                                e['date'],
                                6,
                                BaseColors.primaryColor,
                                FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                      .toList(),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffEAEAEA),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Table(
                    border: TableBorder.all(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    children: [
                      ...List.generate(1, (myindex) => TableRow(
                          decoration: BoxDecoration(
                            color: BaseColors.primaryColorLight,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          children: List.generate(
                            controller.calenderTimeTable.length,
                                (index) => Container(
                              padding: EdgeInsetsDirectional.all(8),
                              height: 40,
                              child: Column(
                                children: [
                                  Text(
                                    controller.calenderTimeTable[index].starTime ??
                                        'N/A',
                                    style: TextStyle(
                                      color: controller.headerList[index]['firstColor'],
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    controller.calenderTimeTable[index].endTime ?? 'N/A',
                                    style: TextStyle(
                                      color: controller.headerList[index]['secondColor'],
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ...List.generate(5, (myindex) => TableRow(
                          children: List.generate(
                            controller.calenderTimeTable.length,
                                (index) => Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 8, vertical: 15),
                              height: 40,
                              child: Center(
                                child: Text(
                                  myindex == 0
                                      ? controller.calenderTimeTable[index]
                                      .daySubject?.monday ??
                                      'N/A'
                                      : myindex == 1
                                      ? controller.calenderTimeTable[index]
                                      .daySubject?.tuesday ??
                                      'N/A'
                                      : myindex == 2
                                      ? controller
                                      .calenderTimeTable[index]
                                      .daySubject
                                      ?.wednesday ??
                                      'N/A'
                                      : myindex == 3
                                      ? controller.calenderTimeTable[
                                  index]
                                      .daySubject
                                      ?.thursday ??
                                      'N/A'
                                      : myindex == 4
                                      ? controller.calenderTimeTable[
                                  index]
                                      .daySubject
                                      ?.friday ??
                                      'N/A'
                                      : 'N/A',
                                  style: TextStyle(
                                    color: Color(0xff7C7C7C),
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
    ),
        );
  }
}
