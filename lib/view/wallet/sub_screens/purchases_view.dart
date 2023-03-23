import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/change_status_popup.dart';
import 'package:staff_app/view/wallet/sub_screens/topup_your_famaily_popup.dart';
import 'package:staff_app/view/wallet/sub_screens/transaction_history_popup.dart';
import 'package:staff_app/view/wallet/wallet_controller.dart';

class PurchasesView extends StatefulWidget {
  const PurchasesView({super.key});

  @override
  State<PurchasesView> createState() => _PurchasesViewState();
}

class _PurchasesViewState extends State<PurchasesView> with SingleTickerProviderStateMixin{
  WalletController controller = Get.find<WalletController>();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  return const TopupYourFamilyPopup();
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
            BaseToggleTabBar(controller: tabController, tabs: [
              BaseTabButton(title: translate(context).transaction, isSelected: tabController.index == 0),
              BaseTabButton(title: translate(context).top_up_record, isSelected: tabController.index == 1),
            ]),
            SizedBox(height: 1.5.h),
            Row(
              children: [
                Expanded(child: calenderDownButton('${translate(context).from}: 10/10/2022', () {})),
                SizedBox(width: 0.5.h),
                Expanded(child: calenderDownButton('${translate(context).to}:  20/10/2022', () {})),
              ],
            ),
            SizedBox(height: 2.h),
            const Text("Transactions",style: TextStyle(fontWeight: FontWeight.w500),),
            SizedBox(height: 1.h),
            AutoScaleTabBarView(
              controller: tabController,
                children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: CustomColors.backgroundColor,
                    borderRadius: BorderRadius.circular(15)),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildTransactionItem(context, index),
                  itemCount: controller.purchasesList.length,
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) => buildTopUpItem(context, index),
                itemCount: controller.purchasesList.length,
              ),
            ]),
          ],
        ),
      ),
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
                              Text( controller.isTopUpRecord.value ? "Added" : 'sent', style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, color: const Color(0xff073EFF)),),
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
            Divider(),
          ],
        );
      },
    );
  }
  Widget buildTopUpItem(BuildContext context, index) {
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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 3.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: CustomColors.greyColor)),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: 12.h,
                                padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                                decoration: BoxDecoration(
                                    color: CustomColors.backgroundColor,
                                    border: Border.all(color: CustomColors.primaryColor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("100", style: Style.montserratBoldStyle().copyWith(fontSize: 22.sp, color: CustomColors.primaryColor),),
                                    Text("AED", style: Style.montserratRegularStyle().copyWith(fontSize: 18.sp, color: CustomColors.primaryColor),),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 2.w),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Amount Added', style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: CustomColors.textBlackColor,fontWeight: FontWeight.w400)),
                                    const SizedBox(height: 8),
                                    Text('TR No : 2587961', style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: CustomColors.textBlackColor,fontWeight: FontWeight.w400)),
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
                                  Text('20/10/2022', style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: CustomColors.textBlackColor,fontWeight: FontWeight.w400)),
                                  const SizedBox(height: 8),
                                  Text('09:00:30pm', style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: CustomColors.textBlackColor,fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: InkWell(
                        onTap: (){
                        },
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                getBoxShadow()
                              ]
                          ),
                          child: SvgPicture.asset(starSvg, height: 18.sp,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
