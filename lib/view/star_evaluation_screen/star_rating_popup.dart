import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';

import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen_ctrl.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/view/star_ratings/controller/star_rating_controller.dart';

class StarRatingPopup extends StatefulWidget {
  const StarRatingPopup({Key? key}) : super(key: key);

  @override
  State<StarRatingPopup> createState() => _StarRatingPopupState();
}

class _StarRatingPopupState extends State<StarRatingPopup> with SingleTickerProviderStateMixin{
  StarRatingController controller = Get.put(StarRatingController());
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    controller.selectedTabIndex.value = 0;
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      if (!tabController.indexIsChanging) {
        controller.selectedTabIndex.value = tabController.index;
        setState(() {});
      }
    });
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Dialog(
          insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white
            ),
            child: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(""),
                      Text(translate(context).star_rating, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: const Icon(Icons.close, color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  BaseToggleTabBar(controller: tabController, tabs: [
                    BaseTabButton(title: translate(context).positive, isSelected: tabController.index == 0,type: toggleMediumButton,),
                    BaseTabButton(title: translate(context).needs, isSelected: tabController.index == 1,type: toggleMediumButton,)
                  ]),
                  GridView.builder(
                    itemCount: controller.ratingList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0
                    ),
                    shrinkWrap: true,
                    itemBuilder: (internalCtx, index) {
                      return GestureDetector(
                        onTap: (){
                          if (tabController.index == 1) {
                            Get.back(closeOverlays: true);
                            showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation){
                              return StarPointDeductPop(title: controller.ratingList[index]['title']);
                            });
                          }else{
                            Get.back(closeOverlays: true);
                            // showSuccessDialog("Points Added Successfully.");
                            controller.rateStar(title: controller.ratingList[index]['title']);
;                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffF3F3F3),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(controller.ratingList[index]['img']),
                                  SizedBox(height: 1.h),
                                  Text(controller.ratingList[index]['title'], style: Style.montserratMediumStyle().copyWith(fontSize: 15.sp),maxLines: 1, overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Stack(
                                  children: [
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      color: tabController.index == 0 ? BaseColors.primaryColor : BaseColors.halfRatingColor,
                                      size: 22.sp,
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: tabController.index == 1?8.0:10,
                                      child: addText(tabController.index == 0 ? "2" : "-2", 13.sp, BaseColors.white, FontWeight.w400),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // Center(
                  //   child: Padding(
                  //     padding: EdgeInsets.only(top: 2.h),
                  //     child: BaseButton(title: translate(context).submit_btn_txt.toUpperCase(), onPressed: (){
                  //       Navigator.pop(context);
                  //     }, btnWidth: 40.w),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
showSuccessDialog(String title){
  showGeneralDialog(context: Get.context!, pageBuilder: (a,b,c){
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(onTap: (){Get.back();},
                  child: SvgPicture.asset("assets/images/ic_close.svg",height: 16)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: BaseColors.primaryColor,width: 1),
                  shape: BoxShape.circle,
                  color: const Color(0xffF8F4E9)
              ),
              child: SvgPicture.asset("assets/images/ic_check.svg",height: 20,),
            ),
            Text(title,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  });
}
class StarPointDeductPop extends StatefulWidget {
  final String title;
  const StarPointDeductPop({Key? key, required this.title}) : super(key: key);

  @override
  State<StarPointDeductPop> createState() => _StarPointDeductPopState();
}

class _StarPointDeductPopState extends State<StarPointDeductPop> {
  StarRatingController controller = Get.find<StarRatingController>();
  int maxSecond=60;
  int seconds = 60;
  Timer? timer;
  int tabIndex=1;
  void startTime(){
    timer?.cancel();
    seconds = 60;
    timer=Timer.periodic(const Duration(seconds: 1), (timers) {

      if(seconds > 0)
      {
        setState(() {
          seconds--;
        });

      }
      else{
        timer?.cancel();
      }
    });

  }
  @override
  void initState() {
    startTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(onTap: (){Get.back();},
                  child: SvgPicture.asset("assets/images/ic_close.svg",height: 16)),
            ),
            Text("Star Points Deduct",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp)),
            SizedBox(height: 4.h,),
            Center(
              child: SizedBox(
                height: 20.h,
                width: 20.h,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: ColorConstants.primaryColorLight,
                      strokeWidth: 1.2.h,
                      value: seconds/maxSecond,
                      valueColor: const AlwaysStoppedAnimation(ColorConstants.primaryColor),
                    ),
                    Center(
                      child: addText(seconds.toString(), 26, ColorConstants.primaryColor, FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(child: BaseButton(rightMargin: 1.w,
                  btnType: mediumLargeButton,title: "Confirm Deduction", onPressed: (){
                    // // Get.back();
                    Get.back(closeOverlays: true);
                    controller.rateStar(title: widget.title);
                    // showSuccessDialog("Points Deducted Successfully.");
                  },borderRadius: 20,)),
                Expanded(child: BaseButton(leftMargin: 1.w, btnType: mediumLargeButton,title: "Issue Resolve",
                  onPressed: (){Get.back();},borderRadius: 20,)),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

