import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/all_feedback_help_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart' as SchoolData;
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_dropdown.dart';
import 'package:staff_app/utility/base_views/base_dropdown_2.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/feedback_help_screen/controller/feedback_help_controller.dart';
import 'package:staff_app/view/feedback_help_screen/select_person_popup.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class AddFeedbackView extends StatefulWidget {
  final bool isUpdating;
  final Data? data;
  const AddFeedbackView({Key? key, this.isUpdating = false, this.data}) : super(key: key);

  @override
  State<AddFeedbackView> createState() => _AddFeedbackViewState();
}

class _AddFeedbackViewState extends State<AddFeedbackView> {
  
  FeedbackHelpController controller = Get.find<FeedbackHelpController>();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void initState() {
    super.initState();
    controller.setData(isUpdating: widget.isUpdating,data: widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: widget.isUpdating ? "Edit Feedback & Help" : "Feedback & Help"),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: Obx(()=>Column(
                children: [
                  BaseSchoolDropDown(
                    controller: controller.schoolController.value,
                    onChanged: (value) async {
                      controller.schoolController.value.text = value?.name??"";
                      controller.selectedSchoolId.value = value?.sId??"";
                      controller.personController.value.text = "";
                      controller.selectedPersonId.value = "";
                      setState(() {
                        controller.schoolController.value.text = value?.name??"";
                      });
                      await baseCtrl.getComplaintTypeData(initialSchoolId: value?.sId??"");
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.typeController.value,
                    hintText: "Type",
                    isDropDown: true,
                    dropDownValue: controller.typeController.value.text,
                    onChanged: (newValue){
                      setState(() {
                        controller.typeController.value.text = newValue.toString();
                      });},
                    items: DummyLists().feedbackList.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                    }).toList(),
                    errorText: "Please select type",
                  ),
                  BaseTextFormField(
                    controller: controller.personController.value,
                    hintText: "Select person",
                    suffixIcon: "assets/images/ic_down.svg",
                    // errorText: "Please select person",
                    onTap: (){
                      if ((controller.selectedSchoolId.value).isNotEmpty) {
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return SelectPersonPopup(selectedSchoolId: controller.selectedSchoolId.value);
                          },
                        );
                      }else{
                        Fluttertoast.cancel();
                        Fluttertoast.showToast(msg: "Please first select school",gravity: ToastGravity.CENTER);
                      }
                    },
                    validator: (val){
                      if ((controller.selectedPersonId.value).isEmpty) {
                        return "Please select person";
                      }
                      return null;
                    },
                    bottomMargin: 1.h,
                  ),
                  BaseTextFormField(
                    controller: controller.titleController.value,
                    hintText: "Title",
                    validator: (val){
                      if ((controller.titleController.value.text).isEmpty) {
                        return "Please enter the title";
                      }
                      return null;
                    },
                    bottomMargin: 1.h,
                  ),
                  BaseTextFormField(
                    controller: controller.messageController.value,
                    maxLine: 4,
                    hintText: "Message",
                    bottomMargin: 1.h,
                    validator: (val){
                      if (controller.messageController.value.text.isEmpty) {
                        return "Please enter the message";
                      }
                      return null;
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.uploadController.value,
                    hintText: translate(context).upload_file_or_photo,
                    suffixIcon: "assets/images/upload_icon.svg",
                    onTap: (){
                      BaseOverlays().showMediaPickerDialog(onCameraClick: () async {
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
                    bottomMargin: 10.h,
                  ),
                  BaseButton(title: "SUBMIT", onPressed: (){
                    if (widget.isUpdating) {
                      controller.updateApi(
                          itemId: widget.data?.sId??"",
                      );
                    }else{
                      controller.create(
                          school: controller.selectedSchoolId.value,
                          forEnquiry: controller.typeController.value.text.trim().toLowerCase(),
                          complaintUser: controller.selectedPersonId.value,
                          title: controller.titleController.value.text.trim(),
                          description: controller.messageController.value.text.trim(),

                          document: "doc.pdf"
                      );
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.setData(isUpdating: false);
    super.dispose();
  }
}
