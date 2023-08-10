import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/today_schedule_module/controller/today_schedule_controller.dart';

import '../../language_classes/language_constants.dart';

class RescheduleClassPopup extends StatefulWidget {
  final String name, reason, comment;
  const RescheduleClassPopup({Key? key, required this.name, required this.reason, required this.comment}) : super(key: key);

  @override
  State<RescheduleClassPopup> createState() => _RescheduleClassPopupState();
}

class _RescheduleClassPopupState extends State<RescheduleClassPopup> {
  TodayScheduleController controller = Get.find<TodayScheduleController>();
  bool isChecked = true;
  String startDate = flipDate(date: formatFlutterDateTime(flutterDateTime: DateTime.now()));
  String endDate = flipDate(date: formatFlutterDateTime(flutterDateTime: DateTime.now()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    Text(translate(context).reschedule, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                  Text(translate(context).current, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(calenderDateSvg,color: BaseColors.primaryColor,height: 20.sp,),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: BaseColors.primaryColor)
                          ),
                          child: Text(flipDate(date: formatFlutterDateTime(flutterDateTime: DateTime.now())), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset("assets/images/Vector (3).svg",height: 20.sp,),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: BaseColors.primaryColor)
                          ),
                          child: Text(widget.name, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text("${translate(context).reschedule} ${translate(context).to}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                  SizedBox(height: 2.h),
                  GestureDetector(
                    onTap: (){
                      showDatePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: BaseColors.primaryColor,
                                ),
                              ),
                              child: child!,
                            );
                          },
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime((DateTime.now().year+50),1,1),
                      ).then((picked){
                        if (picked != null) {
                          endDate = formatFlutterDateTime(flutterDateTime: picked, getDayFirst: true);
                          setState(() {});
                        }
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(calenderDateSvg,color: BaseColors.primaryColor,height: 20.sp,),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: BaseColors.primaryColor)
                            ),
                            child: Text(endDate, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset("assets/images/Vector (3).svg",height: 20.sp,),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: BaseColors.primaryColor)
                          ),
                          child: Text(widget.name, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: BaseColors.primaryColor,
                        activeColor: Colors.transparent,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: isChecked,
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: BaseColors.primaryColor),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                            side: BorderSide(color: BaseColors.primaryColor)
                        ),
                        onChanged: (bool? value) {
                          isChecked = value!;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(child: Text(translate(context).do_you_want_a_permanent_reschedule, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),)),
                    ],
                  ),
                SizedBox(
                  height: 3.h,
                ),

                Center(
                  child: BaseButton(borderRadius: 100,btnType: mediumButton,title: "SUBMIT", onPressed: (){
                    BaseOverlays().dismissOverlay();
                      controller.notifyAdminClassSchedule(
                        reason: widget.reason,
                        comment: widget.comment,
                        startDate: startDate,
                        endDate: endDate,
                        isPermanentReschedule: isChecked,
                      );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
