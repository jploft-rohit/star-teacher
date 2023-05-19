import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';

class ELibraryController extends GetxController{
  RxInt tabIndex = 0.obs;
  RxInt length = 10.obs;
  RxString selectedQuestionType = "".obs;
  RxString selectedSubQuestionType = "".obs;

  Rx<TextEditingController> assignmentCategoryCtrl = TextEditingController().obs;
  Rx<TextEditingController> titleCtrl = TextEditingController().obs;
  Rx<TextEditingController> subjectCtrl = TextEditingController().obs;
  Rx<TextEditingController> gradeCtrl = TextEditingController().obs;
  Rx<TextEditingController> termCtrl = TextEditingController().obs;
  /// Question 1
  Rx<TextEditingController> questionTypeCtrl = TextEditingController().obs;
  Rx<TextEditingController> subQuestionTypeCtrl = TextEditingController().obs;

  Widget subQuestionTypeView({required String type}){
    switch(type) {
      case "Subjective": {
        return BaseTextFormField(
        controller: TextEditingController(),
        hintText: "Upload",
        suffixIcon: "assets/images/upload_icon.svg",
        onTap: (){},
        );
      }
      case "Objective": {
        return BaseTextFormField(
        controller: TextEditingController(),
        hintText: "Upload",
        suffixIcon: "assets/images/upload_icon.svg",
        onTap: (){},
        );
      }
      case "Multiple select": {
        return multipleOptionView();
      }
      default: {
        return SizedBox.shrink();
      }
    }
  }

  // return BaseTextFormField(
  // controller: TextEditingController(),
  // hintText: "Upload Photo",
  // suffixIcon: "assets/images/upload_icon.svg",
  // onTap: (){},
  // );

  Widget questionTypeView({required String type}){
    switch(type) {
      case "Written Question": {
        return SizedBox.shrink();
      }
      case "Photo with Question": {
        return BaseTextFormField(
          controller: TextEditingController(),
          hintText: "Upload Photo",
          suffixIcon: "assets/images/upload_icon.svg",
          onTap: (){},
        );
      }
      case "Video with Question": {
        return BaseTextFormField(
          controller: TextEditingController(),
          hintText: "Upload Video",
          suffixIcon: "assets/images/upload_icon.svg",
          onTap: (){},
        );
      }
      case "Voice only": {
        return BaseTextFormField(
          controller: TextEditingController(),
          hintText: "Upload File",
          suffixIcon: "assets/images/upload_icon.svg",
          onTap: (){},
        );
      }
      case "Match": {
        return multipleOptionView();
      }
      case "Multiple choose on answer": {
        return multipleOptionView();
      }
      case "Multiple choose more than one correct answer": {
        return multipleOptionView();
      }
      case "Sequence Multiple choose": {
        return multipleOptionView();
      }
      case "Complete the sentence": {
        return multipleOptionView();
      }
      case "Complete the word": {
        return multipleOptionView();
      }
      case "Draw": {
        return BaseTextFormField(
          controller: TextEditingController(),
          hintText: "Upload File",
          suffixIcon: "assets/images/upload_icon.svg",
          onTap: (){},
        );
      }
      default: {
        return Column(
          children: [],
        );
      }
    }
  }

  Widget multipleOptionView(){
    return Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: BaseTextFormField(controller: TextEditingController(),hintText: "Option 1")),
          Padding(
            padding: EdgeInsets.only(top: 1.3.h,left: 2.w),
            child: SvgPicture.asset(icDelete,height: 3.h),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: BaseTextFormField(controller: TextEditingController(),hintText: "Option 2")),
          Padding(
            padding: EdgeInsets.only(top: 1.3.h,left: 2.w),
            child: SvgPicture.asset(icDelete,height: 3.h),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: BaseTextFormField(controller: TextEditingController(),hintText: "Option 3")),
          Padding(
            padding: EdgeInsets.only(top: 1.3.h,left: 2.w),
            child: SvgPicture.asset(icDelete,height: 3.h),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: BaseTextFormField(controller: TextEditingController(),hintText: "Option 4")),
          Container(
            margin: EdgeInsets.only(top: 0.7.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: BaseColors.primaryColorLight,
              border: Border.all(color: BaseColors.primaryColor)
            ),
            child: Icon(Icons.add_sharp,color: BaseColors.primaryColor,size: 24.sp),
          ),
        ],
      ),
    ],);
  }
}