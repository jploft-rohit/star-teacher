import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
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
                    color: ColorConstants.borderColor
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFilterDropDown(
                        initialValue: DummyLists.initialSchool, hintText: 'School',
                        listData: DummyLists.schoolData, onChange: (value) {
                        setState(() {
                          DummyLists.initialSchool=value;
                        });
                      },icon: classTakenSvg,),
                      Container(
                        child: VerticalDivider(
                          width: 1,
                        ),
                        height: 35,
                        width: 1,
                      ),
                      CustomFilterDropDown(
                        initialValue: DummyLists.initialGrade, hintText: 'Grade 3',
                        listData: DummyLists.gradeData, onChange: (value) {
                        setState(() {
                          DummyLists.initialGrade=value;
                        });
                      },icon: classTakenSvg,),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFilterDropDown(
                        initialValue: DummyLists.initialClass, hintText: 'H1',
                        listData: DummyLists.classData, onChange: (value) {
                        setState(() {
                          DummyLists.initialClass=value;
                        });
                      },icon: classTakenSvg,),
                      Container(child: VerticalDivider(width: 1,),height: 4.h,width: 1,),
                      CustomFilterDropDown(
                        initialValue: DummyLists.initialTerm, hintText: 'Term 1',
                        listData: DummyLists.termData, onChange: (value) {
                        setState(() {
                          DummyLists.initialTerm=value;
                        });
                      },icon: classTakenSvg,),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  FilterTextFormField(onChange: (String val) {
                  }, hintText: "Search Star,ID...", keyBoardType: TextInputType.name,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 2.h,
            ),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
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
                              color: BaseColors.borderColor
                          )
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: BaseColors.primaryColor
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
                                addText("Najma Suheil", 16.sp, BaseColors.primaryColor, FontWeight.w700),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    addText("ID: ", 14.sp, BaseColors.textBlackColor, FontWeight.w700),
                                    addText("#632541", 14.sp, BaseColors.primaryColor, FontWeight.w700),
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
