import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  bool? obscureText;
  String hintText;
  Color? fillColor;
  Color? txtColor;
  TextInputAction? textInputAction;
  List<TextInputFormatter>? textInputFormatter;
  TextInputType? textInputType;
  String? errorText;
  int? maxLine;
  EdgeInsetsGeometry? contentPadding;
  Widget? suffixIcon;
  double? borderRadius;
  Color? borderColor;
  Function()? onTap;
  Widget? prefixIcon;
  bool? readOnly;
  double? hintTxtSize;

  Color? hintTextColor;

  CustomTextField({Key? key, required this.controller, this.obscureText, required this.hintText, this.textInputAction, this.textInputType, this.textInputFormatter, this.suffixIcon, this.prefixIcon, this.errorText, this.borderRadius, this.fillColor, this.txtColor, this.borderColor, this.maxLine, this.contentPadding, this.hintTxtSize, this.onTap, this.readOnly, this.hintTextColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      obscuringCharacter: "*",
      maxLines: maxLine,
      onTap: onTap,
      readOnly: readOnly ?? false,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      style: TextStyle(color: txtColor ?? Colors.black),
      decoration: InputDecoration(
        contentPadding: contentPadding ?? EdgeInsets.only(top: 16.sp, bottom: 16.sp, left: 10.0, right: 10.0),
        isDense: true,
        hintMaxLines: 2,
        border: new OutlineInputBorder(
            borderSide: new BorderSide(color: CustomColors.txtFiledBorderColor)),
        hintText: hintText,
        errorText: errorText,
        suffixIconConstraints: BoxConstraints(maxHeight: 45),
        prefixIconConstraints: BoxConstraints(maxHeight: 45),
        hintStyle: TextStyle(color: hintTextColor ?? Colors.black,fontSize: hintTxtSize ?? 16.sp),
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor ?? Colors.transparent,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? CustomColors.txtFiledBorderColor, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius??8.0),
        ),
        enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide.none,
          borderSide: BorderSide(color: borderColor ??  CustomColors.txtFiledBorderColor, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius??8.0),
        ),
        errorBorder: OutlineInputBorder(
          // borderSide: BorderSide.none,
          // borderSide: BorderSide(color: CustomColors.txtFiledErrorBorderColor, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius??8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? CustomColors.txtFiledBorderColor, width: 1.0),
          // borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius??8.0),
        ),
      ),
    );
  }
}
