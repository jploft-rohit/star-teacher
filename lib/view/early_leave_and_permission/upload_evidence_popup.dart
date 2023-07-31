import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/early_leave_and_permission/controller/early_leave_controller.dart';

class UploadEvidencePopup extends StatefulWidget {
  final String id;
  const UploadEvidencePopup({Key? key, required this.id}) : super(key: key);

  @override
  State<UploadEvidencePopup> createState() => _UploadEvidencePopupState();
}

class _UploadEvidencePopupState extends State<UploadEvidencePopup> {
  TextEditingController titleCtrl = TextEditingController();
  EarlyLeaveController controller = Get.find<EarlyLeaveController>();

  @override
  void initState() {
    super.initState();
    controller.setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(""),
                      Text(translate(context).upload_evidence, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  BaseTextFormField(
                    controller: controller.reasonController,
                      hintText: translate(context).reason,
                      bottomMargin: 1.h,
                      validator: (val){
                        if (controller.reasonController.text.trim().isEmpty) {
                          return "Please Enter Reason";
                        }
                        return null;
                      },
                  ),
                  BaseTextFormField(
                    controller: controller.outTimeController,
                    suffixIcon: "assets/images/time_icon1.svg",
                    hintText: "Out Time",
                    onTap: (){
                      showTimePicker(
                        context: context,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: BaseColors.primaryColor,
                              ),
                            ),
                            child: child!,
                          );
                        },
                        initialTime: TimeOfDay.now(),
                      ).then((picked){
                        if (picked != null) {
                          print(picked.to24hours());
                          controller.outTimeController.text = (picked.to24hours())+(":00");
                        }
                      });
                    },
                    validator: (val){
                      if (controller.outTimeController.text.trim().isEmpty) {
                        return "Please Select Out Time";
                      }
                      return null;
                    },
                    bottomMargin: 1.h,
                  ),
                  BaseTextFormField(
                    controller: controller.inTimeController,
                    hintText: "In Time",
                    suffixIcon: "assets/images/time_icon1.svg",
                    bottomMargin: 1.h,
                    onTap: (){
                      showTimePicker(
                        context: context,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: BaseColors.primaryColor,
                              ),
                            ),
                            child: child!,
                          );
                        },
                        initialTime: TimeOfDay.now(),
                      ).then((picked){
                        if (picked != null) {
                          print(picked.to24hours());
                          controller.inTimeController.text = (picked.to24hours())+(":00");
                        }
                      });
                    },
                    validator: (val){
                      if (controller.inTimeController.text.trim().isEmpty) {
                        return "Please Select In Time";
                      }
                      return null;
                    },
                  ),
                  BaseTextFormField(controller: titleCtrl,
                    hintText: translate(context).upload_file,
                    bottomMargin: 3.h,
                    suffixIcon: "assets/images/upload_icon.svg",
                    validator: (val){
                    if((val??"").isEmpty){
                      return "Please select file or photo";
                    }
                    return null;
                    },
                    onTap: (){
                      BaseOverlays().showMediaPickerDialog(onCameraClick: () async {
                        BaseOverlays().dismissOverlay();
                        ImagePicker picker = ImagePicker();
                        await picker.pickImage(source: ImageSource.camera).then((value){
                          if (value != null) {
                            controller.selectedFile?.value = File(value.path);
                            controller.uploadController.text = value.path.split("/").last;
                          }
                        });
                      },
                          onGalleryClick: () async {
                            BaseOverlays().dismissOverlay();
                            ImagePicker picker = ImagePicker();
                            await picker.pickImage(source: ImageSource.gallery).then((value){
                              if (value != null) {
                                controller.selectedFile?.value = File(value.path);
                                titleCtrl.text = value.path.split("/").last;
                              }
                            });
                          }
                      );
                    },
                  ),
                  BaseButton(
                      btnType: dialogButton,
                      title: translate(context).submit_btn_txt,
                      onPressed: (){
                        if(controller.formKey.currentState?.validate()??false){
                          controller.uploadEvidence(id: widget.id);
                        }
                      },
                      removeHorizontalPadding: true,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
