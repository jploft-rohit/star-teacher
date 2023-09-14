import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/backend/responses_model/chat_history_response.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/group/group_select_person.dart';

class CreateGroupScreen extends StatefulWidget {
  final ChatHistoryData? data;
  const CreateGroupScreen({super.key, this.data});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final ChatScreenCtrl controller = Get.find<ChatScreenCtrl>();

  @override
  void initState() {
    super.initState();
    controller.setData(data: widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Scaffold(
        appBar: const BaseAppBar(
          title: "Create Group",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: scaffoldPadding),
            child: Column(
              children: [
                BaseSchoolDropDown(
                  topMargin: 2.h,
                  controller: controller.schoolController,
                  onChanged: (val){
                    controller.schoolController.text = val.name??"";
                    controller.selectedSchoolId.value = val.sId??"";
                  },
                ),
                BaseTextFormField(
                  bottomMargin: 1.h,
                  controller: controller.titleController,
                  hintText: "Title",
                  validator: (val){
                    if ((val??"").isEmpty) {
                      return "Please Enter Title";
                    }
                    return null;
                  },
                ),
                BaseTextFormField(
                  bottomMargin: 1.h,
                  controller: controller.uploadController,
                  hintText: "Upload Group Icon Photo",
                  suffixIcon: "assets/images/upload_icon.svg",
                  onTap: (){
                    BaseOverlays().showMediaPickerDialog(
                        onCameraClick: () async {
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
                ),
                BaseTextFormField(
                  bottomMargin: 1.h,
                  controller: controller.personController,
                  hintText: "Select Person",
                  suffixIcon: "assets/images/ic_down.svg",
                  validator: (val){
                    if (controller.selectedGroupUserID.isEmpty) {
                      return "Please Select Person";
                    }
                    return null;
                  },
                  onTap: (){
                    if (controller.selectedSchoolId.value.isNotEmpty) {
                      showGeneralDialog(
                        context: context,
                        pageBuilder:  (context, animation, secondaryAnimation) {
                          return const GroupSelectPerson();
                        },
                      ).then((value){
                        setState(() {});
                      });
                    }else{
                      baseToast(message: "First Select School");
                    }
                  },
                ),
                BaseButton(
                    title: "SUBMIT",
                    topMargin: 2.h,
                    borderRadius: 15,
                    onPressed: (){
                      controller.formKey;
                      if (controller.formKey.currentState?.validate()??false) {
                        controller.createGroup();
                      }
                    },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
