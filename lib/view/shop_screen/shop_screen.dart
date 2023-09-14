import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/shop_screen/shop_tabs/order_tab.dart';
import 'package:staff_app/view/shop_screen/shop_tabs/shop_tab.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';


class ShopView extends StatefulWidget {
  final int? initialTabIndex;
  const ShopView({super.key, this.initialTabIndex});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin{
  ShopScreenCtrl controller = Get.put(ShopScreenCtrl());
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    controller.selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
    controller.schoolController.text = baseCtrl.schoolListData.data?.data?.first.name??"";
    controller.secondaryTabIndex.value = widget.initialTabIndex??0;
    controller.getShopCategoryListData();
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      if (!(tabController.indexIsChanging)) {
        controller.secondaryTabIndex.value = 0;
        controller.ordersTabIndex.value = 0;
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
                  controller.searchController.clear();
                  controller.schoolController.text = val.name??"";
                  controller.selectedSchoolId.value = val.sId??"";
                  if(tabController.index == 0){
                    controller.getShopCategoryListData();
                  }else{
                    controller.getShopOrders();
                  }
                },
                bottomMargin: 1.h,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                  ShopTab(initialTabIndex: widget.initialTabIndex),
                  const OrderTab()
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
