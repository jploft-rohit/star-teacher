import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/view/star_reward_screen/reward_screen_ctrl.dart';

class RewardImageScreen extends StatefulWidget {
  final int index;
  final String uploadedImage;
  const RewardImageScreen({Key? key, required this.index, required this.uploadedImage}) : super(key: key);

  @override
  State<RewardImageScreen> createState() => _RewardImageScreenState();
}

class _RewardImageScreenState extends State<RewardImageScreen> {
  RewardScreenCtrl controller = Get.find<RewardScreenCtrl>();
  bool isImageSelected = false;
  XFile? file;
  late ImagePicker imagePicker;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    controller.uploadedImagePath.value = widget.uploadedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(title: translate(context).reward_image),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:2.h),
              Obx(()=>(controller.uploadedImagePath.value).isEmpty
              ? Row(
                children: [
                  SizedBox(width: 1.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: galleryImageQuality).then((value){
                          if ((value?.path??"").isNotEmpty) {
                            file = value;
                            controller.uploadedImagePath.value = value?.path??"";
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
                        ImagePicker().pickImage(source: ImageSource.camera,imageQuality: cameraImageQuality).then((value){
                          if ((value?.path??"").isNotEmpty) {
                            file = value;
                            controller.uploadedImagePath.value = value?.path??"";
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
                  : isImageSelected
                  ? Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topRight,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(File(controller.uploadedImagePath.value),width: double.infinity),
                  ),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: GestureDetector(
                      onTap: (){
                        controller.uploadedImagePath.value = "";
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
                  : Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BaseImageNetwork(
                          link: controller.rewardList?[widget.index].image??"",
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        right: -10,
                        top: -10,
                        child: GestureDetector(
                          onTap: (){
                            controller.uploadedImagePath.value = "";
                            isImageSelected = true;
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
                  ),
                ),
              SizedBox(height:2.h),
              addText(translate(context).note_add_photo_of_the_reward,
                  15.sp, BaseColors.textBlackColor, FontWeight.w400),
              SizedBox(height:3.h),
              BaseButton(title: translate(context).submit_btn_txt,
                onPressed: (){
                if ((file?.path??"").isNotEmpty) {
                  controller.updateRewardImage(file: file,rewardId: controller.rewardList?[widget.index].sId.toString());
                  // showGeneralDialog(
                  //   context: context,
                  //   pageBuilder:  (context, animation, secondaryAnimation) {
                  //     return SuccessDialogScreen(msg: translate(context).reward_added_successfully);
                  //   },
                  // );
                }else{
                  if (controller.uploadedImagePath.value.isNotEmpty) {
                    Get.back();
                  }else{
                    baseToast(message: "Please Select Image");
                  }
                }
              },btnType: largeButton,)
            ],
          ),
        ),
      ),
    );
  }
}
