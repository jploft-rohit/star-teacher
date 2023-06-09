import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/base_utility.dart';

class OpenPdfPopup extends StatefulWidget {
  String title;
  OpenPdfPopup({Key? key, required this.title}) : super(key: key);

  @override
  State<OpenPdfPopup> createState() => _OpenPdfPopupState();
}

class _OpenPdfPopupState extends State<OpenPdfPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 10.sp, right: 10.sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(widget.title, style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: Colors.black),),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                SvgPicture.asset(pdfSvg),
                SizedBox(
                  height: 2.h,
                ),
                Text("12/07/2022", style: Style.montserratRegularStyle().copyWith(fontSize: 16.sp, color: Colors.black),),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
