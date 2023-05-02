import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';

import '../packages/drop_downbutton2/src/dropdown_button2.dart';

class CustomDropDown extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final String? initialValue;
  final String hintText;
  final String titleText;
  final double hintFontSize;
  final double topPadding;
  final double bottomPadding;
  final double? topMargin;
  final double? bottomMargin;
  final List<String> listData;
  final Icon icon;
  final bool isBackground;
  final Widget? iconRow;
  final Function(dynamic value) onChange;
  CustomDropDown(
      {Key? key,
      this.backgroundColor = ColorConstants.primaryColorLight,
      this.borderColor = ColorConstants.borderColor,
      required this.initialValue,
      required this.hintText,
      required this.listData,
      required this.onChange,
      required this.icon,
      this.hintFontSize = 16,
      this.titleText = "",
      this.iconRow,
      this.isBackground = false,
      this.topPadding = 10,
      this.bottomPadding = 10,
      this.topMargin,
      this.bottomMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: topMargin ?? 8, bottom: bottomMargin ?? 8),
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
            child: Container(
              padding: EdgeInsetsDirectional.only(top: 1.h, bottom: 1.h),
              decoration: BoxDecoration(
                color: isBackground ? Color(0xFFFCFCFC) : backgroundColor,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: borderColor),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<dynamic>(
                    isExpanded: true,
                    isDense: true,
                    value: initialValue,
                    hint: addText(hintText, 15.sp, Color(0xff000000), FontWeight.w400),
                    iconStyleData: IconStyleData(
                      icon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.2.h),
                        child: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25),
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                        offset: Offset(0, -10),
                        padding: EdgeInsets.symmetric(vertical: 1.h)),
                    menuItemStyleData: MenuItemStyleData(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
                    ),
                    items: listData.map((String data) {
                      return DropdownMenuItem(
                        value: data,
                        child:
                            addText(data, 15.sp, Colors.black, FontWeight.w400),
                      );
                    }).toList(),
                    onChanged: onChange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
