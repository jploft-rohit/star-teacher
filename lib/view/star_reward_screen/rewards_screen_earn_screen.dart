import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'dart:ui' as ui;
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/view/star_reward_screen/reward_screen_ctrl.dart';

import '../../Utility/base_utility.dart';

class RewardView extends StatefulWidget {
  final String id;
  const RewardView({super.key, required this.id});

  @override
  State<RewardView> createState() => _RewardViewState();
}

class _RewardViewState extends State<RewardView> {
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  RewardScreenCtrl controller = Get.find<RewardScreenCtrl>();

  @override
  void initState() {
    super.initState();
    controller.getRewardHistory(id: widget.id);
  }

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
              margin: EdgeInsets.only(left: isRTL ? 10 : 10, right: isRTL ? 10 : 10, bottom: 10),
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
            SizedBox(height: 1.h),
            addText(
                controller.myRewards?.first.name??"",
                15.sp,
                BaseColors.primaryColor,
                FontWeight.w700,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.h),
              child: Divider(),
            ),
            addText('Reward Points - ${controller.myRewards?.first.ratings??"0"}', 15.sp, BaseColors.primaryColor, FontWeight.w700),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.h),
              child: Divider(),
            ),
            addText("#${controller.myRewards?.first.studentId??""}", 15.sp, BaseColors.primaryColor, FontWeight.w700),
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
                      padding: EdgeInsets.only(bottom: 8.h),
                      itemCount: controller.starRewardHistoryList?.length??0,
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
                                height: 9.h,
                                width: 8.h,
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    border: Border.all(
                                        color: BaseColors.primaryColor)),
                                child: BaseImageNetwork(
                                  height: double.infinity,
                                  width: double.infinity,
                                  borderRadius: 10,
                                  // fit: BoxFit.cover,
                                  link: controller.starRewardHistoryList?[index]?.reward?.image??"",
                                ),
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildDetail('${translate(context).reward} : ',controller.starRewardHistoryList?[index]?.reward?.title??""),
                                  SizedBox(height: 0.5.h),
                                  buildDetail('${translate(context).rewarded_by} : ',controller.starRewardHistoryList?[index]?.rewardedBy?.name??""),
                                  SizedBox(height: 1.h),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset("assets/images/Vector (1).svg"),
                                          SizedBox(width: 2.w),
                                          addText(formatBackendDate(controller.starRewardHistoryList?[index]?.createdAt??""),
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
                                          addText(getFormattedTime(controller.starRewardHistoryList?[index]?.createdAt??""),
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
