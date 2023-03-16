import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/shop_screen/orders/canteen_orders/sub_screens/every_week.dart';
import 'package:staff_app/view/shop_screen/orders/canteen_orders/sub_screens/this_week.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';

class CanteenOrderView extends StatefulWidget {
  const CanteenOrderView({super.key});

  @override
  State<CanteenOrderView> createState() => _CanteenOrderViewState();
}

class _CanteenOrderViewState extends State<CanteenOrderView> with SingleTickerProviderStateMixin {
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
              color: CustomColors.greyColor,
              height: MediaQuery.of(context).size.height - 10.sp,
              child: TabBarView(
                controller: tabCtrl,
                children: const [
                  CanteenThisWeekOrderView(),
                  CanteenEveryWeekOrderView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 35,
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
            fontSize: 13.sp, fontWeight: FontWeight.w400),
        labelStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 13.sp),
        tabs: [
          Tab(
            text: 'This Week'.tr,
          ),
          Tab(
            text: 'Every Week'.tr,
          ),
        ],
      ),
    );
  }
}
