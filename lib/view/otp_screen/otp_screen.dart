import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/otp_txt_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/route_manager/route_name.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _otpKey = GlobalKey<FormState>(),
      _first = TextEditingController(),
      _second = TextEditingController(),
      _third = TextEditingController(),
      _forth = TextEditingController();
  FocusNode focusNode=FocusNode();

  @override
  void dispose() {
    _otpKey.currentState?.dispose();
    _first.dispose();
    _second.dispose();
    _third.dispose();
    _forth.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColors.backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      Text(translate(context).otp_sent,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: onBoardingTitleTs),),
                      SizedBox(height: 0.5.h,),
                      Text(translate(context).enter_4_digit_otp,style: Style.montserratRegularStyle().copyWith(color: const Color(0xff6B6B6B), fontSize: onBoardingSubTitleTs, height: 1.5),),
                      SizedBox(height: 0.5.h,),
                      Text("05xx-xxxxxxxx",style: Style.montserratRegularStyle().copyWith(color: const Color(0xff6B6B6B), fontSize: onBoardingSubTitleTs, height: 1.5),),
                      SizedBox(height: 0.5.h,),
                      PinCodeTextField(
                        textStyle: TextStyle(color: BaseColors.primaryColor),
                        length: 4, autoFocus: true,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        cursorColor: Colors.black,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 17.w,
                          inactiveColor: BaseColors.borderColor,
                          fieldWidth: 17.w,
                          borderWidth: 1,
                          disabledColor: BaseColors.borderColor,
                          activeColor: BaseColors.primaryColor,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedColor: BaseColors.borderColor,
                          activeFillColor: BaseColors.primaryColorLight,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        // backgroundColor: Colors.blue.shade50,
                        enableActiveFill: true,
                        // controller: textEditingController,
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        onChanged: (value) {
                          debugPrint(value);
                          // setState(() {
                          //   currentText = value;
                          // });
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                        appContext: context,
                      ),
                      SizedBox(height: 5.h,),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: ' ${translate(context).didnt_recive_otp}',
                            style: Style.montserratBoldStyle().copyWith(color: const Color(0xff7C7C7C), fontSize: onBoardingSubTitleTs),
                            children: <TextSpan>[
                              TextSpan(text: ' ${translate(context).sent_again}', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: onBoardingSubTitleTs)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Center(
                        child: BaseButton(btnType: "large",title: translate(context).submit_btn_txt, onPressed: (){
                          Get.offAllNamed(chooseLoginTypeScreenRoute);
                        }),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
