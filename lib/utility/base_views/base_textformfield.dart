import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/packages/drop_downbutton2/dropdown_button2.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';

class BaseTextFormField extends StatelessWidget {
  final double? bottomMargin,topMargin,leftMargin,rightMargin;
  final String? title;
  final String? hintText;
  final String? errorText;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool isDropDown;
  final bool? underLine;
  final int? maxLine;
  final String? Function(String?)? validator;
  final List<DropdownMenuItem<dynamic>>? items;
  final String? dropDownValue;
  final Function()? onTap;
  final ValueChanged? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool? hideBorders;
  BaseTextFormField({Key? key, this.title, required this.controller, this.hintText, this.keyboardType, this.prefixIcon, this.suffixIcon, this.isDropDown = false, this.dropDownValue, this.items = const [], this.onChanged, this.onTap, this.bottomMargin, this.topMargin, this.leftMargin, this.rightMargin, this.maxLine, this.errorText, this.validator, this.underLine = false, this.hideBorders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin??0,bottom: bottomMargin??2.h,right: rightMargin??0,left: leftMargin??0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: (title??"").isNotEmpty,
            child: Expanded(
              flex: 1,
              child: Text(title??"", style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp,
                  color: BaseColors.textBlackColor)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Visibility(visible: (title??"").isNotEmpty,
                    child: SvgPicture.asset(prefixIcon??calenderDateSvg,
                        color: (prefixIcon??"").isEmpty
                         ? Colors.transparent
                         : null)),
                Visibility(
                  visible: (title??"").isNotEmpty,
                  child: SizedBox(
                    width: 2.w,
                  ),
                ),
                isDropDown
                    ? Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField2<dynamic>(
                          isExpanded: true,
                          isDense: true,
                        dropdownStyleData: DropdownStyleData(offset: Offset(0, -10),
                            padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.8.w)),
                        menuItemStyleData: MenuItemStyleData(
                          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 0),
                        ),
                        iconStyleData: IconStyleData(
                          icon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.2.h),
                            child: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black,size: 25),
                          ),
                        ),
                          style: TextStyle(color: Colors.black,fontSize: textFormFieldHintTs),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.black,fontSize: textFormFieldHintTs),
                              contentPadding: EdgeInsets.only(top: 10,bottom: 10,right: 0,left: 0),
                              focusedBorder: (hideBorders??false) ? InputBorder.none : OutlineInputBorder(
                                borderSide: BorderSide(color: BaseColors.txtFiledBorderColor, width: 1.0),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              disabledBorder: (hideBorders??false) ? InputBorder.none : OutlineInputBorder(
                                borderSide: BorderSide(color: BaseColors.txtFiledBorderColor, width: 1.0),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              enabledBorder: (hideBorders??false) ? InputBorder.none : OutlineInputBorder(
                                borderSide: BorderSide(color: BaseColors.txtFiledBorderColor, width: 1.0),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              errorBorder: (hideBorders??false) ? InputBorder.none : OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red, width: 1.0),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedErrorBorder: (hideBorders??false) ? InputBorder.none : OutlineInputBorder(
                                borderSide: BorderSide(color: BaseColors.txtFiledBorderColor, width: 1.0),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          alignment: Alignment.centerLeft,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if(controller.value.text.isEmpty){
                              return errorText;
                            }
                            return null;
                          },
                          hint: Text(controller.text.isEmpty ? hintText??"" : controller.text,style: TextStyle(color: Colors.black,fontSize: textFormFieldHintTs),textAlign: TextAlign.start,),
                          // icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0),
                          // itemPadding: EdgeInsets.zero,
                          items: items,
                          onChanged: onChanged,
                      ),
                    ),
                    )
                    : Expanded(
                    child: CustomTextField(
                    controller: controller,
                    hintText: hintText??"",
                    fillColor: Colors.transparent,
                    borderRadius: 5.0,
                    errorText: errorText,
                    validator: validator,
                    maxLine: maxLine??null,
                    readOnly: (onTap) == null ? false : true,
                    onTap: onTap,
                    textInputType: keyboardType,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 1.8.w),
                      child: SvgPicture.asset(suffixIcon??""),
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
