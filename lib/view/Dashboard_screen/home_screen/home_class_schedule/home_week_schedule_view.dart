import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/class_schedule_screen/class_schedule_screen_ctrl.dart';

class HomeWeekScheduleView extends StatefulWidget {
  const HomeWeekScheduleView({super.key});

  @override
  State<HomeWeekScheduleView> createState() => _HomeWeekScheduleViewState();
}

class _HomeWeekScheduleViewState extends State<HomeWeekScheduleView> {
  ClassScheduleScreenCtrl controller = Get.put(ClassScheduleScreenCtrl());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: BaseColors.borderColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoItems(translate(context).class_name, "H1"),
                      SizedBox(
                        height: 1.h,
                      ),
                      buildInfoItems(translate(context).grade, "G1"),
                      SizedBox(
                        height: 1.h,
                      ),
                      buildInfoItems(translate(context).class_type, "Offline"),
                      SizedBox(
                        height: 1.h,
                      ),
                      buildInfoItems(translate(context).classroom, "43"),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(translate(context).start_time, style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 14.sp),),
                          SizedBox(
                            width: 2.w,
                          ),
                          SvgPicture.asset("assets/images/time_icon.svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("09:00AM", style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 3.0),
                            child: Text(translate(context).end_time, style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 14.sp),),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SvgPicture.asset("assets/images/time_icon.svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("09:00AM", style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 3.0),
                            child: Text(translate(context).completed, style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 14.sp),),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SvgPicture.asset("assets/images/calender_chat.svg",width: 13),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("09:00AM", style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                        ],
                      ),
                      const SizedBox(height: 4),
                      SizedBox(height: 26,child: BaseButton(removeHorizontalPadding: true,
                        verticalPadding: 0,title: "Completed", onPressed: (){},btnType: mediumButton,textSize: 14.sp,))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    // return Column(
    //   children: [
    //     Stack(
    //       children: [
    //         SizedBox(
    //           height: 20.0,
    //           child: PageView.builder(
    //             itemCount: 3,
    //             physics: const NeverScrollableScrollPhysics(),
    //             scrollDirection: Axis.horizontal,
    //             itemBuilder: (context, index) {
    //               return Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   SvgPicture.asset(calenderDateSvg),
    //                   SizedBox(
    //                     width: 2.w,
    //                   ),
    //                   RichText(
    //                     text: TextSpan(
    //                       text: '${translate(context).from} : ',
    //                       style: Style.montserratRegularStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 16.sp),
    //                       children: <TextSpan>[
    //                         TextSpan(text: "05/06", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp)),
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     width: 5.w,
    //                   ),
    //                   SvgPicture.asset(calenderDateSvg),
    //                   SizedBox(
    //                     width: 2.w,
    //                   ),
    //                   RichText(
    //                     text: TextSpan(
    //                       text: '${translate(context).to} : ',
    //                       style: Style.montserratRegularStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 16.sp),
    //                       children: <TextSpan>[
    //                         TextSpan(text: "09/06", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp)),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               );
    //             },
    //           ),
    //         ),
    //         Align(
    //           alignment: AlignmentDirectional.centerStart,
    //           child: IconButton(
    //             onPressed: (){},
    //             visualDensity: const VisualDensity(horizontal: -4,vertical: -4),
    //             padding: EdgeInsets.zero,
    //             constraints: const BoxConstraints(maxHeight: 10),
    //             icon: Icon(
    //               Icons.arrow_back_ios,
    //               size: 18.sp,
    //               color: CustomColors.primaryColor,
    //             ),
    //           ),
    //         ),
    //         Align(
    //           alignment: AlignmentDirectional.centerEnd,
    //           child: IconButton(
    //             onPressed: (){},
    //             visualDensity: const VisualDensity(horizontal: -4,vertical: -4),
    //             padding: EdgeInsets.zero,
    //             constraints: const BoxConstraints(maxHeight: 10),
    //             icon: Icon(
    //               Icons.arrow_forward_ios,
    //               size: 18.sp,
    //               color: CustomColors.primaryColor,
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //     SizedBox(height: 1.h),
    //     Row(
    //       children: [
    //         Expanded(
    //           flex: 1,
    //           child: Column(
    //             children: [
    //               Container(
    //                 clipBehavior: Clip.antiAliasWithSaveLayer,
    //                 padding: const EdgeInsets.symmetric(vertical: 15),
    //                 decoration: BoxDecoration(
    //                   // color: CustomColors.backgroundColor,
    //                   borderRadius: BorderRadius.circular(6),
    //                 ),
    //                 child: Table(
    //                   columnWidths: const {
    //                     0: FlexColumnWidth(1),
    //                   },
    //                   children: [
    //                     TableRow(children: [
    //                       addText('', 12, CustomColors.primaryColor,
    //                           FontWeight.w400),
    //                     ]),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 decoration: const BoxDecoration(),
    //                 child: Table(
    //                   columnWidths: const {
    //                     0: FlexColumnWidth(1),
    //                   },
    //                   children: [
    //                     TableRow(children: [
    //                       Container(
    //                         child: ListView.builder(
    //                           padding: EdgeInsets.zero,
    //                           itemCount: controller.timeList.length,
    //                           shrinkWrap: true,
    //                           itemBuilder: (context, index) => Container(
    //                             margin: const EdgeInsets.symmetric(vertical: 8),
    //                             child: Center(
    //                               child: addText(
    //                                   controller.timeList[index],
    //                                   13.sp,
    //                                   CustomColors.primaryColor,
    //                                   FontWeight.w700),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ]),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         SizedBox(width: 1.w),
    //         Expanded(
    //           flex: 9,
    //           child: Container(
    //             clipBehavior: Clip.antiAliasWithSaveLayer,
    //             decoration: BoxDecoration(
    //               border: Border.all(color: CustomColors.borderColor),
    //               borderRadius: BorderRadius.circular(6),
    //               color: CustomColors.white,
    //             ),
    //             child: Column(
    //               children: [
    //                 Container(
    //                   clipBehavior: Clip.antiAliasWithSaveLayer,
    //                   padding: const EdgeInsets.symmetric(vertical: 15),
    //                   decoration: BoxDecoration(
    //                     color: CustomColors.backgroundColor,
    //                     borderRadius: BorderRadius.circular(6),
    //                   ),
    //                   child: Table(
    //                     columnWidths: const {
    //                       0: FlexColumnWidth(1),
    //                       1: FlexColumnWidth(1),
    //                       2: FlexColumnWidth(1),
    //                       3: FlexColumnWidth(1),
    //                       4: FlexColumnWidth(1),
    //                       5: FlexColumnWidth(1),
    //                       6: FlexColumnWidth(1),
    //                     },
    //                     children: [
    //                       TableRow(children: [
    //                         Center(
    //                           child: addText(translate(context).mon, 12,
    //                               CustomColors.primaryColor, FontWeight.w400),
    //                         ),
    //                         Center(
    //                           child: addText(translate(context).tue, 12,
    //                               CustomColors.primaryColor, FontWeight.w400),
    //                         ),
    //                         Center(
    //                           child: addText(translate(context).wed, 12,
    //                               CustomColors.primaryColor, FontWeight.w400),
    //                         ),
    //                         Center(
    //                           child: addText(translate(context).thu, 12,
    //                               CustomColors.primaryColor, FontWeight.w400),
    //                         ),
    //                         Center(
    //                           child: addText(translate(context).fri, 12,
    //                               CustomColors.primaryColor, FontWeight.w400),
    //                         ),
    //                         Center(
    //                           child: addText(translate(context).sat, 12,
    //                               CustomColors.primaryColor, FontWeight.w400),
    //                         ),
    //                         Center(
    //                           child: addText(translate(context).sun, 12,
    //                               CustomColors.primaryColor, FontWeight.w400),
    //                         ),
    //                       ]),
    //                     ],
    //                   ),
    //                 ),
    //                 Container(
    //                   decoration: const BoxDecoration(),
    //                   child: Table(
    //                     columnWidths: const {
    //                       0: FlexColumnWidth(1),
    //                       1: FlexColumnWidth(1),
    //                       2: FlexColumnWidth(1),
    //                       3: FlexColumnWidth(1),
    //                       4: FlexColumnWidth(1),
    //                       5: FlexColumnWidth(1),
    //                       6: FlexColumnWidth(1),
    //                     },
    //                     children: [
    //                       TableRow(children: [
    //                         Container(
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(6),
    //                             color: CustomColors.txtFieldTextColor,
    //                           ),
    //                           child: ListView.builder(
    //                             padding: EdgeInsets.zero,
    //                             itemCount: controller.monList.length,
    //                             shrinkWrap: true,
    //                             itemBuilder: (context, index) => Container(
    //                               margin: const EdgeInsets.symmetric(vertical: 8),
    //                               child: Center(
    //                                 child: addText(
    //                                     controller.monList[index],
    //                                     13.sp,
    //                                     const Color(0xFF7C7C7C),
    //                                     FontWeight.w400),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Container(
    //                           color: CustomColors.white,
    //                           child: ListView.builder(
    //                             padding: EdgeInsets.zero,
    //                             itemCount: controller.tueList.length,
    //                             shrinkWrap: true,
    //                             itemBuilder: (context, index) => Container(
    //                               padding: const EdgeInsets.symmetric(vertical: 8),
    //                               child: Center(
    //                                 child: addText(
    //                                     controller.tueList[index],
    //                                     13.sp,
    //                                     const Color(0xFF7C7C7C),
    //                                     FontWeight.w400),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Container(
    //                           color: CustomColors.txtFieldTextColor,
    //                           child: ListView.builder(
    //                             padding: EdgeInsets.zero,
    //                             itemCount: controller.wedList.length,
    //                             shrinkWrap: true,
    //                             itemBuilder: (context, index) => Container(
    //                               margin: const EdgeInsets.symmetric(vertical: 8),
    //                               child: Center(
    //                                 child: addText(
    //                                     controller.wedList[index],
    //                                     13.sp,
    //                                     const Color(0xFF7C7C7C),
    //                                     FontWeight.w400),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Container(
    //                           color: CustomColors.white,
    //                           child: ListView.builder(
    //                             padding: EdgeInsets.zero,
    //                             itemCount: controller.thuList.length,
    //                             shrinkWrap: true,
    //                             itemBuilder: (context, index) => Container(
    //                               margin: const EdgeInsets.symmetric(vertical: 8),
    //                               child: Center(
    //                                 child: addText(
    //                                     controller.thuList[index],
    //                                     13.sp,
    //                                     const Color(0xFF7C7C7C),
    //                                     FontWeight.w400),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Container(
    //                           color: CustomColors.txtFieldTextColor,
    //                           child: ListView.builder(
    //                             padding: EdgeInsets.zero,
    //                             itemCount: controller.friList.length,
    //                             shrinkWrap: true,
    //                             itemBuilder: (context, index) => Container(
    //                               margin: const EdgeInsets.symmetric(vertical: 8),
    //                               child: Center(
    //                                 child: addText(
    //                                     controller.friList[index],
    //                                     13.sp,
    //                                     const Color(0xFF7C7C7C),
    //                                     FontWeight.w400),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Container(
    //                           color: CustomColors.white,
    //                           child: ListView.builder(
    //                             padding: EdgeInsets.zero,
    //                             itemCount: controller.satList.length,
    //                             shrinkWrap: true,
    //                             itemBuilder: (context, index) => Container(
    //                               margin: const EdgeInsets.symmetric(vertical: 8),
    //                               child: Center(
    //                                 child: addText(
    //                                     controller.satList[index],
    //                                     13.sp,
    //                                     const Color(0xFF7C7C7C),
    //                                     FontWeight.w400),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Container(
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(6),
    //                             color: CustomColors.txtFieldTextColor,
    //                           ),
    //                           child: ListView.builder(
    //                             padding: EdgeInsets.zero,
    //                             itemCount: controller.tueList.length,
    //                             shrinkWrap: true,
    //                             itemBuilder: (context, index) => Container(
    //                               margin: const EdgeInsets.symmetric(vertical: 8),
    //                               child: Center(
    //                                 child: addText(
    //                                     '-',
    //                                     13.sp,
    //                                     const Color(0xFF7C7C7C),
    //                                     FontWeight.w400),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ]),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     )
    //   ],
    // );
  }
}
