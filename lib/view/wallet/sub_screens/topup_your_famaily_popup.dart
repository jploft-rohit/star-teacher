import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/wallet/sub_screens/cartd_detail_popup.dart';
import 'package:staff_app/view/wallet/wallet_controller.dart';

import '../../../Utility/custom_button.dart';

class TopupYourFamilyPopup extends StatefulWidget {
  const TopupYourFamilyPopup({Key? key}) : super(key: key);

  @override
  State<TopupYourFamilyPopup> createState() => _TopupYourFamilyPopupState();
}

class _TopupYourFamilyPopupState extends State<TopupYourFamilyPopup> {
  TextEditingController amtCtrl = TextEditingController();

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
                        text: '${translate(context).top_up_your} ',
                        style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 16.sp),
                        children: <TextSpan>[
                          TextSpan(text: translate(context).family_wallet, style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp, height: 1.2)),
                        ],
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
                CustomTextField(controller: amtCtrl, hintText: "AED 1000", borderColor: CustomColors.textBlackColor,),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height: 2.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        print(Get.find<WalletController>()
                            .selectedAmount
                            .value);
                        Get.find<WalletController>().update();
                      },
                      child: Container(
                        height: 2.h,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: CustomColors.backgroundColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 0.3,
                                color: CustomColors.primaryColor)),
                        child: addText(
                            "+AED${Get.find<WalletController>().amount[index]}",
                            13.sp,
                            CustomColors.primaryColor,
                            FontWeight.w400),
                      ),
                    ),
                    itemCount: Get.find<WalletController>().amount.length,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: BaseButton(
                    title: "${translate(context).top_up.toUpperCase()} 1,000 AED",
                    btnWidth: 50.w,
                    textSize: 16.sp,
                    onPressed: (){
                      Get.back();
                      showGeneralDialog(
                        context: context,
                        pageBuilder:  (context, animation, secondaryAnimation) {
                          return CardDetailPopup();
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
