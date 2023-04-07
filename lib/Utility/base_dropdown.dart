import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/utility.dart';

class BaseDropDown extends StatelessWidget {
  final String? title;
  final double? belowMargin,topMargin;
  const BaseDropDown({Key? key, this.title,this.belowMargin, this.topMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      margin: EdgeInsets.only(bottom: belowMargin??2.h,top: topMargin??0),
      decoration: BoxDecoration(
        color: BaseColors.backgroundColor,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
            color: BaseColors.borderColor
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title??"Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp)),
          const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
        ],
      ),
    );
  }
}
