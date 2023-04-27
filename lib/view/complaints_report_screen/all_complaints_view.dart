import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/base_dialogs.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/complaints_report_screen/add_comment_popup.dart';
import 'package:staff_app/view/complaints_report_screen/raise_complaint_report_screen.dart';

class AllComplaintsView extends StatefulWidget {
  const AllComplaintsView({Key? key}) : super(key: key);

  @override
  State<AllComplaintsView> createState() => _AllComplaintsViewState();
}

class _AllComplaintsViewState extends State<AllComplaintsView> {
  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', 'July 3,\n10:30AM', ''];

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
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addText("Behavior is not good", 16.sp, BaseColors.textBlackColor, FontWeight.w700),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.to(RaiseComplaintReportScreen(isUpdating: true));
                            },
                            child: Image.asset(editPng, color: BaseColors.primaryColor,height: 18.sp,),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(
                            onTap: (){
                              BaseDialogs().showConfirmationDialog(
                                  title: "Are you sure you want to delete this Complaint?",
                              );
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
                  const Divider(),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/user 1.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      addText("Star :", 14.sp, BaseColors.textBlackColor, FontWeight.w400),
                      const SizedBox(width: 3),
                      addText("Najma Suheil", 14.sp, BaseColors.primaryColor, FontWeight.w600),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/Vector (1).svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      addText("01/03/2022", 14.sp, BaseColors.textBlackColor, FontWeight.w400),
                      SizedBox(
                        width: 10.w,
                      ),
                      SvgPicture.asset("assets/images/time_icon.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      addText("09:13pm", 14.sp, BaseColors.textBlackColor, FontWeight.w400),
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/report.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(child: buildInfoItems("Type", "Complaints"))
                    ],
                  ),
                  // const Divider(),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     SvgPicture.asset("assets/images/report.svg"),
                  //     SizedBox(
                  //       width: 2.w,
                  //     ),
                  //     Flexible(child: buildInfoItems("Complain on", "Bus Driver"))
                  //   ],
                  // ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/user.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(child: buildInfoItems("Person", "Ibrahim Khan"))
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/report.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(child: buildInfoItems("Complain Type", "Bullying"))
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/images/report.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(child: buildInfoItems("Comment", "Please upload the feedback of all the stars in suggested class into the excel worksheet."))
                    ],
                  ),
                  Visibility(visible: index != 0,child: const Divider()),
                  Visibility(
                    visible: index != 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/report.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        Flexible(child: buildInfoItems("Feedback", "Please upload the feedback of all the stars in suggested class into the excel worksheet."))
                      ],
                    ),
                  ),
                  Divider(height: 3.h),
                  Visibility(
                    visible: index != 0,
                    child: Row(
                      children: [
                        Expanded(child: BaseButton(title: translate(context).accept.toUpperCase(), onPressed: (){},rightMargin: 1.5.w,isActive: false,removeHorizontalPadding: true,btnType: mediumLargeButton,)),
                        Expanded(child: BaseButton(title: translate(context).comment.toUpperCase(), onPressed: (){
                          showCommentDialog(context);
                        },leftMargin: 1.5.w,removeHorizontalPadding: true,btnType: mediumLargeButton,)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
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
          ),
        );
      },
    );
  }
}
showCommentDialog(BuildContext context){

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
          backgroundColor: ColorConstants.white,
          elevation: 10,

          scrollable: true,
          title: Stack(
            children: [
              Align(alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 15),
                  child: addAlignedText(
                      "Add Comment",
                      16.sp,
                      Color(0xFF000000),
                      FontWeight.w600),
                ),),

              Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close,color: Color(0xFF929292),),
                  ))
            ],
          ),
          contentPadding: const EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          content: SizedBox(
            width: 100.w,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(controller: TextEditingController(), hintText: "Comment",maxLine: 4,),
                  SizedBox(height: 2.h ,),
                  Align(
                      alignment: Alignment.topCenter,
                      child: BaseButton(title: 'SUBMIT', onPressed: () {
                        Navigator.pop(context);
                      }, btnType: 'mediumlarge',borderRadius: 20,)
                  ),
                  SizedBox(height: 1.h ,),

                ],
              ),
            ),
          )));


}
