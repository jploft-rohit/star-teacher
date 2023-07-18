import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';
import 'package:staff_app/view/shop_screen/tabs/order_list_tile.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> with SingleTickerProviderStateMixin {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();

  late TabController tabCtrl;
  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 2, vsync: this)..addListener(() {
      if (!(tabCtrl.indexIsChanging)) {
        controller.ordersTabIndex.value = tabCtrl.index;
        controller.getShopOrders();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: CustomColors.red,
      height: MediaQuery.of(context).size.height - 64.sp,
      child: Column(
        children: [
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: buildTabBar(),
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: TabBarView(
              controller: tabCtrl,
              children: const [
                OrderListTile(),
                OrderListTile(),
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
