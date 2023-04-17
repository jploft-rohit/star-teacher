import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/request_online_classes/request_online_classes.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';

import '../../Utility/base_floating_action_button.dart';

class RequestOnlineClassesDetail extends StatelessWidget {
  RequestOnlineClassesDetail({Key? key}) : super(key: key);
  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', '', '', ''];

  final List<String> heading = [
    'Request\nRaised',
    'Request\nAccepted',
    'Evidence\nSubmit',
    'Evidence\nApproved'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.screenBackgroundColor,
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {Get.to(const RequestOnlineClasses());},
        title: translate(context).add_request,
      ),
      appBar: BaseAppBar(title: translate(context).online_class_request),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                color: BaseColors.backgroundColor,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: BaseColors.borderColor
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                  const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      color: BaseColors.darkShadowColor,
                      spreadRadius: 1.0,
                      blurRadius: 2.0,
                      offset: Offset(0, 3)
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 12.sp, right: 12.sp),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: BaseColors.primaryColor
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: SvgPicture.asset(manSvg),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rafiq Khan", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 17.sp),),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text("#632541", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation){
                                return ConfirmationDialog(msg: translate(context).are_you_sure_delete, isShowBtn: true);
                              });
                            },
                            child: Icon(
                              CupertinoIcons.delete,
                              color: BaseColors.primaryColor,
                              size: 18.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(onTap: (){
                            Get.to(const RequestOnlineClasses(isUpdating: true));
                          },child: Image.asset(editPng, color: BaseColors.primaryColor,height: 18.sp,)),
                          SizedBox(
                            width: 5.w,
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(uploadDocSvg),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Text(translate(context).upload_evidence, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 13.sp),textAlign: TextAlign.center,)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    color: BaseColors.borderColor,
                    thickness: 1.0,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/Vector (1).svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text("01/03/2022", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text("to", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                      SizedBox(
                        width: 10.w,
                      ),
                      SvgPicture.asset("assets/images/Vector (1).svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text("05/03/2022", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                    ],
                  ),
                  const Divider(
                    color: BaseColors.borderColor,
                    thickness: 1.0,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/report.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text("${translate(context).reason} : ", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                      Text("Due to sickness", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                    ],
                  ),
                  const Divider(
                    color: BaseColors.borderColor,
                    thickness: 1.0,
                  ),
        StepProgressView(
          width: MediaQuery.of(context).size.width,
          curStep: 1,
          color: BaseColors.primaryColor,
          titles: pendingMeetingdates,
          statuses: heading,
        ),
        ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
