import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_reward_screen/add_new_reward_popup.dart';
import 'package:staff_app/view/star_reward_screen/create_reward_screen.dart';
import 'package:staff_app/view/star_reward_screen/reward_screen_ctrl.dart';

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
      appBar: appBarWithAction(context, translate(context).rewards, [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: (){
              Get.to(CreateRewardScreen());
            },
            backgroundColor: CustomColors.backgroundColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: CustomColors.primaryColor
                ),
                borderRadius: BorderRadius.circular(50.0)
            ),
            child: Icon(
              Icons.add,
              size: 25.sp,
              color: CustomColors.primaryColor,
            ),
          ),
          Text(translate(context).add_new, style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),)
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(
              height: 2.h,
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 100.w,
                  decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[1],
                    color: CustomColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 10, left: 10, bottom: 10),
                            padding: EdgeInsets.symmetric(horizontal:12, vertical:8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: CustomColors.primaryColor)),
                            child: SvgPicture.asset(
                              girlSvg,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Row(
                          children: [
                            addText("Sania", 16.sp, CustomColors.textBlackColor, FontWeight.w700),
                            SizedBox(width: 1.w),
                            addText("#632541", 16.sp, CustomColors.primaryColor, FontWeight.w700),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.backgroundColor,
                        boxShadow: kElevationToShadow[3]),
                    child: SvgPicture.asset(cupIcon)),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                        color: CustomColors.primaryColor,
                        borderRadius: BorderRadius.circular(7)),
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.only(bottom: 8.5.h),
                    child: addText('41', 14.sp,
                        CustomColors.white, FontWeight.w500),
                  ),
                )
              ],
            ),
            addText('${translate(context).select_a_reward}:', 17.sp,
                CustomColors.primaryColor, FontWeight.w700),
            SizedBox(height: 0.5.h),
            addText(
                translate(context).reward_star_by_redeeming_real_life_rewards,
                15.sp,
                CustomColors.textBlackColor,
                FontWeight.w400),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:3.h),
                    GridView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: controller.rewardsList.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 140,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 5),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            pageBuilder:  (context, animation, secondaryAnimation) {
                              return AddNewRewardPopup(index: index,);
                            },
                          );
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(right: 15, left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: kElevationToShadow[4],
                                color: CustomColors.backgroundColor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    controller.rewardsList[index]['icon']!,
                                    // height: 10.h,
                                  ),
                                  SizedBox(height:2.h),
                                  addText(
                                      controller.rewardsList[index]['title']!,
                                      15.sp,
                                      CustomColors.primaryColor,
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
                                      Icon(CupertinoIcons.star_fill, color: CustomColors.primaryColor,size: 26.sp,),
                                      addText(
                                          controller.rewardsList[index]
                                          ['value']!,
                                          13.sp,
                                          CustomColors.white,
                                          FontWeight.w700)
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        boxShadow: kElevationToShadow[1],
                                        border: Border.all(
                                            color: CustomColors.primaryColor),
                                        shape: BoxShape.circle,
                                        color:
                                        CustomColors.backgroundColor),
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
