import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_switch.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/notification_setting_screen/controller/notification_settings_controller.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingScreen> createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> with SingleTickerProviderStateMixin{
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  late TabController tabController;
  final NotificationSettingsController controller = Get.put(NotificationSettingsController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      if (!(tabController.indexIsChanging)) {
        controller.selectedTabIndex.value = tabController.index;
        controller.getData();
        setState(() {});
      }
     },
    );
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
        appBar: BaseAppBar(title: translate(context).notification_settings,showNotification: false),
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              BaseToggleTabBar(controller: tabController, tabs: [
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(right: isRTL ? 0 : 6, left: isRTL ? 6 : 0),
                    child: BaseButton(title: 'School',onPressed: null,verticalPadding: 0,isActive: tabController.index == 0 ? true : false,isToggle: tabController.index == 0 ? true : false,btnType: toggleLargeButton,),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(right: isRTL ? 6 : 0, left: isRTL ? 0 : 6),
                    child: BaseButton(title: 'Transportation',onPressed: null,verticalPadding: 0,isActive: tabController.index == 1 ? true : false, isToggle: tabController.index == 1 ? true : false,btnType: toggleLargeButton,),
                  ),
                ),
              ]),
              SizedBox(height: 1.5.h),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                    children: [
                  Obx(()=>SmartRefresher(
                    footer: const BasePaginationFooter(),
                    controller: controller.refreshController,
                    enablePullDown: enablePullToRefresh,
                    enablePullUp: true,
                    onLoading: (){
                      controller.getData(refreshType: "load");
                    },
                    onRefresh: (){
                      controller.getData(refreshType: "refresh");
                    },
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.list?.length??0,
                        itemBuilder: (context, index) {
                          return buildTile(index);
                        },
                      ),
                  ),
                  ),
                  Obx(()=>SmartRefresher(
                    footer: const BasePaginationFooter(),
                    controller: controller.refreshController,
                    enablePullDown: enablePullToRefresh,
                    enablePullUp: true,
                    onLoading: (){
                      controller.getData(refreshType: "load");
                    },
                    onRefresh: (){
                      controller.getData(refreshType: "refresh");
                    },
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.list?.length??0,
                        itemBuilder: (context, index) {
                          return buildTile1(index);
                        },
                      ),
                  ),
                  )
                ]),
              )
            ],
          ),
        ),
        // bottomNavigationBar: Visibility(visible: kDebugMode, child: Padding(
        //   padding: const EdgeInsets.only(bottom: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text("Debug Server - 3.28.14.143:4000",style: TextStyle(fontSize: 10,color: Colors.grey)),
        //     ],
        //   ),
        // )),
      ),
    );
  }
  Widget buildTile(int index){
    return Column(
      children: [
        Divider(
          color: BaseColors.borderColor,
          thickness: 1.0,
          height: 3.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(toBeginningOfSentenceCase(controller.list?[index]?.title??"")??"", style: Style.montserratMediumStyle().copyWith(fontSize: 15.sp, color: BaseColors.textBlackColor),),
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Obx(()=>BaseSwitch(
                  key: GlobalKey(),
                  value: (controller.list?[index]?.userNotificationData?.isActive??"").toString().toLowerCase() == "true" ? true : false,
                  enableColor: BaseColors.backgroundColor,
                  enableSwitchColor: BaseColors.primaryColor,
                  disableColor: BaseColors.textLightGreyColor,
                  width: 35,
                  height: 20,
                  switchHeight: 20,
                  switchWidth: 15,
                  onChanged: (bool value) {
                    controller.changeNotificationSetting(index: index);
                    setState(() {});
                  },),
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget buildTile1(int index){
    return Column(
      children: [
        Divider(
          color: BaseColors.borderColor,
          thickness: 1.0,
          height: 3.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(toBeginningOfSentenceCase(controller.list?[index]?.title??"")??"", style: Style.montserratMediumStyle().copyWith(fontSize: 15.sp, color: BaseColors.textBlackColor),),
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Obx(()=>BaseSwitch(
                key: GlobalKey(),
                value: (controller.list?[index]?.userNotificationData?.isActive??"").toString().toLowerCase() == "true" ? true : false,
                enableColor: BaseColors.backgroundColor,
                enableSwitchColor: BaseColors.primaryColor,
                disableColor: BaseColors.textLightGreyColor,
                width: 35,
                height: 20,
                switchHeight: 20,
                switchWidth: 15,
                onChanged: (bool value) {
                  controller.changeNotificationSetting(index: index);
                  setState(() {});
                },),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Map<String, dynamic>> list = [
    {
      "title": translate(Get.context!).wallet_credit_debits,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).performance_rating_received,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).task_assigned,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).event_updates,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).stars_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).parents_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).teachers_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).wallet_credit_debits,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).performance_rating_received,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).task_assigned,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).event_updates,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).stars_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).parents_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).teachers_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).wallet_credit_debits,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).performance_rating_received,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).task_assigned,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).event_updates,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).stars_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).parents_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).teachers_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).parents_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).teachers_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).wallet_credit_debits,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).performance_rating_received,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).task_assigned,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).event_updates,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).stars_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).parents_chats,
      "isSelected": true,
    },
    {
      "title": translate(Get.context!).teachers_chats,
      "isSelected": true,
    },
  ];
  List<Map<String, dynamic>> list1 = [
    {
      "title": "Get Ready for Pickup",
      "isSelected": true,
    },
    {
      "title": "Estimation Time is Changed by Driver",
      "isSelected": true,
    },
  ];
}
