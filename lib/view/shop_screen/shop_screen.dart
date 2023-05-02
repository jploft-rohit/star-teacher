import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/shop_screen/cart/cart_view.dart';
import 'package:staff_app/view/shop_screen/cart/tray_view.dart';
import 'package:staff_app/view/shop_screen/tabs/order_tab.dart';
import 'package:staff_app/view/shop_screen/tabs/shop_tab.dart';
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
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: BaseColors.white,
        appBar: const BaseAppBar(title: "Shop"),
        // floatingActionButton: Obx(
        //       () => controller.selectedIndex.value == 0
        //       ? shopFloatingButton(() {
        //     if (controller.selectedIndex1.value == 2) {
        //       Get.to(const TrayView());
        //     } else {
        //       Get.to(const CartView());
        //     }
        //   })
        //       : const SizedBox.shrink(),
        // ),
        body: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              BaseToggleTabBar(controller: tabController, tabs: [
                BaseTabButton(title: translate(context).shop, isSelected: tabController.index == 0,type: toggleLargeButton,),
                BaseTabButton(title: translate(context).orders, isSelected: tabController.index == 1,type: toggleLargeButton,),
              ]),
              SizedBox(height:2.h),
              CustomDropDown(
                initialValue: DummyLists.initialSchool,
                hintText: "Select School",
                listData:DummyLists.schoolData,
                onChange: (value) {
                  setState(() {
                    DummyLists.initialSchool=value;
                  });
                },
                topPadding: 5,
                bottomPadding: 5,
                icon: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25,),
              ),
              SizedBox(height: 1.h,),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                  ShopTab(),
                  OrderTab()
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
