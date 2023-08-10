import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
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
            SizedBox(
              height: 20,
              child: PageView.builder(
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.getPreviousWeekMondayDate();
                          setState(() {});
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 18.sp,
                              color: BaseColors.primaryColor,
                            ),
                            SvgPicture.asset(calenderDateSvg),
                            SizedBox(width: 2.w),
                            RichText(
                              text: TextSpan(
                                text: '${translate(context).from} : ',
                                style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),
                                children: <TextSpan>[
                                  TextSpan(text: formatFlutterDateTime(flutterDateTime: controller.fromDate.value, getDayFirst: true), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w),
                      SvgPicture.asset(calenderDateSvg),
                      SizedBox(width: 2.w),
                      GestureDetector(
                        onTap: (){
                          controller.getNextWeekMondayDate();
                          setState(() {});
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: '${translate(context).to} : ',
                                style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),
                                children: <TextSpan>[
                                  TextSpan(text: formatFlutterDateTime(flutterDateTime: controller.endDate.value, getDayFirst: true), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp)),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18.sp,
                              color: BaseColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
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
        ? BaseNoData(topMargin: 23.h)
        : GestureDetector(
        onTap: (){
        int count = 1;
        showDialog(
          context: context,
          builder: (ctx) {
            return StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) setState) {
                return AlertDialog(
                  contentPadding: EdgeInsets.only(top: 8,bottom: 10,right: 12,left: 12),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Topic of Discussion",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                              GestureDetector(onTap: (){
                                BaseOverlays().dismissOverlay();
                              },child: Icon(Icons.close_rounded,color: Colors.black,size: 30,))
                            ]),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(child: Text("Electrostatic")),
                            Icon(Icons.edit,color: BaseColors.primaryColor,size: 20),
                            SizedBox(width: 15)
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(child: Text("Magnetism")),
                            Icon(Icons.edit,color: BaseColors.primaryColor,size: 20),
                            SizedBox(width: 15)
                          ],
                        ),
                        SizedBox(height: 20),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 10.h,
                            maxHeight: 35.h
                          ),
                          child: ListView.builder(
                              itemCount: count,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context,index){
                                TextEditingController topicController = TextEditingController();
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: BaseTextFormField(
                                        controller: topicController,
                                        hintText: "Topic",
                                        validator: (val){
                                          if ((val??"").isEmpty) {
                                            return "Please Enter Topic";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            boxShadow: kElevationToShadow[3],
                                            color: BaseColors.backgroundColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(color: BaseColors.primaryColor)),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: GestureDetector(
                                            onTap: () {
                                              if (count < 4) {
                                                setState(() {
                                                  count = count+1;
                                                });
                                              }
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: BaseColors.primaryColor,
                                              size: 5.0.h,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        Align(child: BaseButton(title: "ADD", onPressed: () {
                          Get.back();
                        },btnType: mediumButton,))
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
          child: RotatedBox(
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
          ),
        );
  }
}
