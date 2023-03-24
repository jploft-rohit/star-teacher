import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                addText("${translate(context).max_points}: ", 14.sp, CustomColors.textBlackColor, FontWeight.w400),
                SizedBox(
                  width: 1.w,
                ),
                Container(
                  padding: EdgeInsets.only(left: 25.sp, right: 25.sp,),
                  decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.borderColor),
                      borderRadius: BorderRadius.circular(6.0)
                  ),
                  child: addText("5", 15.sp, CustomColors.primaryColor, FontWeight.w700),
                )
              ],
            ),
            Row(
              children: [
                Obx(() => Checkbox(
                  checkColor: CustomColors.primaryColor,
                  activeColor: Colors.transparent,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: ctrl.isChecked.value,
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(width: 1.0, color: CustomColors.primaryColor),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                      side: BorderSide(color: CustomColors.primaryColor)
                  ),
                  onChanged: (bool? value) {
                    ctrl.isChecked.value = value!;
                  },
                ),),
                Text(translate(context).select_all, style: Style.montserratMediumStyle().copyWith(color: CustomColors.greyColor, fontSize: 15.sp),),
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
              child: InkWell(
                onTap: (){
                  ctrl.list[index]['isSelected'].value = !ctrl.list[index]['isSelected'].value;
                },
                child: Row(
                  children: [
                    Obx(() => Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 9),
                      decoration: BoxDecoration(
                          color: ctrl.list[index]['isSelected'].value
                              ? CustomColors.backgroundColor
                              : CustomColors.borderColor,
                          boxShadow: [getLightBoxShadow()],
                          border: ctrl.list[index]['isSelected'].value
                              ? Border.all(
                              color: CustomColors.primaryColor, width: 1.5)
                              : Border.all(
                              color: Colors.transparent, width: 1.5),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: CustomColors.white, width: 1.5),
                            shape: BoxShape.circle,
                            boxShadow: [getBoxShadow()],
                            color: ctrl.list[index]['isSelected'].value
                                ? CustomColors.primaryColor
                                : CustomColors.borderColor
                        ),
                        child: Center(
                          child: Icon(Icons.check, color: CustomColors.white,
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
                                color: CustomColors.borderColor
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
                                      addText("Najma Suheil", 16.sp, ctrl.list[index]['isSelected'].value == true ? CustomColors.primaryColor : CustomColors.textLightGreyColor, FontWeight.w700),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          addText("ID: ", 14.sp, ctrl.list[index]['isSelected'].value == true ? CustomColors.textBlackColor : CustomColors.textLightGreyColor, FontWeight.w700),
                                          addText("#632541", 14.sp, ctrl.list[index]['isSelected'].value == true ? CustomColors.primaryColor : CustomColors.textLightGreyColor, FontWeight.w700),
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
                                  border: Border.all(color: ctrl.list[index]['isSelected'].value == true ? CustomColors.primaryColor : CustomColors.textLightGreyColor),
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      if(ctrl.list[index]['count'].value > 1) ctrl.list[index]['count'].value = ctrl.list[index]['count'].value - 1;
                                    },
                                    child: Icon(Icons.remove, color: ctrl.list[index]['isSelected'].value == true ? CustomColors.primaryColor : CustomColors.textLightGreyColor),),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  VerticalDivider(color: ctrl.list[index]['isSelected'].value == true ? CustomColors.primaryColor : CustomColors.textLightGreyColor,width: 0.0, thickness: 1.5,),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Obx(() => addText("${ctrl.list[index]['count'].value}", 15.sp, ctrl.list[index]['isSelected'].value == true ? CustomColors.primaryColor : CustomColors.textLightGreyColor, FontWeight.w700),),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  VerticalDivider(color: ctrl.list[index]['isSelected'].value == true ? CustomColors.primaryColor : CustomColors.textLightGreyColor,width: 0.0, thickness: 1.5),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      ctrl.list[index]['count'].value = ctrl.list[index]['count'].value + 1;
                                    },
                                    child: Icon(Icons.add, color: ctrl.list[index]['isSelected'].value == true ? CustomColors.primaryColor : CustomColors.textLightGreyColor,),),
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
            BaseButton(btnType: mediumLargeButton,title: translate(context).save, onPressed: (){}, btnWidth: 30.w),
            BaseButton(btnType: mediumLargeButton,title: translate(context).next_btn_txt, onPressed: (){
              showGeneralDialog(
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return MarkSelectedPopup(isShowCount: true,);
                },
              );
            }),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
