import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/utility/validators.dart';

class BaseTextFormField extends StatefulWidget {
  final double? bottomMargin,topMargin,leftMargin,rightMargin;
  final String? title;
  final String? hintText;
  final String? errorText;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool isDropDown;
  final int? maxLine;
  final String? Function(String?)? validator;
  final List<DropdownMenuItem>? items;
  final String? dropDownValue;
  final Function()? onTap;
  final ValueChanged? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  BaseTextFormField({Key? key, this.title, required this.controller, this.hintText, this.keyboardType, this.prefixIcon, this.suffixIcon, this.isDropDown = false, this.dropDownValue, this.items = const [], this.onChanged, this.onTap, this.bottomMargin, this.topMargin, this.leftMargin, this.rightMargin, this.maxLine, this.errorText, this.validator}) : super(key: key);

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
              child: Text(widget.title??"", style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp,
                  color: BaseColors.textBlackColor)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Visibility(visible: (widget.title??"").isNotEmpty,
                    child: SvgPicture.asset(widget.prefixIcon??calenderDateSvg,
                        color: (widget.prefixIcon??"").isEmpty
                         ? Colors.transparent
                         : null)),
                Visibility(
                  visible: (widget.title??"").isNotEmpty,
                  child: SizedBox(
                    width: 2.w,
                  ),
                ),
                widget.isDropDown
                    ? Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField2<dynamic>(
                          isExpanded: true,
                          isDense: true,
                          // buttonPadding: EdgeInsets.zero,
                          // dropdownPadding: EdgeInsets.zero,
                          // dropdownScrollPadding: EdgeInsets.zero,
                          style: TextStyle(color: Colors.black,fontSize: 13.sp),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black,fontSize: textFormFieldHintTs),
                            contentPadding: EdgeInsets.only(top: 10,bottom: 10,right: 0,left: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: BaseColors.txtFiledBorderColor, width: 1.0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: BaseColors.txtFiledBorderColor, width: 1.0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: BaseColors.txtFiledBorderColor, width: 1.0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1.0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: BaseColors.txtFiledBorderColor, width: 1.0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if((value??"").isEmpty){
                              return widget.errorText;
                            }
                            return null;
                          },
                          hint: Text(widget.controller.text.isEmpty ? widget.hintText??"" : widget.controller.text,style: TextStyle(color: Colors.black,fontSize: textFormFieldHintTs),textAlign: TextAlign.start,),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0),
                          itemPadding: EdgeInsets.zero,
                          items: widget.items,
                          onChanged: widget.onChanged,
                      ),
                    ),
                )
                    : Expanded(
                    child: CustomTextField(
                    controller: widget.controller,
                    hintText: widget.hintText??"",
                    fillColor: Colors.transparent,
                    borderRadius: 5.0,
                    errorText: widget.errorText,
                    validator: widget.validator,
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
          )
        ],
      ),
    );

  }
}
