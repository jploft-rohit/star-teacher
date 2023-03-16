import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/performance_screen/performance_screen.dart';
import 'package:staff_app/view/sos/select_star_popup.dart';
import 'package:staff_app/view/sos/sos_fire_reported.dart';
import 'package:staff_app/view/sos/sos_screen_ctrl.dart';
import 'package:staff_app/view/sos/sos_warden_view.dart';
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
      backgroundColor: CustomColors.white,
      // backgroundColor: CustomColors.white,
      appBar: appBarWithAction(context, "SOS", [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: CustomColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: CustomColors.borderColor
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                    const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                  ],
                ),
              ),
              SizedBox(height: 2.0.h,),
              buildGrids(),
              SizedBox(height: 2.2.h,),
              Obx(() =>
              (controller.selectedPos.value == 0 ||
                  controller.selectedPos.value == 2 ||
                  controller.selectedPos.value == 3) ? SizedBox(
                  // height: 100,
                  child: buildFightMedicalAndOther(context)) : const SizedBox
                  .shrink()),
              SizedBox(height: 2.2.h,),
              Obx(() =>
              controller.selectedPos.value == 0
                  ? buildNfcScannerAndHand(context)
                  : const SizedBox.shrink()),
              Obx(() => controller.selectedPos.value == 1  ? buildFireEmergency(context) : const SizedBox.shrink() ),
              Obx(() => controller.selectedPos.value == 2  ? buildMedicalSupport(context) : const SizedBox.shrink() ),
              Obx(() => controller.selectedPos.value == 3  ? buildOther(context) : const SizedBox.shrink() ),

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
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 17.h
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
                            ? CustomColors.backgroundColor
                            : CustomColors.white,
                        boxShadow: [getBoxShadow()],
                        border: controller.selectedPos.value == index
                            ? Border.all(
                            color: CustomColors.primaryColor, width: 1.5)
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
                              Text(controller.sosTitles[index],style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: CustomColors.white, width: 2),
                                shape: BoxShape.circle,
                                boxShadow: [getBoxShadow()],
                                color: controller.selectedPos.value == index
                                    ? CustomColors.primaryColor
                                    : CustomColors.borderColor
                            ),
                            child: Icon(Icons.check, color: CustomColors.white,
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
                },
                child: Obx(() {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                    height: 40,
                    // padding: const EdgeInsets.symmetric(horizontal: 9),
                    decoration: BoxDecoration(
                        color: controller.selectedFMOPos.value == index
                            ? CustomColors.backgroundColor
                            : CustomColors.white,
                        boxShadow: [getBoxShadow()],
                        border: controller.selectedFMOPos.value == index
                            ? Border.all(
                            color: CustomColors.primaryColor, width: 1.5)
                            : null,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: CustomColors.white, width: 2),
                              shape: BoxShape.circle,
                              boxShadow: [getBoxShadow()],
                              color: controller.selectedFMOPos.value == index
                                  ? CustomColors.primaryColor
                                  : CustomColors.borderColor
                          ),
                          child: Icon(Icons.check, color: CustomColors.white,
                            size: 17.sp),
                        ),
                        Obx(() => SvgPicture.asset(controller.fmoImageList[index],height: 30,color: controller.selectedFMOPos.value==index ? CustomColors.primaryColor:Colors.black,))
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
              controller: controller.searchCtrl, hintText: translate(context).search_by_id, suffixIcon: controller.selectedFMOPos.value==2? const SizedBox.shrink():SizedBox(
              height: 26,
              width: 30,
              child: Obx(() {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: InkWell(
                    onTap: (){
                      if(controller.selectedFMOPos.value!=0) {
                        Get.to(const ScanQrCodeScreen());
                      }
                    },
                    child: SvgPicture.asset(
                      controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg,color: CustomColors.primaryColor,),
                  ),
                );
              }))),
        ),
        SizedBox(height: 2.h,),

        Align(
            alignment: Alignment.topLeft,
            child: Text(translate(context).stars,style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp, color: CustomColors.textBlackColor),),),
        SizedBox(height: 2.h,),
         Container(
           margin: EdgeInsets.only(left: 5.0,right: 5.0),
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(15.0),
             boxShadow: [
               BoxShadow(
                 color: CustomColors.shadowColor,
                 blurRadius: 5,
                 spreadRadius: 5,
               )
             ]
           ),
           child: ListView.separated(
             physics: const ScrollPhysics(),
             shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
            itemBuilder: (BuildContext context, int index) {
            return InkWell(
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
                    InkWell(
                      onTap: (){
                        Get.to(PerformanceScreen(index: 2,));
                      },
                      child: SizedBox(
                          height: 14,width: 14,
                          child: SvgPicture.asset(starSvg,)),
                    ),
                    SizedBox(width: 0.5.h),
                    Text('Sania Khan (#455285)',style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: CustomColors.textBlackColor),),
                    const Spacer(),
                    Icon(
                      CupertinoIcons.delete,
                      color: CustomColors.primaryColor,
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
        ),controller: controller.searchCtrl, hintText: translate(context).search_location, suffixIcon: controller.selectedFMOPos.value==0 || controller.selectedFMOPos.value==1 ? SizedBox(
            height: 26,
            width: 30,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SvgPicture.asset(controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg,color: CustomColors.primaryColor,),
            )) : SizedBox(),),
        SizedBox(height: 2.h,),
        CustomButton(text: translate(context).notify.toUpperCase(), onPressed: (){
          Get.to(FireReportedView());
        }),
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
          prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SvgPicture.asset(nfcSvg),
          ),
        ),

        SizedBox(height: 2.h,),
        CustomButton(text: translate(context).notify.toUpperCase(), onPressed: (){
          Get.to(FireReportedView());
        }),
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
        ),controller: controller.searchCtrl, hintText: translate(context).search_by_id, suffixIcon: controller.selectedFMOPos.value==2? const SizedBox.shrink():Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: InkWell(
            onTap: (){
              if(controller.selectedFMOPos.value!=0) {
                Get.to(const ScanQrCodeScreen());
              }
            },
            child: SizedBox(
                height: 26,
                width: 30,
                child: SvgPicture.asset(
                  controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg,)),
          ),
        ),),
        SizedBox(height: 2.h,),

        Align(
            alignment: Alignment.topLeft,
            child: Text(translate(context).support_for,style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp, color: CustomColors.textBlackColor),),
        ),
        SizedBox(height: 2.h,),
        Container(
          margin: EdgeInsets.only(left: 5.0,right: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: CustomColors.shadowColor,
                  blurRadius: 5,
                  spreadRadius: 5,
                )
              ]
          ),
          child: ListView.separated(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){

                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      SizedBox(width: 0.5.h),
                      Text('Sania Khan (#455285)',style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: CustomColors.textBlackColor),),
                      const Spacer(),
                      Icon(
                        CupertinoIcons.delete,
                        color: CustomColors.primaryColor,
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
        ),controller: controller.searchCtrl, hintText:translate(context).select_location_LAB_H2, suffixIcon: controller.selectedFMOPos.value==2?SizedBox.shrink(): Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: SizedBox(
              height: 26,
              width: 30,
              child: SvgPicture.asset(controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg,)),
        )),

        SizedBox(height: 2.h,),
        CustomButton(text: translate(context).notify.toUpperCase(), onPressed: (){
          Get.to(FireReportedView());
        }),
        SizedBox(height: 2.h,),
      ],
    );
  }

  Widget buildOther(BuildContext context){
    return Column(
      children: [
        CustomTextField(controller: controller.commentController, hintText: translate(context).add_comment,maxLine: 3,hintTxtSize: 15.sp,),
        SizedBox(height: 2.h,),
        CustomTextField(prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child:SvgPicture.asset("assets/images/circle2017.svg")
        ),controller: controller.commentController, hintText: translate(context).search_by_id,suffixIcon: controller.selectedFMOPos.value==2? const SizedBox.shrink():SizedBox(
            height: 26,
            width: 30,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: (){
                  if(controller.selectedFMOPos.value!=0) {
                    Get.to(const ScanQrCodeScreen());
                  }
                },
                child: SvgPicture.asset(
                  controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg, color: CustomColors.primaryColor,),
              ),
            )),),
        SizedBox(height: 2.h,),

        Container(
          margin: EdgeInsets.only(left: 5.0,right: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: CustomColors.shadowColor,
                  blurRadius: 5,
                  spreadRadius: 5,
                )
              ]
          ),
          child: ListView.separated(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
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
                      InkWell(
                        onTap: (){
                          Get.to(PerformanceScreen(index: 2,));
                        },
                        child: SizedBox(
                            height: 14,width: 14,
                            child: SvgPicture.asset(starSvg,)),
                      ),
                      SizedBox(width: 0.5.h),
                      Text('Sania Khan (#455285)',style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: CustomColors.textBlackColor),),
                      const Spacer(),
                      Icon(
                        CupertinoIcons.delete,
                        color: CustomColors.primaryColor,
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
                controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg, color: CustomColors.primaryColor,),
            )),):CustomTextField(prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SvgPicture.asset("assets/images/circle2017.svg")
        ),controller: controller.searchCtrl, hintText: translate(context).select_location_LAB_H2,suffixIcon: SizedBox(
            height: 26,
            width: 30,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: SvgPicture.asset(
                controller.selectedFMOPos.value==0?nfcSvg:barcodeSvg, color: CustomColors.primaryColor,),
            )),),
        SizedBox(height: 2.h,),
        CustomButton(text: translate(context).notify.toUpperCase(), onPressed: (){
          Get.to(FireReportedView());
        }),
        SizedBox(height: 2.h,),
      ],
    );
  }
}
