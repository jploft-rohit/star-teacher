import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/account_activation_screen/controller/account_activation_controller.dart';
import 'package:staff_app/view/account_activation_screen/rules_screen2.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  AccountActivationController controller = Get.put(AccountActivationController());
  bool isRulesChecked = false;

  @override
  void initState() {
    super.initState();
    controller.getCodeOfConduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Obx(() => HtmlWidget(controller.codeOfConduct.value)),
                SizedBox(height: 20),
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
        ),
      ),
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
                    // controller.getCodeOfConduct();
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
                      Get.to(RulesScreen2());
                    }else{
                      BaseOverlays().showSnackBar(message: "Please agree with code of conduct",title: translate(Get.context!).error);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: 40.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: BaseColors.primaryColor),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      translate(context).agree,
                      style: Style.montserratBoldStyle().copyWith(
                        color: BaseColors.primaryColor,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildTitle(String text){
    return Text(text, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp, height: 1.5),);
  }
  Widget buildSubtitle(String text){
    return Text(text, style: Style.montserratMediumStyle().copyWith(color: const Color(0xff454545), fontSize: 15.sp, height: 1.5),);
  }
}
