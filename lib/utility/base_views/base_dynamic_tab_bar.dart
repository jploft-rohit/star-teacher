import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';
import '../sizes.dart';

class BaseDynamicTabBar extends StatefulWidget {
  const BaseDynamicTabBar({
    super.key,
    required this.itemCount,
    required this.tabBuilder,
    this.stub,
    required this.pageBuilder,
    this.initPosition, this.bottomMargin, this.topMargin, this.rightMargin, this.leftMargin,
  });

  final int itemCount;
  final IndexedWidgetBuilder tabBuilder;
  final Widget? stub;
  final IndexedWidgetBuilder pageBuilder;
  final int? initPosition;
  final double? bottomMargin, topMargin, rightMargin, leftMargin;

  @override
  BaseDynamicTabBarState createState() => BaseDynamicTabBarState();
}

class BaseDynamicTabBarState extends State<BaseDynamicTabBar> with TickerProviderStateMixin {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();
  late TabController tabController;
  late int _currentPosition;

  @override
  void initState() {
    super.initState();
    _currentPosition = widget.initPosition ?? 0;
    tabController = TabController(
      length: widget.itemCount,
      vsync: this,
      initialIndex: _currentPosition,
    )..addListener(() {
      if (!(tabController.indexIsChanging)) {
        controller.dynamicTabIndex.value = tabController.index;
        controller.selectedTabBarId.value = controller.shopCategoryList?[controller.dynamicTabIndex.value]?.sId??"";
        controller.getUserCart();
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
    if (widget.itemCount < 1) return widget.stub ?? Container();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: widget.bottomMargin??0,top: widget.topMargin??0,right: widget.rightMargin??0,left: widget.leftMargin??0),
          height: 6.h,
          width: Get.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(10)
          ),
          child: TabBar(
            isScrollable: true,
            controller: tabController,
            padding: EdgeInsets.all(0.5.h),
            labelColor: Color(0xffC19444),
            labelStyle: TextStyle(color: Color(0xffC19444),fontSize: tabBarTs,fontWeight: FontWeight.w700),
            unselectedLabelStyle: TextStyle(color: Colors.black,fontSize: tabBarTs,fontWeight: FontWeight.w400),
            unselectedLabelColor: Colors.black,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xFFF8F4E9),
                boxShadow: [BoxShadow(
                  color: Colors.black38,
                  offset: Offset(
                    0.0,
                    1.0,
                  ),
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                )]
            ),
            tabs: List.generate(
              widget.itemCount, (index) => widget.tabBuilder(context, index),
            ),
          )
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: List.generate(
              widget.itemCount, (index) => widget.pageBuilder(context, index),
            ),
          ),
        ),
      ],
    );
  }
}
