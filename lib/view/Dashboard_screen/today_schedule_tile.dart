import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/star_attendance_screen/star_attendance_screen.dart';
import 'package:staff_app/view/star_evaluation_screen/star_view.dart';

import '../../utility/base_utility.dart';
import '../../utility/images_icon_path.dart';

class TodayScheduleTile extends StatefulWidget {
  final int index;
  const TodayScheduleTile({super.key, required this.index});

  @override
  State<TodayScheduleTile> createState() => _TodayScheduleTileState();
}

class _TodayScheduleTileState extends State<TodayScheduleTile> {

  DashboardScreenCtrl controller = Get.find<DashboardScreenCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          GestureDetector(
            onTap: (){
              Get.to(const StarAttendanceScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          spreadRadius: 0.0,
                          blurRadius: 5.0
                      )
                    ],
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: BaseColors.primaryColor
                    )
                ),
                padding: const EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0, bottom: 5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${widget.index+2}nd Slot (Hold)", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 16.sp),),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text("Start in", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: BaseColors.backgroundColor,
                                borderRadius: BorderRadius.circular(2.0),
                                border: Border.all(
                                  color: BaseColors.primaryColor,
                                ),
                              ),
                              child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(":", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: BaseColors.backgroundColor,
                                borderRadius: BorderRadius.circular(2.0),
                                border: Border.all(
                                  color: BaseColors.primaryColor,
                                ),
                              ),
                              child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(classTakenSvg, height: 15.0,),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text("Classroom ${controller.todayScheduledList?[widget.index].section?.roomNo.toString()??""}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                                ],
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Container(
                                color: BaseColors.dividerColor,
                                height: 1.0,
                                width: getWidth(context) * 40 / 100,
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.person, color: BaseColors.primaryColor,size: 15.0,),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Expanded(child: Text("${controller.todayScheduledList?[widget.index].classes?.name??""} - ${controller.todayScheduledList?[widget.index].section?.name??""}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),)),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Container(
                                    height: 15.0,
                                    width: 1.0,
                                    color: BaseColors.dividerColor,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  SvgPicture.asset(watchSvg),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Expanded(child: Text(controller.todayScheduledList?[widget.index].subject?.name??"", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),)),
                                ],
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Container(
                                color: BaseColors.dividerColor,
                                height: 1.0,
                                width: getWidth(context) * 40 / 100,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text("Start time", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                            SizedBox(width: 2.w),
                            Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: BaseColors.backgroundColor,
                                borderRadius: BorderRadius.circular(2.0),
                                border: Border.all(
                                  color: BaseColors.primaryColor,
                                ),
                              ),
                              child: Text(getHours(controller.todayScheduledList?[widget.index].startTime.toString()??""), style:  Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(":", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: BaseColors.backgroundColor,
                                borderRadius: BorderRadius.circular(2.0),
                                border: Border.all(
                                  color: BaseColors.primaryColor,
                                ),
                              ),
                              child: Text(getMinutes(controller.todayScheduledList?[widget.index].startTime.toString()??""), style:  Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(classTakenSvg, height: 15.0,),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(controller.todayScheduledList?[widget.index].school?.name??"", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text("End time", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: BaseColors.backgroundColor,
                                borderRadius: BorderRadius.circular(2.0),
                                border: Border.all(
                                  color: BaseColors.primaryColor,
                                ),
                              ),
                              child: Text(getMinutes(controller.todayScheduledList?[widget.index].endTime.toString()??""), style:  Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(":", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: BaseColors.backgroundColor,
                                borderRadius: BorderRadius.circular(2.0),
                                border: Border.all(
                                  color: BaseColors.primaryColor,
                                ),
                              ),
                              child: Text(getMinutes(controller.todayScheduledList?[widget.index].endTime.toString()??""), style:  Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: -10,
            child: GestureDetector(
              onTap: (){
                Get.to(const StarView());
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      getBoxShadow()
                    ]
                ),
                child: SvgPicture.asset(starSvg, height: 18.sp,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
