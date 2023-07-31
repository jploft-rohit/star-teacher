import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_qr.dart';
import 'package:staff_app/utility/constant_images.dart';
import 'package:staff_app/utility/intl/src/intl/date_format.dart';
import 'package:staff_app/utility/notificationService.dart';
import '../constants-classes/color_constants.dart';
import 'images_icon_path.dart';

class Style{
  static TextStyle montserratBoldStyle(){
    return TextStyle(
      fontFamily: "Arial",
      fontWeight: FontWeight.w600,
      fontSize: 25.sp,
    );
  }
  static TextStyle montserratMediumStyle(){
    return TextStyle(
      fontFamily: "Arial",
      fontWeight: FontWeight.w500,
      fontSize: 17.sp,
    );
  }

  static TextStyle montserratRegularStyle(){
    return TextStyle(
      fontFamily: "Arial",
      fontSize: 15.sp,
    );
  }
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = this.minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}

double getHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}
double getWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

BoxShadow getLightBoxShadow() {
  return const BoxShadow(
    color: Colors.black12,
    offset: Offset(
      2.0,
      3.0,
    ),
    blurRadius: 2.0,
    spreadRadius: 0.0,
  );
}
BoxShadow getBoxShadow() {
  return const BoxShadow(
    color: Colors.black38,
    offset: Offset(
      0.0,
      1.0,
    ),
    blurRadius: 2.0,
    spreadRadius: 0.0,
  );
}

List<BoxShadow> baseContainerShadow() {
  return [
    BoxShadow(
    color: Colors.grey.withOpacity(0.8),
    offset: Offset(
      0.0,
      1.0,
    ),
    blurRadius: 2.0,
    spreadRadius: 0.0,
  )];
}

Widget buildInfoItems(String title,String description,{Function()? onSvgClick,String? svgPath}) {
  return RichText(
    text: TextSpan(
      text: '$title : ',
      style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: detailLabelTs,height: 1.5),
      children: [
        TextSpan(text: description, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: detailValueTs,height: 1.5)),
        WidgetSpan(child: GestureDetector(
          onTap: onSvgClick??(){},
          child: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: SvgPicture.asset(svgPath??"",height: 13,),
          ),
        )),
      ],
    ),
  );
}

Widget walletToogleButton(onTap1, isPurchases, onTap2, isEvents) {
  return Row(
    children: [
      Expanded(
        child: GestureDetector(
          onTap: onTap1,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.only(top: 2, right: 2),
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                    boxShadow: isPurchases ? kElevationToShadow[3] : null,
                    color: isPurchases
                        ? BaseColors.backgroundColor
                        : BaseColors.txtFieldTextColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: isPurchases
                            ? Colors.transparent
                            : BaseColors.borderColor)),
                child: Text(translate(Get.context!).purchase, style: Style.montserratBoldStyle().copyWith(color: isPurchases ? BaseColors.primaryColor : BaseColors.txtFiledBorderColor, fontSize: toggleButtonTs),),
              ),
              // Container(
              //   alignment: Alignment.center,
              //   height: 15,
              //   width: 15,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(50),
              //       color: CustomColors.primaryColor),
              //   child: Text("1", style: Style.montserratBoldStyle().copyWith(color: CustomColors.white, fontSize: 13.sp),),
              // )
            ],
          ),
        ),
      ),
      SizedBox(width: 2.w),
      Expanded(
        child: GestureDetector(
          onTap: onTap2,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.only(top: 2, right: 2),
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                    boxShadow: isEvents ? kElevationToShadow[3] : null,
                    color: isEvents
                        ? BaseColors.backgroundColor
                        : BaseColors.txtFieldTextColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: isEvents
                            ? Colors.transparent
                            : BaseColors.borderColor)),
                child: Text(translate(Get.context!).event, style: Style.montserratBoldStyle().copyWith(color: isEvents ? BaseColors.primaryColor : BaseColors.txtFiledBorderColor, fontSize: toggleButtonTs),),
              ),
              Container(
                alignment: Alignment.center,
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: BaseColors.primaryColor),
                child: Text("1", style: Style.montserratBoldStyle().copyWith(color: BaseColors.white,fontSize: 13.sp),),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget purchasesToogleButton(onTap1, isTransaction, onTap2, isTopup) {
  return Row(
    children: [
      Expanded(
        child: GestureDetector(
          onTap: onTap1,
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(
                    color: isTransaction
                        ? Colors.transparent
                        : BaseColors.borderColor),
                color: isTransaction
                    ? BaseColors.backgroundColor
                    : BaseColors.txtFieldTextColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: isTransaction ? kElevationToShadow[3] : null),
            child: Text(translate(Get.context!).transaction, style: Style.montserratBoldStyle().copyWith(color: isTransaction ? BaseColors.primaryColor : BaseColors.txtFiledBorderColor, fontSize: toggleButtonTs),),
          ),
        ),
      ),
      SizedBox(width: 0.7.h),
      Expanded(
        child: GestureDetector(
          onTap: onTap2,
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
                boxShadow: isTopup ? kElevationToShadow[3] : null,
                color: isTopup
                    ? BaseColors.backgroundColor
                    : BaseColors.txtFieldTextColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: isTopup
                        ? Colors.transparent
                        : BaseColors.borderColor)),
            child: Text(translate(Get.context!).top_up_record, style: Style.montserratBoldStyle().copyWith(color: isTopup ? BaseColors.primaryColor : BaseColors.txtFiledBorderColor, fontSize: toggleButtonTs),),
          ),
        ),
      ),
    ],
  );
}

