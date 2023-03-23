import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_switch.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingScreen> createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> with SingleTickerProviderStateMixin{
  int index = 0;

  bool performanceRating = true;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: BaseAppBar(title: translate(context).notification_settings),
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              BaseToggleTabBar(controller: tabController, tabs: [
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: BaseButton(title: 'School',onPressed: null,verticalPadding: 0,isActive: tabController.index == 0 ? true : false,isToggle: tabController.index == 0 ? true : false),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: BaseButton(title: 'Transportation',onPressed: null,verticalPadding: 0,isActive: tabController.index == 1 ? true : false, isToggle: tabController.index == 1 ? true : false),
                  ),
                ),
              ]),
              SizedBox(height: 1.5.h),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                    children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return buildTile(index);
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: list1.length,
                    itemBuilder: (context, index) {
                      return buildTile1(index);
                    },
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTile(int index){
    return Column(
      children: [
        const Divider(
          color: CustomColors.borderColor,
          thickness: 1.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(list[index]['title'], style: Style.montserratMediumStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
            CustomSwitch(
              key: GlobalKey(),
              value: list[index]['isSelected'],
              enableColor: CustomColors.backgroundColor,
              enableSwitchColor: CustomColors.primaryColor,
              disableColor: CustomColors.textLightGreyColor,
              width: 35,
              height: 20,
              switchHeight: 20,
              switchWidth: 15,
              onChanged: (bool value) {
                list[index]['isSelected'] = !list[index]['isSelected'];
                setState(() {});
              },)
          ],
        ),
      ],
    );
  }
  Widget buildTile1(int index){
    return Column(
      children: [
        const Divider(
          color: CustomColors.borderColor,
          thickness: 1.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(list1[index]['title'], style: Style.montserratMediumStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
            CustomSwitch(
              key: GlobalKey(),
              value: list1[index]['isSelected'],
              enableColor: CustomColors.backgroundColor,
              enableSwitchColor: CustomColors.primaryColor,
              disableColor: CustomColors.textLightGreyColor,
              width: 35,
              height: 20,
              switchHeight: 20,
              switchWidth: 15,
              onChanged: (bool value) {
                list1[index]['isSelected'] = !list1[index]['isSelected'];
                setState(() {});
              },)
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
