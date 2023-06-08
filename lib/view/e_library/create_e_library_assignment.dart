import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/dummy_lists.dart';
import 'package:staff_app/utility/utility.dart';
import 'package:staff_app/view/e_library/controller/e_library_controller.dart';
import 'package:staff_app/view/e_library/questions/question1.dart';

class CreateELibraryAssignment extends StatefulWidget {
  final bool? isEditing;
  const CreateELibraryAssignment({Key? key, this.isEditing}) : super(key: key);

  @override
  State<CreateELibraryAssignment> createState() => _CreateELibraryAssignmentState();
}

class _CreateELibraryAssignmentState extends State<CreateELibraryAssignment> {
  ELibraryController controller = Get.find<ELibraryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "${(widget.isEditing??false) ? "Edit" : "Create"} E-Library",),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            children: [
              BaseTextFormField(
                hintText: controller.assignmentCategoryCtrl.value.text.isEmpty ? "Assignment Category" : controller.assignmentCategoryCtrl.value.text.trim(),
                controller: controller.assignmentCategoryCtrl.value,
                isDropDown: true,
                onChanged: (newValue){
                  setState(() {
                    controller.assignmentCategoryCtrl.value.text = newValue.toString();
                  });},
                items: DummyLists().assignmentCategoryList.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                }).toList(),
              ),
              BaseTextFormField(hintText: "Title",controller: TextEditingController()),
              BaseTextFormField(hintText: "Subject",controller: TextEditingController()),
              BaseTextFormField(hintText: "Grade",controller: TextEditingController()),
              BaseTextFormField(hintText: "Term",controller: TextEditingController()),
              BaseButton(title: "SAVE & NEXT", onPressed: (){
                Get.to(const Question1());
              },topMargin: 3.h),
            ],
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