Widget calenderDownButton(label, onTap,{required bool isFrom}) {
  return GestureDetector(
    onTap: (){
      showDatePicker(
          context: Get.context!,
          initialDate: DateTime.now(),
          firstDate: DateTime(2023, 1, 1),
          lastDate: DateTime.now());
    },
    child: Container(
      decoration: BoxDecoration(
          color: BaseColors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: BaseColors.borderColor),
      ),
      padding: EdgeInsets.symmetric(horizontal: 1.2.w, vertical: 0.6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(calenderSvg, height: 2.h,),
                SizedBox(width: 2.w),
                Text(label, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textLightGreyColor, fontSize: 14.sp),),
              ],
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          )
        ],
      ),
    ),
  );
}
Widget textButton2(ontap, text) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
    // height: 20.sp,
    // width: 20.sp,
    child: Material(
      color: Colors.transparent,
      child: GestureDetector(
          onTap: ontap,
          child:
          addText(text, 20, BaseColors.primaryColor, FontWeight.w700)),
    ),
  );
}
Widget iconButton(ontap, icon) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
    height: 20.sp,
    width: 20.sp,
    child: Material(
      color: Colors.transparent,
      child: GestureDetector(
          onTap: ontap,
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.scaleDown,
          )),
    ),
  );
}
Widget radioButton(onTap, value, label) {
  return Row(
    children: [
      iconButton(
          onTap, value ? "assets/images/Group 7585.svg" : "assets/images/Ellipse 33.svg"),
      SizedBox(width: 0.5.h),
      addText(label, radioButtonTitleTs, BaseColors.textBlackColor,
          FontWeight.w400),
    ],
  );
}
Text addAlignedText(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(text.tr,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          fontFamily: 'Arial'));
}
Text addText(String text, double size, Color color, FontWeight fontWeight) {
  return Text(text.tr, style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight, fontFamily: "Arial"));
}
showNFCDialog(BuildContext context,String image){

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
          backgroundColor: BaseColors.white,
          elevation: 5,
          scrollable: true,
          title: Stack(
            children: [
              if(image.isEmpty)
                Align(alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Text(
                      translate(context).programme_NFC,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 16.sp),),
                  ),),
              if(image.isNotEmpty)
                Center(child: SvgPicture.asset(image)),
              Align(alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ))
            ],
          ),
          contentPadding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          content: SizedBox(
            width: 100.w,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(child: Text(image.isEmpty ? translate(context).tap_nfc_card_to_match_frequency : translate(context).nfc_programmed_successfully,
                    style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 16.sp),
                    textAlign: TextAlign.center,),
                  onTap: (){
                    showNFCDialog1(context,"assets/images/check 1.svg");
                  },),
                ],
              ),
            ),
          )));
}
showNFCDialog1(BuildContext context,String image,{String? title}){

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
          backgroundColor: BaseColors.white,
          elevation: 10,
          scrollable: true,
          title: Stack(
            children: [
              if(image.isEmpty)
                Align(alignment: Alignment.center,
                  child: Text(
                    translate(context).programme_NFC,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 17.sp),),),
              if(image.isNotEmpty)
                Padding(
                  padding:  EdgeInsets.only(top: 3.h),
                  child: Center(child: SvgPicture.asset(image)),
                ),
              Align(alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ))
            ],
          ),
          contentPadding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          content: SizedBox(
            width: 100.w,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: (title??"").isEmpty ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                children: [
                  Text(image.isEmpty ? translate(context).tap_nfc_card_to_match_frequency : title ?? translate(context).nfc_programmed_successfully,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 17.sp),textAlign: TextAlign.center,),
                ],
              ),
            ),
          )));
}
void showScanQrDialogue(BuildContext context, bool isShowButton,{data}) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              content: SizedBox(
                width: 100.w,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: Icon(
                                Icons.close
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Center(
                              child: addAlignedText(
                                  'QR Code', 18, Colors.black, FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:3.h),
                      QrImage(
                        data: data.toString(),
                        version: QrVersions.auto,
                        size: 250,
                        gapless: false,
                      ),
                      SizedBox(height:1.h),
                      if(isShowButton) BaseButton(btnType: mediumLargeButton,title: "PRINT QR", onPressed: (){},borderRadius: 20,)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

Future<void> selectDate(BuildContext context) async {
  showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: BaseColors.primaryColor,
            ),
          ),
          child: child!,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime(1600, 8),
      lastDate: DateTime.now()
  ).then((picked){});
}
Future<void> selectTime(BuildContext context) async {
  showTimePicker(
    context: context,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: ColorConstants.primaryColor,
          ),
        ),
        child: child!,
      );
    },
    initialTime: TimeOfDay.now(),
  ).then((picked){

  });
}

