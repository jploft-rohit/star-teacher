import 'dart:io';

import 'package:file_picker/file_picker.dart';
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
import 'package:staff_app/view/leave_request_screen/controller/leave_request_ctrl.dart';

class UploadEvidencePopup extends StatefulWidget {
  final String id;
  const UploadEvidencePopup({Key? key, required this.id}) : super(key: key);

  @override
  State<UploadEvidencePopup> createState() => _UploadEvidencePopupState();
}

class _UploadEvidencePopupState extends State<UploadEvidencePopup> {
  TextEditingController titleCtrl = TextEditingController();
  LeaveRequestCtrl controller = Get.find<LeaveRequestCtrl>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.clearForm();
    });
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
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.all(20.sp),
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
                    controller: controller.reasonController.value,
                      hintText: translate(context).reason,
                      bottomMargin: 1.h,
                    validator: (val){
                      if((val??"").isEmpty){
                        return "Please Enter Reason";
                      }
                      return null;
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.startDateController.value,
                    suffixIcon: calenderDateSvg,
                    hintText: translate(context).from_date,
                    onTap: (){
                      showDatePicker(
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
                          initialDate: controller.startDateController.value.text.isEmpty ? DateTime.now() : DateTime.parse(flipDate(date: controller.startDateController.value.text.trim())),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year+2)
                      ).then((value){
                        if (value != null) {
                          if (controller.endDateController.value.text.trim().isNotEmpty) {
                            DateTime endDate = DateTime.parse(flipDate(date: controller.endDateController.value.text.trim()));
                            if (endDate.isAfter(value)) {
                              controller.startDateController.value.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                            }else{
                              baseToast(message: "\"Start Date\" can't be more than \"End Date\"");
                            }
                          }else{
                            controller.startDateController.value.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                          }
                        }
                      });
                    },
                    bottomMargin: 1.h,
                    validator: (val){
                      if((val??"").isEmpty){
                        return "Please Select From Date";
                      }
                      return null;
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.endDateController.value,
                    hintText: translate(context).to_date,
                    suffixIcon: calenderDateSvg,
                    bottomMargin: 1.h,
                    validator: (val){
                      if((val??"").isEmpty){
                        return "Please Select To Date";
                      }
                      return null;
                    },
                    onTap: (){
                      showDatePicker(
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
                          initialDate: controller.endDateController.value.text.isEmpty ? DateTime.now() : DateTime.parse(flipDate(date: controller.endDateController.value.text.trim())),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year+2)
                      ).then((value){
                        if (value != null) {
                          if (controller.startDateController.value.text.trim().isNotEmpty) {
                            DateTime startDate = DateTime.parse(flipDate(date: controller.startDateController.value.text.trim()));
                            if (startDate.isBefore(value)) {
                              controller.endDateController.value.text = formatFlutterDateTime(flutterDateTime: value,getDayFirst: true);
                            }else{
                              baseToast(message: "\"End Date\" can't be less than \"Start Date\"");
                            }
                          }else{
                            controller.endDateController.value.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                          }
                          // controller.formKey.currentState?.validate();
                        }
                      },
                      );
                    },
                  ),
                  BaseTextFormField(controller: controller.uploadController.value,
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
                      BaseOverlays().showMediaPickerDialog(
                          onCameraClick: () async {
                        BaseOverlays().dismissOverlay();
                        ImagePicker picker = ImagePicker();
                        await picker.pickImage(source: ImageSource.camera).then((value){
                          if (value != null) {
                            controller.selectedFile?.value = File(value.path);
                            controller.uploadController.value.text = value.path.split("/").last;
                             }
                           });
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
