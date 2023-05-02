import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';

Widget buildDropDown(List<String> list, RxString selectedValue, String hint) {
  return DropdownButtonHideUnderline(
    child: Obx(() => DropdownButton2(
          buttonPadding: const EdgeInsets.symmetric(horizontal: 0),
          hint: Text(
            hint.tr,
            style: Style.montserratRegularStyle()
                .copyWith(color: Colors.black, fontSize: 16.sp),
          ),
          items: list
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: Style.montserratRegularStyle()
                          .copyWith(color: Colors.black, fontSize: 16.sp),
                    ),
                  ))
              .toList(),
          value: selectedValue.value.isNotEmpty ? selectedValue.value : null,
          onChanged: (value) {
            selectedValue.value = value as String;
          },
          iconSize: 30,
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            size: 30,
            color: ColorConstants.textfieldiconColor,
          ),
          buttonWidth: 100.w,
          dropdownElevation: 1,
          dropdownDecoration: BoxDecoration(
            color: Colors.white,
          ),
          selectedItemBuilder: (BuildContext context) {
            return list.map<Widget>((item) {
              return Row(
                children: [
                  Text(
                    "Bus ID : ",
                    style: TextStyle(
                        color: ColorConstants.prefixTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  Text(
                    "#${item}",
                    style: TextStyle(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                ],
              );
            }).toList();
          },
        )),
  );
}
