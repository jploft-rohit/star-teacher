import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/notebook_list_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/backend/responses_model/subjects_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:staff_app/view/task_or_reminder_screen/add_task_or_reminder_screen.dart';

import '../ctrl/notebook_ctrl.dart';

class AddNoteScreen extends StatefulWidget {
  final bool isUpdating;
  final NotebookList? data;
  const AddNoteScreen({Key? key, this.isUpdating = false, this.data}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  NotebookCtrl controller = Get.find<NotebookCtrl>();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void initState() {
    super.initState();
    controller.setData(isUpdating: widget.isUpdating, data: widget.data);
    controller.getSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: widget.isUpdating ? "Edit Note" : "Add Note"),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                BaseTextFormField(
                  controller: controller.schoolController.value,
                  errorText: "Please select school",
                  isDropDown: true,
                  hintText: controller.schoolController.value.text.isEmpty ? "Select School" : controller.schoolController.value.text,
                  items: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
                    return DropdownMenuItem(
                      value: data,
                      child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                    );
                  }).toList(),
                  onChanged: (value) async {
                    controller.schoolController.value.text = value?.name??"";
                    controller.selectedSchoolId.value = value?.sId??"";
                  },
                ),
                Row(
                  children: [
                    Obx(() => Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          controller.selectedIndex3.value = 0;
                        },
                        child: Container(
                          height: 40.0,
                          width: getWidth(context) * 50 / 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectedIndex3.value == 0 ? BaseColors.backgroundColor : BaseColors.txtFieldTextColor,
                              border: Border.all(
                                  color: controller.selectedIndex3.value == 0 ? Colors.transparent : BaseColors.txtFiledBorderColor
                              ),
                              boxShadow: [
                                if(controller.selectedIndex3.value == 0)
                                  const BoxShadow(
                                      color: BaseColors.darkShadowColor,
                                      spreadRadius: 1.0,
                                      blurRadius: 2.0,
                                      offset: Offset(0, 3)
                                  )
                              ],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("Has Talent", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex3.value == 0 ? BaseColors.primaryColor : BaseColors.txtFiledBorderColor, fontSize: 16.sp,
                          fontWeight: controller.selectedIndex3.value == 0?FontWeight.bold:FontWeight.w400),),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 2.w,
                    ),
                    Obx(() => Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          controller.selectedIndex3.value = 1;
                        },
                        child: Container(
                          height: 40.0,
                          width: getWidth(context) * 50 / 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectedIndex3.value == 1 ? BaseColors.backgroundColor : BaseColors.txtFieldTextColor,
                              border: Border.all(
                                  color: controller.selectedIndex3.value == 1 ? Colors.transparent : BaseColors.txtFiledBorderColor
                              ),
                              boxShadow: [
                                if(controller.selectedIndex3.value == 1)
                                  const BoxShadow(
                                      color: BaseColors.darkShadowColor,
                                      spreadRadius: 1.0,
                                      blurRadius: 2.0,
                                      offset: Offset(0, 3)
                                  )
                              ],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("Need Improvement", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex3.value == 1 ? BaseColors.primaryColor : BaseColors.txtFiledBorderColor, fontSize: 16.sp,
                              fontWeight: controller.selectedIndex3.value == 0?FontWeight.bold:FontWeight.w400),),
                        ),
                      ),
                    )),
                  ],
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  controller: controller.titleController,
                  hintText: "Title",
                  borderRadius: 5.0,
                  fillColor: BaseColors.txtFieldTextColor,
                  validator: (val){
                    if((val??"").isEmpty){
                      return "Please enter title";
                    }
                    return null;
                  },
                ),
                // SizedBox(height: 2.h),
                // CustomTextField(controller: gradeController, hintText: "Grade", borderRadius: 5.0,fillColor: CustomColors.txtFieldTextColor,suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,)),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text("Date:", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: BaseColors.textBlackColor),),
                    ),
                    Flexible(
                      flex: 4,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(calenderDateSvg),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: CustomTextField(
                                controller: controller.dateController,
                                hintText: "yyyy/mm/dd",
                                readOnly: true,
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
                                      firstDate: DateTime(1600, 8),
                                      lastDate: DateTime.now()
                                  ).then((picked){
                                    if (picked != null) {
                                      controller.dateController..text = "${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}";
                                    }
                                  });
                                },
                                borderRadius: 5.0,
                                fillColor: BaseColors.txtFieldTextColor,
                                hintTxtSize: 15.sp,
                                validator: (val){
                                  if((val??"").isEmpty){
                                    return "Please select date";
                                  }
                                  return null;
                                },
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
                CustomTextField(
                  controller: controller.descriptionController,
                  hintText: "Description",
                  borderRadius: 5.0,
                  maxLine: 5,
                  fillColor: BaseColors.txtFieldTextColor,
                  validator: (val){
                    if((val??"").isEmpty){
                      return "Please enter description";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                BaseTextFormField(
                  controller: controller.recommendationController,
                  hintText: "Select Recommendation",
                  isDropDown: true,
                  dropDownValue: controller.recommendationController.text,
                  onChanged: (newValue){
                    setState(() {
                      controller.recommendationController.text = newValue.toString();
                    });},
                  items: DummyLists().recommendationList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                  }).toList(),
                  errorText: "Please select recommendation",
                ),
                Obx(()=>BaseTextFormField(
                      controller: controller.subjectController,
                      hintText: controller.subjectController.text.isEmpty ? "Subject" : controller.subjectController.text.trim(),
                      isDropDown: true,
                      errorText: "Please select subject",
                      items: controller.subjectsList?.map((SubjectsData data){
                        return DropdownMenuItem(
                          value: data,
                          child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                        );
                      }).toList(),
                      onChanged: (value) async {
                        controller.subjectController.text = value?.name??"";
                        controller.selectedSubjectId.value = value?.sId??"";
                      },
                  ),
                ),
                SizedBox(height: 2.h),
                // CustomTextField(controller: commentController, hintText: "Comment", borderRadius: 5.0,fillColor: CustomColors.txtFieldTextColor),
                // SizedBox(height: 2.h),
                GestureDetector(onTap: (){
                  Get.to(AddTaskOrReminderScreen());
                },child: Text("Remind Me On",style: TextStyle(color: BaseColors.primaryColor,fontSize: 15.sp,fontWeight: FontWeight.w700),)),
                SizedBox(height: 2.h),
                BaseButton(title: widget.isUpdating ? "UPDATE" : "SUBMIT", onPressed: (){
                  if (widget.isUpdating) {
                    controller.updateNotebook(id: widget.data?.sId??"");
                  }else{
                    controller.addNotebook();
                  }
                },btnType: largeButton,bottomMargin: 20.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
