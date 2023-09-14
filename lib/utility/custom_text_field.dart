import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;
  final String hintText;
  final Color? fillColor;
  final Color? txtColor;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputType? textInputType;
  final String? errorText, initialValue;
  final int? maxLine;
  final FocusNode? focusNode;
  final bool? underLine;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final double? borderRadius;
  final Color? borderColor;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final bool? readOnly;
  final double? hintTxtSize;
  final String? Function(String?)? validator;
  final Color? hintTextColor;

  const CustomTextField({Key? key, required this.controller, this.obscureText, required this.hintText, this.textInputAction, this.textInputType, this.textInputFormatter, this.suffixIcon, this.prefixIcon, this.errorText, this.borderRadius, this.fillColor, this.txtColor, this.borderColor, this.maxLine, this.contentPadding, this.hintTxtSize, this.onTap, this.readOnly, this.hintTextColor, this.validator, this.maxLength, this.underLine = false, this.onChanged, this.focusNode, this.initialValue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      obscuringCharacter: "*",
      maxLines: maxLine??1,
      onTap: onTap,
      focusNode: focusNode,
      // initialValue: initialValue??"",
      readOnly: readOnly ?? false,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      validator: validator,
      onChanged: onChanged,
      maxLength: maxLength??200,
      style: TextStyle(color: txtColor ?? Colors.black,fontSize: textFormFieldHintTs),
      decoration: InputDecoration(
        contentPadding: contentPadding ?? EdgeInsets.only(top: 16.sp, bottom: 16.sp, left: 10.0, right: 10.0),
        isDense: true,
        hintMaxLines: 2,
        hintText: hintText,
        errorText: errorText,
        counter: const SizedBox.shrink(),
        counterStyle: const TextStyle(fontSize: 0,color: Colors.transparent),
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
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
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