String formatBackendDate(String dateString, {bool? getDayFirst}) {
  if (dateString.isNotEmpty && dateString != "null") {
    DateTime date = DateTime.parse(dateString);
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString().substring(0);
    if (getDayFirst??true) {
      return '$day-$month-$year';
    }else{
      return '$year-$month-$day';
    }
  }else{
    return "";
  }
}

String convertDateFormat3(String dateString1) {
  if (dateString1.isEmpty && dateString1 == "null") {
    return "\n";
  }else{
    DateTime date = DateTime.parse(dateString1).toLocal();
    String formattedDate = DateFormat("MMM dd,\nhh:mm a").format(date);
    return formattedDate;
  }
}

String getFormattedTime(String dateString1){
  if (dateString1.isNotEmpty && dateString1 != "null") {
    DateTime date = DateTime.parse(dateString1);
    String formattedTime = DateFormat('hh:mm a').format(date.toLocal());
    return formattedTime;
  }else{
    return "N/A";
  }
}

String getFormattedTimeWithMonth(String dateString1){
  if (dateString1.isNotEmpty && dateString1 != "null") {
    DateTime date = DateTime.parse(dateString1);
    String formattedTime = DateFormat('MMM dd,\nhh:mm a').format(date.toLocal());
    return formattedTime;
  }else{
    return "";
  }
}

String getFormattedMonthDate(String dateString1){
  if (dateString1.isNotEmpty && dateString1 != "null") {
    DateTime date = DateTime.parse(dateString1);
    String formattedTime = DateFormat('EEEE, MMM dd').format(date.toLocal());
    return formattedTime;
  }else{
    return "";
  }
}

String flipDate({required String date}){
  if (date.isNotEmpty) {
    List<String> localDate = date.split("-");
    String flippedDate = "${localDate[2]}-${localDate[1]}-${localDate[0]}";
    return flippedDate;
  }else{
    return "";
  }
}


String formatFlutterDateTime({required DateTime flutterDateTime,bool? getDayFirst}){
   if (getDayFirst??false) {
     return "${flutterDateTime.day.toString()}-${flutterDateTime.month.toString().padLeft(2,'0')}-${flutterDateTime.year.toString().padLeft(2,'0')}";
   }else{
     return "${flutterDateTime.year.toString()}-${flutterDateTime.month.toString().padLeft(2,'0')}-${flutterDateTime.day.toString().padLeft(2,'0')}";
   }
}

String formatFlutterDateTimeWithoutDate({required DateTime flutterDateTime,bool? getDayFirst}){
  if (getDayFirst??false) {
    return "${flutterDateTime.month.toString().padLeft(2,'0')}-${flutterDateTime.year.toString().padLeft(2,'0')}";
  }else{
    return "${flutterDateTime.year.toString()}-${flutterDateTime.month.toString().padLeft(2,'0')}";
  }
}

String getFormattedTime3(String dateString1){
  if (dateString1.isNotEmpty && dateString1 != "null") {
    DateTime date = DateTime.parse(dateString1);
    String formattedTime = DateFormat('HH:mm').format(date.toLocal());
    return formattedTime;
  }else{
    return "N/A";
  }
}

String getFormattedTime4(String dateString1){
  if (dateString1.isNotEmpty && dateString1 != "null") {
    DateTime date = DateTime.parse(dateString1);
    String formattedTime = DateFormat('HH:mm').format(date);
    return formattedTime;
  }else{
    return "N/A";
  }
}

String getFormattedTime2(String dateString1){
  if (dateString1.isNotEmpty && dateString1 != "null") {
    String hours, minutes;
    DateTime date = DateTime.parse(dateString1);
    String formattedTime = DateFormat('H:m').format(date.toLocal());
    var time = formattedTime.split(":");
    hours = time[0].length == 1 ? ("0"+time[0].toString()) : (time[0].toString());
    minutes = time[1].length == 1 ? ("0"+time[1].toString()) : (time[1].toString());
    formattedTime = "$hours:$minutes";
    return formattedTime;
  }else{
    return "";
  }
}

String formatTime(DateTime dateTime) {
  String amPm = 'am';
  if (dateTime.hour >= 12) {
    amPm = 'pm';
  }

  String hour = dateTime.hour.toString();
  if (dateTime.hour < 10) {
    hour = "0${(dateTime.hour)}";
  }

  String minute = dateTime.minute.toString();
  if (dateTime.minute < 10) {
    minute = '0${dateTime.minute}';
  }

  return '$hour:$minute';
}

String getHours(String dateString1){
  if (dateString1.isNotEmpty && dateString1 != "null") {
    DateTime date = DateTime.parse(dateString1);
    String formattedTime = DateFormat('hh').format(date.toLocal());
    return formattedTime;
  }else{
    return "";
  }
}
String getMinutes(String dateString1){
  if (dateString1.isNotEmpty && dateString1 != "null") {
    DateTime date = DateTime.parse(dateString1);
    String formattedTime = DateFormat('mm').format(date.toLocal());
    return formattedTime;
  }else{
    return "";
  }
}

baseToast({required String message}){
  Fluttertoast.cancel();
  Fluttertoast.showToast(msg: message,gravity: ToastGravity.CENTER);
}

