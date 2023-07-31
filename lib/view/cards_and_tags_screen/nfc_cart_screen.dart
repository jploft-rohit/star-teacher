import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/cards_and_tags_screen/controller/card_tag_ctrl.dart';
import 'package:staff_app/view/cards_and_tags_screen/wallet_pay_popup.dart';
import 'package:staff_app/view/shop_screen/cart/cart_card_detail.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';
import 'package:staff_app/view/wallet/sub_screens/cartd_detail_popup.dart';

class NFCCartScreen extends StatefulWidget {
  const NFCCartScreen({super.key});

  @override
  State<NFCCartScreen> createState() => _NFCCartScreenState();
}

class _NFCCartScreenState extends State<NFCCartScreen> {
  CardTagCtrl controller = Get.find<CardTagCtrl>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(title: "Cart"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addText('Items', 15.sp,
                  BaseColors.textBlackColor, FontWeight.w400),
              SizedBox(height: 2.h),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) => buildCartCard(
                    'assets/delete/Rectangle 429.png', 'NFC Tags', '15 AED', 2),
              ),
              SizedBox(height:2.h),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: BaseColors.borderColor)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: addText(
                          'Select shipping',
                          15.sp,
                          BaseColors.textBlackColor,
                          FontWeight.w400),
                    ),
                    SizedBox(height:1.h),
                    Obx(() => Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        radioButton(() {
                          controller.homeDelivertSelected();
                        }, controller.isHomeDelivery.value,
                            'Home delivery'),
                        SizedBox(width: 2.h),
                        radioButton(() {
                          controller.schoolDelivertSelected();
                        }, controller.isSchoolDelivery.value,
                            'Handover to school'),
                      ],
                    )),
                    SizedBox(height:1.h),
                  ],
                ),
              ),
              SizedBox(height:2.h),
              detailRow('Sub Total', '160 AED'),
              SizedBox(height:1.h),
              detailRow('Taxes (5%)', '8 AED'),
              SizedBox(height:1.h),
              detailRow('Shipping Charges', '0 AED'),
              SizedBox(height:1.h),
              detailRow('Grand Total', '168 AED'),
              SizedBox(height:3.h),
              Row(
                children: [
                  Expanded(
                    child: BaseButton(removeHorizontalPadding: true,title: "PROCEED TO PAY", onPressed: (){
                      showGeneralDialog(
                        context: context,
                        pageBuilder:  (context, animation, secondaryAnimation) {
                          return CartCardDetail(isFromCart: true);
                        },
                      );
                    }),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                    child: BaseButton(title: "WALLET PAY", onPressed: (){
                      showGeneralDialog(
                        context: context,
                        pageBuilder:  (context, animation, secondaryAnimation) {
                          return WalletPayPopup();
                        },
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height:3.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCartCard(image, name, price, quantity) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: BaseColors.white,
          boxShadow: kElevationToShadow[2],
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: BaseColors.txtFiledBorderColor)
              ),
              // width: double.infinity,
              height: 10.h,
              width: 10.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              )),
          SizedBox(width: 2.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText(name, 16.sp, BaseColors.textBlackColor,
                    FontWeight.w400),
                SizedBox(height:0.5.h),
                addText(price, 14.sp,
                    BaseColors.primaryColor, FontWeight.w700),
                SizedBox(height:1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[1],
                          borderRadius: BorderRadius.circular(30),
                          border:
                          Border.all(color: BaseColors.primaryColor),
                          color: BaseColors.backgroundColor),
                      // width: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          textButton2(() {
                            if(quantity >= 0){
                              quantity--;
                              setState(() {});
                            }
                          }, '-'),
                          SizedBox(width: 1.5.h),
                          addText("$quantity", 14.sp,
                              BaseColors.primaryColor, FontWeight.w900),
                          SizedBox(width: 1.5.h),
                          textButton2(() {
                            quantity++;
                            setState(() {});
                          }, '+'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                      child: VerticalDivider(
                        color: BaseColors.borderColor,
                        thickness: 1.5,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/delete 4.svg",
                          color: BaseColors.textRedColor,
                          height: 2.h,
                        ),
                        SizedBox(width: 1.h),
                        addText('Remove', 14.sp,
                            BaseColors.textRedColor, FontWeight.w400)
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 2.h),
        ],
      ),
    );
  }

  Widget detailRow(title, body) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        addText(title, 15.sp, BaseColors.textBlackColor,
            FontWeight.w400),
        addText(body, 15.sp, BaseColors.primaryColor,
            FontWeight.w700),
      ],
    );
  }
}
