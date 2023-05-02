import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/view/class_schedule_screen/class_schedule_screen_ctrl.dart';

class WeekScheduleView extends StatefulWidget {
  const WeekScheduleView({super.key});

  @override
  State<WeekScheduleView> createState() => _WeekScheduleViewState();
}

class _WeekScheduleViewState extends State<WeekScheduleView> {
  ClassScheduleScreenCtrl controller = Get.put(ClassScheduleScreenCtrl());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          RotationTransition(
            turns: AlwaysStoppedAnimation(90 / 360),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          // color: CustomColors.backgroundColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1),
                          },
                          children: [
                            TableRow(children: [addText('', 12, BaseColors.primaryColor, FontWeight.w400),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(1),
                          },
                          children: [
                            TableRow(children: [
                              Container(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: controller.weekList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Container(
                                    margin: EdgeInsets.symmetric(vertical: 1.4.h),
                                    child: Center(
                                      child: addText(
                                          controller.weekList[index],
                                          13.sp,
                                          BaseColors.primaryColor,
                                          FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 1.w),
                Expanded(
                  flex: 9,
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      border: Border.all(color: BaseColors.borderColor),
                      borderRadius: BorderRadius.circular(6),
                      color: BaseColors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: BaseColors.backgroundColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(1),
                              4: FlexColumnWidth(1),
                              5: FlexColumnWidth(1),
                              6: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(children: [
                                Center(
                                  child: addText(controller.timeList[0], 12,
                                      BaseColors.primaryColor, FontWeight.w400),
                                ),
                                Center(
                                  child: addText(controller.timeList[1], 12,
                                      BaseColors.primaryColor, FontWeight.w400),
                                ),
                                Center(
                                  child: addText(controller.timeList[2], 12,
                                      BaseColors.primaryColor, FontWeight.w400),
                                ),
                                Center(
                                  child: addText(controller.timeList[2], 12,
                                      BaseColors.primaryColor, FontWeight.w400),
                                ),
                                Center(
                                  child: addText(controller.timeList[3], 12,
                                      BaseColors.primaryColor, FontWeight.w400),
                                ),
                                Center(
                                  child: addText(controller.timeList[4], 12,
                                      BaseColors.primaryColor, FontWeight.w400),
                                ),
                                Center(
                                  child: addText(controller.timeList[5], 12,
                                      BaseColors.primaryColor, FontWeight.w400),
                                ),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(1),
                              4: FlexColumnWidth(1),
                              5: FlexColumnWidth(1),
                              6: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: BaseColors.txtFieldTextColor,
                                  ),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: controller.monList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Container(
                                      margin: EdgeInsets.symmetric(vertical: 1.4.h),
                                      child: Center(
                                        child: addText(
                                            controller.monList[index],
                                            13.sp,
                                            Color(0xFF7C7C7C),
                                            FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: BaseColors.white,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: controller.tueList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Container(
                                      padding: EdgeInsets.symmetric(vertical: 1.4.h),
                                      child: Center(
                                        child: addText(
                                            controller.tueList[index],
                                            13.sp,
                                            Color(0xFF7C7C7C),
                                            FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: BaseColors.txtFieldTextColor,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: controller.wedList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Container(
                                      margin: EdgeInsets.symmetric(vertical: 1.4.h),
                                      child: Center(
                                        child: addText(
                                            controller.wedList[index],
                                            13.sp,
                                            Color(0xFF7C7C7C),
                                            FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: BaseColors.white,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: controller.thuList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Container(
                                      margin: EdgeInsets.symmetric(vertical: 1.4.h),
                                      child: Center(
                                        child: addText(
                                            controller.thuList[index],
                                            13.sp,
                                            Color(0xFF7C7C7C),
                                            FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: BaseColors.txtFieldTextColor,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: controller.friList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Container(
                                      margin: EdgeInsets.symmetric(vertical: 1.4.h),
                                      child: Center(
                                        child: addText(
                                            controller.friList[index],
                                            13.sp,
                                            Color(0xFF7C7C7C),
                                            FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: BaseColors.white,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: controller.satList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Container(
                                      margin: EdgeInsets.symmetric(vertical: 1.4.h),
                                      child: Center(
                                        child: addText(
                                            controller.satList[index],
                                            13.sp,
                                            Color(0xFF7C7C7C),
                                            FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: BaseColors.txtFieldTextColor,
                                  ),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: controller.tueList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Container(
                                      margin: EdgeInsets.symmetric(vertical: 1.4.h),
                                      child: Center(
                                        child: addText(
                                            '-',
                                            13.sp,
                                            Color(0xFF7C7C7C),
                                            FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
