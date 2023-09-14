import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/online_class_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/request_online_classes/controller/online_class_request_controller.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class CreateOnlineClassRequest extends StatefulWidget {
  final bool isUpdating;
  final OnlineClassRequestData? data;
  const CreateOnlineClassRequest({Key? key,this.isUpdating = false, this.data}) : super(key: key);

  @override
  State<CreateOnlineClassRequest> createState() => _CreateOnlineClassRequestState();
}

class _CreateOnlineClassRequestState extends State<CreateOnlineClassRequest> {
  OnlineClassRequestController controller = Get.find<OnlineClassRequestController>();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void initState() {
    super.initState();
    controller.setData(isUpdating: widget.isUpdating, data: widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.screenBackgroundColor,
      appBar: BaseAppBar(title: widget.isUpdating ? translate(context).online_class_edit : translate(context).online_class_request),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                BaseSchoolDropDown(
                  controller: controller.schoolController,
                  onChanged: (value) async {
                    controller.schoolController.text = value?.name??"";
                    controller.selectedSchoolId.value = value?.sId??"";
                  },
                ),
                BaseTextFormField(
                  controller: controller.fromDateController,
                  title: "${translate(context).from_date}:",
                  prefixIcon: calenderDateSvg,
                  hintText: translate(context).dd_mm_yyyy,
                  validator: (val){
                    if (controller.fromDateController.text.isEmpty) {
                      return translate(context).please_select_start_date;
                    }
                    return null;
                  },
                  onTap: (){
                    showDatePicker(
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
                        initialDate: controller.fromDateController.text.isEmpty ? DateTime.now() : DateTime.parse(flipDate(date: controller.fromDateController.text.trim())),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year+1)
                    ).then((value){
                      if (value != null) {
                        if (controller.toDateController.text.trim().isNotEmpty) {
                          DateTime endDate = DateTime.parse(flipDate(date: controller.toDateController.text.trim()));
                          if (endDate.isAfter(value)) {
                            controller.fromDateController.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                          }else{
                            baseToast(message: "\"${translate(context).start_date}\" ${translate(context).cant_be_more_than} \"${translate(context).end_date}\"");
                          }
                        }else{
                          controller.fromDateController.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                        }
                      }
                    });
                  },
                ),
                BaseTextFormField(
                  controller: controller.toDateController,
                  title: "${translate(context).to_date}:",
                  prefixIcon: calenderDateSvg,
                  hintText: translate(context).dd_mm_yyyy,
                  validator: (val){
                    if (controller.toDateController.text.isEmpty) {
                      return translate(context).please_select_end_date;
                    }
                    return null;
                  },
                  onTap: (){
                    showDatePicker(
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
                        initialDate: controller.toDateController.text.isEmpty ? DateTime.now() : DateTime.parse(flipDate(date: controller.toDateController.text.trim())),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year+1)
                    ).then((value){
                      if (value != null) {
                        if (controller.fromDateController.text.trim().isNotEmpty) {
                          DateTime startDate = DateTime.parse(flipDate(date: controller.fromDateController.text.trim()));
                           if (startDate.isBefore(value)) {
                            controller.toDateController.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                           }else{
                            baseToast(message: "\"${translate(context).end_date}\" ${translate(context).cant_be_less_than} \"${translate(context).start_date}\"");
                           }
                        }else{
                          controller.toDateController.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                        }
                      }
                    },
                    );
                  },
                ),
                BaseTextFormField(
                  controller: controller.reasonController,
                  title: "${translate(context).reason}:",
                  hintText: translate(context).type_here,
                  validator: (val){
                    if(controller.reasonController.text.isEmpty){
                      return translate(context).please_enter_reason;
                    }
                    return null;
                  },
                ),
                BaseTextFormField(
                  controller: controller.uploadController,
                  hintText: translate(context).upload_file_or_photo,
                  suffixIcon: "assets/images/upload_icon.svg",
                  onTap: (){
                    BaseOverlays().showMediaPickerDialog(onCameraClick: () async {
                      BaseOverlays().dismissOverlay();
                      ImagePicker picker = ImagePicker();
                      await picker.pickImage(source: ImageSource.camera).then((value){
                        if (value != null) {
                          controller.selectedFile?.value = File(value.path);
                          controller.uploadController.text = value.path.split("/").last;
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
                              controller.uploadController.text = value.path.split("/").last;
                            }
                          });
                        },
                        onFilePick: (){
                          BaseOverlays().dismissOverlay();
                          pickFile().then((value) {
                            controller.selectedFile?.value = File(value);
                            controller.uploadController.text = (value.split("/").last);
                          });
                        }
                    );
                  },
                  bottomMargin: 10.h,
                ),
                SizedBox(
                  height: 5.h,
                ),
                BaseButton(title: translate(context).submit_btn_txt, onPressed: (){
                  if (widget.isUpdating) {
                    controller.updateData(id: widget.data?.sId??"");
                  }else{
                    controller.createData();
                  }
                },btnType: largeButton),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