Future<void> downloadFile({required String url,bool? concatBaseUrl,bool? showLoader}) async {
  // Download the PDF file
  if (url.isNotEmpty) {
    /// Saving PDF
    if (url.contains("pdf")) {
      BaseOverlays().showLoader();
      final finalUrl = (concatBaseUrl??true) ? (ApiEndPoints().imageBaseUrl) + (url) : url;
      final request = await HttpClient().getUrl(Uri.parse(finalUrl));
      final response = await request.close();
      final bytes = await consolidateHttpClientResponseBytes(response);

      if (Platform.isIOS) {
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}.pdf';
        final file = File(filePath);
        await file.writeAsBytes(bytes);
        BaseOverlays().dismissOverlay();
        NotificationService.display(0,'PDF Downloaded','The PDF file has been downloaded successfully.',filePath);
      }
      else{
        final directory = await getExternalStorageDirectory();
        final filePath = '${directory!.path}.pdf';
        final file = File(filePath);
        await file.writeAsBytes(bytes);
        BaseOverlays().dismissOverlay();
        NotificationService.display(0,'PDF Downloaded','The PDF file has been downloaded successfully.',filePath);
      }
    }
    /// Properly Saving Image
    else{
      BaseOverlays().showLoader(showLoader: showLoader??true);
      if (await Permission.storage.request().isGranted) {
        try {
          var imageId = await ImageDownloader.downloadImage((concatBaseUrl??true) ? ApiEndPoints().imageBaseUrl + url : url,destination: AndroidDestinationType.directoryDownloads).
          catchError((e){
            BaseOverlays().dismissOverlay(showLoader: showLoader??true);
            return e;
          });
          if (imageId == null) {
            return;
          }
          var size = await ImageDownloader.findByteSize(imageId);
          print("Image Url ---> "+url);
          print("Downloaded Image Size ---> " + (size??0).toString());
          NotificationService.showMessage(0,'Image Downloaded','The Image has been downloaded successfully.');
        } on PlatformException catch (error) {
          BaseOverlays().dismissOverlay(showLoader: showLoader??true);
          print(error);
        }
      }else{
        Map<Permission, PermissionStatus> statuses = await [
          Permission.storage,
        ].request();
      }
      BaseOverlays().dismissOverlay(showLoader: showLoader??true);
      /// New Code
    }
  }
}

// Future<Response> download(String url, {Map<String, dynamic>? headers,
// void Function(int, int)? onReceiveProgress}) async {
// // check permission from permission handler
// while (!(await Permission.manageExternalStorage.request().isGranted)) {
// // ask for permission
// await Permission.manageExternalStorage.request();
// }
// try {
// String fileName = url.split('/').last;
// // create a directory in storage
// Directory? directory = await getExternalStorageDirectory();
// if (Platform.isAndroid) {
// // Redirects it to download folder in android
// directory = Directory("/storage/emulated/0/Download");
// } else {
// directory = await getApplicationDocumentsDirectory();
// }
// int? random = DateTime.now().millisecondsSinceEpoch ~/ 1000;
// String savePath = directory.path + '/$random-$fileName';
//
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
//
// // random id
// int id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
//
// const android = AndroidNotificationDetails(
// 'channelId',
// 'channelName',
// channelDescription: 'channelDescription',
// importance: Importance.high,
// priority: Priority.defaultPriority,
// ongoing: true,
// );
// const iOS = null;
// const platform = NotificationDetails(android: android, iOS: iOS);
//
// await flutterLocalNotificationsPlugin.initialize(
//   InitializationSettings(
//   android: AndroidInitializationSettings(
//     'app_icon',
//   ),
//   iOS: DarwinInitializationSettings(
//   requestAlertPermission: false,
//   requestBadgePermission: false,
//   requestSoundPermission: false,
//   onDidReceiveLocalNotification: (id, title, body, payload) async {},
//   ),
//   ),
//   onDidReceiveNotificationResponse: (NotificationResponse response) {
//     if (response.notificationResponseType == NotificationResponseType.selectedNotification) {
//       if (response.payload == 'Download Complete') {
//         OpenFile.open(savePath);
//       }
//     }
//     },
// );
//
// int previousProgress = 0;
// int totalBytes = 0;
// bool isFirstProgressEvent = true;
//
// final response = await dio.download(url, savePath, options: dio.Options(headers: headers),
//     onReceiveProgress: (receivedBytes, totalBytes) {
//   if (isFirstProgressEvent) {
//     isFirstProgressEvent = false;
//     BaseOverlays().showLoader();
// }
//
// int currentProgress = ((receivedBytes / totalBytes) * 100).toInt();
//
// if (currentProgress - previousProgress >= 1 || currentProgress < 100) {
// previousProgress = currentProgress;
// }
// });
//
// Get.back();
// showSnackBar(message: 'Download Complete');
// var res = await OpenFile.open(savePath);
//
// print(res);
//
// return response;
// } on dio.DioError catch (e) {
// String message = _singleton._handleError(e);
// throw message;
// }
// }



String getMonthDate(String dateString1) {
  DateTime date = DateTime.parse(dateString1);
  String formattedDate = DateFormat("MMM dd").format(date);
  return formattedDate;
}

