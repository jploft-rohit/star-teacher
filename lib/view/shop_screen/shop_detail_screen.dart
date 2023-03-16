import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/shop_screen/canteen_screen.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';
import 'package:staff_app/view/shop_screen/star_shop/all_shop_starApp_view.dart';
import 'package:staff_app/view/shop_screen/stationary_shop/all_shop_view.dart';

class ShopDetailView extends StatefulWidget {
  const ShopDetailView({super.key});

  @override
  State<ShopDetailView> createState() => _ShopDetailViewState();
}

class _ShopDetailViewState extends State<ShopDetailView> with TickerProviderStateMixin {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();

  TabController? tabCtrl;
  @override
  void initState() {
    tabCtrl = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 1.h),
        Row(
          children: [
            Obx(() => Flexible(
              flex: 1,
              child: InkWell(
                onTap: (){
                  controller.selectedIndex1.value = 0;
                },
                child: Container(
                  height: 40.0,
                  width: getWidth(context) * 50 / 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: controller.selectedIndex1.value == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                      border: Border.all(
                          color: controller.selectedIndex1.value == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                      ),
                      boxShadow: [
                        if(controller.selectedIndex1.value == 0)
                          const BoxShadow(
                              color: CustomColors.darkShadowColor,
                              spreadRadius: 1.0,
                              blurRadius: 2.0,
                              offset: Offset(0, 3)
                          )
                      ],
                      borderRadius: BorderRadius.circular(15.sp)
                  ),
                  child: Text("Stationery", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex1.value == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                ),
              ),
            )),
            SizedBox(
              width: 2.w,
            ),
            Obx(() => Flexible(
              flex: 1,
              child: InkWell(
                onTap: (){
                  controller.selectedIndex1.value = 1;
                },
                child: Container(
                  height: 40.0,
                  width: getWidth(context) * 50 / 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: controller.selectedIndex1.value == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                      border: Border.all(
                          color: controller.selectedIndex1.value == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                      ),
                      boxShadow: [
                        if(controller.selectedIndex1.value == 1)
                          const BoxShadow(
                              color: CustomColors.darkShadowColor,
                              spreadRadius: 1.0,
                              blurRadius: 2.0,
                              offset: Offset(0, 3)
                          )
                      ],
                      borderRadius: BorderRadius.circular(15.sp)
                  ),
                  child: Text("Stars Store", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex1.value == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                ),
              ),
            )),
            SizedBox(
              width: 2.w,
            ),
            Obx(() => Flexible(
              flex: 1,
              child: InkWell(
                onTap: (){
                  controller.selectedIndex1.value = 2;
                },
                child: Container(
                  height: 40.0,
                  width: getWidth(context) * 50 / 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: controller.selectedIndex1.value == 2 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                      border: Border.all(
                          color: controller.selectedIndex1.value == 2 ? Colors.transparent : CustomColors.txtFiledBorderColor
                      ),
                      boxShadow: [
                        if(controller.selectedIndex1.value == 2)
                          const BoxShadow(
                              color: CustomColors.darkShadowColor,
                              spreadRadius: 1.0,
                              blurRadius: 2.0,
                              offset: Offset(0, 3)
                          )
                      ],
                      borderRadius: BorderRadius.circular(15.sp)
                  ),
                  child: Text("Canteen", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex1.value == 2 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                ),
              ),
            )),
          ],
        ),
        SizedBox(height: 1.h),
        buildTabBar(),
        SizedBox(height: 1.h),
        Obx(
              () => Visibility(
              visible: controller.selectedIndex1.value == 2,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  controller: tabCtrl,
                  children: const [
                    CanteenShopAllView(),
                    CanteenShopAllView(),
                    CanteenShopAllView(),
                    CanteenShopAllView(),
                  ],
                ),
              )),
        ),
        Obx(
              () => Visibility(
              visible: controller.selectedIndex1.value == 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  controller: tabCtrl,
                  children: const [
                    StationaryShopAllView(),
                    StationaryShopAllView(),
                    StationaryShopAllView(),
                    StationaryShopAllView(),
                    StationaryShopAllView(),
                  ],
                ),
              )),
        ),
        Obx(
              () => Visibility(
              visible: controller.selectedIndex1.value == 1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  controller: tabCtrl,
                  children: const [
                    StarAppShopAllView(),
                    StarAppShopAllView(),
                    StarAppShopAllView(),
                    StarAppShopAllView(),
                  ],
                ),
              )),
        ),
      ],
    );
  }

  Widget buildTabBar() {
    return Container(
      height: 40,
      width: 100.w,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: TabBar(
        controller: tabCtrl,
        isScrollable: false,
        labelPadding: EdgeInsets.zero,
        padding: const EdgeInsets.all(4),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]
        ),
        labelColor: CustomColors.primaryColor,
        unselectedLabelColor: Colors.black,
        tabs:  [
          Tab(
            text: 'All',
          ),
          Tab(
            text: 'Category 1',
          ),
          Tab(
            text: 'Category 2',
          ),
          Tab(
            text: 'Category 3',
          ),
        ],
      ),
    );
  }
}
