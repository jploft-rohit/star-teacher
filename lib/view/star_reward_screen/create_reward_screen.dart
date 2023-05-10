import 'package:dashed_rect/dashed_rect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
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
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(title: translate(context).create_reward),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
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
                        color: const Color(0xFFD2D2D2),
                        strokeWidth: 1.0,
                        gap: 5.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/add-image 1.svg'),
                            SizedBox(height:1.h),
                            addText(translate(context).upload_from_albums, 14.sp,
                                BaseColors.greyColor, FontWeight.w400)
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
                        color: const Color(0xFFD2D2D2),
                        strokeWidth: 1.0,
                        gap: 5.0,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/images/photo-camera 1.svg'),
                              SizedBox(height:1.h),
                              addText(translate(context).camera, 14.sp,
                                  BaseColors.greyColor, FontWeight.w400)
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(width:1.w),
                ],
              ),
              SizedBox(height:2.h),
              BaseTextFormField(
                controller: rewardTitleCtrl,
                hintText: translate(context).reward_title,
              ),
              CustomTextField(
                controller: pointValueCtrl,
                hintText: translate(context).points_value,
                borderRadius: 10.0,
                suffixIcon: Container(
                padding: const EdgeInsets.all(1),
                width: 30,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, top: 1),
                        decoration: const BoxDecoration(
                            color: Color(0xffD7DEEA),
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(10))),
                        child: const Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: BaseColors.textBlackColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.1.h),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, bottom: 1),
                        decoration: const BoxDecoration(
                            color: Color(0xffD7DEEA),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10))),
                        child: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: BaseColors.textBlackColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),),
              SizedBox(height:3.h),
              BaseButton(title: translate(context).create.toUpperCase(), onPressed: (){},btnType: largeButton,)
            ],
          ),
        ),
      ),
    );
  }
}
