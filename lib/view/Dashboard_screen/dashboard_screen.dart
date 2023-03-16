import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/home_screen.dart';
import 'package:staff_app/view/chat_screen/chat_screen.dart';
import 'package:staff_app/view/my_profile_screen/my_profile_screen.dart';
import 'package:staff_app/view/search_screen/search_screen.dart';
import 'package:staff_app/view/task_or_reminder_screen/task_or_reminder_screen.dart';

class DashboardScreen extends GetView<DashboardScreenCtrl>{
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: CustomColors.white,
        bottomNavigationBar: Stack(
          children: [
            CurvedNavigationBar(
              key: controller.bottomNavigationKey,
              buttonBackgroundColor: CustomColors.backgroundColor,
              backgroundColor: Colors.transparent,
              // animationCurve: Curves.easeInOut,
              index: 2,
              color: CustomColors.backgroundColor,
              items: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                  child: SvgPicture.asset(
                    taskSvg,
                    width: 25,
                    height: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    searchSvg,
                    width: 25,
                    height: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    appLogoSvg,
                    width: 25,
                    height: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    chatSvg,
                    width: 25,
                    height: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    profileSvg,
                    width: 25,
                    height: 25,
                  ),
                ),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${translate(context).task}',style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp),),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 8),
                      child: Text('${translate(context).search}',style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp),),
                    ),
                    Text(translate(context).home,style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp),),
                    Text(translate(context).chats,style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp),),
                    Text('${translate(context).account}',style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 16.sp),),
                  ],
                ),
              ),
            )
          ],
        ),
        body: Obx(() => buildPages()),
      ),
    );
  }

  Widget buildPages() {
    switch (controller.currentIndex.value) {
      case 0:
        return TaskOrReminderScreen(isFromBtmBar: true,);
      case 1:
        return const SearchScreen();
      case 2:
        return const HomeScreen();
      case 3:
        return ChatScreen(isFromBtmBar: true,);
      case 4:
        return MyProfileScreen(isFromDrawer: false,index: 0,);
      default:
        return const HomeScreen();
    }
  }


}