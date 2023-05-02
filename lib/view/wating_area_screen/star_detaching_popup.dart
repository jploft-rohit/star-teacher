import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';

class StarDetachingPopup extends StatefulWidget {
  const StarDetachingPopup({Key? key}) : super(key: key);

  @override
  State<StarDetachingPopup> createState() => _StarDetachingPopupState();
}

class _StarDetachingPopupState extends State<StarDetachingPopup> {
  int? index;
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
                    Text("Star Detaching", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: Colors.black),),
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
                          color: index == null ? BaseColors.borderColor : index == 0 ? Colors.green : Colors.red
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
                            Text("Called from Gate 2", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text( index == null ? "Scan the Guardian Card or NFC to Handover the star to Guardians." : index == 0 ? "Star has been successfully handover to the authorized Guardian." : "Unauthorized Guardian Do not allow to Pickup", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp, height: 1.5),textAlign: TextAlign.center,),
                if(index == null || index == 0)
                Divider(
                  color: BaseColors.borderColor,
                  thickness: 1.0,
                ),
                SizedBox(
                  height: 2.h,
                ),
                if(index == null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        index = 0;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0,),
                        decoration: BoxDecoration(
                          color: BaseColors.backgroundColor,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            getBoxShadow()
                          ]
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(uncheckSvg),
                            SizedBox(
                              width: 5.w,
                            ),
                            SvgPicture.asset(nfcSvg, height: 22,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    GestureDetector(
                      onTap: (){
                        index = 1;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0,),
                        decoration: BoxDecoration(
                          color: BaseColors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: BaseColors.borderColor)
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(uncheckSvg),
                            SizedBox(
                              width: 5.w,
                            ),
                            SvgPicture.asset(qrCodeSvg, height: 20.0,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if(index == 0) ...[
                  Center(child: buildInfoItems("Name", "Salma")),
                  SizedBox(
                    height: .5.h,
                  ),
                  Center(child: buildInfoItems("Relation", "Aunt")),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
