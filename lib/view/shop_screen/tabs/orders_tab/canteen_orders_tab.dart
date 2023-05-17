import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/view/shop_screen/tabs/orders_tab/canteen_orders_tab/every_week_tab.dart';
import 'package:staff_app/view/shop_screen/tabs/orders_tab/canteen_orders_tab/this_week_tab.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';

class CanteenOrdersTab extends StatefulWidget {
  const CanteenOrdersTab({super.key});

  @override
  State<CanteenOrdersTab> createState() => _CanteenOrdersTabState();
}

class _CanteenOrdersTabState extends State<CanteenOrdersTab> with SingleTickerProviderStateMixin {
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
      // color: CustomColors.green,
      height: MediaQuery.of(context).size.height - 10.sp,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 1.h),
            buildTabBar(),
            SizedBox(height: 1.h),
            Container(
              color: BaseColors.greyColor,
              height: MediaQuery.of(context).size.height - 10.sp,
              child: TabBarView(
                controller: tabCtrl,
                children: const [
                  ThisWeekTab(),
                  EveryWeekTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTabBar() {
    return BaseTabBar(
      controller: tabCtrl,
      tabs: [
        Tab(
          text: 'This Week'.tr,
        ),
        Tab(
          text: 'Every Week'.tr,
        ),
      ],
    );
  }
}
