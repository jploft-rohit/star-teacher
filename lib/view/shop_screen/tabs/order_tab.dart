import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/shop_screen/tabs/orders_tab/canteen_orders_tab.dart';
import 'package:staff_app/view/shop_screen/tabs/orders_tab/shop_order_tab.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> with SingleTickerProviderStateMixin {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();

  TabController? tabCtrl;
  @override
  void initState() {
    tabCtrl = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: CustomColors.red,
      height: MediaQuery.of(context).size.height - 64.sp,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: buildTabBar(),
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: TabBarView(
              controller: tabCtrl,
              children: const [
                ShopOrderView(),
                CanteenOrdersTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabBar() {
    return BaseTabBar(
      controller: tabCtrl,
      tabs: [
        Tab(
          text: 'Shop Orders'.tr,
        ),
        Tab(
          text: 'Canteen Orders'.tr,
        ),
      ],
    );
  }
}
