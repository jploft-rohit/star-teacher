import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/backend/responses_model/assignment_response.dart';
import 'package:staff_app/backend/responses_model/class_response.dart';
import 'package:staff_app/backend/responses_model/subjects_response.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/dummy_lists.dart';
import 'package:staff_app/view/e_library/controller/e_library_controller.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class CreateELibraryAssignment extends StatefulWidget {
  final bool? isEditing;
  final AssignmentData? data;
  final String title;
  const CreateELibraryAssignment({Key? key, this.isEditing, this.data, required this.title}) : super(key: key);

  @override
  State<CreateELibraryAssignment> createState() => _CreateELibraryAssignmentState();
}

class _CreateELibraryAssignmentState extends State<CreateELibraryAssignment> {
  ELibraryController controller = Get.find<ELibraryController>();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void initState() {
    super.initState();
    controller.setData(isEditing: widget.isEditing,data: widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Create ${widget.title}",),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                BaseTextFormField(
                  hintText: controller.assignmentCategoryCtrl.value.text.isEmpty ? "Assignment Category" : controller.assignmentCategoryCtrl.value.text.trim(),
                  controller: controller.assignmentCategoryCtrl.value,
                  isDropDown: true,
                  onChanged: (newValue){
                    setState(() {
                      controller.assignmentCategoryCtrl.value.text = newValue.toString();
                    });
                  },
                  items: DummyLists().assignmentCategoryList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                  }).toList(),
                  errorText: "Please Select Assignment",
                ),
                BaseTextFormField(
                  hintText: "Title",
                  controller: controller.titleCtrl.value,
                  validator: (val){
                    if (controller.titleCtrl.value.text.trim().isEmpty) {
                      return "Please Enter Title";
                    }
                    return null;
                  },
                  bottomMargin: 1.h,
                ),
                BaseTextFormField(
                  controller: controller.subjectCtrl.value,
                  hintText: controller.subjectCtrl.value.text.isEmpty ? "Subject" : controller.subjectCtrl.value.text.trim(),
                  isDropDown: true,
                  errorText: "Please Select Subject",
                  items: baseCtrl.subjectsList?.map((SubjectsData data){
                    return DropdownMenuItem(
                      value: data,
                      child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                    );
                  }).toList(),
                  onChanged: (value) async {
                    controller.subjectCtrl.value.text = value?.name??"";
                    controller.selectedSubjectId.value = value?.sId??"";
                  },
                ),
                BaseTextFormField(
                  controller: controller.gradeCtrl.value,
                  hintText: controller.gradeCtrl.value.text.isEmpty ? "Class" : controller.gradeCtrl.value.text.trim(),
                  isDropDown: true,
                  errorText: "Please Select Class",
                  items: baseCtrl.classList?.map((ClassData data){
                    return DropdownMenuItem(
                      value: data,
                      child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                    );
                  }).toList(),
                  onChanged: (value) async {
                    controller.gradeCtrl.value.text = value?.name??"";
                    controller.selectedClassId.value = value?.sId??"";
                  },
                ),
                BaseTextFormField(
                    hintText: "Term",
                    controller: controller.termCtrl.value,
                    validator: (val){
                      if (controller.termCtrl.value.text.trim().isEmpty) {
                        return "Please Enter Term";
                      }
                      return null;
                    },
                ),
                BaseButton(
                    title: "SAVE & NEXT",
                    onPressed: (){
                      if (widget.isEditing??false) {
                        controller.editAssignment(id: widget.data?.sId??"");
                      }else{
                        controller.createAssignment();
                      }
                    },
                    topMargin: 3.h,
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
