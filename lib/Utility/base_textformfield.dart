import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';

class BaseTextFormField extends StatefulWidget {
  final double? bottomMargin,topMargin,leftMargin,rightMargin;
  final String? title;
  final String? hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool isDropDown;
  final int? maxLine;
  List<DropdownMenuItem>? items;
  String? dropDownValue;
  final Function()? onTap;
  final ValueChanged? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  BaseTextFormField({Key? key, this.title, required this.controller, this.hintText, this.keyboardType, this.prefixIcon, this.suffixIcon, this.isDropDown = false, this.dropDownValue, this.items = const [], this.onChanged, this.onTap, this.bottomMargin, this.topMargin, this.leftMargin, this.rightMargin, this.maxLine}) : super(key: key);

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.topMargin??0,bottom: widget.bottomMargin??2.h,right: widget.rightMargin??0,left: widget.leftMargin??0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: (widget.title??"").isNotEmpty,
            child: Expanded(
              flex: 1,
              child: Text(widget.title??"", style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp, color: BaseColors.textBlackColor),),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Row(
                children: [
                  Visibility(visible: (widget.title??"").isNotEmpty,child: SvgPicture.asset(widget.prefixIcon??calenderDateSvg,color: (widget.prefixIcon??"").isEmpty ? Colors.transparent : null)),
                  Visibility(
                    visible: (widget.title??"").isNotEmpty,
                    child: SizedBox(
                      width: 2.w,
                    ),
                  ),
                  widget.isDropDown
                      ? Expanded(
                      child: Container(
                      padding: EdgeInsets.only(top: 13.sp, bottom: 13.sp),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                            color: BaseColors.txtFiledBorderColor
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<dynamic>(
                            isExpanded: true,
                            isDense: true,
                            alignment: Alignment.centerLeft,
                            hint: Text(widget.controller.text.isEmpty ? widget.hintText??"" : widget.controller.text,style: TextStyle(color: Colors.black,fontSize: textFormFieldHintTs)),
                            icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0),
                            itemPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            items: widget.items,
                            onChanged: widget.onChanged),
                      ),
                    ),
                  )
                      : Expanded(
                      child: CustomTextField(
                      controller: widget.controller,
                      hintText: widget.hintText??"",
                      fillColor: Colors.transparent,
                      borderRadius: 5.0,
                      maxLine: widget.maxLine??null,
                      readOnly: (widget.onTap) == null ? false : true,
                      onTap: widget.onTap,
                      textInputType: widget.keyboardType,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 1.8.w),
                        child: SvgPicture.asset(widget.suffixIcon??""),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

  }
}
