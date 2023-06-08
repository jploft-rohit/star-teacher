import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/dummy_lists.dart';
import 'package:staff_app/utility/utility.dart';
import 'package:staff_app/view/e_library/controller/e_library_controller.dart';
import 'package:staff_app/view/e_library/questions/question_summary_screen.dart';

class Question1 extends StatefulWidget {
  const Question1({Key? key}) : super(key: key);

  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  ELibraryController controller = Get.find<ELibraryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Create ${controller.assignmentCategoryCtrl.value.text}",),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Obx(()=>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Question:", style: TextStyle(fontSize: 17.sp)),
                    Text("1",style: TextStyle(color: BaseColors.primaryColor,fontWeight: FontWeight.w900)),
                  ],
                ),
                BaseTextFormField(
                  topMargin: 2.h,
                  hintText: controller.questionTypeCtrl.value.text.isEmpty ? "Question Type" : controller.questionTypeCtrl.value.text.trim(),
                  controller: controller.questionTypeCtrl.value,
                  isDropDown: true,
                  onChanged: (value){
                    controller.selectedQuestionType.value = value.toString();
                    controller.questionTypeCtrl.value.text = value.toString();
                    controller.subQuestionTypeCtrl.value.text = "";
                  },
                  items: DummyLists().questionTypeList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: addText(value, 16.sp, Colors.black, FontWeight.w400));
                  }).toList(),
                ),
                BaseTextFormField(
                  hintText: controller.subQuestionTypeCtrl.value.text.isEmpty ? "Sub Question Type" : controller.subQuestionTypeCtrl.value.text.trim(),
                  controller: controller.subQuestionTypeCtrl.value,
                  isDropDown: true,
                  onChanged: (value){
                      controller.subQuestionTypeCtrl.value.text = value.toString();
                      controller.selectedSubQuestionType.value = value.toString();
                   },
                  items: DummyLists().subQuestionType.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: addText(value, 16.sp, Colors.black, FontWeight.w400));
                  }).toList(),
                ),
                BaseTextFormField(hintText: "Marks",controller: TextEditingController()),
                BaseTextFormField(hintText: "Title",controller: TextEditingController()),
                controller.subQuestionTypeView(type: controller.selectedSubQuestionType.value),
                BaseTextFormField(hintText: "Description",controller: TextEditingController(),maxLine: 4,),
                Align(
                  alignment: Alignment.center,
                  child: BaseButton(title: "SAVE & NEXT", onPressed: (){
                    Get.to(QuestionSummaryScreen());
                  },topMargin: 3.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {

    super.dispose();
  }
}