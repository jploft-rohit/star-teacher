import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_dropdown.dart';
import 'package:staff_app/Utility/base_textformfield.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/create_task_or_assignment/assign_assignment_popup.dart';

class CreateTaskStaffView extends StatefulWidget {
  const CreateTaskStaffView({Key? key}) : super(key: key);

  @override
  State<CreateTaskStaffView> createState() => _CreateTaskStaffViewState();
}

class _CreateTaskStaffViewState extends State<CreateTaskStaffView> {
  TextEditingController startDateCtrl = TextEditingController();
  TextEditingController postTimeCtrl = TextEditingController();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController libraryNoCtrl = TextEditingController();
  TextEditingController dueDateCtrl = TextEditingController();
  TextEditingController dueTimeCtrl = TextEditingController();
  TextEditingController assignedController = TextEditingController();
  TextEditingController assignTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BaseTextFormField(
            controller: assignedController,
            hintText: "Select assigned to:",
            suffixIcon: "assets/images/ic_down.svg",
            onTap: (){
              showGeneralDialog(
                context: context,
                pageBuilder:  (context, animation, secondaryAnimation) {
                  return AssignAssignmentPopup();
                },
              );
            },
          ),
          Row(
            children: [
              Expanded(
                child: BaseTextFormField(
                  rightMargin: 1.w,
                  controller: startDateCtrl,
                  suffixIcon: calenderDateSvg,
                  hintText: "Post Date",
                  onTap: (){
                    selectDate(context);
                  },
                ),
              ),
              Expanded(
                child: BaseTextFormField(
                  leftMargin: 1.w,
                  controller: postTimeCtrl,
                  hintText: "Post Time",
                  onTap: (){
                    selectTime(context);
                  },
                  suffixIcon: "assets/images/time_icon1.svg",
                ),
              ),
            ],
          ),
          BaseTextFormField(
            controller: titleCtrl,
            hintText: "Title",
          ),
          BaseTextFormField(
            controller: descriptionCtrl,
            hintText: "Description",
          ),
          BaseTextFormField(
            controller: assignTypeController,
            isDropDown: true,
            hintText: "Assign type",
            dropDownValue: assignTypeController.text,
            onChanged: (newValue){
              setState(() {
                assignTypeController.text = newValue.toString();
              });},
            items: DummyLists().list1.map((value) {
              return DropdownMenuItem(
                value: value,
                child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
            }).toList(),
          ),
          BaseTextFormField(
            controller: libraryNoCtrl,
            hintText: "Library Assignment No.",
          ),
          BaseTextFormField(
            controller: TextEditingController(),
            hintText: "Upload file",
            suffixIcon: "assets/images/upload_icon.svg",
            onTap: (){},
          ),
          Row(
            children: [
              Expanded(
                child: BaseTextFormField(
                  rightMargin: 1.w,
                  controller: dueDateCtrl,
                  hintText: "Due Date",
                  suffixIcon: calenderDateSvg,
                  onTap: (){selectDate(context);},
                ),
              ),
              Expanded(
                child: BaseTextFormField(
                  leftMargin: 1.w,
                  controller: dueTimeCtrl,
                  hintText: "Due Time",
                  onTap: (){
                    selectTime(context);
                  },
                  suffixIcon: "assets/images/time_icon1.svg",
                ),
              ),
            ],
          ),
          BaseButton(title: "SUBMIT", onPressed: (){},btnType: largeButton,),
        ],
      ),
    );
  }
}
