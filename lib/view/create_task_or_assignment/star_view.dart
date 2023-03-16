import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: TextEditingController(),
          hintText: "Select assigned to:",
          fillColor: CustomColors.txtFieldTextColor,
          readOnly: true,
          onTap: (){
            showGeneralDialog(
              context: context,
              pageBuilder:  (context, animation, secondaryAnimation) {
                return AssignAssignmentPopup1();
              },
            );
          },
          borderRadius: 5.0,
          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: CustomTextField(
                fillColor: CustomColors.txtFieldTextColor,
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
                fillColor: CustomColors.txtFieldTextColor,
                hintText: "Post Time",
                borderRadius: 5.0,
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
          fillColor: CustomColors.txtFieldTextColor,
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
        CustomTextField(
          fillColor: CustomColors.txtFieldTextColor,
          controller: TextEditingController(),
          hintText: "Assign type",
          readOnly: true,
          onTap: (){
            print("adfas");
          },
          borderRadius: 5.0,
          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
        ),
        SizedBox(
          height: 2.h,
        ),
        CustomTextField(
          fillColor: CustomColors.txtFieldTextColor,
          controller: libraryNoCtrl,
          hintText: "Library Assignment No.",
          borderRadius: 5.0,
        ),
        SizedBox(
          height: 2.h,
        ),
        CustomTextField(
          fillColor: CustomColors.txtFieldTextColor,
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
                fillColor: CustomColors.txtFieldTextColor,
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
                fillColor: CustomColors.txtFieldTextColor,
                controller: dueTimeCtrl,
                hintText: "Due Time",
                borderRadius: 5.0,
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
        CustomButton(text: "SUBMIT", onPressed: (){})
      ],
    );
  }
}
