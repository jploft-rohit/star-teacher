import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/my_profile_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/add_family_member/controller/family_ctrl.dart';

class AddFamilyMemberScreen extends StatefulWidget {
  final bool isUpdating;
  final FamilyMembers? familyMembers;
  const AddFamilyMemberScreen({Key? key, required this.isUpdating, this.familyMembers}) : super(key: key);

  @override
  State<AddFamilyMemberScreen> createState() => _AddFamilyMemberScreenState();
}

class _AddFamilyMemberScreenState extends State<AddFamilyMemberScreen> {

  FamilyCtrl ctrl = Get.put(FamilyCtrl());

  @override
  void initState() {
    if(widget.isUpdating){
      ctrl.setData(data: widget.familyMembers);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: widget.isUpdating ? translate(context).update_family_member : translate(context).add_family_member),
      body: Form(
        key: ctrl.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              children: [
                BaseTextFormField(
                  controller: ctrl.nameController,
                  title: "${translate(context).name}:",
                  hintText: "Type here...",
                  validator: (val){
                    if ((val??"").isEmpty) {
                      return "Please enter name";
                    }
                    return null;
                  },
                ),
                BaseTextFormField(
                  controller: ctrl.relationController,
                  title: "${translate(context).relation}:",
                  hintText: translate(context).choose,
                  isDropDown: true,
                  dropDownValue: ctrl.relationController.text,
                  errorText: "Please select relation",
                  onChanged: (newValue){
                    setState(() {
                      ctrl.relationController.text = newValue.toString();
                    });},
                    items: DummyLists().list1.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                    }).toList(),
                ),
                BaseTextFormField(
                  controller: ctrl.dobController,
                  title: "${translate(context).dob}:",
                  prefixIcon: calenderDateSvg,
                  hintText: "dd/mm/yyyy",
                  keyboardType: TextInputType.datetime,
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
                        firstDate: DateTime(1600, 8),
                        lastDate: DateTime.now()
                    ).then((picked){
                      if (picked != null) {
                        ctrl.dobController..text = formatFlutterDateTime(flutterDateTime: picked, getDayFirst: true);
                      }
                    });
                  },
                  validator: (val){
                    if ((val??"").isEmpty) {
                      return "Please select name";
                    }
                    return null;
                  },
                ),
                BaseTextFormField(
                  controller: ctrl.mobileController,
                  title: "${translate(context).mobile_number}:",
                  hintText: translate(context).mobile_number,
                  maxLength: 20,
                  keyboardType: TextInputType.phone,
                  validator: (val){
                    if ((val??"").isEmpty) {
                      return "Please enter a valid phone no. between 7 to 15 digits.";
                    }
                    return null;
                  },
                ),
                BaseTextFormField(
                  controller: ctrl.idController,
                  title: "${translate(context).upload_id}:",
                  hintText: translate(context).upload_file_or_photo,
                  suffixIcon: "assets/images/upload_icon.svg",
                  onTap: (){
                    BaseOverlays().showMediaPickerDialog(onCameraClick: () async {
                      BaseOverlays().dismissOverlay();
                      ImagePicker picker = ImagePicker();
                      await picker.pickImage(source: ImageSource.camera).then((value){
                        if (value != null) {
                          ctrl.selectedFile?.value = File(value.path);
                          ctrl.idController.text = value.path.split("/").last;
                        }
                      },
                      );
                    },
                        onGalleryClick: () async {
                          BaseOverlays().dismissOverlay();
                          ImagePicker picker = ImagePicker();
                          await picker.pickImage(source: ImageSource.gallery).then((value){
                            if (value != null) {
                              ctrl.selectedFile?.value = File(value.path);
                              ctrl.idController.text = value.path.split("/").last;
                            }
                          });
                        },
                        onFilePick: (){
                          BaseOverlays().dismissOverlay();
                          pickFile().then((value) {
                            ctrl.selectedFile?.value = File(value);
                            ctrl.idController.text = (value.split("/").last);
                          });
                        }
                    );
                  },
                ),
                BaseTextFormField(
                  controller: ctrl.idExpiryController,
                  title: "${translate(context).id_expiry_date}:",
                  prefixIcon: calenderDateSvg,
                  hintText: "dd/mm/yyyy",
                  keyboardType: TextInputType.datetime,
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
                        ctrl.idExpiryController..text = formatFlutterDateTime(flutterDateTime: picked, getDayFirst: true);
                      }
                    });
                    },
                  validator: (val){
                    if ((val??"").isEmpty) {
                      return "Please select expiry date";
                    }
                    return null;
                  },
                ),
                SizedBox(height: Get.height / 4),
                BaseButton(title: translate(context).submit_btn_txt, onPressed: (){
                  if (widget.isUpdating) {
                    ctrl.updateFamilyMember(familyMemberId: widget.familyMembers?.sId??"");
                  }else{
                    ctrl.addFamilyMember();
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
