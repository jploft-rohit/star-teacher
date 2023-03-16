import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';
import 'package:staff_app/view/wallet/sub_screens/cartd_detail_popup.dart';
import 'package:staff_app/view/wallet/sub_screens/topup_your_famaily_popup.dart';

class WalletPayPopup extends StatefulWidget {
  const WalletPayPopup({Key? key}) : super(key: key);

  @override
  State<WalletPayPopup> createState() => _WalletPayPopupState();
}

class _WalletPayPopupState extends State<WalletPayPopup> {

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
                    Text(""),
                    RichText(
                      text: TextSpan(
                        text: 'Wallet',
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
                Container(
                  width: 100.w,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25), blurRadius: 2)
                    ],
                    color: CustomColors.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: CustomColors.primaryColor),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 1.5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(coinSvg),
                          Column(
                            children: [
                              Text(translate(context).balance, style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor, fontSize: 20.sp),),
                              SizedBox(height: 1.h),
                              Text('${100} AED', style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor,fontSize: 21.sp),),
                              SizedBox(height: 2.h),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(0.5.h),
                            decoration: BoxDecoration(
                                boxShadow: kElevationToShadow[3],
                                borderRadius: BorderRadius.circular(30),
                                color: CustomColors.backgroundColor,
                                border: Border.all(color: CustomColors.primaryColor)),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {
                                  showGeneralDialog(
                                    context: context,
                                    pageBuilder:  (context, animation, secondaryAnimation) {
                                      return CardDetailPopup();
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.add,
                                  color: CustomColors.primaryColor,
                                  size: 5.0.h,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: CustomButton(
                    text: "PAY",
                    btnWidth: 25.w,
                    borderRadius: 30.0,
                    onPressed: (){
                      Get.back();
                      showGeneralDialog(
                        context: context,
                        pageBuilder:  (context, animation, secondaryAnimation) {
                          return ConfirmationDialog(msg: 'Padi successfully!',isShowBtn: true,btnText: "OK",);
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
