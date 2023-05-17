import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

import '../../Utility/sizes.dart';

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
                SizedBox(height: 1.h,),
                SvgPicture.asset(busAtDoorSvg,height: 7.h,),
                SizedBox(
                  height: 3.h,
                ),
                Text(translate(context).bus_at_your_door, style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: Colors.black),),
                SizedBox(
                  height: 3.h,
                ),
                BaseButton(borderRadius: 100,title: translate(context).acknowledge, onPressed: (){Get.back();},btnType: toggleLargeButton,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
