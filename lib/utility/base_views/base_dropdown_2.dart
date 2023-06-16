import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import '../../packages/drop_downbutton2/src/dropdown_button2.dart';

class BaseDropDown2 extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final String hintText;
  final String titleText;
  final String? errorText;
  final double hintFontSize;
  final double topPadding;
  final double bottomPadding;
  final double? topMargin;
  final double? bottomMargin;
  final TextEditingController controller;
  final List<DropdownMenuItem<dynamic>>? listData;
  final bool isBackground;
  final Widget? iconRow;
  final Function(dynamic value)? onChange;
  BaseDropDown2(
      {Key? key,
      this.backgroundColor = ColorConstants.primaryColorLight,
      this.borderColor = ColorConstants.borderColor,
      required this.hintText,
      required this.listData,
      required this.onChange,
      this.hintFontSize = 16,
      this.titleText = "",
      this.iconRow,
      this.isBackground = false,
      this.topPadding = 10,
      this.bottomPadding = 10,
      this.topMargin,
      this.bottomMargin, this.errorText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: topMargin ?? 0, bottom: bottomMargin ?? 2.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          titleText != ""
              ? Container(
                  width: 24.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addText(titleText, 15.sp, Colors.black, FontWeight.w700),
                      SizedBox(
                        width: 1.h,
                      ),
                      iconRow ?? SizedBox.shrink()
                    ],
                  ),
                )
              : SizedBox.shrink(),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField2<dynamic>(
                  isExpanded: true,
                  isDense: true,
                dropdownStyleData: DropdownStyleData(offset: Offset(0, -10),
                    padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.8.w)),
                menuItemStyleData: MenuItemStyleData(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 0),
                ),
                  hint: addText(hintText, 15.sp, Color(0xff000000), FontWeight.w400),
                  iconStyleData: IconStyleData(
                    icon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.2.h),
                      child: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25),
                    ),
                  ),


                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black,fontSize: textFormFieldHintTs),
                  contentPadding: EdgeInsets.only(top: 10,bottom: 10,right: 0,left: 0),
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
                  items: listData,
                  onChanged: onChange,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value){
                  if(controller.value.text.isEmpty){
                    return errorText;
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
