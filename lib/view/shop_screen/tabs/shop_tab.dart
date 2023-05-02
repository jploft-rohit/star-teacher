import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/shop_screen/cart/cart_view.dart';
import 'package:staff_app/view/shop_screen/cart/tray_view.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';
import 'package:staff_app/view/shop_screen/tabs/shop_tabs/canteen_tab.dart';
import 'package:staff_app/view/shop_screen/tabs/shop_tabs/stars_store_tab.dart';
import 'package:staff_app/view/shop_screen/tabs/shop_tabs/stationery_tab.dart';

class ShopTab extends StatefulWidget {
  const ShopTab({super.key});

  @override
  State<ShopTab> createState() => _ShopTabState();
}

class _ShopTabState extends State<ShopTab> with TickerProviderStateMixin {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      controller.selectedIndex1.value = tabController.index;
      setState(() {});
    });
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: shopFloatingButton(() {
        if (controller.selectedIndex1.value == 2) {
          Get.to(const TrayView());
        } else {
          Get.to(CartView(isStationery: tabController.index == 0 ? true : false, isStarsStore: tabController.index == 1 ? true : false,));
        }
      }),
      body: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 1.h),
            BaseToggleTabBar(controller: tabController, tabs: [
              BaseTabButton(title: translate(context).stationery, isSelected: tabController.index == 0),
              BaseTabButton(title: translate(context).stars_store, isSelected: tabController.index == 1),
              BaseTabButton(title: translate(context).canteen, isSelected: tabController.index == 2),
            ]),
            SizedBox(height: 1.h),
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: [
                    StationeryTab(),
                    StarsStoreTab(),
                    CanteenTab(),
                  ]),
            ),
          ],
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
          child: addText(
              '3', 12.sp, BaseColors.white, FontWeight.w400),
        )
      ],
    );
  }
}
