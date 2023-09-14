import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:ui' as ui;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/view/wallet/sub_screens/transaction_history_popup.dart';
import 'package:staff_app/view/wallet/wallet_controller.dart';

import '../../../utility/sizes.dart';

class TransactionTile extends StatefulWidget {
  const TransactionTile({super.key});

  @override
  State<TransactionTile> createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  WalletController controller = Get.find<WalletController>();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Obx(()=>SmartRefresher(
        footer: const BasePaginationFooter(),
        controller: controller.refreshController,
        enablePullDown: enablePullToRefresh,
        enablePullUp: true,
        onLoading: (){
          controller.getHistory(refreshType: "load");
        },
        onRefresh: (){
          controller.getHistory(refreshType: "refresh");
        },
        child: ListView.builder(
            padding: EdgeInsets.only(bottom: 10.h),
            shrinkWrap: true,
            itemCount: controller.list?.length??0,
            itemBuilder: (context, index) {
              return GestureDetector(
              onTap: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder:  (context, animation, secondaryAnimation) {
                    return TransactionHistoryPopup(index: index);
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: BaseColors.greyColor),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            controller.selectedTabIndex.value == 0 && (controller.list?[index]?.productImages?.length??0) != 0
                                ? BaseImageNetwork(
                                    link: controller.list?[index]?.productImages?.first??"",
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
                                  decoration: BoxDecoration(
                                      color: BaseColors.backgroundColor,
                                      border: Border.all(color: BaseColors.primaryColor),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(controller.list?[index]?.txnAmount.toString()??"", style: Style.montserratBoldStyle().copyWith(fontSize: 20.sp, color: BaseColors.primaryColor),),
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
                                        ? Text(controller.list?[index]?.title??"", style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: BaseColors.textBlackColor))
                                        : Text("Amount Added", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                    const SizedBox(height: 4),
                                    controller.selectedTabIndex.value == 0
                                        ? Text('#${controller.list?[index]?.txnId??""}', style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.primaryColor))
                                        : Row(
                                          children: [
                                            Text('TR No : ${controller.list?[index]?.txnId??""}', style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp)),
                                          ],
                                        ),
                                    Visibility(
                                      visible: controller.selectedTabIndex.value == 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: Text(controller.list?[index]?.description??"", style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                      ),
                                    ),
                                    Visibility(
                                      visible: controller.selectedTabIndex.value == 0,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 4),
                                        child: Text.rich(TextSpan(children: [
                                          TextSpan(text: "${controller.list?[index]?.txnAmount.toString()??"0"} AED",style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                          const WidgetSpan(child: SizedBox(width: 2)),
                                          TextSpan(text: "Sent",style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: Colors.blue,fontWeight: FontWeight.w400)),
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
                                  Text(formatBackendDate(controller.list?[index]?.createdAt??""), style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                  const SizedBox(height: 8),
                                  Text(getFormattedTime(controller.list?[index]?.createdAt??""), style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
            },
          ),
      ),
      ),
    );
  }
}
