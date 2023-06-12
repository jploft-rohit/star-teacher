import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialize() {
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings()
    );
    _notificationsPlugin.initialize(initializationSettings,onDidReceiveNotificationResponse: (payload)async{
      print("on clivk ");
      if (payload.payload != null) {
        // Open the PDF file
        if (await canLaunch(payload.payload!)) {
      await launch(payload.payload!);
      } else {
      throw 'Could not launch $payload';
      }
      }

    });
  }

  static void display(int id,String title,String body,filePath) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "Star Admin",
            "pushnotificationappchannel",
            icon: '@mipmap/ic_launcher',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          ),
        iOS: DarwinNotificationDetails(presentAlert: true,presentSound: true)
      );

      await _notificationsPlugin.show(
        id,
        title,
        body,
        notificationDetails,
        payload: filePath,
      );
      const InitializationSettings initializationSettings =
      InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings()
      );
      _notificationsPlugin.initialize(initializationSettings,onDidReceiveNotificationResponse: (payload)async{
        print("on click ${payload.payload}");
        if (payload.payload != null) {
          final result = await OpenFile.open(filePath);

          if (result.type==ResultType.done) {
          } else {
            showDialog(
              context: Get.context!,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      addText("Error", 17, Colors.black, FontWeight.bold),
                      SizedBox(height: 2.h,),
                      addAlignedText("Unable to open the file. Please download pdf viewer.", 16, Colors.black, FontWeight.normal),
                      SizedBox(height: 3.h,),
                      BaseButton(
                        title: 'Ok',
                        btnType: 'medium',
                        verticalPadding: 1.0.h,
                        // isActive: false,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  static void showMessage(int id,String title,String body) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "Star Admin",
            "pushnotificationappchannel",
            icon: '@mipmap/ic_launcher',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          ),
          iOS: DarwinNotificationDetails(presentAlert: true,presentSound: true)
      );

      await _notificationsPlugin.show(
        id,
        title,
        body,
        notificationDetails,
      );
      const InitializationSettings initializationSettings =
      InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings()
      );
      _notificationsPlugin.initialize(initializationSettings,onDidReceiveNotificationResponse: (payload)async{
        print("on onclick ${payload.payload}");
        if (payload.payload != null) {}
      });
    } on Exception catch (e) {
      print(e);
    }
  }
}








