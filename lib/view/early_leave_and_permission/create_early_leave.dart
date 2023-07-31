import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/early_leave_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/early_leave_and_permission/controller/early_leave_controller.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import '../../Utility/images_icon_path.dart';

class CreateEarlyLeave extends StatefulWidget {
  final bool? isUpdating;
  final EarlyLeaveData? data;
  const CreateEarlyLeave({Key? key, this.isUpdating, this.data}) : super(key: key);

  @override
  State<CreateEarlyLeave> createState() => _CreateEarlyLeaveState();
}

class _CreateEarlyLeaveState extends State<CreateEarlyLeave> {

  EarlyLeaveController controller = Get.find<EarlyLeaveController>();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void initState() {
    super.initState();
    controller.setData(isUpdating: widget.isUpdating, data: widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: "${(widget.isUpdating??false)? "Edit" : "Add"} Early Leave & Permission"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
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
                SizedBox(height: 1.h),
                BaseTextFormField(
                  controller: controller.dateController,
                  title: translate(context).date,
                  prefixIcon: calenderDateSvg,
                  hintText: "dd/mm/yyyy",
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
                        lastDate: DateTime((DateTime.now().year+50),1,1),
                    ).then((picked){
                      if (picked != null) {
                        controller.dateController.text = formatFlutterDateTime(flutterDateTime: picked, getDayFirst: true);
                      }
                    });
                  },
                  validator: (val){
                    if (controller.dateController.text.trim().isEmpty) {
                      return "Please Select Date";
                    }
                    return null;
                  },
                ),
                BaseTextFormField(
                  controller: controller.outTimeController,
                  title: "Out Time",
                  prefixIcon: "assets/images/time_icon1.svg",
                  hintText: "Time",
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
                ),
                BaseTextFormField(
                  controller: controller.inTimeController,
                  title: "In Time",
                  prefixIcon: "assets/images/time_icon1.svg",
                  hintText: "Time",
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
                BaseTextFormField(
                  controller: controller.reasonController,
                  title: translate(context).reason,
                  hintText: translate(context).type_here,
                  validator: (val){
                    if (controller.reasonController.text.trim().isEmpty) {
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
                        }
                    );
                  },
                  bottomMargin: 10.h,
                ),
                BaseButton(title: translate(context).submit_btn_txt, onPressed: (){
                  if (widget.isUpdating??false) {
                    controller.updateData(id: widget.data?.sId??"");
                  }else{
                    controller.createData();
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}