import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/otp_txt_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/show_document.dart';
import 'package:staff_app/utility/base_views/textfieldwidget.dart';
import 'package:staff_app/utility/constant_images.dart';
import 'package:staff_app/utility/custom_text_field.dart';

class BaseOverlays {
  showOtpDialog() {
    final first = TextEditingController(),
        second = TextEditingController(),
        third = TextEditingController(),
        forth = TextEditingController();
    showGeneralDialog(
      context: Get.context!,
      barrierDismissible: true,
      // barrierColor: Colors.transparent,
      barrierLabel: "",
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.white),
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.close, color: Colors.black)),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    translate(context).otp_sent,
                    style: Style.montserratBoldStyle().copyWith(
                        color: BaseColors.textBlackColor, fontSize: 21.sp),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    translate(context).enter_4_digit_otp,
                    style: Style.montserratRegularStyle().copyWith(
                        color: const Color(0xff6B6B6B),
                        fontSize: 16.sp,
                        height: 1.5),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    "05xx-xxxxxxxx",
                    style: Style.montserratRegularStyle().copyWith(
                        color: const Color(0xff6B6B6B),
                        fontSize: 16.sp,
                        height: 1.5),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OTPInputBox(
                          controller: first,
                          autoFocus: true,
                          size: MediaQuery.of(context).size),
                      OTPInputBox(
                          controller: second,
                          autoFocus: false,
                          size: MediaQuery.of(context).size),
                      OTPInputBox(
                          controller: third,
                          autoFocus: false,
                          size: MediaQuery.of(context).size),
                      OTPInputBox(
                          controller: forth,
                          autoFocus: false,
                          size: MediaQuery.of(context).size),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: ' ${translate(context).didnt_recive_otp}',
                        style: Style.montserratBoldStyle().copyWith(
                            color: const Color(0xff7C7C7C), fontSize: 16.sp),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' ${translate(context).sent_again}',
                              style: Style.montserratBoldStyle().copyWith(
                                  color: BaseColors.primaryColor,
                                  fontSize: 16.sp)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: BaseButton(
                      btnType: mediumButton,
                      title: translate(context).submit_btn_txt,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      borderRadius: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  showIssuedCardDetailsDialog() {
    showGeneralDialog(
      context: Get.context!,
      barrierDismissible: true,
      // barrierColor: Colors.transparent,
      barrierLabel: "",
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.white),
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    addText(
                        "Issued By - ", 14.sp, Colors.black, FontWeight.w400),
                    addText("Rohit Kumar Sharma", 14.sp, Colors.black,
                        FontWeight.w400),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showConfirmationDialog({
    Function()? onClose,
    String? title,
    Function()? onLeftButtonPressed,
    String? leftButtonTitle,
    Function()? onRightButtonPressed,
    String? rightButtonTitle,
  }) {
    showGeneralDialog(
        context: Get.context!,
        barrierDismissible: true,
        barrierLabel: "",
        pageBuilder: (context, a1, a2) {
          return Dialog(
            // insetPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: onClose ??
                            () {
                              Get.back();
                            },
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.close_rounded),
                        )),
                  ),
                  Text(title ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseButton(
                        btnType: mediumButton,
                        borderRadius: 20,
                        title: leftButtonTitle ?? "Cancel",
                        onPressed: onLeftButtonPressed ??
                            () {
                              Get.back();
                            },
                      ),
                      const SizedBox(width: 20),
                      BaseButton(
                          btnType: mediumButton,
                          borderRadius: 20,
                          title: rightButtonTitle ?? "Proceed",
                          onPressed: onRightButtonPressed ??
                              () {
                                Get.back();
                              }),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
  }

  showOkDialog({
    Function()? onClose,
    String? title,
    Function()? onBtnPressed,
    String? btnTitle,
    String? iconSvg,
    bool? showOkButton,
    bool? barrierDismissible,
  }) {
    showGeneralDialog(
        context: Get.context!,
        barrierDismissible: barrierDismissible??true,
        barrierLabel: "",
        pageBuilder: (context, a1, a2) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: onClose ??
                              () {
                                Get.back();
                              },
                          child: SvgPicture.asset("assets/images/ic_close.svg",
                              height: 16)),
                    ),
                    SizedBox(height: 16),
                    Visibility(
                        visible: (iconSvg ?? "").isNotEmpty,
                        child: SvgPicture.asset(iconSvg ?? "")),
                    SizedBox(height: 16),
                    Text(title ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black)),
                    Visibility(
                        visible: showOkButton ?? true,
                        child: const SizedBox(height: 20)),
                    Visibility(
                        visible: showOkButton ?? true,
                        child: BaseButton(
                            btnType: dialogButton,
                            title: btnTitle ?? "OK",
                            onPressed: onBtnPressed ??
                                () {
                                  Get.back();
                                })),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showMediaPickerDialog({Function()? onCameraClick, Function()? onGalleryClick, Function()? onVideoClick, Function()? onAudioClick, Function()? onFilePick}) {
    final ImagePicker picker = ImagePicker();
    XFile? imageData;
    showGeneralDialog(
      context: Get.context!,
      barrierDismissible: true,
      barrierLabel: "",
      pageBuilder: (context, a1, a2) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset("assets/images/ic_close.svg",
                          height: 16)),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Visibility(
                      visible: onCameraClick != null,
                      child: Expanded(
                          child: GestureDetector(
                            onTap: onCameraClick ?? () async {
                              Get.back();
                              await picker.pickImage(source: ImageSource.camera).then((value){
                                if (value != null) {
                                  imageData = value;
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Icon(Icons.camera_alt_outlined,
                                    color: BaseColors.primaryColor, size: 60),
                                SizedBox(height: 8),
                                Text(translate(Get.context!).camera),
                              ],
                            ),
                          )
                      ),
                    ),
                    Visibility(
                      visible: onGalleryClick != null,
                      child: Expanded(
                          child: GestureDetector(
                            onTap: onGalleryClick ?? () async {
                              Get.back();
                              await picker.pickImage(source: ImageSource.gallery).then((value){
                                if (value != null) {
                                  imageData = value;
                                }
                              });
                            },
                            child: Column(
                              children: [
                                Icon(Icons.photo_library_outlined,
                                    color: BaseColors.primaryColor, size: 60),
                                SizedBox(height: 8),
                                Text(translate(Get.context!).gallery),
                              ],
                            ),
                          ),
                      ),
                    ),
                    Visibility(
                      visible: onFilePick != null,
                      child: Expanded(
                        child: GestureDetector(
                          onTap: onFilePick ?? () async {
                            Get.back();
                            pickFile();
                          },
                          child: Column(
                            children: [
                              Icon(Icons.file_present_outlined, color: BaseColors.primaryColor, size: 60),
                              SizedBox(height: 8),
                              Text("File"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: onVideoClick != null,
                      child: Expanded(
                        child: GestureDetector(
                          onTap: onVideoClick ?? () async {
                            Get.back();
                            await picker.pickVideo(source: ImageSource.gallery).then((value){
                              if (value != null) {
                                imageData = value;
                              }
                            });
                          },
                          child: Column(
                            children: [
                              Icon(Icons.video_collection_outlined,
                                  color: BaseColors.primaryColor, size: 60),
                              SizedBox(height: 8),
                              Text("Video"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: onAudioClick != null,
                      child: Expanded(
                        child: GestureDetector(
                          onTap: onAudioClick ?? () async {
                            var uploadImage = await FilePicker.platform.pickFiles(
                              allowMultiple: false,
                              type: FileType.audio,
                            );
                            // if (uploadImage != null) {
                            //   formWidgetList[index].fileUpload = File(uploadImage.files.first.path!);
                            //   setState(() {});
                            //   formWidgetList[index].fileController.text = formWidgetList[index].fileUpload!.path.split("/").last;
                            //   setState(() {});
                            // }
                          },
                          child: Column(
                            children: [
                              Icon(Icons.audio_file_outlined,
                                  color: BaseColors.primaryColor, size: 60),
                              SizedBox(height: 8),
                              Text("Audio"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  showMediaPDFPhotoDialog({Function()? onFileClick, Function()? onGalleryClick}) {
    final ImagePicker picker = ImagePicker();
    XFile? imageData;
    showGeneralDialog(
      context: Get.context!,
      barrierDismissible: true,
      barrierLabel: "",
      pageBuilder: (context, a1, a2) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset("assets/images/ic_close.svg", height: 16)),
                ),
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: onFileClick ?? () async {
                            Get.back();
                            await picker.pickImage(source: ImageSource.camera).then((value){
                              if (value != null) {
                                imageData = value;
                              }
                            });
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset("assets/images/document 1.svg",height: 55),
                              SizedBox(height: 8),
                              Text("PDF"),
                            ],
                          ),
                        )),
                    Expanded(
                        child: GestureDetector(
                          onTap: onGalleryClick ?? () async {
                            Get.back();
                            await picker.pickImage(source: ImageSource.gallery).then((value){
                              if (value != null) {
                                imageData = value;
                              }
                            });
                          },
                          child: Column(
                            children: [
                              Icon(Icons.photo_library_outlined,
                                  color: BaseColors.primaryColor, size: 60),
                              SizedBox(height: 8),
                              Text("Gallery"),
                            ],
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  showRejectDialog({
    Function()? onClose,
    String? title,
    Function()? onSubmit,
    String? btnTitle,
    String? hintText,
  }) {
    showGeneralDialog(
        context: Get.context!,
        barrierDismissible: true,
        barrierLabel: "",
        pageBuilder: (context, a1, a2) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/images/ic_close.svg",
                            height: 16, color: Colors.transparent),
                        Text(title ?? "Event Rejection Reason",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        GestureDetector(
                          onTap: onClose ??
                              () {
                                Get.back();
                              },
                          child: SvgPicture.asset("assets/images/ic_close.svg",
                              height: 16),
                        ),
                      ],
                    ),
                  ),
                  BaseTextFormField(
                    controller: TextEditingController(),
                    maxLine: 4,
                    hintText: hintText ?? "Why are you rejecting this?",
                  ),
                  BaseButton(
                      removeHorizontalPadding: true,
                      btnType: dialogButton,
                      title: btnTitle ?? translate(context).submit_btn_txt,
                      onPressed: onSubmit ??
                          () {
                            Get.back();
                          }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
  }

  /// Loading
  void showLoader({bool? showLoader}) {
    if (showLoader ?? true) {
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
          onWillPop: () async => false,
          child: Container(
            color: Colors.black26,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ),
      );
    }
  }

  /// Dismiss Loader
  void dismissOverlay({bool? showLoader}) {
    if (showLoader ?? true) {
      Get.back(closeOverlays: true);
    }
  }

  void showSnackBar({String? title, required String message}) {
    Get.closeCurrentSnackbar();
    Get.closeAllSnackbars();
    Get.snackbar(
      title ?? "Error",
      message,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: (title?.toLowerCase()) == "success" || (title??"") == "نجاح"
          ? (Colors.green.shade800)
          : Colors.red,
      margin: EdgeInsets.zero,
      borderRadius: 0,
      icon: Icon(
          (title?.toLowerCase()) == "success" || (title??"") == "نجاح"
              ? Icons.check_circle_outline
              : Icons.error_outline,
          color: Colors.white),
    );
  }

  showReasonDeleteDialog(
      {required String title,
        required TextEditingController controller,
        GlobalKey<FormState>? formKey,
        Function()? onProceed}) {
    controller.text = "";
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        insetPadding: EdgeInsets.only(left: 1.w, right: 1.w),
        backgroundColor: BaseColors.white,
        elevation: 10,
        scrollable: true,
        contentPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return Form(
                key: formKey??GlobalKey<FormState>(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.close, color: Colors.transparent),
                          Expanded(child: Text(title,textAlign: TextAlign.center, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 17.sp))),
                          GestureDetector(
                            onTap: () {Get.back();},
                            child: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${translate(Get.context!).reason}: ",
                      style: Style.montserratBoldStyle().copyWith(
                          color: BaseColors.textBlackColor, fontSize: 15.sp),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      controller: controller,
                      hintText: translate(Get.context!).type_here,
                      borderRadius: 5.0,
                      maxLine: 3,
                      validator: (val){
                        if ((val??"").isEmpty) {
                          return "Please enter the reason.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 2.h),
                    Align(
                      alignment: Alignment.center,
                      child: BaseButton(
                        borderRadius: 20,
                        btnType: mediumLargeButton,
                        title: translate(Get.context!).delete.toUpperCase(),
                        onPressed: onProceed ?? () {
                          BaseOverlays().dismissOverlay();
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  viewPdfDialog({String? url,bool? concatBaseUrl}){
    showGeneralDialog(context: Get.context!,
      pageBuilder: (context, animation, secondaryAnimation) {
        return ShowPdfViewDialog(
          url: (concatBaseUrl??true) ? (ApiEndPoints().imageBaseUrl) + (url??"") : (url??""),
          title: "Task & Reminder",
        );
      },
    );
  }

  viewPhoto({String? url,bool? concatBaseUrl}){
    showGeneralDialog(context: Get.context!,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            PhotoView(
              imageProvider: NetworkImage(((url??"").contains("http")) ? (url??"") :  ApiEndPoints().imageBaseUrl+(url??"")),
              initialScale: PhotoViewComputedScale.contained * 1.0,
              maxScale: PhotoViewComputedScale.contained * 3.0,
              minScale: PhotoViewComputedScale.contained * 0.8,
              loadingBuilder: (context, event) => Center(
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Positioned(child: GestureDetector(
              onTap: (){
                BaseOverlays().dismissOverlay();
              },
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Icon(Icons.close_rounded,color: Colors.white,size: 40),
              ),
            )),
          ],
        );
      },
    );
  }

  void showSumitSuccessfulDialogue(BuildContext context, onTap) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                insetPadding: const EdgeInsets.all(10),
                child: StatefulBuilder(builder: (context, setSta) {
                  return Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: iconButton(() {
                                Get.back();
                              }, "assets/images/crossIcon.svg"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Center(
                                  child: Text(
                                    "Your Details has been submitted\nsuccessfully",
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: dialogHeadingTs,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        height: 1.5,
                                        fontFamily: 'Arial'),
                                  ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        SizedBox(
                          width: 140,
                          child: BaseButton(
                              btnType: 'popup', title: 'Ok', onPressed: onTap),
                        ),
                        SizedBox(height: 2.h),
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }

  void showAddMedicalFilesDialogue(BuildContext context,
      {formKey,
        TextEditingController? titleController,
        TextEditingController? descriptionController,
        TextEditingController? dateController,
        TextEditingController? fileController,
        action}) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                content: SizedBox(
                  width: 100.w,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: iconButton(() {
                                  Get.back();
                                }, StarIcons.closeIconBlack),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Center(
                                  child: addAlignedText(
                                      'Add Medical Records',
                                      dialogHeadingTs,
                                      Colors.black,
                                      FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          spaceheight(2.h),
                          TextFieldWidget(
                            fontsize: textFormFieldHintTs,
                            borderRadius: radiusAll(4),
                            fillColor: BaseColors.white3,
                            labelText: '',
                            hintText: 'Title',
                            controller: titleController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return 'Please enter title';
                              }
                              return null;
                            },
                          ),
                          spaceheight(1.h),
                          TextFieldWidget(
                            fontsize: textFormFieldHintTs,
                            borderRadius: radiusAll(4),
                            fillColor: BaseColors.white3,
                            height: 80,
                            maxLines: 4,
                            labelText: '',
                            hintText: 'Description',
                            controller: descriptionController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return 'Please enter description';
                              }
                              return null;
                            },
                          ),
                          spaceheight(1.h),
                          GestureDetector(
                            onTap: () async {
                              print('tapped');
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
                              ).then((date) async {
                                if (date != null) {
                                  String formattedDate = formatFlutterDateTime(flutterDateTime: date,getDayFirst: false);
                                  dateController!.text = formattedDate;
                                  dateController.text +=
                                  ' ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}';
                                }
                              });

                            },
                            child: AbsorbPointer(
                              child: TextFieldWidget(
                                readOnly: true,
                                fontsize: textFormFieldHintTs,
                                borderRadius: radiusAll(4),
                                fillColor: BaseColors.white3,
                                labelText: '',
                                hintText: 'dd/mm/yyyy',
                                sufficIcon:
                                iconButton(() {}, StarIcons.calenderIcon2),
                                controller: dateController,
                                validator: (v) {
                                  if (v!.isEmpty) {
                                    return 'Please select date';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          spaceheight(1.h),
                          GestureDetector(
                            onTap: () async {
                              await showMediaPickerDialogMedical((fileName, filePath) {
                                  fileController.text = filePath;
                                },
                              );
                            },
                            child: AbsorbPointer(
                              child: TextFieldWidget(
                                controller: fileController,
                                fontsize: textFormFieldHintTs,
                                borderRadius: radiusAll(4),
                                fillColor: BaseColors.white3,
                                labelText: '',
                                hintText: fileController!.text.isNotEmpty
                                    ? 'File Selected'
                                    : 'Upload File',
                                sufficIcon: iconButton(
                                        () {}, "assets/images/upload_doc.svg"),
                              ),
                            ),
                          ),
                          spaceheight(2.h),
                          BaseButton(
                            btnType: 'popup',
                            title: 'SUBMIT',
                            onPressed: action,
                          )

                          // spaceheight(10.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }

  void showMedicalRecordsDialogue(BuildContext context, action) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                shape:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                content: SizedBox(
                  width: 100.w,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: iconButton(() {
                                Get.back();
                              }, StarIcons.closeIconBlack),
                            ),
                          ],
                        ),
                        spaceheight(1.5.h),
                        textArialCenterExpanded(
                            'The star has suffered a mild injury that was dealt with by school nurse and is now fine and able to complete his school day.',
                            detailHeadingTs,
                            ColorConstants.black,
                            FontWeight.w700),
                        spaceheight(2.h),
                        BaseButton(
                            removeHorizontalPadding: true,
                            borderRadius: 50,
                            btnType: 'large',
                            title: 'VIEW MEDICAL RECORD',
                            onPressed: action)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }
}
