import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';

class CanteenShopAllView extends StatefulWidget {
  const CanteenShopAllView({super.key});

  @override
  State<CanteenShopAllView> createState() => _CanteenShopAllViewState();
}

class _CanteenShopAllViewState extends State<CanteenShopAllView> {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 2.h),
            CustomTextField(
              controller: TextEditingController(),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Icon(
                  Icons.search,
                ),
              ),
              hintTextColor: BaseColors.textLightGreyColor,
              hintText: 'Search by name',
            ),
            SizedBox(height:2.h),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: controller.canteenShopList.length,
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
                            controller.canteenShopList[index]['image']!,
                            fit: BoxFit.fill,
                          ),
                        )),
                    addText(
                        controller.canteenShopList[index]['name']!,
                        15.sp + 2,
                        BaseColors.textBlackColor,
                        FontWeight.w400),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        addText(
                            controller.canteenShopList[index]['price']!,
                            15.sp,
                            BaseColors.primaryColor,
                            FontWeight.w400),
                        BaseButton(
                            title: "+Add",
                            onPressed: () {})
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
