import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/sticky_notes_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/view/library_screen/ctrl/notebook_ctrl.dart';
import 'package:staff_app/view/my_notes/ctrl/sticky_note_ctrl.dart';

class AddToDoNote extends StatefulWidget {
  final bool isEditing;
  final StickyNotesData? data;
  const AddToDoNote({Key? key, required this.isEditing, this.data}) : super(key: key);

  @override
  State<AddToDoNote> createState() => _AddToDoNoteState();
}

class _AddToDoNoteState extends State<AddToDoNote> {
  NotebookCtrl ctrl = Get.put(NotebookCtrl());
  StickyNoteCtrl controller = Get.find<StickyNoteCtrl>();

  @override
  void initState() {
    super.initState();
    controller.setData(isUpdating: widget.isEditing,data: widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: widget.isEditing ? "Edit Note" : "Add Note"),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 4,
                  children: List.generate(controller.colorList.length, (index) {
                    return Obx(() => GestureDetector(
                          onTap: () {
                            controller.selectedColorIndex.value = index;
                          },
                          child: Container(
                            height: 27,
                            width: 27,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(
                                  int.tryParse("0xff${controller.colorList[index]}")!),
                            ),
                            child: controller.selectedColorIndex.value == index
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
                  controller: controller.titleController.value,
                  hintText: "Title",
                  borderRadius: 4.0,
                  fillColor: BaseColors.txtFieldTextColor,
                  validator: (val){
                    if (controller.titleController.value.text.isEmpty) {
                      return "Please enter title";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                  controller: controller.descriptionController.value,
                  hintText: "Type here..",
                  borderRadius: 4.0,
                  fillColor: BaseColors.txtFieldTextColor,
                  maxLine: null,
                  validator: (val){
                    if (controller.descriptionController.value.text.isEmpty) {
                      return "Please enter description";
                    }
                    return null;
                  },
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
                      GetBuilder<NotebookCtrl>(
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
                          if (widget.isEditing) {
                            controller.updateStickyNote(color: controller.colorList[controller.selectedColorIndex.value], id: widget.data?.sId??"");
                          }else{
                            controller.createStickyNote(color: controller.colorList[controller.selectedColorIndex.value]);
                          }
                        },btnType: largeButton,))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.titleController.value.text = "";
    controller.descriptionController.value.text = "";
    controller.selectedColorIndex.value = 0;
    super.dispose();
  }
}
