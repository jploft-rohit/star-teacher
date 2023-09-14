import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/terms_conditions_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/route_manager/route_name.dart';
import 'package:staff_app/view/account_activation_screen/rules_screen.dart';
import 'package:staff_app/view/account_activation_screen/rules_screen2.dart';

import '../../utility/intl/date_symbol_data_local.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      Locale locale = await setLocalePref(await BaseSharedPreference().getString(SpKeys().selectedLanguage)??"en");
      Get.updateLocale(locale);
      initializeDateFormatting();
      if (await BaseSharedPreference().getBool(SpKeys().isLoggedIn)??false) {
        bool? isLocalAuth = await BaseSharedPreference().getBool(SpKeys().isBiometricEnable)??false;
        if (isLocalAuth == true) {
          final LocalAuthentication auth = LocalAuthentication();
          try {
            final bool didAuthenticate = await auth.authenticate(localizedReason: translate(Get.context!).local_auth_message);
            if (didAuthenticate) {
              await checkTermsStatus();
            }else{
              SystemNavigator.pop();
            }
          } on PlatformException {
            SystemNavigator.pop();
          }
        }else{
          await checkTermsStatus();
        }
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
      color: const Color(0xFFCBA864),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
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


  checkTermsStatus() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
      await BaseAPI().get(url: ApiEndPoints().getTermsConditionStatus, showLoader: false).then((value){
        if (value?.statusCode == 200) {
          if ((TermsConditionResponse.fromJson(value?.data).data?.isReadTermCondtion??false) == false) {
            if((TermsConditionResponse.fromJson(value?.data).data?.isReadResponsibility??false) == false){
              Get.offAll(const RulesScreen(isFromActivation: false));
            }else{
              Get.offAll(const RulesScreen2(isFromActivation: false));
            }
          }else{
            if((TermsConditionResponse.fromJson(value?.data).data?.isReadResponsibility??false) == false){
              Get.offAll(const RulesScreen2(isFromActivation: false));
            }else{
              Get.offAllNamed(dashboardScreenRoute);
            }
          }
        }
      },
      );
  }
}
