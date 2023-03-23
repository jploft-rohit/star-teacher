import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_reward_screen/reward_screen_ctrl.dart';
import 'package:staff_app/view/star_reward_screen/rewards_screen.dart';

class StarRewardScreen extends StatefulWidget {
  const StarRewardScreen({Key? key}) : super(key: key);

  @override
  State<StarRewardScreen> createState() => _StarRewardScreenState();
}

class _StarRewardScreenState extends State<StarRewardScreen> {
  TextEditingController searchCtrl = TextEditingController();
  RewardScreenCtrl controller = Get.put(RewardScreenCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).star_rewards),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: CustomColors.borderColor
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                          child: Row(
                            children: [
                              SvgPicture.asset(classTakenSvg,height: 15,),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("School", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 25,
                        color: CustomColors.borderColor,
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(classTakenSvg,height: 15,),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("Grade 3", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 0.0,),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                          child: Row(
                            children: [
                              SvgPicture.asset(classTakenSvg,height: 15,),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("H1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 25,
                        color: CustomColors.borderColor,
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(jobDetailSvg,height: 15,),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("Term 1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 0.0,),
                  CustomTextField(
                    controller: searchCtrl,
                    hintText: translate(context).search_by_id,
                    borderColor: Colors.transparent,
                    contentPadding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Get.to(RewardsScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: CustomColors.borderColor
                          )
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: CustomColors.primaryColor
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: SvgPicture.asset(manSvg),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                addText("Najma Suheil", 16.sp, CustomColors.primaryColor, FontWeight.w700),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    addText("ID: ", 14.sp, CustomColors.textBlackColor, FontWeight.w700),
                                    addText("#632541", 14.sp, CustomColors.primaryColor, FontWeight.w700),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
