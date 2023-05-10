import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/validators.dart';
import 'package:staff_app/view/account_activation_screen/account_activation_screen.dart';
import 'package:staff_app/view/login_screen/login_ctrl.dart';
import 'package:staff_app/view/otp_screen/otp_screen.dart';

class LoginScreen extends GetView<LoginCtrl> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Scaffold(
          backgroundColor: BaseColors.white,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.17,
                  alignment: Alignment.center,
                  color: BaseColors.backgroundColor,
                  child: Text(translate(context).login, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: onBoardingHeadingTs,fontWeight: FontWeight.w500),),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      color: Colors.white
                  ),
                  padding: const EdgeInsets.all(25),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 2.5.h),
                      Text(translate(context).welcome,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: onBoardingTitleTs,fontWeight: FontWeight.w700),),
                      SizedBox(height: 0.1.h),
                      Text(translate(context).please_login_to_your_account,style: Style.montserratRegularStyle().copyWith(color: const Color(0xff6B6B6B), fontSize: 16.sp),),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: controller.mobileCtrl,
                        hintText: "05x-xxxxxxxxx",
                        textInputType: TextInputType.phone,
                        fillColor: const Color(0xffFCFCFC),
                        borderRadius: 5,
                        maxLength: 15,
                        validator: Validators().mobileValidator,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: SvgPicture.asset(mobileSvg),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Center(
                        child: BaseButton(btnType: largeButton,title: translate(context).sent_otp_btn_txt, onPressed: (){
                          controller.loginApi();
                          // Get.to(OTPScreen(mobile: controller.mobileCtrl.text.trim()));
                          },borderRadius: 19),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("- - - - - - - - - - - -    "),
                          Text(translate(context).or.toUpperCase(), style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp),),
                          const Text("    - - - - - - - - - - - -"),
                        ],
                      ),
                      SizedBox(height: 7.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(faceScanSvg,height: 9.h,width: 9.h),
                        ],
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                        text: '${translate(context).dont_have_account} ',
                        style: Style.montserratBoldStyle().copyWith(color: const Color(0xff7C7C7C), fontSize: 16.sp),
                        children: <TextSpan>[
                          TextSpan(text: '${translate(context).activate_account}', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp), recognizer: TapGestureRecognizer()..onTap = (){
                            Get.to(const AccountActivationScreen());
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
