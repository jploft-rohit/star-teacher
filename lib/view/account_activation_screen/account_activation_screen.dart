import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/account_activation_screen/controller/account_activation_controller.dart';

class AccountActivationScreen extends StatefulWidget {
  const AccountActivationScreen({Key? key}) : super(key: key);

  @override
  State<AccountActivationScreen> createState() => _AccountActivationScreenState();
}

class _AccountActivationScreenState extends State<AccountActivationScreen> {

  AccountActivationController controller = Get.put(AccountActivationController());

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
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        BaseTextFormField(
                          title: translate(context).full_name,
                          controller: controller.fullNameController,
                          hintText: "Type here...",
                          maxLength: 50,
                          keyboardType: TextInputType.name,
                          validator: (val){
                            if(controller.fullNameController.text.trim().isEmpty){
                              return "Please Enter Full Name";
                            }
                            return null;
                          },
                        ),
                        BaseTextFormField(
                          title: translate(context).employee_id,
                          controller: controller.employeeIdController,
                          hintText: "Type here...",
                          validator: (val){
                            if(controller.employeeIdController.text.trim().isEmpty){
                              return "Please Enter Employee ID";
                            }
                            return null;
                          },
                        ),
                        BaseTextFormField(
                          title: translate(context).mobile_number,
                          controller: controller.mobileController,
                          hintText: "Type here...",
                          keyboardType: TextInputType.phone,
                          maxLength: 20,
                          textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                          validator: (val){
                            if(controller.mobileController.text.trim().isEmpty){
                              return "Please Enter Mobile Number";
                            }
                            return null;
                          },
                          innerPrefixWidget: GestureDetector(
                            onTap: (){
                              showCountryPicker(
                                context: context,
                                favorite: ["AE"],
                                showPhoneCode: true, // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  controller.selectedCountryCode.value = country.phoneCode;
                                  print('Select country: ${country.phoneCode}');
                                  setState(() {});
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(width: 2.w),
                                Text("+${controller.selectedCountryCode.value}",style: TextStyle(fontSize: textFormFieldHintTs)),
                                const Icon(Icons.arrow_drop_down_rounded, color: Colors.grey),
                              ],
                            ),
                          ),
                        ),
                        BaseButton(
                          topMargin: 2.h,
                          title: "SEND OTP",
                          onPressed: () {
                            controller.sendAccountActivationRequest();
                          },
                          btnType: largeButton,borderRadius: 19,)
                      ],
                    ),
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
