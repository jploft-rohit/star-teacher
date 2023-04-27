import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/library_record/sub_pages/return_view.dart';
import 'package:staff_app/view/shop_screen/orders/edit_order_view.dart';
import 'package:staff_app/view/shop_screen/orders/shop_return_view.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';

class ThisWeekTab extends StatefulWidget {
  const ThisWeekTab({super.key});

  @override
  State<ThisWeekTab> createState() => _ThisWeekTabState();
}

class _ThisWeekTabState extends State<ThisWeekTab> {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) =>
                  buildCanteenThisWeekOrderBox(context, index),
            ),
            SizedBox(height: 5.h)
          ],
        ),
      ),
    );
  }

  Widget buildCanteenThisWeekOrderBox(context, index) {
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
                    detailRow('Order Id : ', '#45689'),
                    detailRow('Order Total : ', '42 AED'),
                    detailRow('Order Date : ', '01/08/2022'),
                    detailRow('Serving Days : ', 'Monday, Tuesday, Wednesday'),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Visibility(
                      visible: index==0,
                      child: BaseButton(
                          title: "Return",
                          btnType: smallButton,
                          removeHorizontalPadding: true,
                          onPressed: () {
                            Get.to(ShopReturnView());
                          }),
                    ),
                    Visibility(
                      visible: index.isEven != true,
                      child: BaseButton(
                          title: "Cancel",
                          btnType: smallButton,
                          removeHorizontalPadding: true,
                          onPressed: () {
                            showGeneralDialog(
                              context: context,
                              pageBuilder:  (context, animation, secondaryAnimation) {
                                return ConfirmationDialog(isShowBtn: true,msg: "Are you sure you want\nto cancel this order?",);
                              },
                            ).then((value) {
                              showGeneralDialog(
                                context: context,
                                pageBuilder:  (context, animation, secondaryAnimation) {
                                  return ConfirmationDialog(isShowBtn: true,msg: "Order Canceled, refund will be\nupdated to your account within\n3-5 business days",btnText: "Ok",);
                                },
                              );
                            });
                          }),
                    ),
                    SizedBox(width: 1.5.w),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          Get.to(EditOrderView());
                        },
                        child: Image.asset(editPng, color: BaseColors.primaryColor,height: 18.sp,),
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
              curStep: index.isEven ? 3 : 1,
              color: BaseColors.primaryColor,
              titles: controller.canteenThisWeekDates,
              statuses: controller.canteenThisWeekHeading,
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
