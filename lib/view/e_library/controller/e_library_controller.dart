import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/assignment_response.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/e_library/questions/question1.dart';

class ELibraryController extends GetxController{
  RxInt tabIndex = 0.obs;
  RxInt length = 10.obs;
  RxString selectedQuestionType = "".obs;
  RxString selectedSubQuestionType = "".obs;
  RxString selectedSubjectId = "".obs;
  RxString selectedClassId = "".obs;
  final formKey = GlobalKey<FormState>();
  Rx<TextEditingController> assignmentCategoryCtrl = TextEditingController().obs;
  Rx<TextEditingController> titleCtrl = TextEditingController().obs;
  Rx<TextEditingController> subjectCtrl = TextEditingController().obs;
  Rx<TextEditingController> gradeCtrl = TextEditingController().obs;
  Rx<TextEditingController> termCtrl = TextEditingController().obs;
  Rx<TextEditingController> deleteReasonCtrl = TextEditingController().obs;
  /// Question 1
  Rx<TextEditingController> questionTypeCtrl = TextEditingController().obs;
  Rx<TextEditingController> subQuestionTypeCtrl = TextEditingController().obs;

  RxList<AssignmentData?>? list = <AssignmentData>[].obs;

  setData({bool? isEditing, AssignmentData? data}){
    if(isEditing??false){
      assignmentCategoryCtrl.value.text = (data?.category??"") == "awarenessCourses" ? "Awareness & courses" : toBeginningOfSentenceCase(data?.category??"")??"";
      titleCtrl.value.text = data?.title??"";
      subjectCtrl.value.text = data?.subject?.name??"";
      selectedSubjectId.value = data?.subject?.sId??"";
      gradeCtrl.value.text = data?.classes?.name??"";
      selectedClassId.value = data?.classes?.sId??"";
      termCtrl.value.text = data?.term??"";
    }else{
      assignmentCategoryCtrl.value.clear();
      titleCtrl.value.clear();
      subjectCtrl.value.clear();
      selectedSubjectId.value = "";
      gradeCtrl.value.clear();
      selectedClassId.value = "";
      termCtrl.value.clear();
    }
  }

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

  getData(){
    list?.clear();
    BaseAPI().get(url: ApiEndPoints().getAssignmentsList,queryParameters: {"isPost":tabIndex.value == 0 ? false : true}).then((value){
      if (value?.statusCode ==  200) {
        list?.value = AssignmentResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  createAssignment(){
    if (formKey.currentState?.validate()??false) {
      BaseSuccessResponse response = BaseSuccessResponse();
      var data = {
          "category":assignmentCategoryCtrl.value.text == "Awareness & courses" ? "awarenessCourses" : assignmentCategoryCtrl.value.text.trim().toLowerCase(),
          "title":titleCtrl.value.text.trim(),
          "subject":selectedSubjectId.value,
          "class":selectedClassId.value,
          "term":termCtrl.value.text.trim()
      };
      BaseAPI().post(url: ApiEndPoints().createAssignment,data: data).then((value){
        if (value?.statusCode ==  200) {
          response = BaseSuccessResponse.fromJson(value?.data);
          Navigator.pushReplacement(Get.context!, MaterialPageRoute(builder: (context)=> Question1()));
          BaseOverlays().showSnackBar(message: response.message??"",title: "Success");
          getData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }

  editAssignment({required String id}){
    if (formKey.currentState?.validate()??false) {
      BaseSuccessResponse response = BaseSuccessResponse();
      var data = {
        "category":assignmentCategoryCtrl.value.text == "Awareness & courses" ? "awarenessCourses" : assignmentCategoryCtrl.value.text.trim().toLowerCase(),
        "title":titleCtrl.value.text.trim(),
        "subject":selectedSubjectId.value,
        "class":selectedClassId.value,
        "term":termCtrl.value.text.trim()
      };
      BaseAPI().put(url: ApiEndPoints().editAssignment+id,data: data).then((value){
        if (value?.statusCode ==  200) {
          response = BaseSuccessResponse.fromJson(value?.data);
          Navigator.pushReplacement(Get.context!, MaterialPageRoute(builder: (context)=> Question1()));
          BaseOverlays().showSnackBar(message: response.message??"",title: "Success");
          getData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }

  deleteAssignment({required String id, required int index}){
    if (formKey.currentState?.validate()??false) {
      BaseOverlays().dismissOverlay();
      BaseSuccessResponse response = BaseSuccessResponse();
      var data = {
        "id" : id,
        "reason" : deleteReasonCtrl.value.text.trim()
      };
      BaseAPI().post(url: ApiEndPoints().deleteAssignment, data: data).then((value){
        if (value?.statusCode ==  200) {
          response = BaseSuccessResponse.fromJson(value?.data);
          list?.removeAt(index);
          BaseOverlays().showSnackBar(message: response.message??"" ,title: "Success");
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }

  saveAssignment({required String id}){
      BaseOverlays().dismissOverlay();
      BaseSuccessResponse response = BaseSuccessResponse();
      BaseAPI().get(url: ApiEndPoints().saveAssignment+id).then((value){
        if (value?.statusCode ==  200) {
          response = BaseSuccessResponse.fromJson(value?.data);
          BaseOverlays().showSnackBar(message: response.message??"" ,title: "Success");
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
  }

  postAssignment({required String id,required int index}){
    // BaseOverlays().dismissOverlay();
    BaseSuccessResponse response = BaseSuccessResponse();
    BaseAPI().get(url: ApiEndPoints().postAssignment+id).then((value){
      if (value?.statusCode ==  200) {
        response = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: response.message??"" ,title: "Success");
        list?.removeAt(index);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
}