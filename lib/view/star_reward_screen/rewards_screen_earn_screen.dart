import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_reward_screen/create_reward_screen.dart';
import 'package:staff_app/view/star_reward_screen/reward_screen_ctrl.dart';

import '../../Utility/base_utility.dart';

class RewardView extends StatefulWidget {
  const RewardView({super.key});

  @override
  State<RewardView> createState() => _RewardViewState();
}

class _RewardViewState extends State<RewardView> {
  RewardScreenCtrl controller = Get.find<RewardScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(title: translate(context).rewards),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: BaseColors.primaryColor)),
              child: SvgPicture.asset(
                girlSvg,
              ),
            ),
            SizedBox(height: 1.h),
            addText('Najma Suheil', 15.sp,
                BaseColors.primaryColor, FontWeight.w700),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.h),
              child: Divider(),
            ),
            addText('#632541', 15.sp,
                BaseColors.primaryColor, FontWeight.w700),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.h),
              child: Divider(),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 1.h),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.rewardsList2.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: BaseColors.white,
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: kElevationToShadow[2]),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    border: Border.all(
                                        color: BaseColors.primaryColor)),
                                child: SvgPicture.asset(
                                  controller.rewardsList2[index]['icon']!,
                                  height: 6.h,
                                ),
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildDetail('${translate(context).reward} : ', controller.rewardsList2[index]['title']),
                                  SizedBox(height: 0.5.h),
                                  buildDetail('${translate(context).rewarded_by} : ', controller.rewardsList2[index]['by']),
                                  SizedBox(height: 1.h),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset("assets/images/Vector (1).svg"),
                                          SizedBox(width: 2.w),
                                          addText(
                                              controller.rewardsList2[index]
                                              ['date']!,
                                              13.sp,
                                              BaseColors.textBlackColor,
                                              FontWeight.w400)
                                        ],
                                      ),
                                      SizedBox(width: 6.w),
                                      Row(
                                        children: [
                                          SvgPicture.asset("assets/images/time_icon.svg"),
                                          SizedBox(width: 2.w),
                                          addText(
                                              controller.rewardsList2[index]
                                              ['time']!,
                                              13.sp,
                                              BaseColors.textBlackColor,
                                              FontWeight.w400)
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: BaseColors.backgroundColor,
                                    boxShadow: kElevationToShadow[3]),
                                child: SvgPicture.asset(
                                  cupIcon,
                                  height: 3.5.h,
                                )),
                            SizedBox(width: 2.w),
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

  Widget buildDetail(label, body) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        addText(label, 13.sp, BaseColors.textBlackColor,
            FontWeight.w400),
        addText(body, 14.sp, BaseColors.primaryColor,
            FontWeight.w700),
      ],
    );
  }
}
