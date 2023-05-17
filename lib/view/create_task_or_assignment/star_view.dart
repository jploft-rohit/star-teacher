import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/view/create_task_or_assignment/assign_assignment_popup_1.dart';

class CreateTaskStarView extends StatefulWidget {
  const CreateTaskStarView({Key? key}) : super(key: key);

  @override
  State<CreateTaskStarView> createState() => _CreateTaskStarViewState();
}

class _CreateTaskStarViewState extends State<CreateTaskStarView> {
  TextEditingController startDateCtrl = TextEditingController();
  TextEditingController postTimeCtrl = TextEditingController();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController libraryNoCtrl = TextEditingController();
  TextEditingController dueDateCtrl = TextEditingController();
  TextEditingController dueTimeCtrl = TextEditingController();
  TextEditingController assignTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(
            controller: TextEditingController(),
            hintText: "Select assigned to:",
            fillColor: BaseColors.txtFieldTextColor,
            readOnly: true,
            onTap: (){
              showGeneralDialog(
                context: context,
                pageBuilder:  (context, animation, secondaryAnimation) {
                  return const AssignAssignmentPopup1();
                },
              );
            },
            borderRadius: 5.0,
            suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: CustomTextField(
                  fillColor: BaseColors.txtFieldTextColor,
                  controller: startDateCtrl,
                  hintText: "Post Date",
                  borderRadius: 5.0,
                  readOnly: true,
                  onTap: (){
                    selectDate(context);
                  },
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: SvgPicture.asset(calenderDateSvg),
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Flexible(
                flex: 1,
                child: CustomTextField(
                  controller: postTimeCtrl,
                  fillColor: BaseColors.txtFieldTextColor,
                  hintText: "Post Time",
                  borderRadius: 5.0,
                  onTap: (){
                    selectTime(context);
                  },
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: SvgPicture.asset("assets/images/time_icon1.svg"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextField(
            fillColor: BaseColors.txtFieldTextColor,
            controller: titleCtrl,
            hintText: "Title",
            borderRadius: 5.0,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextField(
            controller: descriptionCtrl,
            hintText: "Description",
            maxLine: 3,
            borderRadius: 5.0,
          ),
          SizedBox(
            height: 2.h,
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
          CustomTextField(
            fillColor: BaseColors.txtFieldTextColor,
            controller: libraryNoCtrl,
            hintText: "Library Assignment No.",
            borderRadius: 5.0,
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextField(
            fillColor: BaseColors.txtFieldTextColor,
            controller: TextEditingController(),
            hintText: "Upload file",
            readOnly: true,
            onTap: (){
              print("adfas");
            },
            borderRadius: 5.0,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: SvgPicture.asset("assets/images/upload_icon.svg"),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: CustomTextField(
                  fillColor: BaseColors.txtFieldTextColor,
                  controller: dueDateCtrl,
                  hintText: "Due Date",
                  borderRadius: 5.0,
                  readOnly: true,
                  onTap: (){
                    selectDate(context);
                  },
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: SvgPicture.asset(calenderDateSvg),
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Flexible(
                flex: 1,
                child: CustomTextField(
                  fillColor: BaseColors.txtFieldTextColor,
                  controller: dueTimeCtrl,
                  hintText: "Due Time",
                  borderRadius: 5.0,
                  onTap: (){
                    selectTime(context);
                  },
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: SvgPicture.asset("assets/images/time_icon1.svg"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          BaseButton(title: "SUBMIT", onPressed: (){},btnType: largeButton,),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
