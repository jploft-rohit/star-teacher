import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_reward_screen/reward_screen_ctrl.dart';

class CreateRewardScreen extends StatefulWidget {
  const CreateRewardScreen({Key? key}) : super(key: key);

  @override
  State<CreateRewardScreen> createState() => _CreateRewardScreenState();
}

class _CreateRewardScreenState extends State<CreateRewardScreen> {
  RewardScreenCtrl controller = Get.find<RewardScreenCtrl>();
  XFile? file;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.rewardTitleCtrl.value.text = "";
      controller.pointValueCtrl.value.text = "";
      controller.selectedImagePath.value = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppBar(title: translate(context).create_reward),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height:2.h),
                Obx(()=>(controller.selectedImagePath.value).isEmpty
                    ? Row(
                    children: [
                      SizedBox(width: 1.w),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 10).then((value){
                              if ((value?.path??"").isNotEmpty) {
                                file = value;
                                controller.selectedImagePath.value = value?.path??"";
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.white,
                            ),
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/add-image 1.svg'),
                                SizedBox(height:1.h),
                                addText(translate(context).upload_from_albums, 14.sp,
                                    BaseColors.greyColor, FontWeight.w400)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 10).then((value){
                              if ((value?.path??"").isNotEmpty) {
                                // getPickedFileSize(bytes: value?.readAsBytes().toString().length??0);
                                file = value;
                                controller.selectedImagePath.value = value?.path??"";
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.white,
                            ),
                            height: 200,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/images/photo-camera 1.svg'),
                                  SizedBox(height:1.h),
                                  addText(translate(context).camera, 14.sp,
                                      BaseColors.greyColor, FontWeight.w400)
                                ]),
                          ),
                        ),
                      ),
                      SizedBox(width:1.w),
                    ],
                  )
                    : Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(File(controller.selectedImagePath.value),width: double.infinity,),
                        ),
                        Positioned(
                          right: -10,
                          top: -10,
                          child: GestureDetector(
                            onTap: (){
                              controller.selectedImagePath.value = "";
                            },
                            child: Container(
                              padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle
                                ),
                                child: Icon(Icons.close,color: Colors.white,)),
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(height:2.h),
                Obx(()=>BaseTextFormField(
                    controller: controller.rewardTitleCtrl.value,
                    hintText: translate(context).reward_title,
                    validator: (val){
                      if ((controller.rewardTitleCtrl.value.text).isEmpty) {
                        return "Please enter reward title";
                      }
                      return null;
                    },
                  ),
                ),
                Obx(()=>CustomTextField(
                    controller: controller.pointValueCtrl.value,
                    hintText: translate(context).points_value,
                    textInputType: TextInputType.number,
                    borderRadius: 10.0,
                    maxLength: 5,
                    textInputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    validator: (val){
                      if ((val??"").isEmpty) {
                        return "Please enter points value";
                      }
                      return null;
                    },
                    suffixIcon: Container(
                    padding: const EdgeInsets.all(1),
                    width: 50,
                    child: Column(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              if (controller.pointValueCtrl.value.text.isEmpty) {
                                controller.pointValueCtrl.value.text = "0";
                              }
                              controller.pointValueCtrl.value.text = ((int.parse(controller.pointValueCtrl.value.text))+1).toString();
                            },
                            child: Container(
                              width: 50,
                              margin: const EdgeInsets.only(left: 10, top: 1),
                              decoration: const BoxDecoration(
                                  color: Color(0xffD7DEEA),
                                  borderRadius:
                                  BorderRadius.only(topRight: Radius.circular(10))),
                              child: const Icon(
                                Icons.keyboard_arrow_up_outlined,
                                color: BaseColors.textBlackColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 0.1.h),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              if (int.parse(controller.pointValueCtrl.value.text) > 0) {
                                controller.pointValueCtrl.value.text = ((int.parse(controller.pointValueCtrl.value.text))-1).toString();
                              }
                            },
                            child: Container(
                              width: 50,
                              margin: const EdgeInsets.only(left: 10, bottom: 1),
                              decoration: const BoxDecoration(
                                  color: Color(0xffD7DEEA),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10))),
                              child: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: BaseColors.textBlackColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),),
                ),
                SizedBox(height:3.h),
                BaseButton(title: translate(context).create.toUpperCase(), onPressed: (){
                  if (file != null) {
                    controller.createReward(file: file);
                  }else{
                    baseToast(message: "Please Upload Image");
                  }
                },btnType: largeButton)
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    controller.rewardTitleCtrl.value.text = "";
    controller.pointValueCtrl.value.text = "";
    super.dispose();
  }
}
