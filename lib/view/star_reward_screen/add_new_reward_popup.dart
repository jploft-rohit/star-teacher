import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/reward_history_response.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/star_reward_screen/reward_image_screen.dart';
import 'package:staff_app/view/star_reward_screen/reward_screen_ctrl.dart';
import 'package:staff_app/view/star_reward_screen/rewards_screen_earn_screen.dart';

class AddNewRewardPopup extends StatefulWidget {
  final int index;
  final String uploadedImage;
  AddNewRewardPopup({Key? key, required this.index, required this.uploadedImage}) : super(key: key);

  @override
  State<AddNewRewardPopup> createState() => _AddNewRewardPopupState();
}

class _AddNewRewardPopupState extends State<AddNewRewardPopup> {
  RewardScreenCtrl rewardScreenCtrl = Get.find<RewardScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    Text(translate(context).do_you_want_to_reward_star,style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: BaseColors.backgroundColor),
                      child: SvgPicture.asset(Get.find<RewardScreenCtrl>().rewardsList[widget.index]['icon']??""),
                    ),
                    SizedBox(height:2.h),
                    Row(
                      children: [
                        Expanded(
                          child: BaseButton(btnType: mediumButton,title: translate(context).yes, onPressed: (){
                            if (rewardScreenCtrl.myRewards?.first.ratings > 0) {
                              int points = int.parse((rewardScreenCtrl.rewardList?[widget.index].points.toString())??"0");
                              BaseOverlays().dismissOverlay();
                              rewardScreenCtrl.giveReward(points: points, rewardId: rewardScreenCtrl.rewardList?[widget.index].sId??"", selectedUserId: rewardScreenCtrl.selectedStarId.value);
                            }else{
                              BaseOverlays().dismissOverlay();
                              baseToast(message: "No enough reward points");
                            }
                          }, isActive: false,borderRadius: 20,),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: BaseButton(btnType: mediumButton,title: translate(context).no, onPressed: (){
                            BaseOverlays().dismissOverlay();
                          },borderRadius: 20,)
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: BaseButton(btnType: mediumButton,title: translate(context).reward_photo, onPressed: (){
                            BaseOverlays().dismissOverlay();
                            Get.to(RewardImageScreen(index: widget.index,uploadedImage: widget.uploadedImage,));
                          },isActive: false,removeHorizontalPadding: true,borderRadius: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
