import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/shop_screen/cart/cart_view.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';
import 'package:staff_app/view/shop_screen/shop_tabs/shop_dynamic_tabs/shop_grid_item/shop_grid_item.dart';

class CardTagShopScreen extends StatefulWidget {
  const CardTagShopScreen({super.key});

  @override
  State<CardTagShopScreen> createState() => _CardTagShopScreenState();
}

class _CardTagShopScreenState extends State<CardTagShopScreen> with TickerProviderStateMixin {
  ShopScreenCtrl controller = Get.put(ShopScreenCtrl());

  @override
  void initState() {
    super.initState();
    controller.secondaryTabIndex.value = 1;
    controller.getShopCategoryListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Request Cards & Tags",),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: scaffoldPadding),
        child: const ShopGridItem(),
      ),
      bottomSheet: SizedBox(
        height: 70,
        child: Center(
          child: BaseButton(
              title: "ADD TO CART",
              bottomMargin: 3.h,
              onPressed: (){
                if ((controller.cartProductsList?.length??0) != 0) {
                  Get.to(const CartView(isFromCardsTags: true))?.then((value) {
                    controller.getShopCategoryListData();
                  });
                }else{
                  baseToast(message: "No Product Found In Cart");
                }
                },
              btnType: largeButton,
          ),
        ),
      ),
    );
  }

  Widget shopFloatingButton(onTap) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: BaseColors.backgroundColor,
                border: Border.all(color: BaseColors.primaryColor)),
            child: SvgPicture.asset('assets/images/shopping-cart 1.svg'),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: BaseColors.primaryColor,
          ),
          child: Obx(()=>addText((controller.cartProductsList?.length??0).toString(), 12.sp, BaseColors.white, FontWeight.w400),
          ),
        )
      ],
    );
  }
}
