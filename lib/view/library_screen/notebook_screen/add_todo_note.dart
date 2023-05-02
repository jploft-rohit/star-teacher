import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen_ctrl.dart';

class AddToDoNote extends StatefulWidget {
  final bool isEditing;
  const AddToDoNote({Key? key, required this.isEditing}) : super(key: key);

  @override
  State<AddToDoNote> createState() => _AddToDoNoteState();
}

class _AddToDoNoteState extends State<AddToDoNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  NotebookScreenCtrl ctrl = Get.put(NotebookScreenCtrl());

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: widget.isEditing ? "Edit Note" : "Add Note"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 4.0,
                children: List.generate(ctrl.colorList.length, (index) {
                  return Obx(() => GestureDetector(
                        onTap: () {
                          ctrl.selectedColor.value = index;
                        },
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(
                                int.tryParse("0xff${ctrl.colorList[index]}")!),
                          ),
                          child: ctrl.selectedColor.value == index
                              ? SvgPicture.asset(
                                  "assets/images/selected_color_img.svg",
                                  fit: BoxFit.scaleDown,
                                )
                              : SizedBox(),
                        ),
                      ));
                }),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: titleController,
                hintText: "Title",
                borderRadius: 4.0,
                fillColor: BaseColors.txtFieldTextColor,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: descriptionController,
                hintText: "Type here..",
                borderRadius: 4.0,
                fillColor: BaseColors.txtFieldTextColor,
                maxLine: null,
              ),
              SizedBox(
                height: 1.h,
              ),
              GestureDetector(
                onTap: () {
                  ctrl.isChecked.value = !ctrl.isChecked.value;
                },
                child: Row(
                  children: [
                    GetBuilder<NotebookScreenCtrl>(
                      builder: (ctrl) {
                        return GestureDetector(
                          onTap: () {
                            ctrl.isChecked.value = !ctrl.isChecked.value;
                            ctrl.update();
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            // padding: const EdgeInsets.symmetric(horizontal: 9),
                            decoration: BoxDecoration(
                                color: ctrl.isChecked.value == true
                                    ? BaseColors.backgroundColor
                                    : BaseColors.borderColor,
                                boxShadow: [getLightBoxShadow()],
                                border: ctrl.isChecked.value == true
                                    ? Border.all(
                                        color: BaseColors.primaryColor,
                                        width: 1.5)
                                    : Border.all(
                                        color: Colors.transparent, width: 1.5),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: BaseColors.white, width: 1.5),
                                  shape: BoxShape.circle,
                                  boxShadow: [getBoxShadow()],
                                  color: ctrl.isChecked.value == true
                                      ? BaseColors.primaryColor
                                      : BaseColors.borderColor),
                              child: Center(
                                child: Icon(Icons.check,
                                    color: BaseColors.white, size: 16.sp),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    addText("Set Reminder", 14.sp, BaseColors.textBlackColor,
                        FontWeight.w400)
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                  child: BaseButton(
                      title: widget.isEditing?"UPDATE":"SUBMIT",
                      onPressed: () {
                        Get.back();
                      },btnType: largeButton,))
            ],
          ),
        ),
      ),
    );
  }

  setData() {
    if (widget.isEditing) {
      titleController.text = "To Do List";
      descriptionController.text =
          "■ Hang washing\n\n■ Hang washing\n\n■ Hang washing";
    }
  }
}
