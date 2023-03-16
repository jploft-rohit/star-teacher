import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';

class AllFeedbackHelpView extends StatefulWidget {
  const AllFeedbackHelpView({Key? key}) : super(key: key);

  @override
  State<AllFeedbackHelpView> createState() => _AllFeedbackHelpViewState();
}

class _AllFeedbackHelpViewState extends State<AllFeedbackHelpView> {
  final List<String> pendingMeetingdates = ['July 2, 8:30PM', 'July 3, 10:30AM', ''];

  final List<String> heading = [
    'Concern\nRaised',
    'InProgress',
    'Concern\nSolved',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
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
                    addText("App is not working", 16.sp, CustomColors.textBlackColor, FontWeight.w700),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.delete,
                          color: CustomColors.primaryColor,
                          size: 18.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: Image.asset(editPng, color: CustomColors.primaryColor,height: 18.sp,),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/Vector (1).svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    addText("01/03/2022", 15.sp, CustomColors.textBlackColor, FontWeight.w400),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      height: 20.0,
                      width: 1,
                      color: CustomColors.borderColor,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SvgPicture.asset("assets/images/time_icon.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    addText("09:13pm", 15.sp, CustomColors.textBlackColor, FontWeight.w400),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/images/chat_img.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(child: buildInfoItems("Revert", "Thanks for your feedback, the support team will solve the issue and update you."))
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Divider(),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: CustomButton(text: "ESCALATE", onPressed: (){}, btnHeight: 35, boxShadow: [], borderRadius: 10.0, btnColor: Colors.white, borderColor: CustomColors.borderColor,textColor: CustomColors.textLightGreyColor, textSize: 16.sp,),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: CustomButton(text: "COMMENTS", onPressed: (){

                      }, btnHeight: 35, boxShadow: [], borderRadius: 10.0, btnColor: Colors.white, borderColor: CustomColors.borderColor,textColor: CustomColors.textLightGreyColor, textSize: 16.sp,),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: CustomButton(text: "ACCEPT", onPressed: (){}, btnHeight: 35, borderRadius: 10.0,textSize: 16.sp,),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),

                StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: 2,
                  color: CustomColors.primaryColor,
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
