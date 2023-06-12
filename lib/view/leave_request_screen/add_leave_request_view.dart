import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/leave_type_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/leave_request_screen/controller/leave_request_ctrl.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class AddLeaveRequestView extends StatefulWidget {
  final bool? isUpdating;
  const AddLeaveRequestView({Key? key, this.isUpdating}) : super(key: key);

  @override
  State<AddLeaveRequestView> createState() => _AddLeaveRequestViewState();
}

class _AddLeaveRequestViewState extends State<AddLeaveRequestView> {

  LeaveRequestCtrl controller = Get.find<LeaveRequestCtrl>();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void initState() {
    super.initState();
    controller.setData(isUpdating: widget.isUpdating??false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: translate(context).leave_request),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Obx(()=> Form(
            key: controller.formKey,
            child: Column(
                children: [
                  BaseTextFormField(
                    controller: controller.selectSchoolController.value,
                    errorText: "Please select school",
                    isDropDown: true,
                    hintText: controller.selectSchoolController.value.text.isEmpty ? "Select School" : controller.selectSchoolController.value.text,
                    items: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
                      return DropdownMenuItem<SchoolData>(
                        value: data,
                        child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                      );
                    }).toList(),
                    onChanged: (value) async {
                      controller.selectSchoolController.value.text = value?.name??"";
                      controller.selectedSchoolId.value = value?.sId??"";
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.leaveTypeController.value,
                    title: translate(context).leave_type,
                    hintText: controller.leaveTypeController.value.text.isEmpty ? translate(context).leave_type : controller.leaveTypeController.value.text,
                    isDropDown: true,
                    errorText: "Please select leave type",
                    items: controller.leaveTypeList?.map((LeaveTypeData data) {
                    return DropdownMenuItem<LeaveTypeData>(
                      value: data,
                      child: addText(data.name??"", 16.sp, Colors.black, FontWeight.w400));
                    }).toList(),
                    onChanged: (value){
                      controller.leaveTypeController.value.text = value.name??"";
                      controller.selectedLeaveTypeId.value = value.sId??"";
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.startDateController.value,
                    title: "${translate(context).leave_start}:",
                    prefixIcon: calenderDateSvg,
                    hintText: "dd/mm/yyyy",
                    validator: (val){
                      if (controller.startDateController.value.text.isEmpty) {
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
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year+1)
                      ).then((picked){
                        if (picked != null) {
                          controller.startDateController.value.text = "${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}";
                          controller.formKey.currentState?.validate();
                        }
                      });
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.endDateController.value,
                    title: "${translate(context).leave_end}:",
                    prefixIcon: calenderDateSvg,
                    hintText: "dd/mm/yyyy",
                    validator: (val){
                      if (controller.endDateController.value.text.isEmpty) {
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
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year+1)
                      ).then((picked){
                        if (picked != null) {
                          controller.endDateController.value.text = "${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}";
                          controller.formKey.currentState?.validate();
                        }
                        },
                      );
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.reasonController.value,
                    title: "${translate(context).reason}:",
                    hintText: "Type here...",
                    validator: (val){
                      if (controller.reasonController.value.text.isEmpty) {
                        return "Please enter reason";
                      }
                      return null;
                    },
                    onChanged: (val){
                      controller.formKey.currentState?.validate();
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.uploadController.value,
                    hintText: translate(context).upload_file_or_photo,
                    suffixIcon: "assets/images/upload_icon.svg",
                    onTap: (){
                      BaseOverlays().showMediaPDFPhotoDialog(onFileClick: () async {
                        BaseOverlays().dismissOverlay();
                        File uploadID;
                        var uploadImage = await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          allowedExtensions: ['pdf'],
                          type: FileType.custom,
                        );
                        if(uploadImage != null)
                        {
                          uploadID = File(uploadImage.files.first.path??"");
                          controller.selectedFile?.value = uploadID;
                          setState(() {});
                          controller.uploadController.value.text = uploadID.path.split("/").last;
                        }
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
                        }
                      );
                    },
                    bottomMargin: 10.h,
                  ),
                  // Image.file(File()),
                  BaseButton(title: translate(context).submit_btn_txt, onPressed: (){
                    controller.create();
                  },btnType: largeButton)
                ],
              ),
          ),
          ),
        ),
      ),
    );
  }
}
