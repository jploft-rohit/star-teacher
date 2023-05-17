import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/constants-classes/color_constants.dart';


class FilterTextFormField extends StatelessWidget {
  final String hintText;
  final Function(String val) onChange;
  final TextInputType keyBoardType;
  FilterTextFormField({Key? key,required this.hintText,required this.onChange,
  required this.keyBoardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: TextEditingController(),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          constraints: BoxConstraints(maxHeight: 4.h),
          isDense: true,
          hintText: hintText,
          border: InputBorder.none,
          prefixIconConstraints: BoxConstraints(
              minHeight: 4.h,
              minWidth: 4.h,
              maxHeight: 4.h,
              maxWidth: 4.5.h),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 8),
            child: Icon(
              size: 2.5.h,
              Icons.search,
              color: Color(0XFF777777),
            ),
          ),
          hintStyle: Theme.of(context)
              .inputDecorationTheme
              .hintStyle
              ?.copyWith(
              fontSize: 15.sp,fontWeight: FontWeight.w400),
          ),
      style: Theme.of(context).textTheme.caption?.copyWith(
          fontSize: 15.sp,fontWeight: FontWeight.w400),
      keyboardType: keyBoardType,
      textInputAction: TextInputAction.done,
      onChanged: onChange,
      textAlign: TextAlign.start,
    );
  }
}
