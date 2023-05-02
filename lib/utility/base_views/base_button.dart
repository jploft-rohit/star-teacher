import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';

class BaseButton extends StatelessWidget {
  final String title;
  final double? textSize;
  final double? btnWidth;
  final double? bottomMargin;
  final double? topMargin;
  final double? leftMargin;
  final double? rightMargin;
  final double? verticalPadding;
  final bool isActive;
  final bool showNextIcon;
  final bool removeHorizontalPadding;
  final bool isToggle;
  final String? btnType;
  final Function()? onPressed;
  final double? borderRadius;
  const BaseButton(
      {Key? key,
      required this.title,
      this.textSize,
      required this.onPressed,
      this.isActive = true,
      this.showNextIcon = false,
      this.removeHorizontalPadding = false,
      this.verticalPadding,
      this.isToggle = false,
      this.btnType,
      this.borderRadius,
      this.btnWidth,
      this.bottomMargin,
      this.topMargin,
      this.leftMargin,
      this.rightMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (btnType) {
      case smallButton:
        return showButtonType(context, false, verticalPadding ?? 0.7.h, 20.w,
            textSize??smallButtonTs, borderRadius??20);
      case mediumButton:
        return showButtonType(context, false, verticalPadding ?? 1.3.h, 25.w,
            textSize??mediumButtonTs, borderRadius??10);
      case mediumLargeButton:
        return showButtonType(context, false, verticalPadding ?? 1.3.h, 30.w,
            textSize??mediumButtonTs, borderRadius??10);
      case largeButton:
        return showButtonType(context, showNextIcon, verticalPadding ?? 1.7.h,
            50.w, textSize??largeButtonTs, borderRadius ?? 19);
      case toggleButton:
        return showButtonType(context, showNextIcon, verticalPadding ?? 1.7.h,
            30.w, textSize??mediumButtonTs, borderRadius??10);
        case toggleMediumButton:
        return showButtonType(context, showNextIcon, verticalPadding ?? 1.7.h,
            37.w, textSize??mediumButtonTs, borderRadius??10);
      case toggleLargeButton:
        return showButtonType(context, showNextIcon, verticalPadding ?? 1.3.h,
            45.w,textSize?? mediumButtonTs, borderRadius??10);
      case buttonIcon:
        return showButtonType(context, true, verticalPadding ?? 1.3.h,
            double.infinity,textSize?? mediumButtonTs, borderRadius ?? 10);
      case dialogButton:
        return showButtonType(
            context, false, verticalPadding ?? 1.3.h, 25.w,textSize?? largeButtonTs, 100);
      default:
        return showButtonType(context, showNextIcon, verticalPadding ?? 1.5.h,
            45.w,textSize?? largeButtonTs, isToggle ? borderRadius??10 : borderRadius??10);
    }
  }

  showButtonType(context, showNextIcon, double verticalPadding, double btnWidth,
      double fontSize, double borderRadius) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: removeHorizontalPadding ? 0 : 4.w,
            vertical: verticalPadding),
        margin: EdgeInsets.only(
            top: topMargin ?? 0,
            bottom: bottomMargin ?? 0,
            left: leftMargin ?? 0,
            right: rightMargin ?? 0),
        width: btnWidth,
        decoration: BoxDecoration(
            color: isActive
                ? !showNextIcon
                    ? Color(0xffF8F4E9)
                    : Colors.white
                : Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: isActive
                ? !showNextIcon
                    ? const [
                        BoxShadow(
                            color: Color(0xffA59F9F),
                            spreadRadius: 0.5,
                            blurRadius: 1.0,
                            offset: Offset(0, 2))
                      ]
                    : null
                : null,
            border: isToggle
                ? null
                : Border.all(
                    color: isActive ? Color(0xffC19444) : Color(0xFFBECADA))),
        child: showNextIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontFamily: "Arial",
                          fontWeight: FontWeight.w400,
                          fontSize: fontSize,
                          color: isActive
                              ? Color(0xffC19444)
                              : Color(0xffB4B9C1))),
                  Icon(
                    Icons.arrow_forward,
                    color: Color(0xffC19444),
                    size: 20.sp,
                  )
                ],
              )
            : Text(title,
                style: TextStyle(
                    fontFamily: "Arial",
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                    fontSize: fontSize,
                    color: isActive ? Color(0xffC19444) : Color(0xff7B8D9E))),
      ),
    );
  }
}
