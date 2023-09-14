import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/notification_screen/controller/notification_ctrl.dart';
import 'package:staff_app/view/notification_screen/notification_list_tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with SingleTickerProviderStateMixin{
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  NotificationCtrl controller = Get.put(NotificationCtrl());
  int index = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    controller.getData();
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      if (!tabController.indexIsChanging) {
        controller.tabIndex.value = tabController.index;
        controller.getData();
        setState(() {});
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: translate(context).notifications,showNotification: false),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            BaseToggleTabBar(controller: tabController, tabs: [
              Tab(
                child: Padding(
                  padding: EdgeInsets.only(right: isRTL ? 0 : 6, left: isRTL ? 6 : 0),
                  child: BaseButton(
                    title: translate(context).school,
                    onPressed: null,
                    verticalPadding: 0,
                    isActive: tabController.index == 0 ? true : false,
                    isToggle: tabController.index == 0 ? true : false,
                    btnType: toggleLargeButton,
                  ),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.only(right: isRTL ? 6 : 0, left: isRTL ? 0 : 6),
                  child: BaseButton(
                    title: translate(context).transportation,
                    onPressed: null,
                    verticalPadding: 0,
                    isActive: tabController.index == 1 ? true : false,
                    isToggle: tabController.index == 1 ? true : false,
                    btnType: toggleLargeButton,
                  ),
                ),
              ),
            ]),
            SizedBox(height: 2.h),
            Expanded(
              child: TabBarView(
                controller: tabController,
                  children: [
                    NotificationListTile(),
                    NotificationListTile(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
