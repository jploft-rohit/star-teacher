import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';

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
  final bool? underLine;
  final int? maxLength;
  EdgeInsetsGeometry? contentPadding;
  Widget? suffixIcon;
  double? borderRadius;
  Color? borderColor;
  Function()? onTap;
  Widget? prefixIcon;
  bool? readOnly;
  double? hintTxtSize;
  final String? Function(String?)? validator;
  Color? hintTextColor;
  CustomTextField({Key? key, required this.controller, this.obscureText, required this.hintText, this.textInputAction, this.textInputType, this.textInputFormatter, this.suffixIcon, this.prefixIcon, this.errorText, this.borderRadius, this.fillColor, this.txtColor, this.borderColor, this.maxLine, this.contentPadding, this.hintTxtSize, this.onTap, this.readOnly, this.hintTextColor, this.validator, this.maxLength, this.underLine = false}) : super(key: key);
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
      validator: validator,
      maxLength: maxLength??200,
      style: TextStyle(color: txtColor ?? Colors.black,fontSize: textFormFieldHintTs),
      decoration: InputDecoration(
        contentPadding: contentPadding ?? EdgeInsets.only(top: 16.sp, bottom: 16.sp, left: 10.0, right: 10.0),
        isDense: true,
        hintMaxLines: 2,
        hintText: hintText,
        errorText: errorText,
        counter: SizedBox.shrink(),
        counterStyle: TextStyle(fontSize: 0,color: Colors.transparent),
        counterText: "",
        semanticCounterText: "",
        suffixIconConstraints: const BoxConstraints(maxHeight: 45),
        prefixIconConstraints: const BoxConstraints(maxHeight: 45),
        hintStyle: TextStyle(color: hintTextColor ?? Colors.black,fontSize: hintTxtSize ?? textFormFieldHintTs),
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor ?? Colors.transparent,
        border: const OutlineInputBorder(borderSide: BorderSide(color: BaseColors.txtFiledBorderColor)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? BaseColors.txtFiledBorderColor, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius??8.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? BaseColors.txtFiledBorderColor, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius??8.0),
        ),
        enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide.none,
          borderSide: BorderSide(color: borderColor ??  BaseColors.txtFiledBorderColor, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius??8.0),
        ),
        errorBorder: OutlineInputBorder(
          // borderSide: BorderSide.none,
          borderSide: BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius??8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? BaseColors.txtFiledBorderColor, width: 1.0),
          // borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius??8.0),
        ),
      ),
    );
  }
}
