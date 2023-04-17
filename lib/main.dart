import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/route_manager/route_manager.dart' as route;
import 'package:staff_app/view/Dashboard_screen/dashboard_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'route_manager/route_name.dart';
import 'view/Dashboard_screen/dashboard_screen_ctrl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Get.lazyPut(()=>DashboardScreenCtrl(), fenix: true);
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
    return ResponsiveSizer(
      builder: (p0, p1, p2) {
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
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
        );
      },
    );
  }
}
