import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/route_manager/route_name.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), (){
      Get.offAndToNamed(chooseLanguageScreenRoute);
    });
    super.initState();
  }

  @override
  Scaffold build(BuildContext context) => Scaffold(
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: CustomColors.primaryColor,
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
