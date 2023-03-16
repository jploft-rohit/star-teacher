import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
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
    return Container(
      height: 32,
      decoration: BoxDecoration(
          boxShadow: kElevationToShadow[1],
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8)),
      child: TabBar(
        labelPadding: EdgeInsets.zero,
        controller: tabCtrl,
        padding: const EdgeInsets.all(4),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]),
        labelColor: CustomColors.primaryColor,
        unselectedLabelColor: Colors.black,
        unselectedLabelStyle: TextStyle(
            fontSize: 14.sp, fontWeight: FontWeight.w400),
        labelStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 14.sp),
        tabs: [
          Tab(
            text: 'Shop Orders'.tr,
          ),
          Tab(
            text: 'Canteen Orders'.tr,
          ),
        ],
      ),
    );
  }
}
