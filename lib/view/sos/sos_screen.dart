import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/performance_screen/performance_screen.dart';
import 'package:staff_app/view/sos/select_star_popup.dart';
import 'package:staff_app/view/sos/sos_fire_reported.dart';
import 'package:staff_app/view/sos/sos_screen_ctrl.dart';
import '../../Utility/sizes.dart';
import 'sos_scanQR.dart';

class SOSView extends StatefulWidget {
  const SOSView({super.key});

  @override
  State<SOSView> createState() => _SOSViewState();
}

class _SOSViewState extends State<SOSView> {
  SosScreenCtrl controller = Get.put(SosScreenCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      // backgroundColor: CustomColors.white,
      appBar: const BaseAppBar(title: "SOS"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomDropDown(
                initialValue: DummyLists.initialSchool,
                hintText: "Select School",
                listData:DummyLists.schoolData,
                onChange: (value) {
                  setState(() {
                    DummyLists.initialSchool=value;
                  });
                },
                topPadding: 5,
                bottomPadding: 5,
                icon: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25,),
              ),
              SizedBox(height: 2.0.h,),
              buildGrids(),
              SizedBox(height: 2.2.h,),
              Obx(() => (controller.selectedPos.value == 0 || controller.selectedPos.value == 2 || controller.selectedPos.value == 3)
                  ? SizedBox(child: buildFightMedicalAndOther(context))
                  : const SizedBox.shrink()),
              SizedBox(height: 2.2.h),
              Obx(() => controller.selectedPos.value == 0  ? buildNfcScannerAndHand(context) : const SizedBox.shrink()),
              Obx(() => controller.selectedPos.value == 1  ? buildFireEmergency(context) : const SizedBox.shrink() ),
              Obx(() => controller.selectedPos.value == 2  ? buildMedicalSupport(context) : const SizedBox.shrink() ),
              Obx(() => controller.selectedPos.value == 3  ? buildOther(context) : const SizedBox.shrink()),
            ],
          ),
        ),
      ),

    );
  }

  Widget buildGrids() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.imageList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.w,
            mainAxisSpacing: 3.h,
            mainAxisExtent: 15.h,
        ),
        itemBuilder: (context, index) =>
            GestureDetector(
              onTap: () {
                controller.selectedPos.value = index;
              },
              child: Obx(() =>
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: controller.selectedPos.value == index
                            ? BaseColors.backgroundColor
                            : BaseColors.white,
                        boxShadow: [getBoxShadow()],
                        border: controller.selectedPos.value == index
                            ? Border.all(
                            color: BaseColors.primaryColor, width: 1.5)
                            : null,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SvgPicture.asset(
                                controller.imageList[index], height: 6.h,),
                              SizedBox(height: 1.h,),
                              Text(controller.sosTitles[index],style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: BaseColors.white, width: 2),
                                shape: BoxShape.circle,
                                boxShadow: [getBoxShadow()],
                                color: controller.selectedPos.value == index
                                    ? BaseColors.primaryColor
                                    : BaseColors.borderColor
                            ),
                            child: Icon(Icons.check, color: BaseColors.white,
                              size: 17.sp,),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),

      ),
    );
  }

  Widget buildFightMedicalAndOther(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.fmoImageList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            // mainAxisSpacing: 15,
            mainAxisExtent: 42
          ),
          itemBuilder: (context, index) =>
              GestureDetector(
                onTap: () {
                  controller.selectedFMOPos.value = index;
                  if(index == 1){
                    Get.to(ScanQrCodeScreen());
                  }
                },
                child: Obx(() {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                    height: 40,
                    // padding: const EdgeInsets.symmetric(horizontal: 9),
                    decoration: BoxDecoration(
                        color: controller.selectedFMOPos.value == index
                            ? BaseColors.backgroundColor
                            : BaseColors.white,
                        boxShadow: [getBoxShadow()],
                        border: controller.selectedFMOPos.value == index
                            ? Border.all(
                            color: BaseColors.primaryColor, width: 1.0)
                            : null,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: BaseColors.white, width: 2),
                              shape: BoxShape.circle,
                              boxShadow: [getBoxShadow()],
                              color: controller.selectedFMOPos.value == index
                                  ? BaseColors.primaryColor
                                  : BaseColors.borderColor
                          ),
                          child: Icon(Icons.check, color: BaseColors.white,
                            size: 17.sp),
                        ),
                        Obx(() => SvgPicture.asset(controller.fmoImageList[index],height: 30,color: controller.selectedFMOPos.value==index ? BaseColors.primaryColor:Colors.black,))
                      ],
                    ),
                  );
                }),
              )),
    );
  }

  Widget buildNfcScannerAndHand(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Get.toNamed(Routes.tripRouteView);
          },
          child: CustomTextField(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SvgPicture.asset("assets/images/circle2017.svg")
            ),
              hintTxtSize: 15.sp,
              borderRadius: 8,
              readOnly: controller.selectedFMOPos.value==2 ? true: false,
              onTap: (){
                if(controller.selectedFMOPos.value==2) {
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return SelectStarPopup(type: "Star",);
                    },
                  );
                }
              },
              controller: controller.searchCtrl, hintText: translate(context).search_by_id,
              suffixIcon: controller.selectedFMOPos.value==2?
            const SizedBox.shrink():GestureDetector(
                onTap: (){
                  controller.selectedFMOPos.value==0?showNFCDialog(context, ""):Get.to(ScanQrCodeScreen());
                },
              child: SizedBox(
                height: 26,
                width: 30,
                child: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg,color: BaseColors.primaryColor,),
                  );
                })),
            )),
        ),
        SizedBox(height: 2.h,),

        Align(
            alignment: Alignment.topLeft,
            child: Text(translate(context).stars,style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp, color: BaseColors.textBlackColor),),),
        SizedBox(height: 2.h,),
         Container(
           margin: const EdgeInsets.only(left: 5.0,right: 5.0),
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(15.0),
             boxShadow: [
               const BoxShadow(
                 color: BaseColors.shadowColor,
                 blurRadius: 5,
                 spreadRadius: 5,
               )
             ]
           ),
           child: ListView.separated(
             physics: const ScrollPhysics(),
             shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
            itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SelectStarPopup(type: "Star",);
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(PerformanceScreen(index: 2,));
                      },
                      child: SizedBox(
                          height: 14,width: 14,
                          child: SvgPicture.asset(starSvg,)),
                    ),
                    SizedBox(width: 0.5.h),
                    Text('Sania Khan (#455285)',style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: BaseColors.textBlackColor),),
                    const Spacer(),
                    const Icon(
                      CupertinoIcons.delete,
                      color: BaseColors.primaryColor,
                      size: 15.0,
                    ),

                  ],
                ),
              ),
            );
        },
    ),
         ),

        SizedBox(height: 2.h,),
        CustomTextField(
          hintTxtSize: 15.sp,
          prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SvgPicture.asset("assets/images/circle2017.svg"),
        ),controller: controller.searchCtrl, hintText: translate(context).search_location, suffixIcon: controller.selectedFMOPos.value==0 || controller.selectedFMOPos.value==1 ?
        GestureDetector(
          onTap: (){
            controller.selectedFMOPos.value==0?showNFCDialog(context, ""):Get.to(ScanQrCodeScreen());
          },
          child: SizedBox(
              height: 26,
              width: 30,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SvgPicture.asset(controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg,color: BaseColors.primaryColor,),
              )),
        ) : const SizedBox(),),
        SizedBox(height: 2.h,),
        BaseButton(title: translate(context).notify.toUpperCase(), onPressed: (){
          // showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation){
          //   return sosDialogs(title: "Fight",icon: fightSvg);
          // });
          BaseOverlays().showOkDialog(
              showOkButton: false,
              iconSvg: fightSvg,
              title: "Emergency Notification has been successfully sent. We are arranging the assistance.",
          );
          // if (controller.selectedPos.value == 1) {
          // Get.to(FireReportedView(from: 'Fight', icon: fightSvg,));
          // }
        },btnType: largeButton,),
        SizedBox(height: 2.h,),
      ],
    );
  }

  Widget buildFireEmergency(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: controller.classroomCtrl,
          hintText: translate(context).classroom_1_f1,
          prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
          suffixIcon: GestureDetector(
            onTap: (){
              showNFCDialog(context, "");
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SvgPicture.asset(nfcSvg),
            ),
          ),
        ),

        SizedBox(height: 2.h,),
        BaseButton(title: translate(context).notify.toUpperCase(), onPressed: (){
          Get.to(FireReportedView(from: 'Fire Emergency', icon: fireSvg,));
        },btnType: largeButton,),
        SizedBox(height: 2.h,),
      ],
    );
  }

  Widget buildMedicalSupport(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          readOnly: controller.selectedFMOPos.value==2 ? true: false,
          onTap: (){
            if(controller.selectedFMOPos.value==2) {
              showGeneralDialog(
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return SelectStarPopup(type: "medical",);
                },
              );
            }
          },
          prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: SvgPicture.asset("assets/images/circle2017.svg")
        ),
          controller: controller.searchCtrl, hintText: translate(context).search_by_id, suffixIcon: controller.selectedFMOPos.value==2? const SizedBox.shrink():Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: GestureDetector(
            onTap: (){
              if(controller.selectedFMOPos.value!=0) {
                Get.to(const ScanQrCodeScreen());
              }
              else{
                showNFCDialog(context, "");
              }
            },
            child: SizedBox(
                height: 26,
                width: 30,
                child: SvgPicture.asset(
                  controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg,color: BaseColors.primaryColor)),
          ),
        ),),
        SizedBox(height: 2.h),

        Align(
            alignment: Alignment.topLeft,
            child: Text(translate(context).support_for,style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp, color: BaseColors.textBlackColor),),
        ),
        SizedBox(height: 2.h),
        Container(
          margin: const EdgeInsets.only(left: 5.0,right: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                const BoxShadow(
                  color: BaseColors.shadowColor,
                  blurRadius: 5,
                  spreadRadius: 5,
                )
              ]
          ),
          child: ListView.separated(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SizedBox(width: 0.5.h),
                      Text('Sania Khan (#455285)',style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: BaseColors.textBlackColor),),
                      const Spacer(),
                      const Icon(
                        CupertinoIcons.delete,
                        color: BaseColors.primaryColor,
                        size: 15.0,
                      ),

                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        CustomTextField(prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: SvgPicture.asset("assets/images/circle2017.svg"),
        ),controller: controller.searchCtrl, hintText:translate(context).select_location_LAB_H2, suffixIcon: controller.selectedFMOPos.value==2?const SizedBox.shrink():
        GestureDetector(
          onTap: (){
            if(controller.selectedFMOPos.value!=0) {
              Get.to(const ScanQrCodeScreen());
            }
            else{
              showNFCDialog(context, "");
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SizedBox(
                height: 26,
                width: 30,
                child: SvgPicture.asset(controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg,color: BaseColors.primaryColor,)),
          ),
        )),

        SizedBox(height: 2.h),
        BaseButton(title: translate(context).notify.toUpperCase(), onPressed: (){
          // showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation){
          //   return sosDialogs(title: "Medical Support",icon: medicalSupportSvg);
          // });
          BaseOverlays().showOkDialog(
            showOkButton: false,
            iconSvg: medicalSupportSvg,
            title: "Emergency Notification has been successfully sent. We are arranging the assistance.",
          );
          // Get.to(FireReportedView(from: 'Medical Support', icon: medicalSupportSvg,));
        },btnType: largeButton,),
        SizedBox(height: 2.h,),
      ],
    );
  }

  Widget buildOther(BuildContext context){
    return Column(
      children: [
        CustomTextField(controller: controller.commentController, hintText: translate(context).add_comment,maxLine: 3,hintTxtSize: 15.sp,),
        SizedBox(height: 2.h),
        CustomTextField(prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child:SvgPicture.asset("assets/images/circle2017.svg")
        ),controller: controller.commentController, hintText: translate(context).search_by_id,suffixIcon: controller.selectedFMOPos.value==2? const SizedBox.shrink():SizedBox(
            height: 26,
            width: 30,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: (){
                  if(controller.selectedFMOPos.value!=0) {
                    Get.to(const ScanQrCodeScreen());
                  }
                  else{
                    showNFCDialog(context, "");
                  }
                },
                child: SvgPicture.asset(
                  controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg, color: BaseColors.primaryColor,),
              ),
            )),),
        SizedBox(height: 2.h,),

        Container(
          margin: const EdgeInsets.only(left: 5.0,right: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                const BoxShadow(
                  color: BaseColors.shadowColor,
                  blurRadius: 5,
                  spreadRadius: 5,
                )
              ]
          ),
          child: ListView.separated(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return SelectStarPopup(type: "Star",);
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(PerformanceScreen(index: 2,));
                        },
                        child: SizedBox(
                            height: 14,width: 14,
                            child: SvgPicture.asset(starSvg,)),
                      ),
                      SizedBox(width: 0.5.h),
                      Text('Sania Khan (#455285)',style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: BaseColors.textBlackColor),),
                      const Spacer(),
                      const Icon(
                        CupertinoIcons.delete,
                        color: BaseColors.primaryColor,
                        size: 15.0,
                      ),

                    ],
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: 2.h,),
        controller.selectedFMOPos.value==2?  CustomTextField(prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SvgPicture.asset("assets/images/circle2017.svg")
        ),controller: controller.commentController, hintText: "Lab",suffixIcon: controller.selectedFMOPos.value==2? const SizedBox.shrink():SizedBox(
            height: 26,
            width: 30,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SvgPicture.asset(
                controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg, color: BaseColors.primaryColor,),
            )),):CustomTextField(prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SvgPicture.asset("assets/images/circle2017.svg")
        ),controller: controller.searchCtrl, hintText: translate(context).select_location_LAB_H2,suffixIcon:
        GestureDetector(
          onTap: (){
            if(controller.selectedFMOPos.value!=0) {
              Get.to(const ScanQrCodeScreen());
            }
            else{
              showNFCDialog(context, "");
            }
          },
          child: SizedBox(
              height: 26,
              width: 30,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SvgPicture.asset(
                  controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg, color: BaseColors.primaryColor,),
              )),
        ),),
        SizedBox(height: 2.h,),
        BaseButton(title: translate(context).notify.toUpperCase(), onPressed: (){
          // showNFCDialog1(context,"assets/images/check 1.svg",title: "Notified Successfully");
          // BaseDialogs().showOkDialog(title: "Notified Successfully",showOkButton: false,onBtnPressed: (){
          //   Get.back();
          // });
          // showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation){
          //   return sosDialogs(title: "Other",icon: otherSosSvg);
          // });
          BaseOverlays().showOkDialog(
            showOkButton: false,
            iconSvg: otherSosSvg,
            title: "Emergency Notification has been successfully sent. We are arranging the assistance.",
          );
          // Get.to(FireReportedView(from: 'Other', icon: otherSosSvg,));
        },btnType: largeButton,),
        SizedBox(height: 2.h,),
      ],
    );
  }
  Widget sosDialogs({title,icon}){
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: BaseColors.textRedColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 7.7.h),
                  SvgPicture.asset(icon,height: 90,width: 90,),
                  SizedBox(height: 3.4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.sp),
                    child: Text(title, style: Style.montserratBoldStyle().copyWith(fontSize: 22.sp, color: BaseColors.white),),
                  ),
                  SizedBox(height: 3.7.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.sp),
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: BaseColors.white, height: 1.3),textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 5.h),
                  Text('${translate(context).reported_by}: Ahmed (Teacher)', style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: BaseColors.white),),
                  SizedBox(height: 3.h),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                child: Icon(Icons.close_rounded,color: Colors.white,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
