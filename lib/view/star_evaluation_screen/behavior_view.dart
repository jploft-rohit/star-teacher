import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_evaluation_screen/mark_selected_popup.dart';
import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen_ctrl.dart';

class BehaviourView extends StatefulWidget {
  const BehaviourView({Key? key}) : super(key: key);

  @override
  State<BehaviourView> createState() => _BehaviourViewState();
}

class _BehaviourViewState extends State<BehaviourView> {
  StarEvaluationScreenCtrl ctrl = Get.put(StarEvaluationScreenCtrl());
  bool isNextDone = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(isNextDone ? "Punctuality" : "Communication Skills",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15.sp)),
        SizedBox(height: 1.5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  child: addText("100", 15.sp, BaseColors.textRedColor, FontWeight.w700),
                ),
              ],
            ),
            Row(
              children: [
                Obx(() => Checkbox(
                  checkColor: BaseColors.primaryColor,
                  activeColor: Colors.transparent,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: ctrl.isChecked.value,
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(width: 1.0, color: BaseColors.primaryColor),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                      side: BorderSide(color: BaseColors.primaryColor)
                  ),
                  onChanged: (bool? value) {
                    ctrl.isChecked.value = value!;
                  },
                ),),
                Text(translate(context).select_all, style: Style.montserratMediumStyle().copyWith(color: BaseColors.greyColor, fontSize: 15.sp),),
              ],
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
              child: GestureDetector(
                onTap: (){
                  ctrl.list[index]['isSelected'].value = !ctrl.list[index]['isSelected'].value;
                },
                child: Row(
                  children: [
                    Obx(() => Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 9),
                      decoration: BoxDecoration(
                          color: ctrl.list[index]['isSelected'].value
                              ? BaseColors.backgroundColor
                              : BaseColors.borderColor,
                          boxShadow: [getLightBoxShadow()],
                          border: ctrl.list[index]['isSelected'].value
                              ? Border.all(
                              color: BaseColors.primaryColor, width: 1.5)
                              : Border.all(
                              color: Colors.transparent, width: 1.5),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: BaseColors.white, width: 1.5),
                            shape: BoxShape.circle,
                            boxShadow: [getBoxShadow()],
                            color: ctrl.list[index]['isSelected'].value
                                ? BaseColors.primaryColor
                                : BaseColors.borderColor
                        ),
                        child: Center(
                          child: Icon(Icons.check, color: BaseColors.white,
                              size: 16.sp),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 2.w,
                    ),
                    Obx(() => Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: ctrl.list[index]['isSelected'].value ? BaseColors.primaryColor : BaseColors.borderColor
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
                              height: 27.0,
                              // padding: EdgeInsets.only(left: 25.sp, right: 25.sp,),
                              decoration: BoxDecoration(
                                  border: Border.all(color: ctrl.list[index]['isSelected'].value == true ? BaseColors.primaryColor : BaseColors.textLightGreyColor),
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      if(ctrl.list[index]['count'].value > 1) ctrl.list[index]['count'].value = ctrl.list[index]['count'].value - 1;
                                    },
                                    child: Icon(Icons.remove, color: ctrl.list[index]['isSelected'].value == true ? BaseColors.primaryColor : BaseColors.textLightGreyColor),),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  VerticalDivider(color: ctrl.list[index]['isSelected'].value == true ? BaseColors.primaryColor : BaseColors.textLightGreyColor,width: 0.0, thickness: 1.5,),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Obx(() => addText("${ctrl.list[index]['count'].value}", 15.sp, ctrl.list[index]['isSelected'].value == true ? BaseColors.primaryColor : BaseColors.textLightGreyColor, FontWeight.w700),),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  VerticalDivider(color: ctrl.list[index]['isSelected'].value == true ? BaseColors.primaryColor : BaseColors.textLightGreyColor,width: 0.0, thickness: 1.5),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      ctrl.list[index]['count'].value = ctrl.list[index]['count'].value + 1;
                                    },
                                    child: Icon(Icons.add, color: ctrl.list[index]['isSelected'].value == true ? BaseColors.primaryColor : BaseColors.textLightGreyColor,),),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            );
          },
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // BaseButton(btnType: mediumLargeButton,title: translate(context).save, onPressed: (){}, btnWidth: 30.w,
            // borderRadius: 19,),
            SizedBox(
              width: 60.w,
              child: BaseButton(removeHorizontalPadding: true,title: isNextDone ? "SUBMIT FOR REVIEW" : translate(context).next_btn_txt, onPressed: (){
                setState(() {
                  isNextDone = true;
                });
                // showGeneralDialog(
                //   context: context,
                //   pageBuilder: (context, animation, secondaryAnimation) {
                //     return MarkSelectedPopup(isShowCount: true,);
                //   },
                // );
              },borderRadius: 19,),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
