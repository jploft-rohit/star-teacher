import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/cards_and_tags_screen/card_tag_ctrl.dart';
import 'package:staff_app/view/cards_and_tags_screen/nfc_cart_screen.dart';
import 'package:staff_app/view/shop_screen/cart/cart_view.dart';

class RequestNFCCardScreen extends StatefulWidget {
  const RequestNFCCardScreen({Key? key}) : super(key: key);

  @override
  State<RequestNFCCardScreen> createState() => _RequestNFCCardScreenState();
}

class _RequestNFCCardScreenState extends State<RequestNFCCardScreen> {
  CardTagCtrl controller = Get.put(CardTagCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Request Card & Tags"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.shopStarShopList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 24.h,
                  mainAxisSpacing: 3.h,
                  crossAxisSpacing: 3.h),
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: kElevationToShadow[2],
                    color: BaseColors.white),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        height: 15.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            controller.shopStarShopList[index]['image']!,
                            fit: BoxFit.fill,
                          ),
                        )),
                    addText(
                        controller.shopStarShopList[index]['name']!,
                        16.sp,
                        BaseColors.textBlackColor,
                        FontWeight.w400),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        addText(
                            controller.shopStarShopList[index]['price']!,
                            15.sp,
                            BaseColors.primaryColor,
                            FontWeight.w400),
                        BaseButton(
                          btnType: smallButton,
                            title: "+Add",
                            onPressed: () {})
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            BaseButton(title: "Add To Cart", onPressed: (){
              Get.to(NFCCartScreen());
            }),
          ],
        ),
      ),
    );
  }
}
