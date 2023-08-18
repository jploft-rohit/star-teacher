import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/route_manager/route_name.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/validators.dart';
import 'package:staff_app/view/login_screen/login_ctrl.dart';
import 'package:staff_app/view/otp_screen/otp_ctrl.dart';

class OTPScreen extends StatefulWidget {
  final String mobile;
  final String? employeeId;
  final bool? isFromActivation;
  const OTPScreen({Key? key, required this.mobile, this.isFromActivation = false, this.employeeId}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OtpCtrl controller = Get.put(OtpCtrl());
  LoginCtrl loginCtrl = Get.find<LoginCtrl>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Scaffold(
          backgroundColor: BaseColors.backgroundColor,
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.17,
                  alignment: Alignment.center,
                  child: Text(translate(context).sms_verification, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: onBoardingHeadingTs),),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: Get.height - MediaQuery.of(context).size.height*0.18,
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
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      Text(translate(context).otp_sent,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: onBoardingTitleTs),),
                      SizedBox(height: 0.5.h),
                      Text(translate(context).enter_4_digit_otp,style: Style.montserratRegularStyle().copyWith(color: const Color(0xff6B6B6B), fontSize: onBoardingSubTitleTs, height: 1.5),),
                      SizedBox(height: 0.3.h),
                      Text(widget.mobile,style: Style.montserratRegularStyle().copyWith(color: const Color(0xff6B6B6B), fontSize: onBoardingSubTitleTs, height: 1.5),),
                      SizedBox(height: 1.0.h),
                      PinCodeTextField(
                        controller: controller.otpController,
                        textStyle: TextStyle(color: BaseColors.primaryColor),
                        length: 4,
                        autoFocus: true,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        cursorColor: Colors.black,
                        animationType: AnimationType.fade,
                        validator: Validators().otpValidator,
                        autovalidateMode: controller.otpController.text.length == 4 ? AutovalidateMode.always : AutovalidateMode.disabled,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 9.h,
                          inactiveColor: BaseColors.borderColor,
                          fieldWidth: 9.h,
                          borderWidth: 1,
                          disabledColor: BaseColors.borderColor,
                          activeColor: BaseColors.primaryColor,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedColor: BaseColors.borderColor,
                          activeFillColor: BaseColors.primaryColorLight,
                          errorBorderColor: Colors.red,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        onChanged: (value) {
                          debugPrint(value);
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                        appContext: context,
                      ),
                      SizedBox(height: 5.h),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: ' ${translate(context).didnt_recive_otp}',
                            style: Style.montserratBoldStyle().copyWith(color: const Color(0xff7C7C7C), fontSize: onBoardingSubTitleTs),
                            children: [
                              TextSpan(recognizer: TapGestureRecognizer()..onTap = (){
                                controller.otpController.text = "";
                                setState(() {});
                                loginCtrl.loginApi(isResend: true);
                              },text: ' ${translate(context).sent_again}', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: onBoardingSubTitleTs)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: BaseButton(btnType: largeButton, title: translate(context).submit_btn_txt, onPressed: (){
                          if (widget.isFromActivation??false) {
                            controller.verifyActivationRequest(employeeId: widget.employeeId??"", mobile: widget.mobile, otp: controller.otpController.text.trim());
                          }else{
                            controller.otpApi(mobile: widget.mobile);
                          }
                        },borderRadius: 19),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
