import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';

import '../packages/drop_downbutton2/src/dropdown_button2.dart';

class CustomFilterDropDown extends StatelessWidget {
  final String hintText;
  final String icon;
  final String? errorMessage;
  final String? initialValue;
  final List<String>? listData;
  final List<DropdownMenuItem<dynamic>>? item;
  final Function(dynamic value) onChange;
  CustomFilterDropDown({Key? key, required this.hintText,
    this.item,required this.onChange,required this.icon, this.initialValue, this.listData, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 4.h,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<dynamic>(
                  isExpanded: true,
                  isDense: true,
                  iconStyleData: IconStyleData(
                    icon: Icon(Icons.arrow_drop_down, color: ColorConstants.black,),
                  ),
                  dropdownStyleData: DropdownStyleData(offset: Offset(0,-10)),
                  //menuItemStyleData: MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 2.h),),
                  alignment: AlignmentDirectional.centerStart,
                  hint: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.8.h,),
                    child: addText(hintText, 14.sp,ColorConstants.black, FontWeight.w700),
                  ),
                  items: item??listData?.map((String data) {
                    return DropdownMenuItem(
                      value: data,
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.8.h,),
                        child: addText(data, 14.sp, Colors.black,FontWeight.w700),
                      ),);
                  }).toList(),
                  onChanged: onChange),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                child: SvgPicture.asset(
                  icon,
                  height: 2.h,
                  width: 2.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
