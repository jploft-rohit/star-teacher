import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';

class CartCardDetail extends StatefulWidget {
  final bool? isUpdating, isFromCart;
  final String? id;
  const CartCardDetail({Key? key, this.isUpdating, this.id, required this.isFromCart}) : super(key: key);

  @override
  State<CartCardDetail> createState() => _CartCardDetailState();
}

class _CartCardDetailState extends State<CartCardDetail> {
  TextEditingController cardNoCtrl = TextEditingController();
  TextEditingController expiryCtrl = TextEditingController();
  TextEditingController cvvCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Card Details',
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
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextField(
                    controller: cardNoCtrl,
                    hintText: "Card number",
                    hintTextColor: BaseColors.textLightGreyColor,
                    textInputType: TextInputType.number,
                    textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                    validator: (val){
                      if ((val??"").isEmpty) {
                        return "Please Enter Card Number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: CustomTextField(controller: expiryCtrl, hintText: "Expiry", suffixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: GestureDetector(onTap: (){
                            selectDate(context);
                          },child: SvgPicture.asset(calenderSvg,height:17.sp,)),
                        ),hintTextColor: BaseColors.textLightGreyColor,
                          textInputType: TextInputType.datetime,
                          // textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                          validator: (val){
                            if ((val??"").isEmpty) {
                              return "Please Enter Expiry Date";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(
                        flex: 1,
                        child: CustomTextField(controller: cvvCtrl, hintText: "CVV", suffixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: SvgPicture.asset("assets/images/information-button(1) 1.svg",height: 17.sp,),
                        ),hintTextColor: BaseColors.textLightGreyColor,
                          textInputType: TextInputType.number,
                          textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                          validator: (val){
                            if ((val??"").isEmpty) {
                              return "Please Enter CVV";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTextField(
                    controller: nameCtrl,
                    hintText: "Card holder name",
                    hintTextColor: BaseColors.textLightGreyColor,
                    textInputType: TextInputType.name,
                    validator: (val){
                      if ((val??"").isEmpty) {
                        return "Please Enter Card Holder Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 2.h),
                  Center(
                    child: BaseButton(
                      title: "PAY",
                      btnType: mediumButton,
                      borderRadius: 20,
                      onPressed: (){
                        if (formKey.currentState?.validate()??false) {
                          Get.back();
                          if (widget.isUpdating??false) {
                            controller.updateOrder(id: widget.id??"");
                          }else{
                            controller.createOrder(isFromCart: widget.isFromCart??false);
                          }
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
