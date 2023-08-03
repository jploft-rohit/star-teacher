import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/route_manager/route_manager.dart' as route;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/view/login_screen/login_ctrl.dart';
import 'route_manager/route_name.dart';
import 'view/Dashboard_screen/dashboard_screen_ctrl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51NLl4oBJG0qcZ8qIRik60miJ5fayU9GyJgV19GWMPCc9e84A6xyD6ZAU4nIKG01HwukmK9ACWz8mWnht79pDR4t300kYWwP2ox";
  // Stripe.merchantIdentifier = 'merchant.com.courrierApp';
  await Stripe.instance.applySettings();
  BaseSharedPreference().sharedPrefInit();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Get.lazyPut(()=>DashboardScreenCtrl(), fenix: true);
  Get.lazyPut(()=>LoginCtrl(), fenix: true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  // @override
  // static void setLocale(BuildContext context, Locale newLocale) {
  //   _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
  //   state?.setLocale(newLocale);
  // }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Locale? _locale;
  // setLocale(Locale locale) {
  //   setState(() {
  //     _locale = locale;
  //   });
  //
  //   log(_locale.toString());
  // }

  @override
  void didChangeDependencies() {
    // getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          onGenerateRoute: route.generateRoute,
          initialRoute: splashScreenRoute,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // localizationsDelegates: [
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          locale: Get.deviceLocale,
          title: 'Star Teacher',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: (BuildContext context, Widget? child){
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0,alwaysUse24HourFormat: true),
              child: child!,
            );
          },
        );
      },
    );
  }
}
