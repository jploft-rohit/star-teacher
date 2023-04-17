import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_tab_bar.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/shop_screen/canteen_screen.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';
import 'package:staff_app/view/shop_screen/star_shop/all_shop_starApp_view.dart';
import 'package:staff_app/view/shop_screen/stationary_shop/all_shop_view.dart';
import 'package:staff_app/view/shop_screen/tabs/shop_canteen_tab.dart';

class ShopDetailView extends StatefulWidget {
  const ShopDetailView({super.key});

  @override
  State<ShopDetailView> createState() => _ShopDetailViewState();
}

class _ShopDetailViewState extends State<ShopDetailView> with TickerProviderStateMixin {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this)..addListener(() {
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
    return DefaultTabController(
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
              ShopCanteenTab(),
              ShopCanteenTab(),
              ShopCanteenTab(),
            ]),
          ),
        ],
      ),
    );
  }
}
