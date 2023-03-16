import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class BusAtDoorPopup extends StatefulWidget {
  const BusAtDoorPopup({Key? key}) : super(key: key);

  @override
  State<BusAtDoorPopup> createState() => _BusAtDoorPopupState();
}

class _BusAtDoorPopupState extends State<BusAtDoorPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(busAtDoorSvg),
                SizedBox(
                  height: 2.h,
                ),
                Text(translate(context).bus_at_your_door, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                SizedBox(
                  height: 2.h,
                ),
                CustomButton(text: translate(context).acknowledge, onPressed: (){Get.back();})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
