import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';

class SubmitAssignmentPopup extends StatefulWidget {
  const SubmitAssignmentPopup({Key? key}) : super(key: key);

  @override
  State<SubmitAssignmentPopup> createState() => _SubmitAssignmentPopupState();
}

class _SubmitAssignmentPopupState extends State<SubmitAssignmentPopup> {
  TextEditingController commentCtrl = TextEditingController();

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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                Text("Are you sure you want\nto complete this task?", style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: Colors.black),textAlign: TextAlign.center,),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(controller: commentCtrl, hintText: "Comments", maxLine: 3,fillColor: BaseColors.txtFieldTextColor,),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: BaseButton(btnType: dialogButton,title: "YES", onPressed: (){
                    Get.back();
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
