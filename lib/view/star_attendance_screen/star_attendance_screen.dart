import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_attendance_screen/star_attendance_screen_ctrl.dart';

class StarAttendanceScreen extends StatefulWidget {
  const StarAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<StarAttendanceScreen> createState() => _StarAttendanceScreenState();
}

class _StarAttendanceScreenState extends State<StarAttendanceScreen> {
  StarAttendanceScreenCtrl controller = Get.put(StarAttendanceScreenCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(context, translate(context).stars_attendance, [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Row(
              children: [
                Obx(() => Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      controller.selectedFMOPos.value = 0;
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
                      controller.selectedFMOPos.value = 0;
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
                      controller.selectedFMOPos.value = 0;
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
                      child: Text(translate(context).hybrid, style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 2 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                    ),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Obx(() => controller.list[controller.selectedIndex.value]),
          ],
        ),
      ),
    );
  }
}
