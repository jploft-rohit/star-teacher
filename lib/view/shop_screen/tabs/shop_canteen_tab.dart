import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_tab_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';

class ShopCanteenTab extends StatefulWidget {
  const ShopCanteenTab({super.key});

  @override
  State<ShopCanteenTab> createState() => _ShopCanteenTabState();
}

class _ShopCanteenTabState extends State<ShopCanteenTab> with SingleTickerProviderStateMixin{
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this)..addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 2.h),
            BaseTabBar(
              controller: tabController,
              tabs:  const [
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
            SizedBox(height: 2.h),
            Expanded(
              child: TabBarView(
                controller: tabController,
                  children: [
                data(),
                data(),
                data(),
                data(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
  Widget data(){
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Icon(
                Icons.search,
              ),
            ),
            hintTextColor: CustomColors.textLightGreyColor,
            hintText: 'Search by name',
          ),
          SizedBox(height:2.h),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: controller.canteenShopList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 24.h,
                mainAxisSpacing: 3.h,
                crossAxisSpacing: 3.h),
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: kElevationToShadow[2],
                  color: CustomColors.white),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      height: 15.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          controller.canteenShopList[index]['image']!,
                          fit: BoxFit.fill,
                        ),
                      )),
                  addText(
                      controller.canteenShopList[index]['name']!,
                      15.sp + 2,
                      CustomColors.textBlackColor,
                      FontWeight.w400),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: addText(
                            controller.canteenShopList[index]['price']!,
                            15.sp,
                            CustomColors.primaryColor,
                            FontWeight.w400),
                      ),
                      Expanded(
                        child: BaseButton(
                            title: "+Add",
                            verticalPadding: 0,
                            onPressed: () {}),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}