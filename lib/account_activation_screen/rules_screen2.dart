import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/strings.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/route_manager/route_name.dart';

class RulesScreen2 extends StatefulWidget {
  const RulesScreen2({Key? key}) : super(key: key);

  @override
  State<RulesScreen2> createState() => _RulesScreen2State();
}

class _RulesScreen2State extends State<RulesScreen2> {
  bool isRulesChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 18.sp,horizontal: 15.sp),
            color: BaseColors.backgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: BaseColors.white,
                        border: Border.all(color: BaseColors.borderColor),
                        borderRadius: BorderRadius.circular(50.0)
                    ),
                    alignment: Alignment.center,
                    child: Text(translate(context).decline, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                  ),
                ),


                GestureDetector(
                  onTap: () {
                    Get.toNamed(dashboardScreenRoute);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: 40.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: BaseColors.primaryColor),
                        borderRadius: BorderRadius.circular(50.0)
                    ),
                    alignment: Alignment.center,
                    child: Text(translate(context).agree, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                  ),
                )


              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitle('Responsibilities of School Bus Drivers & Supervisors:'),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    buildSubtitle("Aims and Principals "),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    buildSubtitle(rules),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: BaseColors.primaryColor,
                          value: isRulesChecked,
                          side: const BorderSide(color: BaseColors.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          onChanged: (bool? value) {
                            isRulesChecked = value!;
                            setState(() {});
                          },
                        ),
                        Expanded(child: Text('I have read all the terms and responsibility guidelines and I agree to all of them.', style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTitle(String text){
    return Text(text, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 17.sp, height: 1.5),);
  }
  Widget buildSubtitle(String text){
    return Text(text, style: Style.montserratMediumStyle().copyWith(color: Colors.black, fontSize: 15.sp, height: 1.5),);
  }
}
