import 'package:dashed_rect/dashed_rect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class CreateRewardScreen extends StatefulWidget {
  const CreateRewardScreen({Key? key}) : super(key: key);

  @override
  State<CreateRewardScreen> createState() => _CreateRewardScreenState();
}

class _CreateRewardScreenState extends State<CreateRewardScreen> {
  TextEditingController rewardTitleCtrl = TextEditingController();
  TextEditingController pointValueCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: appBarWithAction(context, translate(context).create_reward, [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:2.h),
            Row(
              children: [
                SizedBox(width: 1.w),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                    ),
                    height: 200,
                    child: DashedRect(
                      color: Color(0xFFD2D2D2),
                      strokeWidth: 1.0,
                      gap: 5.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/add-image 1.svg'),
                          SizedBox(height:1.h),
                          addText(translate(context).upload_from_albums, 14.sp,
                              CustomColors.greyColor, FontWeight.w400)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                    ),
                    height: 200,
                    child: DashedRect(
                      color: Color(0xFFD2D2D2),
                      strokeWidth: 1.0,
                      gap: 5.0,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/photo-camera 1.svg'),
                            SizedBox(height:1.h),
                            addText(translate(context).camera, 14.sp,
                                CustomColors.greyColor, FontWeight.w400)
                          ]),
                    ),
                  ),
                ),
                SizedBox(width:1.w),
              ],
            ),
            SizedBox(height:2.h),
            CustomTextField(controller: rewardTitleCtrl, hintText: translate(context).reward_title, borderRadius: 10.0,),
            SizedBox(height:2.h),
            CustomTextField(controller: pointValueCtrl, hintText: translate(context).points_value, borderRadius: 10.0,suffixIcon: Container(
              padding: EdgeInsets.all(1),
              width: 30,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 1),
                      decoration: BoxDecoration(
                          color: Color(0xffD7DEEA),
                          borderRadius:
                          BorderRadius.only(topRight: Radius.circular(10))),
                      child: Icon(
                        Icons.keyboard_arrow_up_outlined,
                        color: CustomColors.textBlackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.1.h),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, bottom: 1),
                      decoration: BoxDecoration(
                          color: Color(0xffD7DEEA),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10))),
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: CustomColors.textBlackColor,
                      ),
                    ),
                  )
                ],
              ),
            ),),
            SizedBox(height:3.h),
            CustomButton(text: translate(context).create.toUpperCase(), onPressed: (){

            })
          ],
        ),
      ),
    );
  }
}
