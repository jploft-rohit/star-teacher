import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';
import 'package:staff_app/view/wallet/wallet_controller.dart';

class CardDetailPopup extends StatefulWidget {
  const CardDetailPopup({Key? key}) : super(key: key);

  @override
  State<CardDetailPopup> createState() => _CardDetailPopupState();
}

class _CardDetailPopupState extends State<CardDetailPopup> {
  TextEditingController cardNoCtrl = TextEditingController();
  TextEditingController expiryCtrl = TextEditingController();
  TextEditingController cvvCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  WalletController controller = Get.find<WalletController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Dialog(
          insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white
            ),
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: translate(context).card_details,
                          style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.close, color: Colors.black,),)
                    ],
                  ),
                  BaseTextFormField(
                    textInputFormatter: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    topMargin: 2.h,
                    controller: nameCtrl,
                    maxLength: 20,
                    keyboardType: TextInputType.number,
                    hintText: translate(context).card_number,
                    validator: (val){
                      if((val??"").isEmpty){
                        return "Please enter card number";
                      }
                      return null;
                    },
                    bottomMargin: 1.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: BaseTextFormField(
                            controller: expiryCtrl,
                            maxLength: 10,
                            hintText: translate(context).expiry,
                            keyboardType: TextInputType.datetime,
                            suffixIcon: calenderSvg,
                            validator: (val){
                              if((val??"").isEmpty){
                                return "Please enter expiry date";
                              }
                              return null;
                            },
                            // onChanged: (val){
                            //     if(expiryCtrl.text.trim().length == 2){
                            //       expiryCtrl.text = (expiryCtrl.text.trim()) + "/";
                            //     }
                            // },
                          bottomMargin: 0,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(
                        flex: 1,
                        child: BaseTextFormField(
                            controller: cvvCtrl,
                            hintText: "CVV",
                            textInputFormatter: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            keyboardType: TextInputType.number,
                            suffixIcon: "assets/images/information-button(1) 1.svg",
                            maxLength: 10,
                            bottomMargin: 0,
                            validator: (val){
                              if((val??"").isEmpty){
                                return "Please enter CVV";
                              }
                              return null;
                            },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  BaseTextFormField(
                      controller: cardNoCtrl,
                      keyboardType: TextInputType.name,
                      hintText: translate(context).card_holder_name,
                      validator: (val){
                        if((val??"").isEmpty){
                          return "Please enter Card Holder name";
                        }
                        return null;
                      },
                  ),
                  Center(
                    child: BaseButton(
                      title: translate(context).pay.toUpperCase(),
                      borderRadius: 20,
                      btnType: mediumButton,
                      onPressed: (){
                        if (formKey.currentState?.validate()??false) {
                          controller.addWalletMoney();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
