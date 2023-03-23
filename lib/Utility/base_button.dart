import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';

class BaseButton extends StatelessWidget {
  final String title;
  final double? btnWidth;
  final double? textSize;
  final double? verticalPadding;
  final bool isActive;
  final bool showNextIcon;
  final bool removeHorizontalPadding;
  final bool isToggle;
  final Function()? onPressed;
  const BaseButton({Key? key, required this.title, this.btnWidth, this.textSize, required this.onPressed, this.isActive = true, this.showNextIcon = false, this.removeHorizontalPadding = false, this.verticalPadding, this.isToggle = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: removeHorizontalPadding ? 0 : 4.w,vertical: verticalPadding ?? 1.7.h),
        width: showNextIcon ? double.infinity : btnWidth ?? 50.w,
        decoration: BoxDecoration(
            color: isActive ? !showNextIcon ? Color(0xffF8F4E9) : Colors.white:Colors.white,
            borderRadius: BorderRadius.circular(baseButtonRadius),
            boxShadow: isActive ? !showNextIcon ? const [
              BoxShadow(
                  color: Color(0xffA59F9F),
                  spreadRadius: 1.0,
                  blurRadius: 2.0,
                  offset: Offset(0, 3)
              )
            ]:null:null,
            border: isToggle ? null :  Border.all(color: isActive ? Color(0xffC19444) :  Color(0xffE2E2E2))
        ),
        child: showNextIcon
            ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontFamily: "Arial", fontWeight: FontWeight.w500, fontSize: textSize ?? largeButtonTs, color: isActive ? Color(0xffC19444) : Color(0xffB4B9C1))),
                Icon(
                  Icons.arrow_forward,
                  color: Color(0xffC19444),
                  size: 20.sp,
                )
              ],
            )
            : Text(title, style: TextStyle(fontFamily: "Arial", fontWeight: FontWeight.w600, fontSize: textSize ?? largeButtonTs, color: isActive ? Color(0xffC19444) : Color(0xffB4B9C1))),
      ),
    );
  }
}
