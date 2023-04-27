import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/shop_screen/cart/cart_view.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';

class StationaryShopAllView extends StatefulWidget {
  const StationaryShopAllView({super.key});

  @override
  State<StationaryShopAllView> createState() => _StationaryShopAllViewState();
}

class _StationaryShopAllViewState extends State<StationaryShopAllView> {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:2.h),
            CustomTextField(
              controller: TextEditingController(),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Icon(
                  Icons.search,
                ),
              ),
              hintTextColor: BaseColors.textLightGreyColor,
              hintText: 'Search by name',
            ),
            SizedBox(height:2.h),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.shopStationaryList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 30.h,
                  mainAxisSpacing: 3.h,
                  crossAxisSpacing: 3.h),
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  Get.to(const CartView());
                },
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: kElevationToShadow[2],
                      color: BaseColors.white),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: double.infinity,
                          height: 20.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              controller.shopStationaryList[index]['image']!,
                              fit: BoxFit.fill,
                            ),
                          )),
                      addText(
                          controller.shopStationaryList[index]['name']!,
                          16.sp,
                          BaseColors.textBlackColor,
                          FontWeight.w400),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: addText(
                                controller.shopStationaryList[index]['price']!,
                                15.sp,
                                BaseColors.primaryColor,
                                FontWeight.w400),
                          ),
                          Expanded(
                            flex: 1,
                            child: BaseButton(
                                verticalPadding: 0,
                                removeHorizontalPadding: false,
                                title: "+Add",
                                onPressed: () {}),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
