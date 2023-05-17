import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/otp_txt_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
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
          );
        });
  }

  XFile? showMediaPickerDialog() {
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
                      Expanded(
                          child: GestureDetector(
                        onTap: () async {
                          Get.back();
                          imageData = await picker.pickImage(source: ImageSource.camera);
                        },
                        child: Column(
                          children: [
                            Icon(Icons.camera_alt_outlined,
                                color: BaseColors.primaryColor, size: 60),
                            SizedBox(height: 8),
                            Text("Camera"),
                          ],
                        ),
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: () async {
                          Get.back();
                          imageData = await picker.pickImage(
                              source: ImageSource.gallery);
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
        });
    return imageData;
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
      backgroundColor: (title?.toLowerCase()) == "success"
          ? (Colors.green.shade800)
          : Colors.red,
      margin: EdgeInsets.zero,
      borderRadius: 0,
      icon: Icon(
          (title?.toLowerCase()) == "success"
              ? Icons.check_circle_outline
              : Icons.error_outline,
          color: Colors.white),
    );
  }

  showReasonDeleteDialog(
      {required String title,
      required TextEditingController controller,
      Function()? onProceed}) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.close, color: Colors.transparent),
                    Text(title, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 17.sp)),
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
        ),
      ),
    );
  }
}
