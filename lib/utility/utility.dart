import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';

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

Widget walletToogleButton(
    onTap1, isPurchases, onTap2, isEvents) {
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
Widget calenderDownButton(label, onTap) {
  return GestureDetector(
    onTap: (){
      showDatePicker(
          context: Get.context!,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000, 8),
          lastDate: DateTime.now());
    },
    child: Container(
      decoration: BoxDecoration(
          color: BaseColors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: BaseColors.borderColor)),
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
  ).then((picked){

  });
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