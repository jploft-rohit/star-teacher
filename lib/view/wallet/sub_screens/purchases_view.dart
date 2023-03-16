import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/wallet/sub_screens/topup_your_famaily_popup.dart';
import 'package:staff_app/view/wallet/sub_screens/transaction_history_popup.dart';
import 'package:staff_app/view/wallet/wallet_controller.dart';

class PurchasesView extends StatefulWidget {
  const PurchasesView({super.key});

  @override
  State<PurchasesView> createState() => _PurchasesViewState();
}

class _PurchasesViewState extends State<PurchasesView> {
  WalletController controller = Get.find<WalletController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.h),
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
                      Obx(
                        () => Text('${controller.walletBalance.value} AED', style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor,fontSize: 21.sp),),
                      ),
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
                              return TopupYourFamilyPopup();
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
        SizedBox(height: 2.h),
        GetBuilder<WalletController>(
          builder: (controller) {
            return purchasesToogleButton(() {
              controller.isTransaction.value = true;
              controller.isTopUpRecord.value = false;
              controller.update();
            }, controller.isTransaction.value, () {
              controller.isTransaction.value = false;
              controller.isTopUpRecord.value = true;
              controller.update();
            }, controller.isTopUpRecord.value);
          }
        ),
        SizedBox(height: 1.5.h),
        Row(
          children: [
            Expanded(child: calenderDownButton('${translate(context).from}: 10/10/2022', () {})),
            SizedBox(width: 0.5.h),
            Expanded(child: calenderDownButton('${translate(context).to}:  20/10/2022', () {})),
          ],
        ),
        SizedBox(height: 2.h),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: CustomColors.backgroundColor,
              borderRadius: BorderRadius.circular(15)),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                buildTransactionItem(context, index),
            itemCount: controller.purchasesList.length,
          ),
        )
      ],
    );
  }

  Widget buildTransactionItem(BuildContext context, index) {
    return GetBuilder<WalletController>(
      builder: (controller) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder:  (context, animation, secondaryAnimation) {
                    return TransactionHistoryPopup(index: index,);
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        controller.purchasesList[index]['image']!,
                        fit: BoxFit.scaleDown,
                        height: 5.h,
                      ),
                      SizedBox(width: 1.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(controller.isTopUpRecord.value ? "**** **** **** 9890" : 'Purchases', style: Style.montserratRegularStyle().copyWith(fontSize: 15.sp, color: CustomColors.textBlackColor),),
                              // SizedBox(width: 0.5.h),
                              Text(
                                '(${controller.purchasesList[index]['item']})',
                                style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, color: CustomColors.textBlackColor),),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                controller.purchasesList[index]['amount']!,
                                style: Style.montserratRegularStyle().copyWith(fontSize: 15.sp, color: CustomColors.textBlackColor),),
                              SizedBox(width: 0.5.h),
                              Text( controller.isTopUpRecord.value ? "Added" : 'sent', style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, color: Color(0xff073EFF)),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.purchasesList[index]['date']!,
                        style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp),),
                      SizedBox(height: 1.h),
                      Text(
                        controller.purchasesList[index]['time']!,
                        style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp),),
                    ],
                  ),
                ],
              ),
            ),
            Divider()
          ],
        );
      },
    );
  }
}