String convertDateFormat7(String dateString1){
  DateTime date = DateTime.parse(dateString1);
  print("date1");
  print(date);
  String formattedDate = DateFormat("MMMM, dd/MM/yyyy").format(date.toLocal());
  print("date1");
  print(formattedDate);
  return formattedDate;
}

String convertDateFormat8(String dateString1){
  DateTime date = DateTime.parse(dateString1);
  print("date1");
  print(date);
  String formattedDate = DateFormat("yyyy-MM-dd").format(date.toLocal());
  print("date1");
  print(formattedDate);
  return formattedDate;
}

String getFormattedEmirateId(String emirateId){
  // final String formattedEmirateId = emirateId.substring(0,3) + "-" + emirateId.substring(3,8) + "-" + emirateId.substring(8, 15) + "-" + emirateId.substring(15,emirateId.length);
  // final String formattedEmirateId = emirateId.replaceAll(RegExp(r'(?<=.{2})\d(?=.{4})'), '-');
  return emirateId;
}

// Format File Size
void getPickedFileSize({required int bytes, int decimals = 0}) {
const suffixes = ["b", "kb", "mb", "gb", "tb"];
var i = (log(bytes) / log(1024)).floor();
print("Picked File Size -------------> "+(((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i]).toString());
}

SizedBox spaceheight(double height) {
  return SizedBox(
    height: height,
  );
}

double getSmallestTextFontSIze() {
  return 12.sp;
}

double getSmallTextFontSIze() {
  return 14.sp;
}

double getNormalTextFontSIze() {
  return 16.sp;
}

double getSubheadingTextFontSIze() {
  return 18.sp;
}

double get17TextFontSIze() {
  return 17.sp;
}

double get15TextFontSize() {
  return 15.sp;
}

double getHeadingTextFontSIze() {
  return 19.sp;
}

double getLargeTextFontSIze() {
  return 21.sp;
}

BorderRadius radiusAll(double radius) {
  return BorderRadius.circular(radius);
}

EdgeInsets marginSymetric(double horizontal, double vertical) {
  return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}

Widget buildDivider() {
  return Divider(
    color: ColorConstants.borderColor2.withOpacity(0.5),
    thickness: 2,
    height: 3.h,
  );
}

Widget buildDivider2() {
  return Divider(
    color: BaseColors.dividerColor2,
    height: 1.h,
    thickness: 1.5,
  );
}

Widget buildDivider3() {
  return Divider(
    color: BaseColors.dividerColor2,
    height: 0.8.h,
    thickness: 0.8,
  );
}

Widget saveButton(context, onTap) {
  return BaseButton(
    title: 'SAVE',
    onPressed: onTap,
    btnType: 'small',
    // removeHorizontalPadding: true,
  );
}

showMediaPickerDialogMedical(
    void Function(String fileName, String filePath) onPickedImage) {
  showGeneralDialog(
    context: Get.context!,
    barrierDismissible: true,
    barrierLabel: "",
    pageBuilder: (context, a1, a2) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    StarIcons.closeIconBlack,
                    height: 16,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        Get.back();
                        final result = await ImagePicker().pickImage(
                          source: ImageSource.camera,
                        );
                        if (result != null) {
                          final fileBytes = await result.readAsBytes();
                          final fileName = result.path.split('/').last;
                          final filePath = result.path;
                          // Do something with the fileBytes and fileName
                          onPickedImage(fileName, filePath);
                        }
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: ColorConstants.primaryColor,
                            size: 60,
                          ),
                          SizedBox(height: 8),
                          Text("Camera"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        Get.back();
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.any,
                          allowMultiple: true,
                        );
                        if (result != null) {
                          final files = result.files;
                          for (var file in files) {
                            final fileBytes = file.bytes;
                            final fileName = file.name;
                            final filePath = file.path;
                            // Do something with the fileBytes fileName and filePath
                            onPickedImage(fileName, filePath!);
                          }
                        }
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.photo_library_outlined,
                            color: ColorConstants.primaryColor,
                            size: 60,
                          ),
                          SizedBox(height: 8),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      );
    },
  );
}

Text addTextCenter(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(text.tr,
      textScaleFactor: 1,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          fontFamily: 'Arial'));
}

Decoration getEditTextDecoration() {
  return BoxDecoration(
      borderRadius: getBorderRadius(),
      border: Border.all(color: ColorConstants.borderColor),
      color: ColorConstants.etBgColor);
}

BorderRadius getBorderRadius() {
  return BorderRadius.circular(10);
}

BorderRadius getCurvedBorderRadius() {
  return BorderRadius.circular(20);
}

