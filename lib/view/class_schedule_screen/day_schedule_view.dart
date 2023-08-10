import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/class_schedule_screen/notifiy_authority_popup.dart';
import 'package:staff_app/view/today_schedule_module/controller/today_schedule_controller.dart';

class DayScheduleView extends StatefulWidget {
  const DayScheduleView({Key? key}) : super(key: key);

  @override
  State<DayScheduleView> createState() => _DayScheduleViewState();
}

class _DayScheduleViewState extends State<DayScheduleView> {

  TodayScheduleController controller = Get.find<TodayScheduleController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(()=>Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(child: Padding(
              padding: const EdgeInsets.only(right: 20,top: 6,bottom: 6,left: 6),
              child: Icon(Icons.arrow_back_ios,color: BaseColors.primaryColor,size: 22,),
            ),onTap: (){
              controller.goToPreviousDate();
            },),
            addText(convertDateFormat7(controller.selectedDate.value.toLocal().toString()), 16, Colors.black, FontWeight.w700),
            GestureDetector(child: Padding(
              padding: const EdgeInsets.only(right: 6,top: 6,bottom: 6,left: 20),
              child: Icon(Icons.arrow_forward_ios,color: BaseColors.primaryColor,size: 22,),
            ),onTap: (){
              controller.goToNextDate();
              },
            ),
          ],
         ),
        ),
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: 3.h,
        ),
        Expanded(
          child: Obx(()=> ListView.builder(
            padding: EdgeInsets.only(bottom: 8.h),
            shrinkWrap: true,
            itemCount: controller.list?.length??0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                            buildInfoItems(translate(context).class_name, controller.list?[index]?.classes?.name??""),
                            SizedBox(height: 1.h),
                            buildInfoItems(translate(context).grade, "G1"),
                            SizedBox(height: 1.h),
                            buildInfoItems(translate(context).class_type, controller.list?[index]?.classType??""),
                            SizedBox(height: 1.h),
                            buildInfoItems(translate(context).classroom, controller.list?[index]?.section?.roomNo??""),
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
                                SizedBox(width: 2.w),
                                SvgPicture.asset("assets/images/time_icon.svg"),
                                SizedBox(width: 2.w),
                                Text(getFormattedTime(controller.list?[index]?.startTime??""), style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
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
                                SizedBox(width: 2.w),
                                Text(getFormattedTime(controller.list?[index]?.endTime??""), style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                              ],
                            ),
                            SizedBox(height: 1.h),
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
                                Text(formatBackendDate(controller.list?[index]?.endTime??""), style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                              ],
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                                height: 26,
                                child: BaseButton(
                                  removeHorizontalPadding: true,
                                  verticalPadding: 0,
                                  title: "NOTIFY ADMIN",
                                  onPressed: (){
                                    showDialog(context: context, builder: (context){
                                      return NotifyAuthorityPopup(name: controller.list?[index]?.classes?.name??"");
                                    });
                                  },
                                  btnType: mediumButton,
                                  textSize: 14.sp,
                                ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          ),
        )
      ],
    );
  }
}
