import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_dropdown.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/create_task_or_assignment/assign_assignment_popup.dart';
import 'package:staff_app/view/create_task_or_assignment/create_task_or_assignment_screen_ctrl.dart';
import 'package:staff_app/view/create_task_or_assignment/parent_view.dart';
import 'package:staff_app/view/create_task_or_assignment/staff_view.dart';
import 'package:staff_app/view/create_task_or_assignment/star_view.dart';
import 'package:staff_app/view/worksheet/create_worksheet/create_question_1_screen.dart';
import 'package:staff_app/view/worksheet/worksheet_ctrl.dart';

import '../../../utility/images_icon_path.dart';
import '../../../utility/sizes.dart';

class CreateWorkSheet extends StatefulWidget {
  const CreateWorkSheet({Key? key}) : super(key: key);

  @override
  State<CreateWorkSheet> createState() => _CreateWorkSheetState();
}

class _CreateWorkSheetState extends State<CreateWorkSheet> with SingleTickerProviderStateMixin{
  WorkSheetCtrl controller = Get.put(WorkSheetCtrl());

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
    return Scaffold(
      appBar: BaseAppBar(title: "Create Worksheet"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: scaffoldPadding),
          child: Column(
            children: [
              BaseTextFormField(
                topMargin: 2.h,
                controller: assignedController,
                hintText: "Title",
                isDropDown: true,
                suffixIcon: "assets/images/ic_down.svg",
                onTap: (){
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: BaseTextFormField(
                      rightMargin: 1.w,
                      controller: startDateCtrl,
                      suffixIcon: calenderDateSvg,
                      hintText: "Date",
                      onTap: (){
                        selectDate(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: BaseTextFormField(
                      leftMargin: 1.w,
                      controller: postTimeCtrl,
                      hintText: "Time",
                      onTap: (){
                        selectTime(context);
                      },
                      suffixIcon: "assets/images/time_icon1.svg",
                    ),
                  ),
                ],
              ),
              BaseTextFormField(
                rightMargin: 1.w,
                controller: startDateCtrl,
                suffixIcon: calenderDateSvg,
                hintText: "Due Date (Optional)",
                onTap: (){
                  selectDate(context);
                },
              ),
              BaseTextFormField(
                controller: descriptionCtrl,
                hintText: "Assigned To",
                isDropDown: true,
              ),
              BaseTextFormField(
                controller: descriptionCtrl,
                hintText: "Description",
                maxLine: 4,
              ),
              BaseButton(title: "SUBMIT", onPressed: (){
                Get.to(CreateQuestion1());
              },btnType: largeButton,),
            ],
          ),
        ),
      ),
    );
  }
}