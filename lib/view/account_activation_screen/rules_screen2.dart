import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/strings.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen.dart';
import 'package:staff_app/view/login_screen/login_screen.dart';

class RulesScreen2 extends StatefulWidget {
  const RulesScreen2({Key? key}) : super(key: key);

  @override
  State<RulesScreen2> createState() => _RulesScreen2State();
}

class _RulesScreen2State extends State<RulesScreen2> {
  bool isRulesChecked = false;

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
                    if (isRulesChecked) {
                      Get.closeAllSnackbars();
                      _showActivationDialogue(context);
                    }else{
                      BaseOverlays().showSnackBar(message: "Please agree with responsibility",title: "Error");
                    }

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
                        SizedBox(
                          height: 22,
                          width: 22,
                          child: Checkbox(
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
                        ),
                        SizedBox(width: 10),
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

  void _showActivationDialogue(BuildContext context) {
    showGeneralDialog(barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(color: Colors.transparent)
                ),
                insetPadding: const EdgeInsets.only(left: 15, right: 15.0),
                content: SizedBox(
                  width: 100.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(translate(context).account_activation_popup_txt,style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: BaseColors.textBlackColor, height: 1.5),textAlign: TextAlign.center,),
                      const SizedBox(height: 20,),
                      BaseButton(btnType: mediumButton,borderRadius: 20,title: translate(context).ok.toUpperCase(), onPressed: () {
                        BaseOverlays().dismissOverlay();
                        Get.offAll(LoginScreen());
                       /* Get.offAll(DashboardScreen());*/
                        },textSize: mediumButtonTs,)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }

  Widget buildTitle(String text){
    return Text(text, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp, height: 1.5),);
  }
  Widget buildSubtitle(String text){
    return Text(text, style: Style.montserratMediumStyle().copyWith(color: Colors.black, fontSize: 15.sp, height: 1.5),);
  }
}
