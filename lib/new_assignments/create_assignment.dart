import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/assigned_assignment_list_response.dart';
import 'package:staff_app/new_assignments/assignment_select_person.dart';
import 'package:staff_app/new_assignments/controller/new_assignment_ctrl.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/dummy_lists.dart';
import '../../utility/images_icon_path.dart';
import '../../utility/sizes.dart';

class CreateAssignment extends StatefulWidget {
  final String title;
  final bool? isEditing;
  final AssignedAssignmentData? data;
  const CreateAssignment({Key? key, required this.title, this.isEditing, this.data}) : super(key: key);

  @override
  State<CreateAssignment> createState() => _CreateAssignmentState();
}

class _CreateAssignmentState extends State<CreateAssignment> with SingleTickerProviderStateMixin{
  NewAssignmentCtrl controller = Get.find<NewAssignmentCtrl>();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Create ${widget.title}"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: scaffoldPadding),
          child: Obx(()=>Form(
            key: controller.formKey,
            child: Column(
                children: [
                  BaseSchoolDropDown(
                    controller: controller.schoolCtrl.value,
                    onChanged: (val){
                      controller.schoolCtrl.value.text = val.name;
                      controller.selectedSchoolId.value = val.sId;
                    },
                    bottomMargin: 3.h,
                  ),
                  BaseTextFormField(
                    controller: controller.titleController.value,
                    hintText: "Title",
                    validator: (val){
                      if (controller.titleController.value.text.trim().isEmpty) {
                        return "Please Enter Title";
                      }
                      return null;
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.assignmentNumberCtrl.value,
                    hintText: "${(widget.title.toLowerCase()) == "worksheet" ? "Worksheet" : "Assignments"} Number  :",
                    keyboardType: TextInputType.number,
                    textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                    validator: (val){
                      if (controller.assignmentNumberCtrl.value.text.trim().isEmpty) {
                        return "Please Enter Assignment Number";
                      }
                      return null;
                    },
                  ),
                  Visibility(
                    visible: (widget.title.toLowerCase()) != "worksheet",
                    child: BaseTextFormField(
                      hintText: controller.assignmentTypeCtrl.value.text.isEmpty ? "Assignment Type" : controller.assignmentTypeCtrl.value.text.trim(),
                      controller: controller.assignmentTypeCtrl.value,
                      isDropDown: true,
                      onChanged: (newValue){
                        setState(() {
                          controller.assignmentTypeCtrl.value.text = newValue.toString();
                        });
                      },
                      items: DummyLists().assignmentCategoryList.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: addText(value, 16.sp, Colors.black, FontWeight.w400),
                        );
                      }).toList(),
                      errorText: "Please Select Assignment Type",
                      bottomMargin: 3.h,
                    ),
                  ),
                  BaseTextFormField(
                    controller: controller.assignmentToCtrl.value,
                    hintText: "Assign To :",
                    suffixIcon: "assets/images/ic_down.svg",
                    onTap: (){
                      if (controller.selectedSchoolId.value.isNotEmpty) {
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return AssignmentSelectPerson(screenName: widget.title);
                          },
                        );
                      }else{
                        baseToast(message: "Please First Select School");
                      }
                    },
                    validator: (val){
                      if (controller.assignmentToCtrl.value.text.trim().isEmpty) {
                        return "Please Select Assignment To";
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BaseTextFormField(
                          controller: controller.postDateCtrl.value,
                          suffixIcon: calenderDateSvg,
                          hintText: "Assign Date",
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
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime((DateTime.now().year+50),1,1),
                            ).then((picked){
                              if (picked != null) {
                                controller.postDateCtrl.value.text = formatFlutterDateTime(flutterDateTime: picked,getDayFirst: false);
                              }
                            });
                          },
                          validator: (val){
                            if (controller.postDateCtrl.value.text.trim().isEmpty) {
                              return "Please Select Post Date";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: BaseTextFormField(
                          controller: controller.postTimeCtrl.value,
                          hintText: "Assign Time",
                          onTap: (){
                            showTimePicker(
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
                              initialTime: TimeOfDay.now(),
                            ).then((picked){
                              if (picked != null) {
                                print(picked.to24hours());
                                controller.postTimeCtrl.value.text = (picked.to24hours())+(":00");
                              }
                            });
                          },
                          suffixIcon: "assets/images/time_icon1.svg",
                          validator: (val){
                            if (controller.postTimeCtrl.value.text.trim().isEmpty) {
                              return "Please Select Post Time";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BaseTextFormField(
                          controller: controller.submitDateCtrl.value,
                          suffixIcon: calenderDateSvg,
                          hintText: "Submit Date",
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
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime((DateTime.now().year+50),1,1),
                            ).then((picked){
                              if (picked != null) {
                                controller.submitDateCtrl.value.text = formatFlutterDateTime(flutterDateTime: picked,getDayFirst: false);
                              }
                            });
                          },
                          validator: (val){
                            if (controller.submitDateCtrl.value.text.trim().isEmpty) {
                              return "Please Select Submit Date";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: BaseTextFormField(
                          controller: controller.submitTimeCtrl.value,
                          hintText: "Submit Time",
                          onTap: (){
                            showTimePicker(
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
                              initialTime: TimeOfDay.now(),
                            ).then((picked){
                              if (picked != null) {
                                print(picked.to24hours());
                                controller.submitTimeCtrl.value.text = (picked.to24hours())+(":00");
                              }
                            });
                          },
                          suffixIcon: "assets/images/time_icon1.svg",
                          validator: (val){
                            if (controller.submitTimeCtrl.value.text.trim().isEmpty) {
                              return "Please Select Submit Time";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  BaseTextFormField(
                    controller: controller.dueDateCtrl.value,
                    suffixIcon: calenderDateSvg,
                    hintText: "Due Date",
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
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime((DateTime.now().year+50),1,1),
                      ).then((picked){
                        if (picked != null) {
                          controller.dueDateCtrl.value.text = formatFlutterDateTime(flutterDateTime: picked, getDayFirst: false);
                        }
                      });
                    },
                    validator: (val){
                      if (controller.dueDateCtrl.value.text.trim().isEmpty) {
                        return "Please Select Due Date";
                      }
                      return null;
                    },
                  ),
                  Visibility(
                    visible: (widget.title.toLowerCase()) != "worksheet",
                    child: BaseTextFormField(
                      controller: controller.supportDocCtrl.value,
                      suffixIcon: uploadDocSvg,
                      hintText: "Support Doc (Optional)",
                      onTap: (){
                        BaseOverlays().showMediaPickerDialog(
                          onCameraClick: () async {
                          BaseOverlays().dismissOverlay();
                          ImagePicker picker = ImagePicker();
                          await picker.pickImage(source: ImageSource.camera).then((value){
                            if (value != null) {
                              controller.selectedFile?.value = File(value.path);
                              controller.supportDocCtrl.value.text = value.path.split("/").last;
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
                                  controller.supportDocCtrl.value.text = value.path.split("/").last;
                                }
                              },
                            );
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
                      validator: (val){
                        if (controller.supportDocCtrl.value.text.trim().isEmpty) {
                          return "Please Select Support Doc";
                        }
                        return null;
                      },
                    ),
                  ),
                  Visibility(
                    visible: (widget.title.toLowerCase()) != "worksheet",
                    child: BaseTextFormField(
                      controller: controller.linkCtrl.value,
                      hintText: "Link (Optional)",
                      bottomMargin: 3.h,
                      // validator: (val){
                      //   if (controller.linkCtrl.value.text.trim().isEmpty) {
                      //     return "Please Enter Link";
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  Visibility(
                    visible: (widget.title.toLowerCase()) == "worksheet",
                    child: BaseTextFormField(
                      controller: controller.descriptionController.value,
                      hintText: "Description",
                      bottomMargin: 3.h,
                      maxLine: 4,
                      validator: (val){
                        if (controller.descriptionController.value.text.trim().isEmpty) {
                          return "Please Enter Description";
                        }
                        return null;
                      },
                    ),
                  ),
                  BaseButton(title: "SUBMIT", onPressed: (){
                    controller.createData();
                  },btnType: largeButton,bottomMargin: 3.h),
                ],
              ),
          ),
          ),
        ),
      ),
    );
  }
}