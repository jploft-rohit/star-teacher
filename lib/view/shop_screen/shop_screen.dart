import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/shop_screen/cart/cart_view.dart';
import 'package:staff_app/view/shop_screen/cart/tray_view.dart';
import 'package:staff_app/view/shop_screen/orders/order_view.dart';
import 'package:staff_app/view/shop_screen/shop_detail_screen.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';


class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> with SingleTickerProviderStateMixin{
  ShopScreenCtrl controller = Get.put(ShopScreenCtrl());
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      controller.selectedIndex.value = tabController.index;
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: CustomColors.white,
        appBar: const BaseAppBar(title: "Shop"),
        floatingActionButton: Obx(
              () => controller.selectedIndex.value == 0
              ? shopFloatingButton(() {
            if (controller.selectedIndex1.value == 2) {
              Get.to(const TrayView());
            } else {
              Get.to(const CartView());
            }
          })
              : const SizedBox.shrink(),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              BaseToggleTabBar(controller: tabController, tabs: [
                BaseTabButton(title: translate(context).shop, isSelected: tabController.index == 0),
                BaseTabButton(title: translate(context).orders, isSelected: tabController.index == 1),
              ]),
              SizedBox(height:2.h),
              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: CustomColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: CustomColors.borderColor
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                    const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                  ],
                ),
              ),
              SizedBox(height:1.h),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                  ShopDetailView(),
                  OrderView()
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget shopFloatingButton(onTap) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.backgroundColor,
                border: Border.all(color: CustomColors.primaryColor)),
            child: SvgPicture.asset('assets/images/shopping-cart 1.svg'),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.primaryColor,
          ),
          child: addText(
              '3', 12.sp, CustomColors.white, FontWeight.w400),
        )
      ],
    );
  }
}
