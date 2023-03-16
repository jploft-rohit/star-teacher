import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/account_activation_screen/account_activation_screen.dart';
import 'package:staff_app/account_activation_screen/rules_screen.dart';
import 'package:staff_app/route_manager/route_name.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen.dart';
import 'package:staff_app/view/choose_language/choose_language.dart';
import 'package:staff_app/view/choose_login_type_screen/choose_login_type_screen.dart';
import 'package:staff_app/view/login_screen/login_screen.dart';
import 'package:staff_app/view/otp_screen/otp_screen.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_screen.dart';
import 'package:staff_app/view/splash_screen/splash_screen.dart';


GetPageRoute<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashScreenRoute:
      return GetPageRoute(page: () => const SplashScreen());

    case dashboardScreenRoute:
      return GetPageRoute(page: () => const DashboardScreen());

    case chooseLanguageScreenRoute:
      return GetPageRoute(page: () => const ChooseLangaugeScreen());

    case loginScreenRoute:
      return GetPageRoute(page: () => const LoginScreen());

    case otpScreenRoute:
      return GetPageRoute(page: () => const OTPScreen());

    case chooseLoginTypeScreenRoute:
      return GetPageRoute(page: () => const ChooseLoginTypeScreen());

    case accountActivationScreenRoute:
      return GetPageRoute(page: () => const AccountActivationScreen());

    case ruleScreenRoute:
      return GetPageRoute(page: () => const RulesScreen());

    case salarySlipScreenRoute:
      return GetPageRoute(page: () => const SalarySlipScreen());


    default:
      return GetPageRoute(page: () => const SplashScreen());
  }
}