import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_floating_action_button.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/sos/help_detail_popup.dart';
import 'package:staff_app/view/sos/sos_warden_controller.dart';


class SOSWardenView extends StatefulWidget {
  const SOSWardenView({super.key});

  @override
  State<SOSWardenView> createState() => _SOSWardenViewState();
}

class _SOSWardenViewState extends State<SOSWardenView> with SingleTickerProviderStateMixin {
  SosWardenController controller = Get.put(SosWardenController());
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: CustomColors.white,
        // backgroundColor: CustomColors.white,
        appBar: const BaseAppBar(title: "SOS"),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: CustomColors.backgroundColor,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: CustomColors.backgroundColor)),
                  padding: const EdgeInsets.all(10),
                  // margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Assembly Point 1',style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp, color: CustomColors.textBlackColor),),
                      // iconButton(() {}, Assets.imagesDropDownArrow)
                    ],
                  ),
                ),
                SizedBox(height: 1.8.h,),
                Text(translate(context).you_are_a_warden,style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: CustomColors.textBlackColor),),
                SizedBox(height: 1.3.h,),
                Container(
                  width: double.infinity,
                  // margin: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: CustomColors.textRedColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 4.0.h),
                      SvgPicture.asset(emergencySvg,height: 70,width: 70,),
                      SizedBox(height: 2.0.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.sp),
                        child: Text(translate(context).fire_emergency,style: Style.montserratBoldStyle().copyWith(fontSize: 25.sp, color: CustomColors.white),),
                      ),
                      SizedBox(height: 1.3.h),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.2.h,
                ),
                buildGrids(),
                SizedBox(
                  height: 2.2.h,
                ),
                // view grid of NFC Scanner and Hand
                Obx(() => (controller.selectedPos.value == 0 ||
                    controller.selectedPos.value == 1)
                    ? SizedBox(
                  // height: 100,
                    child: buildFightMedicalAndOther(context))
                    : const SizedBox.shrink()),
                SizedBox(
                  height: 2.2.h,
                ),
                // views of NFC Scanner and Hand contect
                Obx(() => (controller.selectedPos.value == 0 )
                    ? buildNfcScannerAndHand(context)
                    : buildNfcScannerAndHandForNeedHelp(context)),
              ],
            ),
          ),
        ),
        floatingActionButton: BaseFloatingActionButton(
          onTap: () {  },
          title: translate(context).need_help,
        ),
      ),
    );
  }

  Widget buildGrids() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.sosTitles1.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 17.h),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          controller.selectedPos.value = index;
        },
        child: Obx(() => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    Text(controller.sosTitlesValue[index],style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 25.sp),),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(controller.sosTitles1[index],style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                  ],
                ),
              ),
              if(controller.selectedPos.value == index)
              Positioned(
                top: 10,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: CustomColors.white, width: 2),
                      shape: BoxShape.circle,
                      boxShadow: [getBoxShadow()],
                      color: CustomColors.primaryColor),
                  child: Icon(
                    Icons.check,
                    color: CustomColors.white,
                    size: 15.sp,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget buildFightMedicalAndOther(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.fmoImageList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            // mainAxisSpacing: 15,
            mainAxisExtent: 42),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            controller.selectedFMOPos.value = index;
            switch (index) {
              case 1:
              // Get.to(const ScanQrCodeScreen());
                break;
            }
          },
          child: Obx(() {
            return Container(
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
                  borderRadius: BorderRadius.circular(10.0)),
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
                            : CustomColors.borderColor),
                    child: Icon(
                      Icons.check,
                      color: CustomColors.white,
                      size: 16.sp,
                    ),
                  ),
                  SvgPicture.asset(
                    controller.fmoImageList[index],
                    height: 30,
                    color: controller.selectedFMOPos.value == index
                        ? CustomColors.primaryColor
                        : null,
                  )
                ],
              ),
            );
          }),
        ));
  }

  Widget buildNfcScannerAndHand(BuildContext context) {
    return Column(
      children: [
        controller.selectedFMOPos.value==0?
        CustomTextField(controller: controller.searchCtrl, hintText: translate(context).search_by_id,
          borderRadius: 15.0,
          hintTextColor: CustomColors.textLightGreyColor,
          contentPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
          prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(
            Icons.search,
            color: Color(0xff777777),
          ),
        ), ): Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CustomTextField(controller: controller.searchCtrl,
                borderRadius: 15.0,
                contentPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                hintTextColor: CustomColors.textLightGreyColor,
                hintText: translate(context).search_by_id, prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  Icons.search,
                  color: Color(0xff777777),
                ),
              ), ),
            ),
            SizedBox(width: 2.0.w),
            SvgPicture.asset(qrCodeSvg,color: CustomColors.textBlackColor,height: 25.sp,),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        BaseToggleTabBar(controller: tabController, tabs: [
          BaseTabButton(title: translate(context).remaining, isSelected: tabController.index == 0),
          BaseTabButton(title: translate(context).stamped, isSelected: tabController.index == 1),
        ]),
        SizedBox(
          height: 1.8.h,
        ),
        AutoScaleTabBarView(
            controller: tabController,
            children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.mapRemaining.length,
              itemBuilder: (_, int remItemIndex){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: CustomColors.borderColor
                        )
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: CustomColors.primaryColor
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: SvgPicture.asset(manSvg),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.mapRemaining[remItemIndex]['title'] ?? "", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                              SizedBox(
                                height: .5.h,
                              ),
                              Text(controller.mapRemaining[remItemIndex]['id'] ?? "", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                            ],
                          ),
                        ),
                        // const Spacer(),
                        controller.selectedFMOPos.value == 2 ? Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            width: 75,
                            height: 21,
                            // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                            decoration: BoxDecoration(
                                color: CustomColors.backgroundColor,
                                boxShadow: [getBoxShadow()],
                                border: Border.all(color: CustomColors.borderColor, width: 1.5),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Center(child: Text(translate(context).stamp, style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp),)),
                          ),
                        ): const SizedBox()
                      ],
                    ),
                  ),
                );
              }),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.mapRemaining.length,
              itemBuilder: (_, int remItemIndex){
                return controller.selectedFMOPos.value==2?Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10,10,10,10),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: CustomColors.borderColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: CustomColors.primaryColor),
                              ),
                              child: SvgPicture.asset(manSvg,),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nawaz Alam', style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp)),
                                SizedBox(height: 0.4.h),
                                Text('#632541', style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp)),
                                SizedBox(height: 0.4.h),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(locationSvg),
                                      Text('${controller.mapRemaining[remItemIndex]['assembly no']}', style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        // const Spacer(),
                        Container(
                          width: 82,
                          height: 21,
                          // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                          decoration: BoxDecoration(
                              color: CustomColors.backgroundColor,
                              boxShadow: [getBoxShadow()],
                              border: Border.all(color: CustomColors.borderColor, width: 1.5),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Center(child: Text(translate(context).change_Status, style: Style.montserratRegularStyle().copyWith(fontSize: 12.sp),)),
                        )
                      ],
                    ),
                  ),
                ):Container(
                  height: 46,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: CustomColors.borderColor)),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                //width: 46,
                                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: CustomColors.primaryColor),
                                ),
                                child: SvgPicture.asset(
                                  manSvg,
                                ),),
                              SizedBox(width: 1.5.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(controller.mapRemaining[remItemIndex]['title'] ?? "", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  Text(controller.mapRemaining[remItemIndex]['id'] ?? "", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.1.h,
                          child: const VerticalDivider(color: CustomColors.borderColor,),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              SvgPicture.asset(locationSvg),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text('${controller.mapRemaining[remItemIndex]['assembly no']}', style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                );
              })
        ]),
      ],
    );
  }

  Widget buildNfcScannerAndHandForNeedHelp(BuildContext context) {
    return Column(
      children: [
        CustomTextField(controller: controller.searchCtrl, hintText: translate(context).search_by_id,
          borderRadius: 15.0,
          contentPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
          hintTextColor: CustomColors.textLightGreyColor,
          prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(
            Icons.search,
            color: Color(0xff777777),
          ),
        ), ),
        SizedBox(
          height: 2.h,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: controller.mapRemaining.length,
            itemBuilder: (_, int remItemIndex){
              return InkWell(
                onTap: (){
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const HelpDetailPopup();
                    },
                  );
                },
                child: Container(
                  height: 50,
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: CustomColors.textRedColor,width: 1.5),
                      color: CustomColors.white),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                // padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: CustomColors.primaryColor),
                                ),
                                child: SvgPicture.asset(
                                  manSvg,
                                ),),
                              SizedBox(width: 1.5.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(controller.mapRemaining[remItemIndex]['title'] ?? "", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  Text(controller.mapRemaining[remItemIndex]['id'] ?? "", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.1.h,
                          child: const VerticalDivider(color: CustomColors.borderColor,),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(translate(context).reported_location, style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, color: CustomColors.textLightGreyColor),),
                              SizedBox(height: 0.4.h),
                              Row(
                                children: [
                                  SvgPicture.asset(locationSvg),SizedBox(width: 0.6.h),
                                  Text(controller.mapRemaining[remItemIndex]['Reported Location'].toString(),style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, color: CustomColors.textLightGreyColor),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
              );
            }),
      ],
    );
  }
}
