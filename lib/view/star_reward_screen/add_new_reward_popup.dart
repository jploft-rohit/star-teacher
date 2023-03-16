import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_reward_screen/reward_image_screen.dart';
import 'package:staff_app/view/star_reward_screen/reward_screen_ctrl.dart';
import 'package:staff_app/view/star_reward_screen/rewards_screen_earn_screen.dart';

class AddNewRewardPopup extends StatefulWidget {
  int index;
  AddNewRewardPopup({Key? key, required this.index}) : super(key: key);

  @override
  State<AddNewRewardPopup> createState() => _AddNewRewardPopupState();
}

class _AddNewRewardPopupState extends State<AddNewRewardPopup> {
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
                    InkWell(
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
                          color: CustomColors.backgroundColor),
                      child: SvgPicture.asset(Get.find<RewardScreenCtrl>()
                          .rewardsList[widget.index]['icon']!),
                    ),
                    SizedBox(height:2.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(text: translate(context).yes, onPressed: (){
                            Get.to(RewardView());
                          }, btnHeight: 35.0,borderRadius: 50.0, borderColor: CustomColors.borderColor,boxShadow: [], btnColor: CustomColors.white, textColor: CustomColors.textLightGreyColor,),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: CustomButton(text: translate(context).no, onPressed: (){}, btnHeight: 35.0,borderRadius: 50.0),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: CustomButton(text: translate(context).reward_photo, onPressed: (){
                            Get.to(RewardImageScreen());
                          }, btnHeight: 35.0,borderRadius: 50.0, borderColor: CustomColors.borderColor,boxShadow: [], textSize: 15.sp,btnColor: CustomColors.white, textColor: CustomColors.textLightGreyColor),
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
