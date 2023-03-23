import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';

class CartCardDetail extends StatefulWidget {
  const CartCardDetail({Key? key}) : super(key: key);

  @override
  State<CartCardDetail> createState() => _CartCardDetailState();
}

class _CartCardDetailState extends State<CartCardDetail> {
  TextEditingController cardNoCtrl = TextEditingController();
  TextEditingController expiryCtrl = TextEditingController();
  TextEditingController cvvCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();

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
                        style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 16.sp),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(controller: cardNoCtrl, hintText: "Card number",hintTextColor: CustomColors.textLightGreyColor,),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: CustomTextField(controller: expiryCtrl, hintText: "Expiry", suffixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: InkWell(onTap: (){
                          selectDate(context);
                        },child: SvgPicture.asset(calenderSvg,height:17.sp,)),
                      ),hintTextColor: CustomColors.textLightGreyColor,),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: CustomTextField(controller: expiryCtrl, hintText: "CVV", suffixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: SvgPicture.asset("assets/images/information-button(1) 1.svg",height: 17.sp,),
                      ),hintTextColor: CustomColors.textLightGreyColor,),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(controller: cardNoCtrl, hintText: "Card holder name",hintTextColor: CustomColors.textLightGreyColor,),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: BaseButton(
                    title: "PAY",
                    btnWidth: 100.w,
                    onPressed: (){
                      Get.back();
                      showGeneralDialog(
                        context: context,
                        pageBuilder:  (context, animation, secondaryAnimation) {
                          return ConfirmationDialog(msg: 'Order successfully placed!',isShowBtn: true,btnText: "OK",);
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
