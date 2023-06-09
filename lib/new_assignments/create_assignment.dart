import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/new_assignments/controller/new_assignment_ctrl.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import '../../utility/images_icon_path.dart';
import '../../utility/sizes.dart';

class CreateAssignment extends StatefulWidget {
  const CreateAssignment({Key? key}) : super(key: key);

  @override
  State<CreateAssignment> createState() => _CreateAssignmentState();
}

class _CreateAssignmentState extends State<CreateAssignment> with SingleTickerProviderStateMixin{
  NewAssignmentCtrl controller = Get.find<NewAssignmentCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Create Assignment"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: scaffoldPadding),
          child: Column(
            children: [
              BaseTextFormField(
                topMargin: 2.h,
                controller: controller.assignmentNumberCtrl.value,
                hintText: "Assignments Number  :",
              ),
              BaseTextFormField(
                controller: controller.assignmentTypeCtrl.value,
                hintText: "Assignments Type  :",
              ),
              BaseTextFormField(
                controller: controller.assignmentToCtrl.value,
                hintText: "Assignments To",
                isDropDown: true,
                bottomMargin: 3.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: BaseTextFormField(
                      rightMargin: 1.w,
                      controller: controller.postDateCtrl.value,
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
                      controller: controller.postTimeCtrl.value,
                      hintText: "Post Time",
                      onTap: (){
                        selectTime(context);
                      },
                      suffixIcon: "assets/images/time_icon1.svg",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: BaseTextFormField(
                      rightMargin: 1.w,
                      controller: controller.submitDateCtrl.value,
                      suffixIcon: calenderDateSvg,
                      hintText: "Submit Date",
                      onTap: (){
                        selectDate(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: BaseTextFormField(
                      leftMargin: 1.w,
                      controller: controller.submitTimeCtrl.value,
                      hintText: "Submit Time",
                      onTap: (){
                        selectTime(context);
                      },
                      suffixIcon: "assets/images/time_icon1.svg",
                    ),
                  ),
                ],
              ),
              BaseTextFormField(
                controller: controller.dueDateCtrl.value,
                suffixIcon: calenderDateSvg,
                hintText: "Due Date (Optional)",
                onTap: (){
                  selectDate(context);
                },
              ),
              BaseTextFormField(
                controller: controller.supportDocCtrl.value,
                suffixIcon: calenderDateSvg,
                hintText: "Support Doc (Optional)",
                onTap: (){
                  selectDate(context);
                },
              ),
              BaseTextFormField(
                controller: controller.linkCtrl.value,
                hintText: "Link (Optional)",
              ),
              BaseButton(title: "SUBMIT", onPressed: (){
                Get.back();
              },btnType: largeButton,),
            ],
          ),
        ),
      ),
    );
  }
}