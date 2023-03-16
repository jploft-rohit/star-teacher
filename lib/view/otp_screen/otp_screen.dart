import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/otp_txt_field.dart';
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
        backgroundColor: CustomColors.backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.17,
                  alignment: Alignment.center,
                  child: Text(translate(context).sms_verification, style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor, fontSize: 21.sp),),
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
                      Text(translate(context).otp_sent,style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 21.sp),),
                      SizedBox(height: 0.5.h,),
                      Text(translate(context).enter_4_digit_otp,style: Style.montserratRegularStyle().copyWith(color: const Color(0xff6B6B6B), fontSize: 16.sp, height: 1.5),),
                      SizedBox(height: 0.5.h,),
                      Text("05xx-xxxxxxxx",style: Style.montserratRegularStyle().copyWith(color: const Color(0xff6B6B6B), fontSize: 16.sp, height: 1.5),),
                      SizedBox(height: 0.5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OTPInputBox(controller: _first, autoFocus: true, size: MediaQuery.of(context).size),
                          OTPInputBox(
                              controller: _second, autoFocus: false, size: MediaQuery.of(context).size),
                          OTPInputBox(controller: _third, autoFocus: false, size: MediaQuery.of(context).size),
                          OTPInputBox(controller: _forth, autoFocus: false, size: MediaQuery.of(context).size),
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
                        child: CustomButton(text: translate(context).submit_btn_txt, onPressed: (){
                          Get.offAllNamed(chooseLoginTypeScreenRoute);
                        }),
                      ),
                      SizedBox(height: 10.h,),
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
