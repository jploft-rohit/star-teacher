import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/intl/intl.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/view/wallet/wallet_controller.dart';

class TransactionHistoryPopup extends StatefulWidget {
  final int index;
  TransactionHistoryPopup({Key? key, required this.index}) : super(key: key);

  @override
  State<TransactionHistoryPopup> createState() => _TransactionHistoryPopupState();
}

class _TransactionHistoryPopupState extends State<TransactionHistoryPopup> {
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  WalletController controller = Get.find<WalletController>();

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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: BaseColors.greyColor),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  margin: const EdgeInsets.only(bottom: 15),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        controller.selectedTabIndex.value == 0
                            ? BaseImageNetwork(
                          link: (controller.list?[widget.index]?.productImages??[]).isNotEmpty ? (controller.list?[widget.index]?.productImages?.first??"") : "",
                          concatBaseUrl: false,
                          height: 6.h,
                          width: 7.h,
                          leftMargin: 0.6.w,
                          rightMargin: isRTL ? 1.1.w : 0,
                          borderRadius: 10,
                        )
                            : Container(
                          width: 10.h,
                          padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                          margin: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                              color: BaseColors.backgroundColor,
                              border: Border.all(color: BaseColors.primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(controller.list?[widget.index]?.txnAmount.toString()??"", style: Style.montserratBoldStyle().copyWith(fontSize: 20.sp, color: BaseColors.primaryColor),),
                              Text("AED", style: Style.montserratRegularStyle().copyWith(fontSize: 16.sp, color: BaseColors.primaryColor),),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.selectedTabIndex.value == 0
                                    ? Text(controller.list?[widget.index]?.otherUser?.name??"", style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: BaseColors.textBlackColor))
                                    : Text("Amount Added", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                const SizedBox(height: 4),
                                Visibility(
                                    visible: controller.selectedTabIndex.value == 0,
                                    child: Text("Order ID : ${controller.list?[widget.index]?.order?.orderId?.toString()??""}", style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor, fontWeight: FontWeight.w400))),
                                Visibility(
                                    visible: controller.selectedTabIndex.value == 0,
                                    child: const SizedBox(height: 4)),
                                Text("TR No : ${controller.list?[widget.index]?.transactionNo?.toString()??""}", style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor, fontWeight: FontWeight.w400)),
                                const SizedBox(height: 4),
                                Visibility(
                                  visible: controller.selectedTabIndex.value == 0,
                                  child: Text("${controller.list?[widget.index]?.txnFor} (${(controller.list?[widget.index]?.productNames??[]).isNotEmpty ? (controller.list?[widget.index]?.productNames?.first??"") : ""})", style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                ),
                                Visibility(
                                  visible: controller.selectedTabIndex.value == 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text.rich(TextSpan(children: [
                                      TextSpan(text: "${controller.list?[widget.index]?.txnAmount.toString()??"0"} AED",style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                      const WidgetSpan(child: SizedBox(width: 2)),
                                      TextSpan(text: toBeginningOfSentenceCase(controller.list?[widget.index]?.paymentType??"")??"",style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: Colors.blue,fontWeight: FontWeight.w400)),
                                    ])),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: isRTL ? 0 : 10,top: 2, left: isRTL ? 10 : 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(formatBackendDate(controller.list?[widget.index]?.createdAt??""), style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                              const SizedBox(height: 8),
                              Text(getFormattedTime(controller.list?[widget.index]?.createdAt??""), style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                            downloadFile(url: controller.list?[widget.index]?.reciept??"");
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
