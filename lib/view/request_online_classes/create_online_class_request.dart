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
      appBar: BaseAppBar(title: widget.isUpdating ? "Online Class Edit" : translate(context).online_class_request),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                BaseTextFormField(
                  controller: controller.schoolController,
                  errorText: "Please Select School",
                  isDropDown: true,
                  hintText: controller.schoolController.text.isEmpty ? "Select School" : controller.schoolController.text,
                  items: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
                    return DropdownMenuItem(
                      value: data,
                      child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                    );
                  }).toList(),
                  onChanged: (value) async {
                    controller.schoolController.text = value?.name??"";
                    controller.selectedSchoolId.value = value?.sId??"";
                  },
                ),
                BaseTextFormField(
                  controller: controller.fromDateController,
                  title: "${translate(context).leave_start}:",
                  prefixIcon: calenderDateSvg,
                  hintText: "dd/mm/yyyy",
                  validator: (val){
                    if (controller.fromDateController.text.isEmpty) {
                      return "Please select start date";
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
                            baseToast(message: "\"Start Date\" can't be more than \"End Date\"");
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
                  title: "${translate(context).leave_end}:",
                  prefixIcon: calenderDateSvg,
                  hintText: "dd/mm/yyyy",
                  validator: (val){
                    if (controller.toDateController.text.isEmpty) {
                      return "Please select end date";
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
                            baseToast(message: "\"End Date\" can't be less than \"Start Date\"");
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
                  hintText: "Type here...",
                  validator: (val){
                    if(controller.reasonController.text.isEmpty){
                      return "Please Enter Reason";
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
