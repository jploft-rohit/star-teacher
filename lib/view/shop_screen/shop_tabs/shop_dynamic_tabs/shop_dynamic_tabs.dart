import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_dynamic_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';
import 'package:staff_app/view/shop_screen/shop_tabs/shop_dynamic_tabs/shop_grid_item/shop_grid_item.dart';

class ShopDynamicTabs extends StatefulWidget {
  const ShopDynamicTabs({super.key});

  @override
  State<ShopDynamicTabs> createState() => _ShopDynamicTabsState();
}

class _ShopDynamicTabsState extends State<ShopDynamicTabs>{
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> (controller.shopCategoryList?.length??0) == 0 ? SizedBox(height: 1.h,child: BaseNoData(message: "No Category Found")) : SizedBox(
      height: 4.h,
      child: BaseDynamicTabBar(
        itemCount: controller.shopCategoryList?.length??0,
        tabBuilder: (BuildContext context, int index) {
          return Tab(text: controller.shopCategoryList?[index]?.title??"");
        },
        pageBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 2.h),
              CustomTextField(
                controller: TextEditingController(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Icon(
                    Icons.search,
                  ),
                ),
                hintTextColor: BaseColors.textLightGreyColor,
                hintText: 'Search by name',
              ),
              SizedBox(height:2.h),
              Expanded(child: ShopGridItem()),
            ],
          );
        },
      ),
    ),
    );
  }
}