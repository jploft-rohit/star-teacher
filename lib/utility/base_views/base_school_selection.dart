import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class BaseSchoolDropDown extends StatelessWidget {
  final double? bottomMargin,topMargin,leftMargin,rightMargin;
  final BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  final TextEditingController controller;
  final Function(dynamic)? onChanged;
  BaseSchoolDropDown({Key? key, required this.controller, this.onChanged, this.bottomMargin, this.topMargin, this.leftMargin, this.rightMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      topMargin: topMargin??0, bottomMargin: bottomMargin??2.h, rightMargin: rightMargin??0, leftMargin: leftMargin??0,
      controller: controller,
      errorText: translate(Get.context!).please_select_school,
      isDropDown: true,
      hintText: controller.value.text.isEmpty ? translate(Get.context!).select_school : controller.value.text,
      items: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
        return DropdownMenuItem(
          value: data,
          child: Text(data.name??"",style: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.w400)),
        );
      }).toList(),
      onChanged: onChanged
    );
  }
}
