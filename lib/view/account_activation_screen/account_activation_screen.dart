import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/route_manager/route_name.dart';
import 'package:staff_app/view/otp_screen/otp_screen.dart';

class AccountActivationScreen extends StatefulWidget {
  const AccountActivationScreen({Key? key}) : super(key: key);

  @override
  State<AccountActivationScreen> createState() => _AccountActivationScreenState();
}

class _AccountActivationScreenState extends State<AccountActivationScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController employeeIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Flexible(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },child: const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
                      ),
                    ),
                    Center(
                      child: Text(translate(context).account_activation, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 21.sp),),
                    )
                  ],
                )),
            Flexible(
                flex: 12,
                child: Container(
                  padding: EdgeInsets.only(top: 4.h, left: 7.w, right: 7.w),
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: BaseColors.white,
                      boxShadow: [getBoxShadow()]),
                  child: Column(
                    children: [
                      buildInputField(translate(context).full_name, fullNameController),
                      SizedBox(height: 2.h,),
                      buildInputField(translate(context).employee_id, employeeIdController),
                      // SizedBox(height: 1.h,),
                      // buildInputField(translate(context).otp_for_verification, otpController),
                      SizedBox(height: 2.h,),

                      buildNumberInputField(translate(context).mobile_number, mobileController),
                      SizedBox(height: 4.h,),
                      BaseButton(
                        title: "SEND OTP",
                        onPressed: () {
                          Get.to(OTPScreen(mobile: "05x-xxxxxxxxx",isFromActivation: true,));
                        },
                        btnType: largeButton,borderRadius: 19,)
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildInputField(String fieldName,TextEditingController controller){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(fieldName, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),)),

        Container(
          width: 60.w,
          child: CustomTextField(controller: controller,
            hintTxtSize: 15.sp,
            fillColor: const Color(0xffFCFCFC),
            hintText: translate(context).type_here,borderRadius: 4,),
        )
      ],
    );
  }


  Widget buildNumberInputField(String fieldName,TextEditingController controller){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(fieldName, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),

            Container(
              width: 60.w,
              child: CustomTextField(
                controller: controller,
                hintText: translate(context).type_here,
                fillColor: const Color(0xffFCFCFC),
                borderRadius: 4.0,
                hintTxtSize: 15.sp,
                // suffixIcon: Container(
                //   margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                //   padding: const EdgeInsets.all(4.0),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5.0),
                //     color: const Color(0xff4C4C4C)
                //   ),
                //   child: Text(translate(context).sent_otp_btn_txt, style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp,color: BaseColors.white),),
                // ),
              ),
            )
          ],
        ),
        // SizedBox(height: 0.7.h,),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //
        //     Text(translate(context).otp_sent1, style: Style.montserratBoldStyle().copyWith(color: Colors.green, fontSize: 14.sp),),
        //     const SizedBox(width: 5,),
        //     Text(translate(context).resend, style: Style.montserratBoldStyle().copyWith(color: const Color(0xffD77502), fontSize: 14.sp, decoration: TextDecoration.underline),)
        //
        //
        //   ],
        // )
      ],
    );
  }
}
