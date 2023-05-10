import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/view/feedback_help_screen/add_feedback_view.dart';

class HelpView extends StatefulWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  final List<String> pendingMeetingdates = ['July 2, 8:30PM', 'July 3, 10:30AM', ''];

  final List<String> heading = [
    'Concern\nRaised',
    'InProgress',
    'Concern\nSolved',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText("App is not working", 16.sp, BaseColors.textBlackColor, FontWeight.w700),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(AddFeedbackView(isUpdating: true));
                          },
                          child: Image.asset(editPng, color: BaseColors.primaryColor,height: 18.sp,),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        GestureDetector(
                          onTap: (){
                            BaseOverlays().showConfirmationDialog(title: "Are you sure you want to\ndelete this Help?");
                          },
                          child: Icon(
                            CupertinoIcons.delete,
                            color: BaseColors.primaryColor,
                            size: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/user 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    addText("Star :", 15.sp, BaseColors.textBlackColor, FontWeight.w400),
                    const SizedBox(width: 3),
                    addText("Najma Suheil", 15.sp, BaseColors.primaryColor, FontWeight.w600),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/Vector (1).svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    addText("01/03/2022", 15.sp, BaseColors.textBlackColor, FontWeight.w400),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      height: 20.0,
                      width: 1,
                      color: BaseColors.borderColor,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SvgPicture.asset("assets/images/time_icon.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    addText("09:13pm", 15.sp, BaseColors.textBlackColor, FontWeight.w400),
                  ],
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/family_img.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems("Type", "Help"))
                  ],
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/family_img.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems("Help for", "App not working"))
                  ],
                ),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/report.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems("Message", "Hi, I'm facing some issues with the application's speed..it's not working as fast as I expect."))
                  ],
                ),
                Divider(),
                Visibility(
                  visible: index != 0,
                  child: Row(
                    children: [
                      // Flexible(
                      //   flex: 1,
                      //   child: BaseButton(title: "ESCALATE", onPressed: (){}),
                      // ),
                      // SizedBox(
                      //   width: 2.w,
                      // ),
                      Expanded(
                        flex: 1,
                        child: BaseButton(title: "ACCEPT", onPressed: (){},btnType: mediumButton,removeHorizontalPadding: true),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: BaseButton(title: "COMMENT", onPressed: (){},isActive: false,btnType: mediumButton,removeHorizontalPadding: true),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: index+1,
                  color: BaseColors.primaryColor,
                  titles: pendingMeetingdates,
                  statuses: heading,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
