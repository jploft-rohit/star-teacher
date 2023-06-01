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
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 2.h),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseDetailData(prefixIcon: "",detailsLabel: "Subject", detailsValue: "Arabic"),
                      Row(children: [
                        Expanded(flex: 1,child: SvgPicture.asset("assets/images/family_img.svg")),
                        Expanded(flex: 3,child: Text("Exam Type :")),
                        Expanded(flex: 8,child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.4.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: BaseColors.primaryColor,width: 1)
                          ),
                          child: Text("Type Here..."),
                        ))
                      ]),
                      Divider(),
                      Row(children: [
                        Expanded(flex: 1,child: SvgPicture.asset("assets/images/family_img.svg")),
                        Expanded(flex: 3,child: Text("Max Marks :")),
                        Expanded(flex: 8,child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.4.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: BaseColors.primaryColor,width: 1)
                          ),
                          child: Text("Type Here..."),
                        ))
                      ]),
                      Divider(),
                      Row(children: [
                        Expanded(flex: 1,child: SvgPicture.asset("assets/images/family_img.svg")),
                        Expanded(flex: 3,child: Text("Obtained Marks :")),
                        Expanded(flex: 8,child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.4.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: BaseColors.primaryColor,width: 1)
                          ),
                          child: Text("Type Here..."),
                        ))
                      ]),
                      Divider(),
                      Row(children: [
                        Expanded(flex: 1,child: SvgPicture.asset("assets/images/family_img.svg")),
                        Expanded(flex: 3,child: Text("Feedback :")),
                        Expanded(flex: 8,child: Container(
                          height: 8.h,
                          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.4.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: BaseColors.primaryColor,width: 1)
                          ),
                          child: Text("Description"),
                        ))
                      ]),
                    ],
                  ),
                ),
              );
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 50.w,child: BaseButton(removeHorizontalPadding: true,title: translate(context).submit_for_review.toUpperCase(), onPressed: (){},borderRadius: 19,)),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
