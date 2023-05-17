import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';

class StarCalledPopup extends StatefulWidget {
  const StarCalledPopup({Key? key}) : super(key: key);

  @override
  State<StarCalledPopup> createState() => _StarCalledPopupState();
}

class _StarCalledPopupState extends State<StarCalledPopup> {
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
                    Text("Star Called", style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
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
                      borderRadius: BorderRadius.circular(15.0),
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
                          borderRadius: BorderRadius.circular(15.0),
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
                            SizedBox(
                              height: .5.h,
                            ),
                            buildInfoItems("Status", "Called for Pickup")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("Location", style: Style.montserratRegularStyle().copyWith(color: Color(0xff929292), fontSize: 15.sp),),
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
                    Text("Gate No.: ", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                    Text("6", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Divider(
                  color: BaseColors.borderColor,
                  thickness: 1.0,
                ),
                Text("The Parent has been reached to Pickup the Star and Called Please Acknowledge to Drop The Star.", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp, height: 1.5),textAlign: TextAlign.center,),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: BaseButton(btnType: dialogButton,title: "OK", onPressed: (){
                      Get.back();
                  }, btnWidth: 30.w),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
