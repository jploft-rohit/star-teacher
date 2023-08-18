import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/view/star_reward_screen/add_new_reward_popup.dart';
import 'package:staff_app/view/star_reward_screen/create_reward_screen.dart';
import 'package:staff_app/view/star_reward_screen/reward_screen_ctrl.dart';
import 'package:staff_app/view/star_reward_screen/rewards_screen_earn_screen.dart';

import '../../utility/sizes.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> with AutomaticKeepAliveClientMixin{
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  RewardScreenCtrl controller = Get.find<RewardScreenCtrl>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).rewards),
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {Get.to(const CreateRewardScreen());},
        title: translate(context).add_new,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            GestureDetector(
              onTap: (){
                Get.to(RewardView(id: controller.myRewards?.first.sId));
              },
              child: Obx(()=>(controller.myRewards?.length??0) == 0
                  ? SizedBox.shrink()
                  : Stack(
                  alignment: isRTL ? Alignment.centerLeft : Alignment.centerRight,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: isRTL ? 0 : 10, left: isRTL ? 10 : 0),
                      width: 100.w,
                      decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[1],
                        color: BaseColors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10, left: isRTL ? 10 : 10, right: isRTL ? 10 : 10, bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal:7, vertical: 7),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: BaseColors.primaryColor)),
                                child: BaseImageNetwork(
                                  link: controller.myRewards?.first.profilePic??"",
                                  concatBaseUrl: false,
                                  height: 11.w,
                                  width: 11.w,
                                  ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                    addText(controller.myRewards?.first.name??"", 16.sp, BaseColors.textBlackColor, FontWeight.w700),
                                ],
                              ),
                              SizedBox(height: 0.3.h),
                              addText("#${controller.myRewards?.first.studentId??""}", 16.sp, BaseColors.primaryColor, FontWeight.w700),
                              SizedBox(height: 0.8.h),
                              BaseButton(title: "View History", onPressed: (){},btnType: smallButton,removeHorizontalPadding: true,),
                            ],
                          ),
                          // addText("#632541", 16.sp, BaseColors.primaryColor, FontWeight.w700),
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: BaseColors.backgroundColor,
                            boxShadow: kElevationToShadow[3]),
                        child: SvgPicture.asset(cupIcon)),
                    Align(
                      alignment: isRTL ? Alignment.topLeft : Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: BaseColors.primaryColor,
                            borderRadius: BorderRadius.circular(7)),
                        padding: const EdgeInsets.all(6),
                        margin: EdgeInsets.only(bottom: 8.5.h),
                        child: addText(int.parse((controller.myRewards?.first.ratings.toString()??"0").toString()) > 0 ? (controller.myRewards?.first.ratings.toString()??"0") : "0", 14.sp,
                            BaseColors.white, FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            addText('${translate(context).select_a_reward}:', 17.sp, BaseColors.primaryColor, FontWeight.w700),
            SizedBox(height: 0.5.h),
            addText(
                translate(context).reward_star_by_redeeming_real_life_rewards,
                15.sp,
                BaseColors.textBlackColor,
                FontWeight.w400,
            ),
            Expanded(
              child: Obx(()=>GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 2.h,bottom: 14.h),
                  itemCount: controller.rewardList?.length??0,
                  shrinkWrap: true,
                  cacheExtent: 99999999,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 140,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      showGeneralDialog(
                        context: context,
                        pageBuilder:  (context, animation, secondaryAnimation) {
                          return AddNewRewardPopup(index: index, uploadedImage: controller.rewardList?[index].image??"",);
                        },
                      );
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(right: 15, left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: kElevationToShadow[4],
                            color: BaseColors.backgroundColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BaseImageNetwork(
                                link: controller.rewardList?[index].image??"",
                                height: 8.h,
                                width: 8.h,
                                concatBaseUrl: true,
                                cacheHeight: 150,
                                cacheWidth: 80,
                                fit: BoxFit.fitHeight,
                              ),
                              SizedBox(height:2.h),
                              addText(
                                  controller.rewardList?[index].title??"",
                                  15.sp,
                                  BaseColors.primaryColor,
                                  FontWeight.w700)
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(CupertinoIcons.star_fill, color: BaseColors.primaryColor,size: 26.sp,),
                                  addText(
                                      (controller.rewardList?[index].points.toString())??"",
                                      13.sp,
                                      BaseColors.white,
                                      FontWeight.w700)
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    boxShadow: kElevationToShadow[1],
                                    border: Border.all(
                                        color: BaseColors.primaryColor),
                                    shape: BoxShape.circle,
                                    color:
                                    BaseColors.backgroundColor),
                                child:
                                SvgPicture.asset("assets/images/edit_icon.svg"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
