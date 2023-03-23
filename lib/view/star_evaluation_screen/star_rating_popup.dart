import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen_ctrl.dart';

import '../../Utility/custom_colors.dart';

class StarRatingPopup extends StatefulWidget {
  const StarRatingPopup({Key? key}) : super(key: key);

  @override
  State<StarRatingPopup> createState() => _StarRatingPopupState();
}

class _StarRatingPopupState extends State<StarRatingPopup> with SingleTickerProviderStateMixin{
  StarEvaluationScreenCtrl ctrl = Get.find<StarEvaluationScreenCtrl>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                  BaseToggleTabBar(controller: tabController, tabs: [
                    BaseTabButton(title: translate(context).positive, isSelected: tabController.index == 0),
                    BaseTabButton(title: translate(context).needs, isSelected: tabController.index == 1)
                  ]),
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
                                    color: tabController.index == 0 ? CustomColors.primaryColor : Colors.grey.shade500,
                                    size: 22.sp,
                                  ),
                                  Positioned(
                                    top: 10.0,
                                    left: 10.0,
                                    child: addText(tabController.index == 0 ? "2" : "-2", 13.sp, CustomColors.white, FontWeight.w400),)
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
                      child: BaseButton(title: translate(context).submit_btn_txt.toUpperCase(), onPressed: (){
                        Navigator.pop(context);
                      }, btnWidth: 40.w),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
