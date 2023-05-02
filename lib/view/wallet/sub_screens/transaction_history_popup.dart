import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/wallet/wallet_controller.dart';

class TransactionHistoryPopup extends StatefulWidget {
  int index;
  TransactionHistoryPopup({Key? key, required this.index}) : super(key: key);

  @override
  State<TransactionHistoryPopup> createState() => _TransactionHistoryPopupState();
}

class _TransactionHistoryPopupState extends State<TransactionHistoryPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: SizedBox(
          width: 100.w,
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(
                            Icons.close
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Center(
                        child: addText(translate(context).transaction_history, 18,
                            Colors.black, FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 3.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: BaseColors.greyColor)),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(12.0,8,8,8),
                                  child: Image.asset(Get.find<WalletController>().purchasesList[0]['image']!,height: 60,),
                                ),
                                Text('#632541', style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: BaseColors.primaryColor)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 2.w),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Cookies', style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: BaseColors.textBlackColor)),
                                    const SizedBox(height: 4),
                                    Text('Order ID : 659878', style: Style.montserratBoldStyle().copyWith(fontSize: 12.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w300)),
                                    const SizedBox(height: 3),
                                    Text('TR No : 258796', style: Style.montserratBoldStyle().copyWith(fontSize: 12.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w300)),
                                    const SizedBox(height: 3),
                                    Text('Purchase (Cookies)', style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                    const SizedBox(height: 2),
                                    Text.rich(TextSpan(children: [
                                      TextSpan(text: "2 AED",style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                      const WidgetSpan(child: SizedBox(width: 2)),
                                      TextSpan(text: "Sent",style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: Colors.blue,fontWeight: FontWeight.w400)),
                                    ])),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 35),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('20/10/2022', style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                  const SizedBox(height: 8),
                                  Text('09:00:30pm', style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 3.0),
                    //   child: GestureDetector(
                    //     onTap: (){
                    //     },
                    //     child: Container(
                    //       padding: const EdgeInsets.all(3),
                    //       decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           shape: BoxShape.circle,
                    //           boxShadow: [
                    //             getBoxShadow()
                    //           ]
                    //       ),
                    //       child: SvgPicture.asset(starSvg, height: 18.sp,),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.only(left: 4.w,right: 5.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: BaseButton(
                          title: translate(context).print_receipt.toUpperCase(),
                          btnType: mediumLargeButton,
                          borderRadius: 20,
                          onPressed: (){
                            Get.back();
                          },
                        ),
                      ),
                      SizedBox(width: 4.5.w),
                      Expanded(
                        child: BaseButton(
                          title: "SAVE RECEIPT",
                          btnType: mediumLargeButton,
                          borderRadius: 20,
                          onPressed: (){
                            Get.back();
                          },
                        ),
                      ),
                    ],
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
