import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/assignments_screen/assignment_screen_ctrl.dart';

class AssignedByMeView extends StatefulWidget {
  const AssignedByMeView({Key? key}) : super(key: key);

  @override
  State<AssignedByMeView> createState() => _AssignedByMeViewState();
}

class _AssignedByMeViewState extends State<AssignedByMeView> {
  AssignmentScreenCtrl controller = Get.find<AssignmentScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Obx(() => Flexible(
              flex: 1,
              child: InkWell(
                onTap: (){
                  controller.selectedIndex1.value = 0;
                },
                child: Container(
                  height: 40.0,
                  width: getWidth(context) * 50 / 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: controller.selectedIndex1.value == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                      border: Border.all(
                          color: controller.selectedIndex1.value == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                      ),
                      boxShadow: [
                        if(controller.selectedIndex1.value == 0)
                          const BoxShadow(
                              color: CustomColors.darkShadowColor,
                              spreadRadius: 1.0,
                              blurRadius: 2.0,
                              offset: Offset(0, 3)
                          )
                      ],
                      borderRadius: BorderRadius.circular(15.sp)
                  ),
                  child: Text(translate(context).staff, style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex1.value == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
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

                  controller.selectedIndex1.value = 1;
                },
                child: Container(
                  height: 40.0,
                  width: getWidth(context) * 50 / 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: controller.selectedIndex1.value == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                      border: Border.all(
                          color: controller.selectedIndex1.value == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                      ),
                      boxShadow: [
                        if(controller.selectedIndex1.value == 1)
                          const BoxShadow(
                              color: CustomColors.darkShadowColor,
                              spreadRadius: 1.0,
                              blurRadius: 2.0,
                              offset: Offset(0, 3)
                          )
                      ],
                      borderRadius: BorderRadius.circular(15.sp)
                  ),
                  child: Text(translate(context).stars, style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex1.value == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
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

                  controller.selectedIndex1.value = 2;
                },
                child: Container(
                  height: 40.0,
                  width: getWidth(context) * 50 / 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: controller.selectedIndex1.value == 2 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                      border: Border.all(
                          color: controller.selectedIndex1.value == 2 ? Colors.transparent : CustomColors.txtFiledBorderColor
                      ),
                      boxShadow: [
                        if(controller.selectedIndex1.value == 2)
                          const BoxShadow(
                              color: CustomColors.darkShadowColor,
                              spreadRadius: 1.0,
                              blurRadius: 2.0,
                              offset: Offset(0, 3)
                          )
                      ],
                      borderRadius: BorderRadius.circular(15.sp)
                  ),
                  child: Text(translate(context).parents, style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex1.value == 2 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                ),
              ),
            )),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Obx(() => controller.screenList1[controller.selectedIndex1.value],),
      ],
    );
  }
}
