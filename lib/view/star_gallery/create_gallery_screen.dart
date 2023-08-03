import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/class_response.dart';
import 'package:staff_app/backend/responses_model/class_section_response.dart';
import 'package:staff_app/backend/responses_model/star_gallery_category_response.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:staff_app/view/star_gallery/controller/star_gallery_ctrl.dart';

class CreateGalleryScreen extends StatefulWidget {
  const CreateGalleryScreen({Key? key}) : super(key: key);

  @override
  State<CreateGalleryScreen> createState() => _CreateGalleryScreenState();
}

class _CreateGalleryScreenState extends State<CreateGalleryScreen> {
  StarGalleryCtrl controller = Get.find<StarGalleryCtrl>();
  String mediaType1 = "";
  String mediaType2 = "";
  String mediaType3 = "";
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void initState() {
    super.initState();
    controller.getGalleryCategory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Star Gallery"),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: Obx(()=>Column(
                children: [
                  BaseTextFormField(
                    hintText: controller.selectedCategoryId.value.isEmpty ? "Select Category" : controller.selectedCategoryId.value,
                    controller: controller.galleryCategoryController.value,
                    isDropDown: true,
                    items: controller.starGalleryCategoryList?.map((value){
                      return DropdownMenuItem<StarGalleryCategoryData>(
                        value: value,
                        child: addText(value.title??"", 15.sp, Colors.black, FontWeight.w400),
                      );
                    }).toList(),
                    onChanged: (val){
                      controller.galleryCategoryController.value.text = val.title??"";
                      controller.selectedCategoryId.value = val.sId??"";
                      print(controller.selectedCategoryId.value);
                    },
                    errorText: "Please select category",
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: ColorConstants.borderColor
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomFilterDropDown(
                          hintText: controller.selectedClass.value.name.toString().isEmpty ? 'Class' : controller.selectedClass.value.name??"Class",
                          item: baseCtrl.classList?.map((ClassData value){
                            return DropdownMenuItem<ClassData>(
                              value: value,
                              child: addText(value.name??"", 15.sp, Colors.black, FontWeight.w400),
                            );
                          }).toList(),
                          onChange: (value) {
                            controller.selectedClassSection.value = ClassSectionData();
                            controller.selectedClass.value = value;
                            baseCtrl.getClassSections(classId: controller.selectedClass.value.sId??"");
                          },
                          icon: classTakenSvg,
                        ),
                        Container(
                          child: VerticalDivider(
                            width: 1,
                          ),
                          height: 5.5.h,
                          width: 2,
                        ),
                        CustomFilterDropDown(
                          hintText: controller.selectedClassSection.value.name.toString().isEmpty ? 'Section' : controller.selectedClassSection.value.name??"Section",
                          item: baseCtrl.classSectionList?.map((ClassSectionData value){
                            return DropdownMenuItem<ClassSectionData>(
                              value: value,
                              child: addText(value.name??"", 15.sp, Colors.black, FontWeight.w400),
                            );
                          }).toList(),
                          onChange: (value) {
                            controller.selectedClassSection.value = value;
                          },
                          icon: classTakenSvg,
                        ),
                      ],
                    ),
                  ),
                  ///
                  BaseTextFormField(
                      controller: controller.titleController.value,
                      validator: (val){
                        if (controller.titleController.value.text.isEmpty) {
                          return "Please enter title";
                        }
                        return null;
                      },
                      hintText: "Title",
                  ),
                  BaseTextFormField(
                      controller: controller.uploadController.value,
                      hintText: "Upload Images & Video",
                      suffixIcon: "assets/images/upload_icon.svg",
                      validator: (val){
                        if ((controller.image1?.value.path??"").isEmpty) {
                          return "Please select minimum 1 image";
                        }
                        return null;
                      },
                    onTap: () async {
                      if ((controller.image1?.value.path??"").isEmpty || (controller.image2?.value.path??"").isEmpty || (controller.image3?.value.path??"").isEmpty) {
                         await BaseOverlays().showMediaPickerDialog(
                             onCameraClick: (){
                               BaseOverlays().dismissOverlay();
                               ImagePicker().pickImage(source: ImageSource.camera).then((value){
                                 if (value != null) {
                                   if((controller.image1?.value.path??"").isEmpty){
                                     mediaType1 = "image";
                                     controller.image1?.value = value;
                                   }else if ((controller.image2?.value.path??"").isEmpty) {
                                     mediaType2 = "image";
                                     controller.image2?.value = value;
                                   }else if ((controller.image3?.value.path??"").isEmpty) {
                                     mediaType3 = "image";
                                     controller.image3?.value = value;
                                   }else{
                                     baseToast(message: "You have selected max number of media");
                                   }
                                 }
                               },
                              );
                             },
                             onGalleryClick: (){
                             BaseOverlays().dismissOverlay();
                             ImagePicker().pickImage(source: ImageSource.gallery).then((value){
                                 if (value != null) {
                                   if((controller.image1?.value.path??"").isEmpty){
                                     mediaType1 = "image";
                                     controller.image1?.value = value;
                                   }else if ((controller.image2?.value.path??"").isEmpty) {
                                     mediaType2 = "image";
                                     controller.image2?.value = value;
                                   }else if ((controller.image3?.value.path??"").isEmpty) {
                                     mediaType3 = "image";
                                     controller.image3?.value = value;
                                   }else{
                                     baseToast(message: "You have selected max number of media");
                                   }
                                 }
                               },
                             );
                           },
                           onVideoClick: (){
                             BaseOverlays().dismissOverlay();
                             ImagePicker().pickVideo(source: ImageSource.gallery,).then((value) async {
                               if (value != null) {
                                 final videoInfo = FlutterVideoInfo();
                                 var info = await videoInfo.getVideoInfo(value.path);
                                 if ((info?.duration??0) > 6000) {
                                   if((controller.image1?.value.path??"").isEmpty){
                                     mediaType1 = "video";
                                     controller.image1?.value = value;
                                   }else if ((controller.image2?.value.path??"").isEmpty) {
                                     mediaType2 = "video";
                                     controller.image2?.value = value;
                                   }else if ((controller.image3?.value.path??"").isEmpty) {
                                     mediaType3 = "video";
                                     controller.image3?.value = value;
                                   }else{
                                     baseToast(message: "You have selected max number of media");
                                   }
                                 }else{
                                   baseToast(message: "Video duration can't be less than 6 seconds.");
                                 }
                               }
                              },
                             );
                           }
                         );
                       }else{
                        baseToast(message: "You have selected max number of images");
                      }
                    },
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Container(
                            height: 110,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorConstants.primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                (controller.image1?.value.path??"").isEmpty
                                    ? Padding(
                                      padding: const EdgeInsetsDirectional.only(top: 10),
                                      child: SvgPicture.asset("assets/images/school.svg",height: 70,width: 70,fit: BoxFit.scaleDown),
                                      )
                                    : mediaType1 == "video"
                                    ? Icon(Icons.play_circle_outline, size: 40)
                                    : Image.file(File(controller.image1?.value.path??"")),
                                Visibility(
                                  visible: (controller.image1?.value.path??"").isNotEmpty,
                                  child: GestureDetector(
                                    onTap: (){
                                      controller.image1?.value = XFile("");
                                    },
                                    child: Align(
                                      alignment: AlignmentDirectional.topEnd,
                                      child: Icon(Icons.close,size: 20,color: Color(0xFF929292)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      SizedBox(width: 10),
                      Expanded(
                          child: Container(
                            height: 110,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorConstants.primaryColor,),borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                (controller.image2?.value.path??"").isEmpty
                                    ? Padding(
                                    padding: const EdgeInsetsDirectional.only(top: 10),
                                    child: SvgPicture.asset("assets/images/school.svg",height: 70,width: 70,fit: BoxFit.scaleDown),
                                    )
                                    : mediaType2 == "video"
                                      ? Icon(Icons.play_circle_outline, size: 40)
                                      : Image.file(File(controller.image2?.value.path??"")),
                                Visibility(
                                  visible: (controller.image2?.value.path??"").isNotEmpty,
                                  child: GestureDetector(
                                    onTap: (){
                                      controller.image2?.value = XFile("");
                                    },
                                    child: Align(
                                      alignment: AlignmentDirectional.topEnd,
                                      child: Icon(Icons.close,size: 20,color: Color(0xFF929292),),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(width: 10),
                      Expanded(
                          child: Container(
                            height: 110,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorConstants.primaryColor,),borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                (controller.image3?.value.path??"").isEmpty
                                    ? Padding(
                                    padding: const EdgeInsetsDirectional.only(top: 10),
                                    child: SvgPicture.asset("assets/images/school.svg",height: 70,width: 70,fit: BoxFit.scaleDown,),
                                )
                                    : mediaType3 == "video"
                                      ? Icon(Icons.play_circle_outline, size: 40)
                                      : Image.file(File(controller.image3?.value.path??"")),
                                Visibility(
                                  visible: (controller.image3?.value.path??"").isNotEmpty,
                                  child: GestureDetector(
                                    onTap: (){
                                      controller.image3?.value = XFile("");
                                    },
                                    child: Align(
                                      alignment: AlignmentDirectional.topEnd,
                                      child: Icon(Icons.close,size: 20,color: Color(0xFF929292),),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 3.h,),
                  ///
                  BaseButton(title: translate(context).submit_btn_txt, onPressed: (){
                    controller.createGallery();
                  },btnType: largeButton,),
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
    controller.image1?.value = XFile("");
    controller.image2?.value = XFile("");
    controller.image3?.value = XFile("");
    controller.imagesList?.clear();
    controller.selectedCategoryId.value = "";
    controller.selectedClass.value = ClassData();
    controller.selectedClassSection.value = ClassSectionData();
    controller.galleryCategoryController.value.clear();
    controller.titleController.value.clear();
    controller.uploadController.value.clear();
    controller.classController.value.clear();
    controller.classSectionController.value.clear();
    super.dispose();
  }
}
