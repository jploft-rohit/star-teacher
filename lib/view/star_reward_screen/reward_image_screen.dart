import 'package:dashed_rect/dashed_rect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_evaluation_screen/success_dialog_screen.dart';

class RewardImageScreen extends StatefulWidget {
  const RewardImageScreen({Key? key}) : super(key: key);

  @override
  State<RewardImageScreen> createState() => _RewardImageScreenState();
}

class _RewardImageScreenState extends State<RewardImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: appBarWithAction(context, translate(context).reward_image, [
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
            addText(translate(context).note_add_photo_of_the_reward,
                15.sp, CustomColors.textBlackColor, FontWeight.w400),
            SizedBox(height:3.h),
            CustomButton(text: translate(context).submit_btn_txt, onPressed: (){
              showGeneralDialog(
                context: context,
                pageBuilder:  (context, animation, secondaryAnimation) {
                  return SuccessDialogScreen(msg: translate(context).reward_added_successfully);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
