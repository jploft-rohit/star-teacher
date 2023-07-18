import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/library_record/sub_pages/return_view.dart';
import 'package:staff_app/view/shop_screen/orders/edit_order_view.dart';
import 'package:staff_app/view/shop_screen/orders/shop_return_view.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';

class OrderListTile extends StatefulWidget {
  const OrderListTile({super.key});

  @override
  State<OrderListTile> createState() => _OrderListTileState();
}

class _OrderListTileState extends State<OrderListTile> {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>ListView.builder(
        shrinkWrap: true,
        itemCount: controller.shopOrdersList?.length??0,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          int stepperIndex = -5;
          controller.statusTime.value = ["\n","\n","\n"];
          controller.statusTitle.value = ["Order Placed", "Confirmed", "Served"];
          controller.shopOrdersList?[index]?.progressStatus?.toList().asMap().forEach((loopIndex,element) {
            controller.statusTime[loopIndex] = (getFormattedTimeWithMonth(element.timestamp??""));
            stepperIndex = loopIndex;
          });
          return buildCanteenThisWeekOrderBox(context, index, stepperIndex: stepperIndex);
        },
      ),
    );
  }

  Widget buildCanteenThisWeekOrderBox(context, index,{required int stepperIndex}) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      width: 100.w,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: BoxDecoration(
        color: BaseColors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: BaseColors.textLightGreyColor),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 3)
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    detailRow('Order Id : ', '#${controller.shopOrdersList?[index]?.orderId?.toString()??""}'),
                    detailRow('Order Total : ', '${controller.shopOrdersList?[index]?.totalAmount?.toString()??""} AED'),
                    detailRow('Order Date : ', formatBackendDate(controller.shopOrdersList?[index]?.createdAt??"")),
                    // detailRow('Serving Days : ', 'Monday, Tuesday, Wednesday'),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Visibility(
                      visible: (stepperIndex) == 2,
                      child: BaseButton(
                          title: "Return",
                          btnType: smallButton,
                          removeHorizontalPadding: true,
                          onPressed: () {
                            Get.to(ShopReturnView());
                          }),
                    ),
                    Visibility(
                      visible: (stepperIndex) != 2,
                      child: BaseButton(
                          title: "Cancel",
                          btnType: smallButton,
                          removeHorizontalPadding: true,
                          onPressed: () {
                            BaseOverlays().showConfirmationDialog(title: "Are you sure you want to cancel this order?",onRightButtonPressed: (){
                              controller.cancelOrder(id: controller.shopOrdersList?[index]?.sId??"", index: index);
                            });
                            // .then((value) {
                            //   showGeneralDialog(
                            //     context: context,
                            //     pageBuilder:  (context, animation, secondaryAnimation) {
                            //       return ConfirmationDialog(isShowBtn: true,msg: "Order Canceled, refund will be\nupdated to your account within\n3-5 business days",btnText: "Ok",);
                            //     },
                            //   );
                            // });
                          }),
                    ),
                    SizedBox(width: 1.5.w),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          Get.to(EditOrderView(id: controller.shopOrdersList?[index]?.sId??""));
                        },
                        child: Align(alignment: Alignment.centerRight,child: Image.asset(editPng, color: BaseColors.primaryColor,height: 18.sp,)),
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: StepProgressView(
              width: MediaQuery.of(context).size.width,
              curStep: stepperIndex+1,
              color: BaseColors.primaryColor,
              titles: controller.statusTime,
              statuses: controller.statusTitle,
            ),
          ),
        ],
      ),
    );
  }

  Widget detailRow(label, body) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addText(label, 14.sp, BaseColors.textBlackColor, FontWeight.w400),
            Expanded(child: addText(body, 14.sp, BaseColors.primaryColor, FontWeight.w700)),
          ],
        ),
        SizedBox(height: 0.5.h)
      ],
    );
  }
}
