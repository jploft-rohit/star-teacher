import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/main.dart';
import 'package:staff_app/route_manager/route_name.dart';
import 'package:staff_app/view/choose_language/choose_language_ctrl.dart';

import '../../Utility/images_icon_path.dart';

class ChooseLangaugeScreen extends StatefulWidget {
  const ChooseLangaugeScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLangaugeScreen> createState() => _ChooseLangaugeScreenState();
}

class _ChooseLangaugeScreenState extends State<ChooseLangaugeScreen> {
  bool arbicselect=false;
  bool englishselect=true;

  ChooseLanguageScreenCtrl controller = Get.put(ChooseLanguageScreenCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.17,
                alignment: Alignment.center,
                child: Text(translate(context).choose_language, style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 21.sp),),
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
                      child: Text(translate(context).choose_your_language,style: Style.montserratRegularStyle().copyWith(color: const Color(0xff6B6B6B), fontSize: 16.sp),),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Flexible(
                    //       flex: 1,
                    //       child: Stack(
                    //         children: [
                    //           InkWell(
                    //             onTap: (){
                    //               setState(() {
                    //                 arbicselect=true;
                    //                 englishselect=false;
                    //               });
                    //             },
                    //             child: Card(
                    //                 color: !arbicselect?Color(0xFFF2F2F2):Color(0xFFF8F4E9),
                    //                 elevation: 5,
                    //                 shape: arbicselect
                    //                     ? new RoundedRectangleBorder(
                    //                     side: new BorderSide(color: Color(0xFFC19444), width: 1.0),
                    //                     borderRadius: BorderRadius.circular(10.0))
                    //                     : new RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(10.0)),
                    //                 child:Padding(
                    //                   padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
                    //                   child: Column(
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       SvgPicture.asset(arabicFlagSvg,fit: BoxFit.scaleDown,height: 40,width: 40,),
                    //                       SizedBox(height: 20,),
                    //                       Text("Arabic", style: Style.montserratBoldStyle().copyWith(color: arbicselect?Color(0xffC19444):Color(0xff000000),fontSize: 16.sp),),
                    //                     ],
                    //                   ),
                    //                 )
                    //             ),
                    //           ),
                    //           arbicselect?Container(
                    //             width: MediaQuery.of(context).size.width*0.34,
                    //             alignment: Alignment.topRight,
                    //             child: Align(child: SvgPicture.asset(checkEnableSvg),
                    //                 alignment: Alignment.topRight),
                    //           ):Container(),
                    //         ],
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 5.w,
                    //     ),
                    //     Flexible(
                    //       flex: 1,
                    //       child: Stack(
                    //         children: [
                    //           InkWell(
                    //             onTap: (){
                    //               setState(() {
                    //                 arbicselect=false;
                    //                 englishselect=true;
                    //               });
                    //             },
                    //             child: Card(
                    //                 color: !englishselect?Color(0xFFF2F2F2):Color(0xFFF8F4E9),
                    //                 elevation: 5,
                    //                 shape: englishselect
                    //                     ? new RoundedRectangleBorder(
                    //                     side: new BorderSide(color: Color(0xFFC19444), width: 1.0),
                    //                     borderRadius: BorderRadius.circular(10.0))
                    //                     : new RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(10.0)),
                    //                 child:Padding(
                    //                   padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
                    //                   child: Column(
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       SvgPicture.asset("assets/images/english_flag.svg",fit: BoxFit.scaleDown,height: 40,width: 40,),
                    //                       SizedBox(height: 20,),
                    //                       Text("English", style: Style.montserratBoldStyle().copyWith(color: englishselect?Color(0xffC19444):Color(0xff000000),fontSize: 16.sp),),
                    //                     ],
                    //                   ),
                    //                 )
                    //             ),
                    //           ),
                    //           englishselect?Container(
                    //             width: MediaQuery.of(context).size.width*0.34,
                    //             alignment: Alignment.topRight,
                    //             child: Align(child: SvgPicture.asset(checkEnableSvg),
                    //                 alignment: Alignment.topRight),
                    //           ):Container(),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 20.h,
                      child: ListView.builder(
                        itemCount: controller.languageList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              controller.selectedPos.value = index;
                              // if(index == 0){
                              //   controller.updateLocale('ar');
                              // } else {
                              //   controller.updateLocale('en_US');

                              // }
                              Locale _locale = await setLocalePref(controller.selectedPos.value == 1 ? ENGLISH : ARABIC);
                              print("country Code1: ${_locale.languageCode}");
                              Get.updateLocale(_locale);
                              // MyApp.setLocale(context, _locale);

                            },
                            child: Obx(
                                  () => Container(
                                width: 38.w,
                                margin:
                                EdgeInsets.symmetric(horizontal: 2.w),
                                padding:
                                EdgeInsets.symmetric(vertical: 1.5.h),
                                decoration: BoxDecoration(
                                    color: controller.selectedPos.value ==
                                        index
                                        ? CustomColors.backgroundColor
                                        : CustomColors.white,
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
                                        CustomColors.primaryColor,
                                        width: 1.5)
                                        : null,
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
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
                                                  color: CustomColors
                                                      .primaryColor,
                                                  boxShadow: [
                                                    getBoxShadow()
                                                  ],
                                                  border: Border.all(
                                                      color: CustomColors
                                                          .white,
                                                      width: 2)),
                                              child: const Icon(
                                                Icons.check,
                                                color: CustomColors.white,
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
                                            // Text(
                                            //     controller
                                            //         .languageList[index],
                                            //     getNormalTextFontSIze(),
                                            //     controller.selectedPos
                                            //         .value ==
                                            //         index
                                            //         ? CustomColors
                                            //         .primaryColor
                                            //         : CustomColors.black,
                                            //     FontWeight.w600)
                                            Text(controller.languageList[index], style: Style.montserratBoldStyle().copyWith(color: controller.selectedPos.value == index
                                                ? CustomColors.primaryColor
                                                : CustomColors.textBlackColor,fontSize: 16.sp),),
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
                      child: BaseButton(btnType: "large",title: translate(context).continue_btn_txt, onPressed: (){
                        Get.offAllNamed(loginScreenRoute);
                      })
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