Widget yesNoButtons(context, bool isYes, onTap) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: isYes
                    ? ColorConstants.primaryColor
                    : ColorConstants.borderColor),
            color: isYes ? ColorConstants.primaryColorLight : Colors.white,
            borderRadius: BorderRadius.circular(7)),
        height: 3.h,
        width: 60,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(7),
              onTap: onTap,
              child: Container(
                alignment: Alignment.center,
                child: addText(
                    translate(context).yes,
                    smallButtonTs,
                    isYes ? ColorConstants.primaryColor : ColorConstants.grey2,
                    FontWeight.w700),
              )),
        ),
      ),
      spacewidth(0.934.h),
      Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: isYes
                    ? ColorConstants.borderColor
                    : ColorConstants.primaryColor),
            color: isYes ? Colors.white : ColorConstants.primaryColorLight,
            borderRadius: BorderRadius.circular(7)),
        height: 3.h,
        width: 60,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(7),
              onTap: onTap,
              child: Container(
                alignment: Alignment.center,
                child: addText(
                    translate(context).no,
                    smallButtonTs,
                    isYes ? BaseColors.grey2 : ColorConstants.primaryColor,
                    FontWeight.w700),
              )),
        ),
      ),
    ],
  );
}

Widget addEditText2(
    TextEditingController? controller,
    String hintText, {
      String? Function(String?)? validator,
      TextInputType keyboardType = TextInputType.text,
      InputBorder? border,
      TextCapitalization textCapitalization = TextCapitalization.none,
    }) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    cursorColor: ColorConstants.primaryColor,
    controller: controller,
    textCapitalization: textCapitalization,
    validator: validator,
    keyboardType: keyboardType,
    textInputAction: TextInputAction.next,
    style: TextStyle(fontSize: getNormalTextFontSIze()),
    decoration: InputDecoration(
      hintText: hintText.tr,
      hintStyle: TextStyle(
          fontSize: getNormalTextFontSIze(),
          color: ColorConstants.gretTextColor),
      border: border ?? InputBorder.none,
      enabledBorder: border ?? InputBorder.none,
      focusedBorder: border ?? InputBorder.none,
    ),
  );
}

SizedBox spacewidth(double width) {
  return SizedBox(
    width: width,
  );
}

Widget textArialUnderline(
    String text, double fontSize, Color fontColor, FontWeight fontWeight) {
  return Text(
    text,
    textScaleFactor: 1,
    style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        decoration: TextDecoration.underline,
        fontFamily: 'Arial'),
  );
}

Text addOverflowText(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(text.tr,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 1,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis,
          fontFamily: 'Arial'));
}

Text addUnderlineLineText(
    String text, double size, Color color, FontWeight fontWeight) {
  return Text(text.tr,
      textScaleFactor: 1,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          decoration: TextDecoration.underline,
          fontFamily: 'Arial'));
}

Widget addEditText(
    TextEditingController controller,
    String hintText, {
      String? Function(String?)? validator,
      TextInputType keyboardType = TextInputType.text,
      InputBorder? border,
      Widget prefixIcon = const SizedBox(),
    }) {
  return Expanded(
    child: TextFormField(
      validator: validator,
      cursorColor: ColorConstants.primaryColor,
      keyboardType: keyboardType,
      controller: controller,
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: getNormalTextFontSIze()),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText.tr,
        hintStyle: TextStyle(
            fontSize: getNormalTextFontSIze(),
            color: ColorConstants.gretTextColor),
        border: border ?? InputBorder.none,
        enabledBorder: border ?? InputBorder.none,
        focusedBorder: border ?? InputBorder.none,
      ),
    ),
  );
}

TextFormField addSmallEditText(
    TextEditingController controller,
    String hintText,
    String? Function(String?)? v,
    Widget? suffixIcon, // Updated to accept nullable Widget
    ) {
  return TextFormField(
    cursorColor: ColorConstants.primaryColor,
    keyboardType: TextInputType.multiline,
    controller: controller,
    textInputAction: TextInputAction.next,
    style: TextStyle(fontSize: getNormalTextFontSIze()),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      fillColor: ColorConstants.etBgColor,
      filled: true,
      hintText: hintText.tr,
      hintStyle: TextStyle(
        fontSize: getNormalTextFontSIze(),
        color: ColorConstants.gretTextColor,
      ),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: suffixIcon,
      ), // Added suffixIcon property
      suffixIconConstraints: BoxConstraints(
        maxHeight: 30,
        maxWidth: 30,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorConstants.borderColor,
          width: 1.0,
        ),
        borderRadius: getBorderRadius(),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorConstants.borderColor,
          width: 1.0,
        ),
        borderRadius: getBorderRadius(),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorConstants.borderColor,
          width: 1.0,
        ),
        borderRadius: getBorderRadius(),
      ),
    ),
    validator: v,
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );
}

Widget addPrimaryColorEditText(
    TextEditingController controller,
    String hintText,
    Widget suffixIcon, {
      String? Function(String?)? validator,
      TextInputType keyboardType = TextInputType.text,
      InputBorder? border,
      TextCapitalization textCapitalization = TextCapitalization.none,
      List<TextInputFormatter>? inputFormatters,
    }) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    readOnly: hintText.tr.toLowerCase().contains('file'),
    textCapitalization: textCapitalization,
    validator: validator,
    cursorColor: ColorConstants.primaryColor,
    keyboardType: keyboardType,
    controller: controller,
    textInputAction: TextInputAction.next,
    style: TextStyle(
        fontSize: getNormalTextFontSIze(),
        color: ColorConstants.primaryColor,
        fontWeight: FontWeight.w500),
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
      labelText: hintText.tr,
      labelStyle:
      TextStyle(fontSize: getNormalTextFontSIze(), color: Colors.black),
      border: border ?? InputBorder.none,
      enabledBorder: border ?? InputBorder.none,
      focusedBorder: border ?? InputBorder.none,
    ),
    inputFormatters: inputFormatters,
  );
}

