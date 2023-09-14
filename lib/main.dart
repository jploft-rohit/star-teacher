import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/route_manager/route_manager.dart' as route;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/notificationService.dart';
import 'package:staff_app/video_call_zego_utility/login_service.dart';
import 'package:staff_app/view/login_screen/login_ctrl.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'route_manager/route_name.dart';
import 'view/Dashboard_screen/dashboard_screen_ctrl.dart';
//
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

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
  final String? _userID = await BaseSharedPreference().getString(SpKeys().userId)??"";
  final String? _userName = await BaseSharedPreference().getString(SpKeys().userName)??"";
  if (_userID != null) {
    currentUser.id = _userID;
    currentUser.name = _userName??"";
  }
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // if(Platform.isAndroid)
  // {
    await Firebase.initializeApp();

    ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

    ZegoUIKit().initLog().then((value) {
      ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
        [ZegoUIKitSignalingPlugin()],
      );
      // HttpOverrides.global = MyHttpOverrides();
      runApp(MyApp(navigatorKey: navigatorKey));
    });
  // }
  // else{
    // HttpOverrides.global = MyHttpOverrides();
    runApp(MyApp(navigatorKey: navigatorKey));
  // }

}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const MyApp({super.key, required this.navigatorKey});


  // @override
  // static void setLocale(BuildContext context, Locale newLocale) {
  //   _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
  //   state?.setLocale(newLocale);
  // }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging? _firebaseMessaging;
  // Locale? _locale;
  // setLocale(Locale locale) {
  //   setState(() {
  //     _locale = locale;
  //   });
  //
  //   log(_locale.toString());
  // }

  @override
  void initState() {
    super.initState();
    if(Platform.isAndroid)
    {
      initFirebase();
      if (currentUser.id.isNotEmpty) {
        onUserLogin();
      }
    }
  }

  @pragma('vm:entry-point')
  initFirebase() async {
    _firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null && message.notification != null) {
        log(message.toString());
        print('Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');
      }
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      log(message.toString());
      print(
          'Message title: ${message.notification?.title}, body: ${message.notification?.body}, data: ${message.data}');
      NotificationService.normaldisplay(1, message.notification!.title.toString(), message.notification!.body.toString());
    });
  }

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
          navigatorKey: widget.navigatorKey,
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
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                  alwaysUse24HourFormat: true,
              ),
              child: Stack(
                children: [
                  child!,
                  /// support minimizing
                    ZegoUIKitPrebuiltCallMiniOverlayPage(
                      contextQuery: () {
                        return widget.navigatorKey.currentState!.context;
                      },
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
