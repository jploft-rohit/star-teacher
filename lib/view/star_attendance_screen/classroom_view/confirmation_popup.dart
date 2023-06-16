import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';

class ConfirmationDialog extends StatefulWidget {
  String msg;
  bool isShowBtn;
  String? btnText;
  ConfirmationDialog({Key? key, required this.msg, required this.isShowBtn, this.btnText}) : super(key: key);

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
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
                    GestureDetector(
                      onTap: (){
                        Get.back(result: false);
                      },
                      child: Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(widget.msg, style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: Colors.black),textAlign: TextAlign.center,),
                SizedBox(
                  height: 2.h,
                ),
                if(widget.isShowBtn)
                Center(
                  child: BaseButton(btnType: dialogButton,title: widget.btnText ?? "Yes", onPressed: (){
                    Get.back(result: true);
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
