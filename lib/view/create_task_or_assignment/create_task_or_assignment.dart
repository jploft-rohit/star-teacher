import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/create_task_or_assignment/create_task_or_assignment_screen_ctrl.dart';

class CreateTaskOrAssignmentScreen extends StatefulWidget {
  const CreateTaskOrAssignmentScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskOrAssignmentScreen> createState() => _CreateTaskOrAssignmentScreenState();
}

class _CreateTaskOrAssignmentScreenState extends State<CreateTaskOrAssignmentScreen> {
  CreateTaskOrAssignmentScreenCtrl controller = Get.put(CreateTaskOrAssignmentScreenCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithAction(context, "Create Task & Assignments", [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: CustomColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: CustomColors.borderColor
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                    const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
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
                        child: Text("Staff", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
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
                        child: Text("Stars", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
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
                        child: Text("Parents", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 2 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(() => controller.screens[controller.selectedIndex.value]),
            ],
          ),
        ),
      ),
    );
  }
}
