import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';

class CanteenThisWeekOrderView extends StatefulWidget {
  const CanteenThisWeekOrderView({super.key});

  @override
  State<CanteenThisWeekOrderView> createState() => _CanteenThisWeekOrderViewState();
}

class _CanteenThisWeekOrderViewState extends State<CanteenThisWeekOrderView> {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
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
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: CustomColors.textLightGreyColor),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 3)
        ],
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              detailRow('Order Id : ', '#45689'),
              detailRow('Order Total : ', '42 AED'),
              detailRow('Order Date : ', '01/08/2022'),
              detailRow('Serving Days : ', 'Monday, Tuesday, Wednesday'),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: index.isEven ? 3 : 1,
                  color: CustomColors.primaryColor,
                  titles: controller.canteenThisWeekDates,
                  statuses: controller.canteenThisWeekHeading,
                ),
              ),
            ],
          ),
          Visibility(
            visible: index.isEven != true,
            child: Positioned(
              right: 0,
              top: 10,
              child: Row(
                children: [
                  BaseButton(
                      btnWidth: 65,
                      title: "Cancel",
                      textSize: 15.sp,
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
                  SizedBox(width: 1.h),
                  InkWell(
                    onTap: (){

                    },
                    child: Image.asset(editPng, color: CustomColors.primaryColor,height: 18.sp,),
                  )
                ],
              ),
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
          children: [
            addText(label, 15.sp, CustomColors.textBlackColor,
                FontWeight.w400),
            addText(body, 15.sp,
                CustomColors.primaryColor, FontWeight.w700),
          ],
        ),
        SizedBox(height: 0.5.h)
      ],
    );
  }
}
