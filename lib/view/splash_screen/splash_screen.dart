import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/route_manager/route_name.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      if (await BaseSharedPreference().getBool(SpKeys().isLoggedIn)??false) {
        Get.offAll(DashboardScreen());
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
      color: Color(0xFFCBA864),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              "assets/images/app_logo_withou_bg.svg",
              width: 20.w,
              height: 20.w,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    ),
  );
}
