import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/route_manager/route_name.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  bool isRulesChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 18.sp,horizontal: 15.sp),
            color: CustomColors.backgroundColor,
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
                        color: CustomColors.white,
                        border: Border.all(color: CustomColors.borderColor),
                        borderRadius: BorderRadius.circular(50.0)
                    ),
                    alignment: Alignment.center,
                    child: Text(translate(context).decline, style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),),
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
                        border: Border.all(color: CustomColors.primaryColor),
                        borderRadius: BorderRadius.circular(50.0)
                    ),
                    alignment: Alignment.center,
                    child: Text(translate(context).agree, style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitle('Some of the highlights that the code of conduct entails:'),
                    buildSubtitle("a. Education professionals should commit to protecting children from bullying, neglect, and exploitation.\nb. Educational professionals should avoid disclosing confidential information about students and their familie\nc. Education professionals must be aware of Emirati culture and traditions and highly regard the values of Isla\nd. Education professionals must refrain from smoking in the workplace and using unauthorized substance\ne. Education professionals must not discuss socially unacceptable behaviors like gender identity and homosexuality."),
                    SizedBox(
                      height: 2.h,
                    ),
                    buildTitle('Code of Conduct for Workers in the General education Sector:'),
                    buildSubtitle("1. Encourage positive values in students, safeguard them against being drawn into ideas deemed unacceptable by UAE's society and promote the principles of tolerance and acceptance of others.2. Encourage students to highly regard the UAE's journey of development and prosperity, and encourage them to actively participate in national activities and events\n3. Commit to protecting children from neglect, exploitation, bullying and all forms of abuse\n4. Avoid disclosing confidential information about the students and their families and avoid spreading false news and rumors. Refrain from committing any verbal or physical violence against students under all circumstances\n5. Demonstrate positive behavior in dealing with the parents and the community.\n6. Respect and make yourself aware of the Emirati culture and traditions and highly regard the values of Islam\n7. Respect cultural, religious and ethnic diversity of the workplace, and refrain from committing any behavioral or verbal offenses against your colleagues, the educational institution and its employees\n8. Refrain from using, possessing or falling under the influence of any unauthorized substances, including smoking, in the workplace\n9. Refrain from spreading socially unacceptable behaviors and discussing gender identity, homosexuality or any other behavior deemed unacceptable to the UAE's society\n10. Adhere to appropriate, non-revealing clothing, respecting the traditions of the UAE and showing a respectful image of workers in the educational sector."),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: CustomColors.primaryColor,
                          value: isRulesChecked,
                          side: const BorderSide(color: CustomColors.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          onChanged: (bool? value) {
                            isRulesChecked = value!;
                            setState(() {});
                          },
                        ),
                        Expanded(child: Text('I have read all the terms and responsibility guidelines and I agree to all of them.', style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),),)
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
    return Text(text, style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 17.sp, height: 1.5),);
  }
  Widget buildSubtitle(String text){
    return Text(text, style: Style.montserratMediumStyle().copyWith(color: const Color(0xff454545), fontSize: 15.sp, height: 1.5),);
  }
}
