import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen_ctrl.dart';

import '../../Utility/custom_colors.dart';

class StarRatingPopup extends StatefulWidget {
  const StarRatingPopup({Key? key}) : super(key: key);

  @override
  State<StarRatingPopup> createState() => _StarRatingPopupState();
}

class _StarRatingPopupState extends State<StarRatingPopup> {
  StarEvaluationScreenCtrl ctrl = Get.find<StarEvaluationScreenCtrl>();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(""),
                    Text(translate(context).star_rating, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Obx(() => Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          ctrl.selectedIndex.value = 0;
                        },
                        child: Container(
                          height: 40.0,
                          width: getWidth(context) * 50 / 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ctrl.selectedIndex.value == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                              border: Border.all(
                                  color: ctrl.selectedIndex.value == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                              ),
                              boxShadow: [
                                if(ctrl.selectedIndex.value == 0)
                                  const BoxShadow(
                                      color: CustomColors.darkShadowColor,
                                      spreadRadius: 1.0,
                                      blurRadius: 2.0,
                                      offset: Offset(0, 3)
                                  )
                              ],
                              borderRadius: BorderRadius.circular(15.sp)
                          ),
                          child: Text(translate(context).positive, style: Style.montserratBoldStyle().copyWith(color: ctrl.selectedIndex.value == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 2.w,
                    ),
                    Obx(() => Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          ctrl.selectedIndex.value = 1;
                        },
                        child: Container(
                          height: 40.0,
                          width: getWidth(context) * 50 / 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ctrl.selectedIndex.value == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                              border: Border.all(
                                  color: ctrl.selectedIndex.value == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                              ),
                              boxShadow: [
                                if(ctrl.selectedIndex.value == 1)
                                  const BoxShadow(
                                      color: CustomColors.darkShadowColor,
                                      spreadRadius: 1.0,
                                      blurRadius: 2.0,
                                      offset: Offset(0, 3)
                                  )
                              ],
                              borderRadius: BorderRadius.circular(15.sp)
                          ),
                          child: Text(translate(context).needs, style: Style.montserratBoldStyle().copyWith(color: ctrl.selectedIndex.value == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                        ),
                      ),
                    )),
                  ],
                ),
                GridView.builder(
                  itemCount: ctrl.ratingList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(ctrl.ratingList[index]['img']),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(ctrl.ratingList[index]['title'], style: Style.montserratMediumStyle().copyWith(fontSize: 15.sp),maxLines: 1, overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Stack(
                              children: [
                                Icon(
                                  CupertinoIcons.star_fill,
                                  color: CustomColors.primaryColor,
                                  size: 22.sp,
                                ),
                                Positioned(
                                  top: 10.0,
                                  left: 10.0,
                                  child: addText("${ctrl.ratingList[index]['rating']}", 13.sp, CustomColors.white, FontWeight.w400),)
                              ],
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: CustomButton(text: translate(context).submit_btn_txt.toUpperCase(), onPressed: (){
                      Navigator.pop(context);
                    }, btnWidth: 40.w, btnHeight: 30,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
