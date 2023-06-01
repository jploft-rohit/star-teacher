import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/view/notification_screen/notification_screen.dart';
import 'package:staff_app/view/sos/sos_screen.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? showSos,showNotification,showBackIcon;
  final Function()? onDrawerPressed;
  final Function()? onBackPressed;
  final Widget? bottomChild;
  final double? bottomWidgetHeight;

  const BaseAppBar({Key? key, this.title, this.showSos = false, this.onBackPressed, this.showNotification = true, this.showBackIcon = true, this.onDrawerPressed, this.bottomChild, this.bottomWidgetHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title??"", style: Style.montserratBoldStyle().copyWith(fontSize: appBarHeadingTs, color: BaseColors.appBarTextColor)),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(preferredSize: Size.fromHeight(bottomWidgetHeight??0),
      child: bottomChild??SizedBox.shrink()),
      leading: onDrawerPressed != null
      ///   Drawer Icon
          ? GestureDetector(onTap: onDrawerPressed, child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(drawerSvg),
          ))
      ///   Back Icon
          : Visibility(
              visible: showBackIcon??true,
              child: GestureDetector(onTap: onBackPressed ?? (){
                 Navigator.pop(context);
              },child: Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black,size: 20.sp)),
      ),
      actions: [
      ///  SOS Icon
        Visibility(
          visible: showSos??false,
          child: GestureDetector(
            onTap: (){
              Get.to(const SOSView());
            },
            child: SvgPicture.asset(sosSvg),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
      /// Notification Icon
        Visibility(
          visible: showNotification??true,
          child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: SvgPicture.asset("assets/images/ic_notification.svg",height: 24.sp,width: 24.sp),
                  ),
              ),
              /// Notification Count
              Positioned(
                top: 1.8.h,
                child: Container(
                  height: 17.sp,
                  width: 17.sp,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: BaseColors.primaryColor
                  ),
                  child: Text("1",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight+(bottomWidgetHeight??0));
}