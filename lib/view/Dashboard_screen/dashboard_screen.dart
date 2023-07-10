import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:staff_app/Utility/curved_navigation_bar/curved_navigation_bar.dart';
import 'dart:io' show Platform;
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/home_screen.dart';
import 'package:staff_app/view/chat_screen/chat_screen.dart';
import 'package:staff_app/view/my_profile_screen/my_profile_screen.dart';
import 'package:staff_app/view/search_screen/controller/search_screen_ctrl.dart';
import 'package:staff_app/view/search_screen/search_screen.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:staff_app/view/task_or_reminder_screen/task_or_reminder_screen.dart';

class DashboardScreen extends GetView<DashboardScreenCtrl>{
  DashboardScreen({super.key});

  final BaseCtrl splashCtrl = Get.put(BaseCtrl());
  final SearchScreenCtrl searchController = Get.put(SearchScreenCtrl());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: Platform.isIOS?false:true,
      top: false,
      child: WillPopScope(
        onWillPop: kDebugMode ? onWillPop : null,
        child: Scaffold(
          extendBody: true,
          backgroundColor: BaseColors.white,
          bottomNavigationBar: Stack(
            children: [
              CurvedNavigationBar(
                key: controller.bottomNavigationKey,
                buttonBackgroundColor: BaseColors.backgroundColor,
                backgroundColor: Colors.transparent,
                // animationCurve: Curves.easeInOut,
                index: 2,
                color: BaseColors.backgroundColor,
                height: Platform.isIOS?85.0:75.0,
                items: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                    child: SvgPicture.asset(
                      taskSvg,
                      width: 28,
                      height: 28,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      searchSvg,
                      width: 28,
                      height: 28,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      appLogoSvg,
                      width: 28,
                      height: 28,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      chatSvg,
                      width: 28,
                      height: 28,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      profileSvg,
                      width: 28,
                      height: 28,
                    ),
                  ),
                ],
                onTap: (index) {
                  controller.currentIndex.value = index;
                  searchController.searchedList.value = [];
                  searchController.searchedList.clear();
                },
              ),
              Positioned(
                bottom: (Platform.isIOS?15.0:5.0),
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('${translate(context).task}',style: Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: bottomNavigationBarTs),),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 8),
                        child: Text('${translate(context).search}',style: Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: bottomNavigationBarTs),),
                      ),
                      Text(translate(context).home,style: Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: bottomNavigationBarTs),),
                      Text(translate(context).chats,style: Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: bottomNavigationBarTs),),
                      Text('${translate(context).account}',style: Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: bottomNavigationBarTs),),
                    ],
                  ),
                ),
              )
            ],
          ),
          body: Obx(() => buildPages()),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    BaseOverlays().showConfirmationDialog(
      title: translate(Get.context!).exit_app_msg,
      onRightButtonPressed: (){
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
    );
    return Future.value(true);
  }

  Widget buildPages() {
    switch (controller.currentIndex.value) {
      case 0:
        return TaskOrReminderScreen(isFromBtmBar: true,);
      case 1:{
        return const SearchScreen();
      }
      case 2:
        return const HomeScreen();
      case 3:
        return ChatScreen(isFromBtmBar: true,);
      case 4:
        return MyProfileScreen(isFromDrawer: false,index: 0);
      default:
        return const HomeScreen();
    }
  }


}