Widget buildLineEditText(
    TextEditingController controller,
    String hint,
    ) {
  return TextFormField(
    maxLines: 5,
    keyboardType: TextInputType.multiline,
    controller: controller,
    textInputAction: TextInputAction.done,
    style: TextStyle(
        fontSize: getNormalTextFontSIze(),
        color: ColorConstants.black,
        fontWeight: FontWeight.normal),
    decoration: InputDecoration(
      hintText: hint.tr,
      hintStyle: TextStyle(
          fontSize: getNormalTextFontSIze(),
          color: ColorConstants.gretTextColor),
      border: InputBorder.none,
    ),
  );
}

Widget verticalDivider() {
  return SizedBox(
      height: getHeadingTextFontSIze(),
      child: const VerticalDivider(color: ColorConstants.lightGreyColor));
}

BoxShadow getDeepBoxShadow() {
  return const BoxShadow(
    color: Colors.black12,
    offset: Offset(
      0.0,
      3.0,
    ),
    blurRadius: 10.0,
    spreadRadius: 0.0,
  );
}

Decoration getPrimaryDecoration() {
  return BoxDecoration(
      borderRadius: getEdgyBorderRadius(),
      border: Border.all(color: ColorConstants.primaryColor),
      color: ColorConstants.primaryColorLight);
}

Decoration getPrimaryDecoration2() {
  return BoxDecoration(
      borderRadius: getBorderRadius(),
      boxShadow: [getBoxShadow()],
      // border: Border.all(color: ColorConstants.primaryColor),
      color: ColorConstants.primaryColorLight);
}

BorderRadius getEdgyBorderRadius() {
  return BorderRadius.circular(5);
}

BorderRadius getBorderRadiusCircular() {
  return BorderRadius.circular(200);
}

BorderRadius getCustomBorderRadius(double radius) {
  return BorderRadius.circular(radius);
}

Widget buildInputField(String fieldName, TextEditingController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      addText(fieldName, getNormalTextFontSIze(), ColorConstants.black,
          FontWeight.w700),

      Container(
        width: 65.w,
        decoration: getEditTextDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          cursorColor: ColorConstants.primaryColor,
          keyboardType: TextInputType.text,
          controller: controller,
          textInputAction: TextInputAction.next,
          style: TextStyle(fontSize: getNormalTextFontSIze()),
          decoration: InputDecoration(
              hintText: 'Type here.....'.tr,
              hintStyle: TextStyle(
                  fontSize: getNormalTextFontSIze(),
                  color: ColorConstants.gretTextColor),
              border: InputBorder.none),
        ),
      )

      // Flexible(
      //   flex: 7,
      //   child: addDecoratedEditText(controller, 'Type here.....'),
      // )
    ],
  );
}

// void showToast(String message) {
//   Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: ColorConstants.primaryColor,
//       textColor: ColorConstants.white,
//       fontSize: 16.0);
// }

Widget getLightDivider() {
  return Divider(
    color: ColorConstants.borderColor2,
    height: 3.h,
  );
}

Widget checkBoxButton2(ontap, icon) {
  return Obx(() => SizedBox(
    height: 20.sp,
    width: 20.sp,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(20.sp),
          onTap: ontap,
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.scaleDown,
          )),
    ),
  ));
}

Widget iconButtonSmall(ontap, icon) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
    height: 18.sp,
    width: 18.sp,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(10.sp),
          onTap: ontap,
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.scaleDown,
            height: 15,
          )),
    ),
  );
}

Widget iconButtonSmallest(ontap, icon) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
    height: 5.sp,
    width: 5.sp,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(10.sp),
          onTap: ontap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              icon,
              height: 5,
              width: 5,
              fit: BoxFit.scaleDown,
              // height: 2,
            ),
          )),
    ),
  );
}

Widget notificationButton(ontap, icon) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(10.sp),
          onTap: ontap,
          child: SvgPicture.asset(
            icon,
            height: getLargeTextFontSIze() * 1.2,
          )),
    ),
  );
}

Widget sendOTPButton(ontap) {
  return Container(
    decoration: BoxDecoration(
        color: ColorConstants.otpButtonColor,
        borderRadius: BorderRadius.circular(7)),
    height: 1.h,
    width: 75,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: ontap,
          child: Container(
            alignment: Alignment.center,
            child: addText(
                'SEND OTP', smallButtonTs, Colors.white, FontWeight.w700),
          )),
    ),
  );
}

Widget changeButton(ontap) {
  return BaseButton(
    title: 'CHANGE',
    onPressed: ontap,
    btnType: 'small',
    borderRadius: 20,
  );
}

Widget textButton({required Widget child, required Function() onTap}) {
  return Align(
    alignment: Alignment.center,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.sp),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(5.sp),
          child: child,
        ),
      ),
    ),
  );
}

