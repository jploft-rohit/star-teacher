import 'package:flutter/material.dart';
import 'package:staff_app/Utility/base_colors.dart';

class OTPInputBox extends StatefulWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final Size size;
  bool isFilled=false;

  OTPInputBox({
    Key? key,
    required this.controller,
    required this.autoFocus,
    required this.size,
    this.isFilled=false,
  }) : super(key: key);

  @override
  State<OTPInputBox> createState() => _OTPInputBoxState();
}

class _OTPInputBoxState extends State<OTPInputBox> {
  @override
  SizedBox build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0XFFC19444), width: 1),
    );
    return SizedBox(
      height: widget.size.width / 5,
      width: widget.size.width / 5.5,
      child: TextField(
        autofocus: widget.autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: widget.controller,
        maxLength: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: widget.controller.text.isEmpty ?  BaseColors.txtFiledBorderColor : BaseColors.primaryColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: widget.controller.text.isEmpty ?  BaseColors.txtFiledBorderColor : BaseColors.primaryColor, width: 1),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: widget.controller.text.isEmpty ?  BaseColors.txtFiledBorderColor : BaseColors.primaryColor, width: 1)
          ),
          fillColor: widget.controller.text.toString().trim().isEmpty ? Colors.transparent : BaseColors.backgroundColor,
          filled: true,
          errorBorder: outlineInputBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          counterText: '',
        ),
        style: Theme.of(context).textTheme.caption?.copyWith(
          color: Color(0xFFC19444),
          fontSize: widget.size.width / 14,
          fontWeight: FontWeight.w700,
        ),
        onChanged: (val) {
          if(val.isNotEmpty)
          {
            widget.isFilled=true;
          }
          if (val.length == 1) FocusScope.of(context).nextFocus();
          if (val.isEmpty && !widget.autoFocus) FocusScope.of(context).previousFocus();
          setState(() {});
        },
      ),
    );
  }
}