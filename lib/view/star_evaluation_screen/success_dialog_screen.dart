import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/base_utility.dart';

class SuccessDialogScreen extends StatefulWidget {
  String msg;
  SuccessDialogScreen({Key? key, required this.msg}) : super(key: key);

  @override
  State<SuccessDialogScreen> createState() => _SuccessDialogScreenState();
}

class _SuccessDialogScreenState extends State<SuccessDialogScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    Text(""),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/check 1.svg"),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(widget.msg,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 17.sp),textAlign: TextAlign.center,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
