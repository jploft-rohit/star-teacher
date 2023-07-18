import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/shop_screen/shop_tabs/order_tab.dart';
import 'package:staff_app/view/shop_screen/shop_tabs/shop_tab.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';


class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin{
  ShopScreenCtrl controller = Get.put(ShopScreenCtrl());
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    controller.getShopCategoryListData();
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      if (!(tabController.indexIsChanging)) {
        controller.primaryTabIndex.value = tabController.index;
        setState(() {});
        if(tabController.index == 0){
          controller.getShopCategoryListData();
        }else{
          controller.getShopOrders();
        }
        // controller.getData();
      }
    });
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
              BaseSchoolDropDown(
                topMargin: 2.h,
                controller: controller.schoolController,
                onChanged: (val){
                  controller.schoolController.text = val.name??"";
                  controller.selectedSchoolId.value = val.sId??"";
                  controller.getShopOrders();
                },
                bottomMargin: 1.h,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                  ShopTab(),
                  OrderTab()
                 ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
