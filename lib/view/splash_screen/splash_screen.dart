import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/route_manager/route_name.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen.dart';
import 'package:staff_app/view/splash_screen/controller/splash_ctrl.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashCtrl splashCtrl = Get.put(SplashCtrl());

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      if (await BaseSharedPreference().getBool(SpKeys().isLoggedIn)??false) {
        Get.to(DashboardScreen());
      }else{
        Get.offAndToNamed(chooseLanguageScreenRoute);
      }
    });
    super.initState();
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  @override
  Scaffold build(BuildContext context) => Scaffold(
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: BaseColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            splashLogoSvg,
            width: 30.w,
            height: 30.w,
            fit: BoxFit.fill,
          ),
        ],
      ),
    ),
  );
}
