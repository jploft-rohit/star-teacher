import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/route_manager/route_name.dart';
import 'package:staff_app/view/choose_language/choose_language_ctrl.dart';

class ChooseLangaugeScreen extends StatefulWidget {
  const ChooseLangaugeScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLangaugeScreen> createState() => _ChooseLangaugeScreenState();
}

class _ChooseLangaugeScreenState extends State<ChooseLangaugeScreen> {

  ChooseLanguageScreenCtrl controller = Get.put(ChooseLanguageScreenCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColors.backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.17,
                alignment: Alignment.center,
                child: Text(translate(context).choose_language, style: Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: onBoardingHeadingTs),),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Colors.white
                ),
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(translate(context).choose_your_language,style: Style.montserratRegularStyle().copyWith(color: const Color(0xff6B6B6B), fontSize: onBoardingSubTitleTs),),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    SizedBox(
                      height: 20.h,
                      child: ListView.builder(
                        itemCount: controller.languageList.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              controller.selectedPos.value = index;
                              Locale _locale = await setLocalePref(controller.selectedPos.value == 1 ? ENGLISH : ARABIC);
                              print("country Code1: ${_locale.languageCode}");
                              Get.updateLocale(_locale);
                            },
                            child: Obx(() => Container(
                                       width: 38.w,
                                       margin: EdgeInsets.symmetric(horizontal: 2.w),
                                       padding: EdgeInsets.symmetric(vertical: 1.5.h),
                                       decoration: BoxDecoration(
                                       color: controller.selectedPos.value == index
                                         ? BaseColors.backgroundColor
                                         : BaseColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12.withOpacity(0.1),
                                        blurRadius: 5.0,
                                        spreadRadius: 4.0,
                                      )
                                    ],
                                    border: controller.selectedPos.value ==
                                        index
                                        ? Border.all(
                                        color:
                                        BaseColors.primaryColor,
                                        width: 1.5)
                                        : null,
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Stack(
                                    children: [
                                      Visibility(
                                          maintainSize: true,
                                          maintainAnimation: true,
                                          maintainState: true,
                                          visible: controller
                                              .selectedPos.value ==
                                              index
                                              ? true
                                              : false,
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              padding:
                                              const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: BaseColors
                                                      .primaryColor,
                                                  boxShadow: [
                                                    getBoxShadow()
                                                  ],
                                                  border: Border.all(
                                                      color: BaseColors
                                                          .white,
                                                      width: 2)),
                                              child: const Icon(
                                                Icons.check,
                                                color: BaseColors.white,
                                                size: 15,
                                              ),
                                            ),
                                          )),
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(controller
                                                .languageImageList[index]),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Text(controller.languageList[index], style: Style.montserratBoldStyle().copyWith(color: controller.selectedPos.value == index
                                                ? BaseColors.primaryColor
                                                : BaseColors.textBlackColor,fontSize: 16.sp),),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                    Align(
                      alignment: Alignment.topCenter,
                      child: BaseButton(btnType: "large",title: translate(context).continue_btn_txt,textSize: 17.sp, onPressed: (){
                        Get.toNamed(loginScreenRoute);
                        BaseSharedPreference().setString(SpKeys().selectedLanguage, controller.selectedPos.value == 0 ? "ar" : "en");
                      },borderRadius: 19,)
                    ),
                  ],
                ),
              )
            ],

          ),
        )
    );
  }
}
