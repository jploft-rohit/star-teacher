import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_multiselection_dropdown.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/dummy_lists.dart';
import 'package:staff_app/view/assignments_screen/controller/mcq_controller.dart';
import 'package:staff_app/view/mcq_screen/controller/mcq_controller.dart';

class CreateMcqScreen extends StatefulWidget {
  final bool? isUpdating;
  final String screenType, id, term, subject, assignmentType, assignmentNumber, currentQuestionNumber;
  const CreateMcqScreen({Key? key, required this.screenType, required this.id, required this.term, required this.subject, required this.assignmentType, required this.assignmentNumber, this.isUpdating, required this.currentQuestionNumber}) : super(key: key);

  @override
  State<CreateMcqScreen> createState() => _CreateMcqScreenState();
}

class _CreateMcqScreenState extends State<CreateMcqScreen> {

  MCQController controller = Get.put(MCQController());
  WorkSheetController workSheetController = Get.put(WorkSheetController());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.clearData();
      controller.totalMarks = 0;
      controller.screenType = widget.screenType;
      controller.term = widget.term;
      controller.subject = widget.subject;
      controller.assignmentNumber = widget.assignmentNumber;
      controller.currentQuestionNumber.value = int.parse(widget.currentQuestionNumber);
      if (widget.isUpdating??false) {
        workSheetController.getELibraryQuestion(id: widget.id);
        controller.eLibraryQuestionResponse.value = workSheetController.eLibraryQuestionResponse.value;
        controller.setData(isUpdating: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BaseAppBar(title: "Create ${controller.screenType}"),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: Obx(()=>Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Question: ", style: TextStyle(fontSize: 17.sp)),
                      Text(controller.currentQuestionNumber.value.toString(),style: TextStyle(color: BaseColors.primaryColor,fontWeight: FontWeight.w900)),
                    ],
                  ),
                  BaseTextFormField(
                    topMargin: 2.h,
                    hintText: controller.questionTypeController.value.text.isEmpty ? "Question Type" : controller.questionTypeController.value.text.trim(),
                    controller: controller.questionTypeController.value,
                    isDropDown: true,
                    errorText: "Please Select Question Type",
                    items: DummyLists().questionTypeList.map((value) {
                      return DropdownMenuItem(
                          value: value,
                          child: addText(value, 16.sp, Colors.black, FontWeight.w400));
                    }).toList(),
                    onChanged: (value){
                      // controller.selectedQuestionType.value = value.toString();
                      controller.questionTypeController.value.text = value.toString();
                      controller.mediaFile?.value = File("");
                      controller.answerFile?.value = File("");
                      controller.uploadController.value.clear();
                      controller.updateSubTypeList();
                      controller.subQuestionTypeController.refresh();
                      setState(() {});
                      // controller.subQuestionTypeController.value.text = "";
                      // setState(() {});
                      // controller.selectedSubQuestionType.value = "";
                    },
                  ),
                  BaseTextFormField(
                    hintText: controller.subQuestionTypeController.value.text.isEmpty ? "Sub Question Type" : controller.subQuestionTypeController.value.text.trim(),
                    controller: controller.subQuestionTypeController.value,
                    isDropDown: true,
                    errorText: "Please Select Sub Question Type",
                    onChanged: (value){
                        controller.subQuestionTypeController.value.text = value.toString();
                        controller.mediaFile?.value = File("");
                        controller.answerFile?.value = File("");
                        controller.uploadController.value.clear();
                        setState(() {});
                        // controller.selectedSubQuestionType.value = value.toString();
                     },
                    items: controller.subQuestionType.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: addText(value, 16.sp, Colors.black, FontWeight.w400,
                        ),
                      );
                    }).toList(),
                  ),
                  BaseTextFormField(
                      hintText: "Marks",
                      controller: controller.marksController.value,
                      bottomMargin: 1.h,
                      textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      validator: (val){
                        if ((val??"").isEmpty) {
                          return "Please Enter Marks";
                        }
                        return null;
                      },
                  ),
                  BaseTextFormField(
                      hintText: "Title",
                      controller: controller.titleController.value,
                      bottomMargin: 1.h,
                      validator: (val){
                        if ((val??"").isEmpty) {
                          return "Please Enter Title";
                        }
                        return null;
                      },
                  ),
                  controller.subQuestionTypeView(type: controller.subQuestionTypeController.value.text.trim()),
                  BaseTextFormField(
                      hintText: "Description",
                      controller: controller.descriptionController.value,
                      maxLine: 4,
                      validator: (val){
                        if ((val??"").isEmpty) {
                          return "Please Enter Description";
                        }
                        return null;
                      },
                    onFieldValueChanged: (val){
                        controller.textFieldControllersList.refresh();
                        controller.update();
                        setState(() {});
                        print("setState called");
                    },
                    bottomMargin: 1.h,
                  ),
                  Visibility(
                    visible: controller.subQuestionTypeController.value.text == "Subjective",
                    child: BaseTextFormField(
                      hintText: "Answer",
                      controller: controller.answerController.value,
                      validator: (val){
                        if ((val??"").isEmpty) {
                          return "Please Enter Answer";
                        }
                        return null;
                      },
                      bottomMargin: 1.h,
                    ),
                  ),
                  Visibility(
                    visible: controller.subQuestionTypeController.value.text == "Objective",
                    child: BaseTextFormField(
                        controller: controller.selectedOptionController.value,
                        isDropDown: true,
                        // onTap: (){
                        //   setState(() {});
                        //   print("setState Called");
                        // },
                        hintText: controller.selectedOptionController.value.text.isEmpty ? "Select Correct Option" : controller.selectedOptionController.value.text.trim(),
                        errorText: "Please Select Correct Answer Option",
                        items: controller.textFieldControllersList.map((TextEditingController data) {
                          return DropdownMenuItem(
                            value: data,
                            child: addText(data.text, 15.sp, Colors.black, FontWeight.w400),
                          );
                        }).toList(),
                        onChanged: (val){
                          controller.selectedOptionController.value.text = val.value.text;
                          setState(() {});
                        },
                    ),
                  ),
                  Visibility(
                    visible: controller.subQuestionTypeController.value.text == "Multiple select",
                    child: Row(
                      children: [
                        Expanded(
                          child: DropDownTextField.multiSelection(
                            initialValue: controller.selectedOptions,
                            dropDownList: controller.textFieldControllersList.asMap().map((index, data) {
                              return MapEntry(index, DropDownValueModel(value: data, name: 'Option ${index + 1}'));
                            }).values.toList(),
                            validator: (val) {
                              print(val);
                              if (val == "") {
                                return "Please Select Correct Answers";
                              }
                              return null;
                            },
                            displayCompleteItem: true,
                            textFieldDecoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 15),
                              isDense: true,
                              labelStyle: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(fontSize: 15.sp, color: Color(0xFF000000)),
                              hintStyle: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(fontSize: 15.sp, color: Color(0xFF000000)),
                              hintText: "Select Answer",
                              border: OutlineInputBorder(borderSide: BorderSide(color: ColorConstants.borderColor)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorConstants.borderColor)),
                              prefix: SizedBox(width: 15),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorConstants.borderColor)),
                              fillColor: Color(0xFFFCFCFC),
                              filled: true,
                              suffixIconConstraints: BoxConstraints(minWidth: 35),
                              suffixIcon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (value) {
                              controller.selectedOptions.value = [];
                              print(value.toString());
                              List<dynamic> clasLuist = [];
                              clasLuist = value;
                              List<DropDownValueModel>? _optiondropDownList;
                              if (clasLuist.isNotEmpty) {
                                _optiondropDownList = clasLuist.cast<DropDownValueModel>();
                                for (int i = 0; i < _optiondropDownList.length; i++) {
                                  var option = _optiondropDownList[i].name.replaceAll("Option ", "");
                                  controller.selectedOptions.add("option$option");
                                  print(controller.selectedOptions.toString());
                                  // formWidgetList[index].multipleSelectAnswer.add("option$option");
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BaseButton(title: "SAVE & NEXT", onPressed: () async {
                          if (controller.formKey.currentState?.validate()??false) {
                            if (widget.isUpdating??false) {
                              await controller.updateMcq(id: widget.id, createAnotherQuestion: true, questionId: controller.eLibraryQuestionResponse.value?.questions?[controller.currentQuestionNumber.value].id??"").then((value) {
                                controller.questionTypeController.value.text = "";
                                controller.subQuestionTypeController.value.text = "";
                                controller.clearData();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CreateMcqScreen(screenType: widget.screenType, id: widget.id, term: widget.term, subject: widget.subject, assignmentType: widget.assignmentType, assignmentNumber: widget.assignmentNumber, currentQuestionNumber: controller.currentQuestionNumber.value.toString(),)));
                              });
                            }else{
                              await controller.createMcq(id: widget.id, createAnotherQuestion: true).then((value) {
                                controller.questionTypeController.value.text = "";
                                controller.subQuestionTypeController.value.text = "";
                                controller.clearData();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CreateMcqScreen(screenType: widget.screenType, id: widget.id, term: widget.term, subject: widget.subject, assignmentType: widget.assignmentType, assignmentNumber: widget.assignmentNumber, currentQuestionNumber: controller.currentQuestionNumber.value.toString(),)));
                              });
                            }
                          }
                        },topMargin: 3.h,rightMargin: 1.w,isActive: false,
                        ),
                      ),
                      Expanded(
                        child: BaseButton(title: "POST", onPressed: () async {
                          if (controller.formKey.currentState?.validate()??false) {
                            if (widget.isUpdating??false) {
                              controller.updateMcq(id: widget.id, createAnotherQuestion: false, questionId: controller.eLibraryQuestionResponse.value?.questions?[controller.currentQuestionNumber.value].id??"");
                            }else{
                              await controller.createMcq(id: widget.id, createAnotherQuestion: false).then((value) {
                                controller.questionTypeController.value.text = "";
                                controller.subQuestionTypeController.value.text = "";
                                controller.clearData();
                              });
                            }
                          }
                         },topMargin: 3.h, leftMargin: 1.w
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h)
                ],
              ),
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