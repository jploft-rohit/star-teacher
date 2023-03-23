import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_tab_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/shop_screen/orders/shop_order/canteen_orders.dart';
import 'package:staff_app/view/shop_screen/orders/shop_order/shop_order_view.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> with SingleTickerProviderStateMixin {
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
                // SizedBox.shrink(),
                CanteenOrderView(),
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
