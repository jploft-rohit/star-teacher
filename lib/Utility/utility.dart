import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';

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

Widget buildInfoItems(String title,String description, [icon]) {
  return RichText(
    text: TextSpan(
      text: '$title : ',
      style: Style.montserratRegularStyle().copyWith(color: CustomColors.textBlackColor, fontSize: textFormFieldLabelTs),
      children: <TextSpan>[
        TextSpan(text: description, style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: textFormFieldHintTs, height: 1.2)),
      ],
    ),
  );
}

Widget walletToogleButton(
    onTap1, isPurchases, onTap2, isEvents) {
  return Row(
    children: [
      Expanded(
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
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
                        ? CustomColors.backgroundColor
                        : CustomColors.txtFieldTextColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: isPurchases
                            ? Colors.transparent
                            : CustomColors.borderColor)),
                child: Text(translate(Get.context!).purchase, style: Style.montserratBoldStyle().copyWith(color: isPurchases ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: toggleButtonTs),),
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
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
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
                        ? CustomColors.backgroundColor
                        : CustomColors.txtFieldTextColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: isEvents
                            ? Colors.transparent
                            : CustomColors.borderColor)),
                child: Text(translate(Get.context!).event, style: Style.montserratBoldStyle().copyWith(color: isEvents ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: toggleButtonTs),),
              ),
              Container(
                alignment: Alignment.center,
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: CustomColors.primaryColor),
                child: Text("1", style: Style.montserratBoldStyle().copyWith(color: CustomColors.white,fontSize: 13.sp),),
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
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap1,
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(
                    color: isTransaction
                        ? Colors.transparent
                        : CustomColors.borderColor),
                color: isTransaction
                    ? CustomColors.backgroundColor
                    : CustomColors.txtFieldTextColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: isTransaction ? kElevationToShadow[3] : null),
            child: Text(translate(Get.context!).transaction, style: Style.montserratBoldStyle().copyWith(color: isTransaction ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: toggleButtonTs),),
          ),
        ),
      ),
      SizedBox(width: 0.7.h),
      Expanded(
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap2,
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
                boxShadow: isTopup ? kElevationToShadow[3] : null,
                color: isTopup
                    ? CustomColors.backgroundColor
                    : CustomColors.txtFieldTextColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: isTopup
                        ? Colors.transparent
                        : CustomColors.borderColor)),
            child: Text(translate(Get.context!).top_up_record, style: Style.montserratBoldStyle().copyWith(color: isTopup ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: toggleButtonTs),),
          ),
        ),
      ),
    ],
  );
}
Widget calenderDownButton(label, onTap) {
  return Container(
    decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: CustomColors.borderColor)),
    padding: EdgeInsets.symmetric(horizontal: 1.2.w, vertical: 0.6.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              SvgPicture.asset(calenderSvg, height: 2.h,),
              SizedBox(width: 2.w),
              Text(label, style: Style.montserratBoldStyle().copyWith(color: CustomColors.textLightGreyColor, fontSize: 14.sp),),
            ],
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
        )
      ],
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
      child: InkWell(
          borderRadius: BorderRadius.circular(10.sp),
          onTap: ontap,
          child:
          addText(text, 20, CustomColors.primaryColor, FontWeight.w700)),
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
      child: InkWell(
          borderRadius: BorderRadius.circular(10.sp),
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
      addText(label, radioButtonTitleTs, CustomColors.textBlackColor,
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
          backgroundColor: CustomColors.white,
          elevation: 10,
          scrollable: true,
          title: Stack(
            children: [
              if(image.isEmpty)
                Align(alignment: Alignment.center,
                  child: Text(
                    translate(context).programme_NFC,style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor,fontSize: 17.sp),),),
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
                  Text(image.isEmpty ? translate(context).tap_nfc_card_to_match_frequency : translate(context).nfc_programmed_successfully,style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor,fontSize: 17.sp),textAlign: TextAlign.center,),
                ],
              ),
            ),
          ))).then((value) {showNFCDialog1(context,"assets/images/check 1.svg");});
}
showNFCDialog1(BuildContext context,String image){

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
          backgroundColor: CustomColors.white,
          elevation: 10,
          scrollable: true,
          title: Stack(
            children: [
              if(image.isEmpty)
                Align(alignment: Alignment.center,
                  child: Text(
                    translate(context).programme_NFC,style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor,fontSize: 17.sp),),),
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
                  Text(image.isEmpty ? translate(context).tap_nfc_card_to_match_frequency : translate(context).nfc_programmed_successfully,style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor,fontSize: 17.sp),textAlign: TextAlign.center,),
                ],
              ),
            ),
          )));
}
void showScanQrDialogue(BuildContext context, bool isShowButton) {
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
                      SvgPicture.asset(
                        "assets/images/barcode2.svg",
                        fit: BoxFit.scaleDown,
                      ),
                      SizedBox(height:1.h),
                      if(isShowButton) BaseButton(title: "PRINT QR", onPressed: (){})
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
              primary: CustomColors.primaryColor,
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