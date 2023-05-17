import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/view/star_reward_screen/add_new_reward_popup.dart';
import 'package:staff_app/view/star_reward_screen/create_reward_screen.dart';
import 'package:staff_app/view/star_reward_screen/reward_screen_ctrl.dart';
import 'package:staff_app/view/star_reward_screen/rewards_screen_earn_screen.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  RewardScreenCtrl controller = Get.find<RewardScreenCtrl>();

  @override
  Widget build(BuildContext context) {
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
            
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: (){
                Get.to(RewardView());
              },
              child: Obx(()=>(controller.myRewards?.length??0) == 0
                  ? SizedBox.shrink()
                  : Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
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
                                margin: const EdgeInsets.only(
                                    top: 10, left: 10, bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal:12, vertical:8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: BaseColors.primaryColor)),
                                child: BaseImageNetwork(link: controller.myRewards?.first.profilePic??"",
                                  concatBaseUrl: false,height: 5.h,width: 4.h,),
                              ),
                            ],
                          ),
                          SizedBox(width: 5.w),
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
                              // BaseButton(title: "View History", onPressed: (){},btnType: smallButton,removeHorizontalPadding: true,),
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
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: BaseColors.primaryColor,
                            borderRadius: BorderRadius.circular(7)),
                        padding: const EdgeInsets.all(6),
                        margin: EdgeInsets.only(bottom: 8.5.h),
                        child: addText(((controller.myRewards?.first.ratings??"N/A").toString()), 14.sp,
                            BaseColors.white, FontWeight.w500),
                      ),
                    )
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
                FontWeight.w400),
            Expanded(
              child: Obx(()=>GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 2.h,bottom: 2.h),
                  itemCount: controller.rewardList?.length??0,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 140,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 5),
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
                              BaseImageNetwork(link: controller.rewardList?[index].image??"",height: 8.h,width: 8.h),
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
}
