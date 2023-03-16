import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';

class CustomButton extends StatelessWidget {
  String text;
  double? btnHeight;
  double? btnWidth;
  double? textSize;
  double? borderRadius;
  Color? btnColor;
  Color? borderColor;
  Color? textColor;
  List<BoxShadow>? boxShadow;
  Function() onPressed;
  CustomButton({Key? key, required this.text, required this.onPressed, this.btnWidth, this.btnHeight, this.textSize, this.borderRadius, this.boxShadow, this.btnColor, this.borderColor, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: btnHeight ?? 6.5.h,
        width: btnWidth ?? getWidth(context) * 50 / 100,
        decoration: BoxDecoration(
            color: btnColor ?? CustomColors.backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 20.0),
            boxShadow: boxShadow ?? const [
              BoxShadow(
                  color: CustomColors.darkShadowColor,
                  spreadRadius: 1.0,
                  blurRadius: 2.0,
                  offset: Offset(0, 3)
              )
            ],
            border: Border.all(color: borderColor ?? CustomColors.primaryColor)
        ),
        alignment: Alignment.center,
        child: Text(text, style: Style.montserratBoldStyle().copyWith(color: textColor ?? CustomColors.primaryColor,fontSize: textSize ?? 17.sp),),
      ),
    );
  }
}
