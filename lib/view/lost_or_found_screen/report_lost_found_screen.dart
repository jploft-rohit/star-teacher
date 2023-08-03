import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_dropdown_2.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart' as SchoolData;
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/lost_or_found_screen/controller/lost_found_controller.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class CreateLostFound extends StatefulWidget {
  final String type;
  final bool isUpdating;
  const CreateLostFound({Key? key,this.isUpdating = false, required this.type}) : super(key: key);

  @override
  State<CreateLostFound> createState() => _CreateLostFoundState();
}

class _CreateLostFoundState extends State<CreateLostFound> {
  LostFoundController controller = Get.find<LostFoundController>();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void initState() {
    super.initState();
    setData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: widget.isUpdating ? widget.type == "Lost" ? "Update Lost Report" : "Update Found Report" : widget.type == "Lost" ? "Report Lost" : "Report Found"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: controller.formKey,
          child: Obx(()=>SingleChildScrollView(
            child: Column(
                children: [
                  BaseSchoolDropDown(
                    controller: controller.schoolController.value,
                    onChanged: (value) async {
                      controller.schoolController.value.text = value?.name??"";
                      controller.selectedSchoolName.value = value?.name??"";
                      controller.selectedSchoolId.value = value?.sId??"";
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.titleController.value,
                    hintText: translate(context).title,
                    validator: (val){
                      if (controller.titleController.value.text.isEmpty) {
                        return "Please enter title";
                      }
                      return null;
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.dateController.value,
                    hintText: "${widget.type} Date",
                    onTap: (){
                      selectDate(context).then((picked) {
                        if(picked != null){
                          controller.dateController.value.text = formatFlutterDateTime(flutterDateTime: picked,getDayFirst: true);
                        }
                      });
                      },
                    suffixIcon: "assets/images/ic_calendar_black.svg",
                    validator: (val){
                      if (controller.dateController.value.text.isEmpty) {
                        return "Please select found date";
                      }
                      return null;
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.whereController.value,
                    hintText: translate(context).where,
                    validator: (val){
                      if (controller.whereController.value.text.isEmpty) {
                        return "Please enter, where you ${widget.type}";
                      }
                      return null;
                    },
                  ),
                  BaseTextFormField(
                      bottomMargin: 3.h,
                      controller: controller.uploadController.value,
                      hintText: translate(context).upload_photo,
                      suffixIcon: "assets/images/upload_icon.svg",
                      onTap: (){
                        BaseOverlays().showMediaPickerDialog(
                            onCameraClick: () async {
                              BaseOverlays().dismissOverlay();
                              ImagePicker picker = ImagePicker();
                              await picker.pickImage(source: ImageSource.camera).then((value){
                                if (value != null) {
                                  controller.selectedFile?.value = File(value.path);
                                  controller.uploadController.value.text = value.path.split("/").last;
                                }
                              },
                              );
                            },
                            onGalleryClick: () async {
                              BaseOverlays().dismissOverlay();
                              ImagePicker picker = ImagePicker();
                              await picker.pickImage(source: ImageSource.gallery).then((value){
                                if (value != null) {
                                  controller.selectedFile?.value = File(value.path);
                                  controller.uploadController.value.text = value.path.split("/").last;
                                }
                              });
                            },
                            onFilePick: (){
                              BaseOverlays().dismissOverlay();
                              pickFile().then((value) {
                                controller.selectedFile?.value = File(value);
                                controller.uploadController.value.text = (value.split("/").last);
                              });
                            }
                        );
                      },
                  ),
                  BaseButton(
                      title: widget.isUpdating ? translate(context).update : translate(context).submit_btn_txt,
                      onPressed: (){ controller.createLostFound(); },
                      btnType: largeButton,
                  )
                ],
              ),
          ),
          ),
        ),
      ),
    );
  }
  Future<DateTime?> selectDate(BuildContext context) async {
    return showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: BaseColors.primaryColor,
              ),
            ),
            child: child!,
          );
        },
        initialDate: DateTime.now(),
        firstDate: DateTime(1600, 8),
        lastDate: DateTime.now()
    );
  }
  setData(){
    if(widget.isUpdating){
      controller.titleController.value.text = "${widget.type} a book in the computer lab.";
      controller.dateController.value.text = "28-11-2022";
      controller.whereController.value.text = "In Computer Lab";
      controller.uploadController.value.text = "doc.pdf";
    }else{
      controller.titleController.value.text = "";
      controller.dateController.value.text = "";
      controller.whereController.value.text = "";
      controller.uploadController.value.text = "";
    }
  }
}
