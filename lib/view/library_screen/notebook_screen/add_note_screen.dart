import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';

import 'notebook_screen_ctrl.dart';

class AddNoteScreen extends StatefulWidget {
  final bool isUpdating;
  const AddNoteScreen({Key? key, this.isUpdating = false}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  NotebookScreenCtrl controller = Get.find<NotebookScreenCtrl>();
  TextEditingController titleController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController recommendationController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithAction(context, widget.isUpdating ? "Edit Note" : "Add Note", [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                        controller.selectedIndex3.value = 0;
                      },
                      child: Container(
                        height: 40.0,
                        width: getWidth(context) * 50 / 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.selectedIndex3.value == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                            border: Border.all(
                                color: controller.selectedIndex3.value == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                            ),
                            boxShadow: [
                              if(controller.selectedIndex3.value == 0)
                                const BoxShadow(
                                    color: CustomColors.darkShadowColor,
                                    spreadRadius: 1.0,
                                    blurRadius: 2.0,
                                    offset: Offset(0, 3)
                                )
                            ],
                            borderRadius: BorderRadius.circular(15.sp)
                        ),
                        child: Text("Has Talent", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex3.value == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
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
                        controller.selectedIndex3.value = 1;
                      },
                      child: Container(
                        height: 40.0,
                        width: getWidth(context) * 50 / 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.selectedIndex3.value == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                            border: Border.all(
                                color: controller.selectedIndex3.value == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                            ),
                            boxShadow: [
                              if(controller.selectedIndex3.value == 1)
                                const BoxShadow(
                                    color: CustomColors.darkShadowColor,
                                    spreadRadius: 1.0,
                                    blurRadius: 2.0,
                                    offset: Offset(0, 3)
                                )
                            ],
                            borderRadius: BorderRadius.circular(15.sp)
                        ),
                        child: Text("Need Improvement", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex3.value == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(controller: titleController, hintText: "Title", borderRadius: 5.0,fillColor: CustomColors.txtFieldTextColor,),
              SizedBox(height: 2.h),
              CustomTextField(controller: gradeController, hintText: "Grade", borderRadius: 5.0,fillColor: CustomColors.txtFieldTextColor,suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,)),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text("Date:", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
                  ),
                  Flexible(
                    flex: 4,
                    child: Container(
                      child: Row(
                        children: [
                          SvgPicture.asset(calenderDateSvg),
                          SizedBox(
                            width: 2.w,
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: dateController,
                              hintText: "dd/mm/yyyy",
                              readOnly: true,
                              onTap: (){
                                selectDate(context);
                              },
                              borderRadius: 5.0,
                              fillColor: CustomColors.txtFieldTextColor,
                              hintTxtSize: 15.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(controller: descriptionController, hintText: "Description", borderRadius: 5.0,maxLine: 5,fillColor: CustomColors.txtFieldTextColor,),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: recommendationController,
                hintText: "Select Recommendation",
                borderRadius: 5.0,
                fillColor: CustomColors.txtFieldTextColor,
                hintTxtSize: 15.sp,
                suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
              ),
              SizedBox(height: 2.h),
              CustomTextField(controller: subjectController, hintText: "Subject", borderRadius: 5.0,fillColor: CustomColors.txtFieldTextColor,suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0)),
              SizedBox(height: 2.h),
              CustomTextField(controller: commentController, hintText: "Comment", borderRadius: 5.0,fillColor: CustomColors.txtFieldTextColor),
              SizedBox(height: 2.h),
              CustomButton(text: widget.isUpdating ? "UPDATE" : "SUBMIT", onPressed: (){
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
  setData(){
    if (widget.isUpdating) {
      titleController.text = "Extra classes for her";
      gradeController.text = "5th";
      dateController.text = "06/23/2022";
      descriptionController.text = "This star has good dance skills, so I recommend extra classes for her to improve more.";
      recommendationController.text = "Ovaish Khan";
      subjectController.text = "Science";
      commentController.text = "Dance";
    }
  }
}
