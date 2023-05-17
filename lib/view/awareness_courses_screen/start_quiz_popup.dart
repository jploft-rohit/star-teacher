import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class StartQuizPopup extends StatefulWidget {
  const StartQuizPopup({Key? key}) : super(key: key);

  @override
  State<StartQuizPopup> createState() => _StartQuizPopupState();
}

class _StartQuizPopupState extends State<StartQuizPopup> {
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
                SizedBox(
                  height: 1.h,
                ),
                Text(translate(context).you_have_completed_course_please_start_quiz, style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: Colors.black),textAlign: TextAlign.center,),
                SizedBox(
                  height: 2.h,
                ),
                buildInfoItems(translate(context).total_question, "10"),
                SizedBox(
                  height: 1.h,
                ),
                buildInfoItems(translate(context).total_marks, "25"),
                SizedBox(
                  height: 2.h,
                ),
                BaseButton(btnType: dialogButton,title: translate(context).start.toUpperCase(), onPressed: (){
                  Get.back();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
