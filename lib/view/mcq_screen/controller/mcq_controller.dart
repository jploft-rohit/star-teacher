import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/e_library_questions_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/view/mcq_screen/question_summary_screen.dart';
import '../../../utility/images_icon_path.dart';

class MCQController extends GetxController{
  String screenType = "";
  String assignmentNumber = "";
  String term = "";
  final eLibraryQuestionResponse = Rxn<ELibraryQuestionData?>();
  String subject = "";
  int totalMarks = 0;
  RxList<String> selectedOptions = <String>[].obs;
  int editQuestionsIndex = 0;
  // RxString selectedQuestionType = "".obs;
  // RxString selectedSubQuestionType = "".obs;
  Rx<File?>? answerFile = File("").obs;
  RxInt currentQuestionNumber = 1.obs;
  Rx<File?>? selectedFile = File("").obs;
  Rx<File?>? mediaFile = File("").obs;
  final formKey = GlobalKey<FormState>();
  Rx<TextEditingController> questionTypeController = TextEditingController().obs;
  Rx<TextEditingController> selectedOptionController = TextEditingController().obs;
  Rx<TextEditingController> subQuestionTypeController = TextEditingController().obs;
  Rx<TextEditingController> marksController = TextEditingController().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  Rx<TextEditingController> answerController = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;
  /// Options Controller
  RxList<TextEditingController> textFieldControllersList = <TextEditingController>[].obs;
  Rx<TextEditingController> option1Controller = TextEditingController().obs;
  Rx<TextEditingController> option2Controller = TextEditingController().obs;
  Rx<TextEditingController> option3Controller = TextEditingController().obs;
  Rx<TextEditingController> option4Controller = TextEditingController().obs;
  Rx<TextEditingController> option5Controller = TextEditingController().obs;
  Rx<TextEditingController> option6Controller = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    clearData();
  }

  RxList<String> subQuestionType = ["Subjective", "Objective", "Multiple select"].obs;

  updateSubTypeList(){
    switch (questionTypeController.value.text) {
      case "Written Question" : return subQuestionType.value = ["Subjective", "Objective", "Multiple select"];
      case "Photo with Question" : return subQuestionType.value = ["Subjective", "Objective", "Multiple select"];
      case "Video with Question" : return subQuestionType.value = ["Subjective", "Objective", "Multiple select"];
      case "Voice only" : return subQuestionType.value = ["Subjective", "Objective", "Multiple select"];
      ///
      case "Match" : return subQuestionType.value = ["Objective", "Multiple select"];
      case "Multiple choose on answer" : return subQuestionType.value = ["Objective", "Multiple select"];
      case "Multiple choose more than one correct answer" : return subQuestionType.value = ["Multiple select"];
      case "Sequence Multiple choose" : return subQuestionType.value = ["Objective"];
      case "Complete the sentence" : return subQuestionType.value = ["Subjective", "Objective"];
      case "Complete the word" : return subQuestionType.value = ["Subjective", "Objective"];
      default : return subQuestionType.value = ["Subjective", "Objective", "Multiple select"];
    }
  }


  String getQuestionTypeKey({required String title}){
    switch (title) {
      case "Written Question" : return "writtenQuestion";
      case "Photo with Question" : return "photoWithQuestion";
      case "Video with Question" : return "videoWithQuestion";
      case "Voice only" : return "voiceOnly";
      case "Match" : return "match";
      case "Multiple choose on answer" : return "multipleChooseOnAnswer";
      case "Multiple choose more than one correct answer" : return "multipleChooseMoreThanOneCorrectAnswer";
      case "Sequence Multiple choose" : return "sequenceMultipleChoose";
      case "Complete the sentence" : return "completeTheSentence";
      case "Complete the word" : return "completeTheWord";
      default : return "";
    }
  }

  String getQuestionTypeKeyFromApi({required String title}){
    switch (title) {
      case "writtenQuestion" : return "Written Question";
      case "photoWithQuestion" : return "Photo with Question";
      case "videoWithQuestion" : return "Video with Question";
      case "voiceOnly" : return "Voice only";
      case "match" : return "Match";
      case "multipleChooseOnAnswer" : return "Multiple choose on answer";
      case "multipleChooseMoreThanOneCorrectAnswer" : return "Multiple choose more than one correct answer";
      case "sequenceMultipleChoose" : return "Sequence Multiple choose";
      case "completeTheSentence" : return "Complete the sentence";
      case "completeTheWord" : return "Complete the word";
      default : return "";
    }
  }

  String getSubQuestionTypeKey({required String title}){
    switch (title) {
      case "Subjective" : return "subjective";
      case "Objective" : return "objective";
      case "Multiple select" : return "multipleSelect";
      default : return "";
    }
  }

  String getSubQuestionTypeKeyFromApi({required String title}){
    switch (title) {
      case "subjective" : return "Subjective";
      case "objective" : return "Objective";
      case "multipleSelect" : return "Multiple select";
      default : return "";
    }
  }

  Future createMcq({required String id, required bool createAnotherQuestion}) async {
    dio.FormData data;
    if ((mediaFile?.value?.path??"").isNotEmpty) {
      data = dio.FormData.fromMap({
        "assignment": id,
        "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
        "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
        "marks":marksController.value.text.trim(),
        "title":titleController.value.text.trim(),
        "description":descriptionController.value.text.trim(),
        "answer":answerController.value.text.trim(),
        "answerOption":"",
        "mediaFile":await dio.MultipartFile.fromFile(mediaFile?.value?.path??"", filename: mediaFile?.value?.path.split("/").last??""),
      });
    }
    else if((answerFile?.value?.path??"").isNotEmpty){
      data = dio.FormData.fromMap({
        "assignment": id,
        "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
        "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
        "marks":marksController.value.text.trim(),
        "title":titleController.value.text.trim(),
        "description":descriptionController.value.text.trim(),
        "answer":answerController.value.text.trim(),
        "answerOption":"",
        "answerFile":await dio.MultipartFile.fromFile(answerFile?.value?.path??"", filename: answerFile?.value?.path.split("/").last??""),
      });
    }
    else if((answerFile?.value?.path??"").isNotEmpty && (mediaFile?.value?.path??"").isNotEmpty){
      data = dio.FormData.fromMap({
        "assignment": id,
        "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
        "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
        "marks":marksController.value.text.trim(),
        "title":titleController.value.text.trim(),
        "description":descriptionController.value.text.trim(),
        "answer":answerController.value.text.trim(),
        "answerOption":"",
        "mediaFile":await dio.MultipartFile.fromFile(mediaFile?.value?.path??"", filename: mediaFile?.value?.path.split("/").last??""),
        "answerFile":await dio.MultipartFile.fromFile(answerFile?.value?.path??"", filename: answerFile?.value?.path.split("/").last??""),
      });
    }
    else{
      if (subQuestionTypeController.value.text == "Multiple select") {
        data = dio.FormData.fromMap({
          "assignment": id,
          "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
          "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
          "marks":marksController.value.text.trim(),
          "title":titleController.value.text.trim(),
          "description":descriptionController.value.text.trim(),
          "answer":answerController.value.text.trim(),
        });
      }else{
        data = dio.FormData.fromMap({
          "assignment": id,
          "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
          "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
          "marks":marksController.value.text.trim(),
          "title":titleController.value.text.trim(),
          "description":descriptionController.value.text.trim(),
          "answer":answerController.value.text.trim(),
          "answerOption":"",
        });
      }
    };
    if (subQuestionTypeController.value.text != "Subjective") {
      textFieldControllersList.asMap().forEach((index, value) {
        data.fields.add(MapEntry("option${(index+1).toString()}", value.text.trim()));
      });
    }
    if (subQuestionTypeController.value.text == "Multiple select") {
      selectedOptions.asMap().forEach((index, value) {
        data.fields.add(MapEntry("multiOption[${(index).toString()}]", selectedOptions[index].toString()));
      });
    }
    print("MCQ Form Data");
    print(data.fields);
    await BaseAPI().post(url: ApiEndPoints().createMCQ, data: data).then((value){
      if (value?.statusCode ==  200) {
            BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
              if (createAnotherQuestion) {
                totalMarks = (int.parse(marksController.value.text.trim())) + totalMarks;
                currentQuestionNumber.value = (currentQuestionNumber.value) + 1;
                clearData();
              }else{
                totalMarks = int.parse(marksController.value.text.trim());
                Navigator.pushReplacement(Get.context!, MaterialPageRoute(builder: (context)=> QuestionSummaryScreen(totalMarks: totalMarks.toString())));
              }
        } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
       }
     },
   );
  }

  updateMcq({required String id, required String questionId, required bool createAnotherQuestion}) async {
    // dio.FormData data;
    // if ((mediaFile?.value?.path??"").isNotEmpty) {
    //   data = dio.FormData.fromMap({
    //     "assignment": id,
    //     "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
    //     "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
    //     "marks":marksController.value.text.trim(),
    //     "title":titleController.value.text.trim(),
    //     "description":descriptionController.value.text.trim(),
    //     "answer":answerController.value.text.trim(),
    //     "answerOption":"",
    //     "id":"",
    //     "mediaFile":await dio.MultipartFile.fromFile(mediaFile?.value?.path??"", filename: mediaFile?.value?.path.split("/").last??""),
    //   });
    // }
    // else if((answerFile?.value?.path??"").isNotEmpty){
    //   data = dio.FormData.fromMap({
    //     "assignment": id,
    //     "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
    //     "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
    //     "marks":marksController.value.text.trim(),
    //     "title":titleController.value.text.trim(),
    //     "description":descriptionController.value.text.trim(),
    //     "answer":answerController.value.text.trim(),
    //     "answerOption":"",
    //     "answerFile":await dio.MultipartFile.fromFile(answerFile?.value?.path??"", filename: answerFile?.value?.path.split("/").last??""),
    //   });
    // }
    // else if((answerFile?.value?.path??"").isNotEmpty && (mediaFile?.value?.path??"").isNotEmpty){
    //   data = dio.FormData.fromMap({
    //     "assignment": id,
    //     "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
    //     "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
    //     "marks":marksController.value.text.trim(),
    //     "title":titleController.value.text.trim(),
    //     "description":descriptionController.value.text.trim(),
    //     "answer":answerController.value.text.trim(),
    //     "answerOption":"",
    //     "mediaFile":await dio.MultipartFile.fromFile(mediaFile?.value?.path??"", filename: mediaFile?.value?.path.split("/").last??""),
    //     "answerFile":await dio.MultipartFile.fromFile(answerFile?.value?.path??"", filename: answerFile?.value?.path.split("/").last??""),
    //   });
    // }
    // else{
    //   data = dio.FormData.fromMap({
    //     "assignment": id,
    //     "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
    //     "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
    //     "marks":marksController.value.text.trim(),
    //     "title":titleController.value.text.trim(),
    //     "description":descriptionController.value.text.trim(),
    //     "answer":answerController.value.text.trim(),
    //     "answerOption":"",
    //   });
    // };
    // if (subQuestionTypeController.value.text != "Subjective") {
    //   textFieldControllersList.asMap().forEach((index, value) {
    //     data.fields.add(MapEntry("option${(index+1).toString()}", value.text.trim()));
    //   });
    // }
    // print("MCQ Form Data");
    // print(data.fields);
    // BaseAPI().post(url: ApiEndPoints().createMCQ, data: data).then((value){
    //   if (value?.statusCode ==  200) {
    //     BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
    //     if (createAnotherQuestion) {
    //       totalMarks = (int.parse(marksController.value.text.trim())) + totalMarks;
    //       currentQuestionNumber.value = (currentQuestionNumber.value) + 1;
    //       clearData();
    //     }else{
    //       totalMarks = int.parse(marksController.value.text.trim());
    //       Navigator.pushReplacement(Get.context!, MaterialPageRoute(builder: (context)=> QuestionSummaryScreen(totalMarks: totalMarks.toString(),)));
    //     }
    //   } else {
    //     BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
    //   }
    // },
    // );
    dio.FormData data;
    if ((mediaFile?.value?.path??"").isNotEmpty) {
      data = dio.FormData.fromMap({
        "assignment": id,
        "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
        "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
        "marks":marksController.value.text.trim(),
        "title":titleController.value.text.trim(),
        "description":descriptionController.value.text.trim(),
        "answer":answerController.value.text.trim(),
        "answerOption":"",
        "questionId":questionId,
        "mediaFile":await dio.MultipartFile.fromFile(mediaFile?.value?.path??"", filename: mediaFile?.value?.path.split("/").last??""),
      });
    }
    else if((answerFile?.value?.path??"").isNotEmpty){
      data = dio.FormData.fromMap({
        "assignment": id,
        "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
        "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
        "marks":marksController.value.text.trim(),
        "title":titleController.value.text.trim(),
        "description":descriptionController.value.text.trim(),
        "answer":answerController.value.text.trim(),
        "answerOption":"",
        "questionId":questionId,
        "answerFile":await dio.MultipartFile.fromFile(answerFile?.value?.path??"", filename: answerFile?.value?.path.split("/").last??""),
      });
    }
    else if((answerFile?.value?.path??"").isNotEmpty && (mediaFile?.value?.path??"").isNotEmpty){
      data = dio.FormData.fromMap({
        "assignment": id,
        "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
        "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
        "marks":marksController.value.text.trim(),
        "title":titleController.value.text.trim(),
        "description":descriptionController.value.text.trim(),
        "answer":answerController.value.text.trim(),
        "answerOption":"",
        "mediaFile":await dio.MultipartFile.fromFile(mediaFile?.value?.path??"", filename: mediaFile?.value?.path.split("/").last??""),
        "answerFile":await dio.MultipartFile.fromFile(answerFile?.value?.path??"", filename: answerFile?.value?.path.split("/").last??""),
      });
    }
    else{
      if (subQuestionTypeController.value.text == "Multiple select") {
        data = dio.FormData.fromMap({
          "assignment": id,
          "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
          "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
          "marks":marksController.value.text.trim(),
          "title":titleController.value.text.trim(),
          "description":descriptionController.value.text.trim(),
          "questionId":questionId,
          "answer":answerController.value.text.trim(),
        });
      }else{
        data = dio.FormData.fromMap({
          "assignment": id,
          "type":getQuestionTypeKey(title: questionTypeController.value.text.trim()),
          "subtype":getSubQuestionTypeKey(title: subQuestionTypeController.value.text.trim()),
          "marks":marksController.value.text.trim(),
          "title":titleController.value.text.trim(),
          "description":descriptionController.value.text.trim(),
          "answer":answerController.value.text.trim(),
          "answerOption":"",
          "questionId":questionId,
        });
      }
    };
    if (subQuestionTypeController.value.text != "Subjective") {
      textFieldControllersList.asMap().forEach((index, value) {
        data.fields.add(MapEntry("option${(index+1).toString()}", value.text.trim()));
      });
    }
    if (subQuestionTypeController.value.text == "Multiple select") {
      selectedOptions.asMap().forEach((index, value) {
        data.fields.add(MapEntry("multiOption[${(index).toString()}]", selectedOptions[index].toString()));
      });
    }
    print("MCQ Form Data");
    print(data.fields);
    await BaseAPI().post(url: ApiEndPoints().createMCQ, data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
        if (createAnotherQuestion) {
          totalMarks = (int.parse(marksController.value.text.trim())) + totalMarks;
          currentQuestionNumber.value = (currentQuestionNumber.value) + 1;
          clearData();
        }else{
          totalMarks = int.parse(marksController.value.text.trim());
          Navigator.pushReplacement(Get.context!, MaterialPageRoute(builder: (context)=> QuestionSummaryScreen(totalMarks: totalMarks.toString())));
        }
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
     }
    },
  );
 }

  clearData(){
    textFieldControllersList.value = [option1Controller.value, option2Controller.value, option3Controller.value, option4Controller.value];
    answerFile = File("").obs;
    selectedFile = File("").obs;
    mediaFile = File("").obs;
    subQuestionType.value = ["Subjective", "Objective", "Multiple select"];
    // questionTypeController.value.clear();
    // subQuestionTypeController.value.clear();
    marksController.value.clear();
    questionTypeController.value.text = "";
    subQuestionTypeController.value.text = "";
    selectedOptionController.value.text = "";
    titleController.value.clear();
    descriptionController.value.clear();
    answerController.value.clear();
    uploadController.value.clear();
    option1Controller.value.clear();
    option2Controller.value.clear();
    option3Controller.value.clear();
    option4Controller.value.clear();
    option5Controller.value.clear();
    option6Controller.value.clear();
  }

  setData({bool? isUpdating}){
    if (isUpdating??false) {
      answerFile = File("").obs;
      selectedFile = File("").obs;
      mediaFile = File("").obs;
      subQuestionType.value = ["Subjective", "Objective", "Multiple select"];
      questionTypeController.value.text = getQuestionTypeKeyFromApi(title: (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].type??""));
      subQuestionTypeController.value.text = getSubQuestionTypeKeyFromApi(title: (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].subtype??""));
      marksController.value.text = (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].marks??0).toString();
      titleController.value.text = (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].title??"");
      descriptionController.value.text = (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].description??"");
      answerController.value.text = (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].answer?.text??"");
      // uploadController.value.text = (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].title??"");
      option1Controller.value.text = (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].option1?.text??"");
      option2Controller.value.text = (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].option2?.text??"");
      option3Controller.value.text = (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].option3?.text??"");
      option4Controller.value.text = (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].option4?.text??"");
      option5Controller.value.text = (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].option5?.text??"");
      option6Controller.value.text = (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].option6?.text??"");
      (eLibraryQuestionResponse.value?.questions?[editQuestionsIndex].answer?.multiOption??[]).forEach((element) {
        selectedOptions.add("Option ${element.replaceAll("option", "")}");
      });
      selectedOptionController.value.text = selectedOptions.join(",");
    }
  }

  Widget subQuestionTypeView({required String type}){
    switch(type) {
      case "Subjective": {
        return Obx(()=>Visibility(
            visible: questionTypeController.value.text == "Photo with Question" || questionTypeController.value.text == "Video with Question" || questionTypeController.value.text == "Voice only",
            child: BaseTextFormField(
              controller: uploadController.value,
              hintText: translate(Get.context!).upload_file_or_photo,
              suffixIcon: "assets/images/upload_icon.svg",
              onTap: (){
                    BaseOverlays().showMediaPickerDialog(
                    onCameraClick: questionTypeController.value.text == "Photo with Question" ? () async {
                      BaseOverlays().dismissOverlay();
                      ImagePicker picker = ImagePicker();
                      await picker.pickImage(source: ImageSource.camera).then((value){
                        if (value != null) {
                          mediaFile?.value = File(value.path);
                          uploadController.value.text = value.path.split("/").last;
                        }
                       },
                     );
                    }:null,
                    onGalleryClick: questionTypeController.value.text == "Photo with Question" ? () async {
                      BaseOverlays().dismissOverlay();
                      ImagePicker picker = ImagePicker();
                      await picker.pickImage(source: ImageSource.gallery).then((value){
                        if (value != null) {
                          mediaFile?.value = File(value.path);
                          uploadController.value.text = value.path.split("/").last;
                        }
                      });
                    }:null,
                      onVideoClick: questionTypeController.value.text == "Video with Question" ? (){
                          BaseOverlays().dismissOverlay();
                          ImagePicker().pickVideo(source: ImageSource.gallery).then((value){
                            if (value != null) {
                              mediaFile?.value = File(value.path);
                              uploadController.value.text = value.path.split("/").last;
                            }
                          },
                          );
                        }:null,
                      onAudioClick: questionTypeController.value.text == "Voice only" ? () async {
                        BaseOverlays().dismissOverlay();
                        FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          type: FileType.audio,
                        ).then((value) {
                          if ((value?.files.first.path??"").isNotEmpty) {
                            mediaFile?.value = File(value?.files.first.path??"");
                          }
                        });
                      }:null,
                );
              },
              validator: (val){
                if ((val??"").isEmpty) {
                  return "Please Select Media";
                }
                return null;
              },
              bottomMargin: 1.h,
            ),
          ),
        );
      }
      case "Objective": {
        // return BaseTextFormField(
        //   controller: TextEditingController(),
        //   hintText: "Upload",
        //   suffixIcon: "assets/images/upload_icon.svg",
        //   onTap: (){},
        // );
        return multipleOptionView2();
      }
      case "Multiple select": {
        return multipleOptionView2();
      }
      default: {
        return SizedBox.shrink();
      }
    }
  }

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
        return multipleOptionView2();
      }
      case "Multiple choose on answer": {
        return multipleOptionView2();
      }
      case "Multiple choose more than one correct answer": {
        return multipleOptionView2();
      }
      case "Sequence Multiple choose": {
        return multipleOptionView2();
      }
      case "Complete the sentence": {
        return multipleOptionView2();
      }
      case "Complete the word": {
        return multipleOptionView2();
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

  // Widget multipleOptionView(){
  //   return Column(children: [
  //     Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(child: BaseTextFormField(controller: option1Controller.value, hintText: "Option 1")),
  //         Padding(
  //           padding: EdgeInsets.only(top: 1.3.h,left: 2.w),
  //           child: SvgPicture.asset(icDelete,height: 3.h),
  //         ),
  //       ],
  //     ),
  //     Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(child: BaseTextFormField(controller: option2Controller.value, hintText: "Option 2")),
  //         Padding(
  //           padding: EdgeInsets.only(top: 1.3.h,left: 2.w),
  //           child: SvgPicture.asset(icDelete,height: 3.h),
  //         ),
  //       ],
  //     ),
  //     Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(child: BaseTextFormField(controller: option3Controller.value, hintText: "Option 3")),
  //         Padding(
  //           padding: EdgeInsets.only(top: 1.3.h,left: 2.w),
  //           child: SvgPicture.asset(icDelete,height: 3.h),
  //         ),
  //       ],
  //     ),
  //     Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(child: BaseTextFormField(controller: option4Controller.value,hintText: "Option 4")),
  //         Container(
  //           margin: EdgeInsets.only(top: 0.7.h),
  //           decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               color: BaseColors.primaryColorLight,
  //               border: Border.all(color: BaseColors.primaryColor)
  //           ),
  //           child: Icon(Icons.add_sharp,color: BaseColors.primaryColor,size: 24.sp),
  //         ),
  //       ],
  //     ),
  //   ],);
  // }

  Widget multipleOptionView2(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(()=>Visibility(
          visible: questionTypeController.value.text == "Photo with Question" || questionTypeController.value.text == "Video with Question" || questionTypeController.value.text == "Voice only",
          child: BaseTextFormField(
            controller: uploadController.value,
            hintText: translate(Get.context!).upload_file_or_photo,
            suffixIcon: "assets/images/upload_icon.svg",
            onTap: (){
              BaseOverlays().showMediaPickerDialog(
                  onCameraClick: () async {
                    BaseOverlays().dismissOverlay();
                    ImagePicker picker = ImagePicker();
                    await picker.pickImage(source: ImageSource.camera).then((value){
                      if (value != null) {
                        mediaFile?.value = File(value.path);
                        uploadController.value.text = value.path.split("/").last;
                      }
                    },
                   );
                  },
                  onGalleryClick: () async {
                    BaseOverlays().dismissOverlay();
                    ImagePicker picker = ImagePicker();
                    await picker.pickImage(source: ImageSource.gallery).then((value){
                      if (value != null) {
                        mediaFile?.value = File(value.path);
                        uploadController.value.text = value.path.split("/").last;
                      }
                    });
                  },
                  onVideoClick: questionTypeController.value.text == "Video with Question" ? (){
                    BaseOverlays().dismissOverlay();
                    ImagePicker().pickVideo(source: ImageSource.gallery).then((value){
                      if (value != null) {
                        mediaFile?.value = File(value.path);
                      }
                    },
                    );
                  }:null,
                onAudioClick: questionTypeController.value.text == "Voice only" ? () async {
                  BaseOverlays().dismissOverlay();
                  FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.audio,
                  ).then((value) {
                    if ((value?.files.first.path??"").isNotEmpty) {
                      mediaFile?.value = File(value?.files.first.path??"");
                    }
                  });
                }:null,
              );
            },
            bottomMargin: 1.h,
          ),
        )),
        Obx(()=>ListView.builder(
              itemCount: textFieldControllersList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                      child: BaseTextFormField(
                        controller: textFieldControllersList[index],
                        hintText: "Option ${(index+1).toString()}",
                        bottomMargin: 1.h,
                        onFieldValueChanged: (val){
                          textFieldControllersList.refresh();
                          update();
                        },
                        validator: (val){
                          if (textFieldControllersList[0].value.text.trim().isEmpty && textFieldControllersList[1].value.text.trim().isEmpty) {
                            return "Please Enter Option ${(index+1).toString()}";
                          }
                          return null;
                        },
                      ),
                  ),
                  Expanded(
                    flex: 1,
                    child: (((index+1) < textFieldControllersList.length) || textFieldControllersList.length == 6)
                        ? GestureDetector(
                           onTap: (){
                             if(textFieldControllersList.length > 2){
                               textFieldControllersList.removeAt(index);
                               textFieldControllersList.refresh();
                             }
                           },
                          child: Padding(
                            padding: EdgeInsets.only(top: 1.3.h,left: 2.w),
                            child: SvgPicture.asset(icDelete,height: 3.h,color: textFieldControllersList.length == 2 ? Colors.grey.shade300 : BaseColors.primaryColor),
                          ),
                        )
                        : GestureDetector(
                          onTap: (){
                            if (textFieldControllersList.length < 6) {
                              textFieldControllersList.add(TextEditingController());
                            }
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 0.7.h,left: 2.w),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: BaseColors.primaryColorLight,
                                  border: Border.all(color: BaseColors.primaryColor)
                              ),
                              child: Icon(Icons.add_sharp,color: BaseColors.primaryColor,size: 24.sp),
                            ),
                        ),
                  ),
                ],
              );
          }),
        ),
      ],
    );
  }
}