Future<String> formatDate(DateTime selectedDate,
    {String seperator = '-', String? formatString}) async {
  final DateFormat formatter =
  DateFormat(formatString ?? 'dd${seperator}MM${seperator}yyyy');
  final String formatted = formatter.format(selectedDate);
  return formatted;
}

String convertTimestampToDate(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  String formattedDate = DateFormat('dd-MM-yyyy').format(date);
  return formattedDate;
}

void main() {
  int timestamp = 1670803200000;
  String formattedDate = convertTimestampToDate(timestamp);
  print(formattedDate); // Output: 11-12-2022
}

Text addarialText(
    String text, Color color, double fontsize, FontWeight fontWeight) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: fontsize.sp,
          fontWeight: fontWeight,
          fontFamily: 'Arial'));
}

underlineBorder() {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      color: ColorConstants.dividerColor2,
    ),
  );
}

outlineBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorConstants.dividerColor2,
    ),
  );
}

String getFormattedDate(String dateString,
    {String seperator = '/', bool fullYear = false, bool reverse = false}) {
  DateTime date = DateTime.parse(dateString);
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = '';
  if (fullYear) {
    year = date.year.toString();
  } else {
    if (!reverse) {
      year = date.year.toString().substring(2);
    } else {
      year = date.year.toString();
    }
  }
  if (reverse) {
    return '$year$seperator$month$seperator$day';
  }
  return '$day$seperator$month$seperator$year';
}

String getFormattedTimeInHHMMDD(String dateString) {
  DateTime date = DateTime.parse(dateString);
  String hour = (date.hour % 12).toString().padLeft(2, '0');
  String minute = date.minute.toString().padLeft(2, '0');
  String second = date.second.toString().padLeft(2, '0');
  return '$hour:$minute:$second';
}

Widget noRecordAvailable({String? msg, double fontSize = 15.0}) {
  return Center(
    child: Text(
      msg ?? 'No record available',
      style: TextStyle(
        fontSize: fontSize, // Change the font size to 20
        color: Colors.grey, // Change the text color to grey
      ),
    ),
  );
}

String getTime(dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String formattedTime = DateFormat.Hm().format(dateTime);
  return formattedTime;
}

void showSnackBar(
    {bool success = true, required String message, String? title}) {
  closeSnackbar();
  Get.snackbar(
    title != null
        ? title
        : success
        ? 'Success'
        : 'Error', // title
    message,
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: success ? (Colors.green.shade800) : Colors.red,
    margin: EdgeInsets.zero,
    borderRadius: 0,
    icon: Icon(
      success ? Icons.check_circle_outline : Icons.error_outline,
      color: Colors.white,
    ),
    animationDuration: Duration(milliseconds: 0),
  );
}

void closeSnackbar() async {
  Get.closeCurrentSnackbar();
  Get.closeAllSnackbars();
}

Future<DateTime?> selectDateMedical(
    {DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) async {
  return await showDatePicker(
    context: Get.context!,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: ColorConstants.primaryColor,
          ),
        ),
        child: child!,
      );
    },
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime(2015),
    lastDate: lastDate ?? DateTime(2050),
  );
}

Widget textArialCenterExpanded(
    String text, double fontSize, Color fontColor, FontWeight fontWeight) {
  return Text(
    text,
    textAlign: TextAlign.center,
    textScaleFactor: 1,
    style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        height: 1.5,
        fontFamily: 'Arial'),
  );
}

showMediaPickerDialog(
    void Function(String fileName, String filePath) onPickedImage) {
  showGeneralDialog(
    context: Get.context!,
    barrierDismissible: true,
    barrierLabel: "",
    pageBuilder: (context, a1, a2) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    StarIcons.closeIconBlack,
                    height: 16,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        Get.back();
                        final result = await ImagePicker().pickImage(
                          source: ImageSource.camera,
                        );
                        if (result != null) {
                          final fileBytes = await result.readAsBytes();
                          final fileName = result.path.split('/').last;
                          final filePath = result.path;
                          // Do something with the fileBytes and fileName
                          onPickedImage(fileName, filePath);
                        }
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: ColorConstants.primaryColor,
                            size: 60,
                          ),
                          SizedBox(height: 8),
                          Text("Camera"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        Get.back();
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.any,
                          allowMultiple: true,
                        );
                        if (result != null) {
                          final files = result.files;
                          for (var file in files) {
                            final fileBytes = file.bytes;
                            final fileName = file.name;
                            final filePath = file.path;
                            // Do something with the fileBytes fileName and filePath
                            onPickedImage(fileName, filePath!);
                          }
                        }
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.photo_library_outlined,
                            color: ColorConstants.primaryColor,
                            size: 60,
                          ),
                          SizedBox(height: 8),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      );
    },
  );
}

void showScanQrDialogueMedical(BuildContext context, {barcode}) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              shape:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              content: SizedBox(
                width: 100.w,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.close),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Center(
                              child: addAlignedText(
                                  'QR Code', 18, Colors.black, FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      // barcode == null
                      //     ?
                      //     SvgPicture.asset(
                      //         "assets/images/barcode2.svg",
                      //         fit: BoxFit.scaleDown,
                      //       )
                      //     :
                      BaseQr(
                        data: barcode ?? '',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

