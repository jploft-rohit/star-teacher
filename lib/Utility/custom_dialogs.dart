import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/otp_txt_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class CustomDialogs {
  showOtpDialog(){
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
          body: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 120),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.white
            ),
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                  Text(translate(context).otp_sent,style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 21.sp),),
                  SizedBox(height: 0.5.h,),
                  Text(translate(context).enter_4_digit_otp,style: Style.montserratRegularStyle().copyWith(color: const Color(0xff6B6B6B), fontSize: 16.sp, height: 1.5),),
                  SizedBox(height: 0.5.h,),
                  Text("05xx-xxxxxxxx",style: Style.montserratRegularStyle().copyWith(color: const Color(0xff6B6B6B), fontSize: 16.sp, height: 1.5),),
                  SizedBox(height: 0.5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OTPInputBox(controller: first, autoFocus: true, size: MediaQuery.of(context).size),
                      OTPInputBox(
                          controller: second, autoFocus: false, size: MediaQuery.of(context).size),
                      OTPInputBox(controller: third, autoFocus: false, size: MediaQuery.of(context).size),
                      OTPInputBox(controller: forth, autoFocus: false, size: MediaQuery.of(context).size),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: ' ${translate(context).didnt_recive_otp}',
                        style: Style.montserratBoldStyle().copyWith(color: const Color(0xff7C7C7C), fontSize: 16.sp),
                        children: <TextSpan>[
                          TextSpan(text: ' ${translate(context).sent_again}', style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Center(
                    child: BaseButton(btnType: dialogButton,title: translate(context).submit_btn_txt, onPressed: (){
                      Navigator.pop(context);
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  showIssuedCardDetailsDialog(){
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
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 120),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.white
            ),
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    addText("Issued By - ",14.sp,Colors.black,FontWeight.w400),
                    addText("Rohit Kumar Sharma",14.sp,Colors.black,FontWeight.w400),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  showConfirmationDialog({Function()? onClose,String? title,Function()? onLeftButtonPressed, String? leftButtonTitle,Function()? onRightButtonPressed, String? rightButtonTitle}){
    double btnHeight = 30;
    double btnWidth = getWidth(Get.context!) * 50 / 180;
    showGeneralDialog(
        context: Get.context!,
        barrierDismissible: true,
        barrierLabel: "",
        pageBuilder: (context,a1,a2){
          return Dialog(
            // insetPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(onTap: onClose ?? (){Get.back();},
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.close_rounded),
                        )),
                  ),
                      Text(title??"",textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    BaseButton(btnType: dialogButton,title: leftButtonTitle??"Cancel", onPressed: onLeftButtonPressed ?? (){Get.back();}),
                    const SizedBox(width: 20),
                    BaseButton(btnType: dialogButton,title: rightButtonTitle??"Proceed", onPressed: onRightButtonPressed ?? (){Get.back();}),
                  ],),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
    });
  }
}