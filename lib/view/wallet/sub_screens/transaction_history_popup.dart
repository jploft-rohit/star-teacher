import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
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
                      child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: const Icon(
                            Icons.close
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Center(
                        child: addText(translate(context).transaction_history, 18,
                            Colors.black, FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Get.find<WalletController>()
                              .purchasesList[widget.index]['image']!,
                          fit: BoxFit.scaleDown,
                          height: 5.5.h,
                        ),
                        SizedBox(width: 1.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              children: [
                                addText(
                                    'Purchases',
                                    15.sp,
                                    Colors.black,
                                    FontWeight.w400),
                                addText(
                                    '(${Get.find<WalletController>().purchasesList[widget.index]['item']})',
                                    13.sp,
                                    Colors.black,
                                    FontWeight.w400),
                              ],
                            ),
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              children: [
                                addText(
                                    Get.find<WalletController>()
                                        .purchasesList[widget.index]
                                    ['amount']!,
                                    15.sp,
                                    Colors.black,
                                    FontWeight.w400),
                                SizedBox(width: 0.5.h),
                                addText(
                                    'sent',
                                    12.sp,
                                    Color(0xff073EFF),
                                    FontWeight.w400),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              children: [
                                addText(
                                    'TR No : ',
                                    13.sp,
                                    Colors.black,
                                    FontWeight.w400),
                                SizedBox(width: 0.5.h),
                                addText(
                                    '2587961',
                                    13.sp,
                                    Colors.black,
                                    FontWeight.w400),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addText(
                            Get.find<WalletController>()
                                .purchasesList[widget.index]['date']!,
                            15.sp,
                            CustomColors.greyColor,
                            FontWeight.w500),
                        SizedBox(height: 1.h),
                        addText(
                            Get.find<WalletController>()
                                .purchasesList[widget.index]['time']!,
                            13.sp,
                            CustomColors.greyColor,
                            FontWeight.w500),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                BaseButton(
                  title: translate(context).print_receipt.toUpperCase(),
                  btnWidth: 40.w,
                  textSize: 16.sp,
                  onPressed: (){},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
