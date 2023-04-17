import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_evaluation_screen/mark_selected_popup.dart';
import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen_ctrl.dart';

class AssesmentView extends StatefulWidget {
  const AssesmentView({Key? key}) : super(key: key);

  @override
  State<AssesmentView> createState() => _AssesmentViewState();
}

class _AssesmentViewState extends State<AssesmentView> {
  StarEvaluationScreenCtrl ctrl = Get.find<StarEvaluationScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            addText("${translate(context).assessment_score}: ", 14.sp, BaseColors.textBlackColor, FontWeight.w400),
            SizedBox(
              width: 1.w,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.sp, right: 15.sp,),
              decoration: BoxDecoration(
                  border: Border.all(color: BaseColors.borderColor),
                  borderRadius: BorderRadius.circular(6.0)
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      addText("100", 15.sp, BaseColors.textRedColor, FontWeight.w700),
                      addText(" (max)", 14.sp, BaseColors.textLightGreyColor, FontWeight.w500),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: InkWell(
                onTap: (){
                  ctrl.list[index]['isSelected'].value = !ctrl.list[index]['isSelected'].value;
                },
                child: Container(
                  padding: EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: BaseColors.borderColor
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
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
                      Container(
                        padding: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 2, bottom: 2),
                        decoration: BoxDecoration(
                            border: Border.all(color: BaseColors.primaryColor),
                            borderRadius: BorderRadius.circular(6.0)
                        ),
                        child: addText("100", 16.sp, BaseColors.primaryColor, FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(flex: 2,child: BaseButton(btnType: mediumButton,title: translate(context).save, onPressed: (){}, btnWidth: 30.w)),
            SizedBox(width: 3.5.w),
            Expanded(flex: 4,child: BaseButton(btnType: mediumButton,title: translate(context).submit_for_review.toUpperCase(), onPressed: (){})),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
