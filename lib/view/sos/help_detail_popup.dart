import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class HelpDetailPopup extends StatefulWidget {
  const HelpDetailPopup({Key? key}) : super(key: key);

  @override
  State<HelpDetailPopup> createState() => _HelpDetailPopupState();
}

class _HelpDetailPopupState extends State<HelpDetailPopup> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    Text(translate(context).help_details, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: BaseColors.borderColor
                      )
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: BaseColors.primaryColor
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: SvgPicture.asset(manSvg),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Abdul Khan", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                            SizedBox(
                              height: .5.h,
                            ),
                            Text("#632541", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(translate(context).reported_location, style: Style.montserratRegularStyle().copyWith(color: Color(0xff929292), fontSize: 15.sp),),
                SizedBox(
                  height: 0.5.h,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_sharp,
                      color: BaseColors.primaryColor,
                      size: 15.0,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text("Classroom 43", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Divider(
                  color: BaseColors.borderColor,
                  thickness: 1.0,
                ),
                Text(translate(context).im_stuck_at_my_location_Please_help_me_Im_unable_to_evacuate_the_classroom, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp, height: 1.5),textAlign: TextAlign.center,),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
