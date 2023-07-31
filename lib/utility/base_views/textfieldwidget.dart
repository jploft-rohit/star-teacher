import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';

import '../base_utility.dart';
import '../sizes.dart';

class TextFieldWidget extends StatefulWidget {
  List<TextInputFormatter>? inputFormatters;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  BorderRadius? borderRadius;
  double? height;
  void Function(String)? onChanged;
  final Function? onSubmit;
  final String labelText;
  final bool isEnabled;
  Color? fillColor;
  Color? hintColor;
  Color? borderColor;
  bool? readOnly;
  final int maxLines;
  double? fontsize;
  double? borderWidth;
  Widget? sufficIcon;
  // final Color color;
  final TextCapitalization capitalization;
  final bool isIcon;
  Widget? prefixIcon;
  final bool isNumber;
  final bool divider;
  String? Function(String?)? validator;

  TextFieldWidget({
    this.hintText = 'Type here.....',
    this.controller,
    this.hintColor,
    this.focusNode,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.nextFocus,
    this.fontsize,
    this.fillColor,
    this.height,
    // this.color,
    required this.labelText,
    this.isEnabled = true,
    this.readOnly,
    this.sufficIcon,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.onChanged,
    this.isIcon = false,
    this.isNumber = false,
    this.prefixIcon,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.divider = false,
    this.validator,
    this.inputFormatters,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<TextFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.fillColor ?? BaseColors.textField,
        borderRadius: widget.borderRadius,
      ),
      // height: widget.height ?? 50,
      child: TextFormField(
        textCapitalization: widget.capitalization,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        readOnly: widget.readOnly ?? false,
        onChanged: widget.onChanged,
        textInputAction: TextInputAction.done,
        textAlign: TextAlign.start,
        autofocus: false,
        cursorColor: Colors.black,
        minLines: widget.maxLines,
        enabled: true,
        maxLines: widget.maxLines,
        style: TextStyle(
            color: Colors.black, fontSize: getNormalTextFontSIze() - 1),
        controller: widget.controller,
        focusNode: widget.focusNode,
        keyboardType:
            widget.isNumber ? TextInputType.number : TextInputType.text,
        onEditingComplete: () {
          // _fPassword.requestFocus();
        },
        decoration: InputDecoration(
          errorMaxLines: 2,
          filled: true,
          fillColor: widget.fillColor ?? BaseColors.white,
          suffixIcon: widget.sufficIcon,
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: widget.hintColor ?? Color(0xFF8E8E8E),
              fontSize: widget.fontsize ?? textFormFieldHintTs,
              fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.only(
              left: widget.isIcon ? 0 : 10, right: 5, top: 10.0),
          border: OutlineInputBorder(
              borderRadius: widget.borderRadius ??
                  BorderRadius.all(
                    Radius.circular(10),
                  ),
              borderSide: BorderSide(
                  width: widget.borderWidth ?? 1.0,
                  color: widget.borderColor ?? const Color(0xffBECADA))),
          focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ??
                  BorderRadius.all(
                    Radius.circular(10),
                  ),
              borderSide: BorderSide(
                  width: widget.borderWidth ?? 1.0,
                  color: widget.borderColor ?? const Color(0xffBECADA))),
          enabledBorder: OutlineInputBorder(
              borderRadius:
                  widget.borderRadius ?? BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  width: widget.borderWidth ?? 1.0,
                  color: widget.borderColor ?? const Color(0xffBECADA))),
          // errorBorder: OutlineInputBorder(
          //     borderRadius:
          //         widget.borderRadius ?? BorderRadius.all(Radius.circular(10)),
          //     borderSide: BorderSide(
          //       width: widget.borderWidth ?? 1.0,
          //       color: widget.borderColor ?? const Color(0xffBECADA),
          //     )),
          // focusedErrorBorder: OutlineInputBorder(
          //     borderRadius:
          //         widget.borderRadius ?? BorderRadius.all(Radius.circular(10)),
          //     borderSide: BorderSide(
          //       width: widget.borderWidth ?? 1.0,
          //       color: widget.borderColor ?? const Color(0xffBECADA),
          //     )),
        ),
        inputFormatters: widget.inputFormatters,
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
