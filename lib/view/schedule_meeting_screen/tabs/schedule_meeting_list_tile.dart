import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/custom_text_field.dart';
import 'package:staff_app/utility/step_progress.dart';
import 'package:staff_app/view/chat_screen/chating_screen.dart';
import 'package:staff_app/view/schedule_meeting_screen/choose_meeting_date_time_popup.dart';
import 'package:staff_app/view/schedule_meeting_screen/controller/schedule_meeting_screen_ctrl.dart';
import 'package:staff_app/view/schedule_meeting_screen/meeting_cancel_reason_popup.dart';
import 'package:staff_app/view/task_or_reminder_screen/add_task_or_reminder_screen.dart';

import '../../../utility/sizes.dart';

class ScheduleMeetingListTile extends StatelessWidget {

  ScheduleMeetingListTile({Key? key}) : super(key: key);
  final ScheduleMeetingScreenCtrl controller = Get.find<ScheduleMeetingScreenCtrl>();

  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', '', '', ""];
  final List<String> heading = [
    'Request\nRaised',
    'Accepted',
    'Planned On',
    'Completed',
  ];

  final List<String> cancelledStepperTitles = [
    'Request\nRaised',
    'Request\nCancelled',
  ];
  final List<String> cancelledStepperDates = ['July 2,\n8:30PM',"July 2,\n8:30PM"];

  @override
  Widget build(BuildContext context) {
    return Obx(()=>(controller.list?.length??0) == 0
        ? BaseNoData(message: "No Scheduled Meeting Found")
        : ListView.builder(
          itemCount: controller.list?.length??0,
          shrinkWrap: true,
          itemBuilder: (context, index) {
          // int stepperIndex = 0;
          // if (controller.selectedTabIndex == 0) {
          //   controller.list?[index].requestStatus?.toList().asMap().forEach((loopIndex,element) {
          //     if ((element.time??"").toString().isNotEmpty) {
          //       stepperIndex = loopIndex;
          //       if (controller.selectedTabIndex.value == 0) {
          //
          //       }
          //     }
          //   });
          // }
          // else if (controller.selectedTabIndex == 1) {
          //   stepperIndex = 2;
          //   controller.list?[index].requestStatus?.toList().asMap().forEach((loopIndex,element) {
          //     controller.stepperTimeDate[0] = convertDateFormat3(element.time??"");
          //     controller.stepperTimeDate[1] = convertDateFormat3(element.time??"");
          //     controller.stepperTimeDate[2] = convertDateFormat3(element.time??"");
          //   });
          // }
          // else if (controller.selectedTabIndex == 2) {
          //   stepperIndex = 3;
          //   controller.list?[index].requestStatus?.toList().asMap().forEach((loopIndex,element) {
          //     controller.stepperTimeDate[0] = convertDateFormat3(element.time??"");
          //     controller.stepperTimeDate[1] = convertDateFormat3(element.time??"");
          //     controller.stepperTimeDate[2] = convertDateFormat3(element.time??"");
          //   });
          // }
          // else if (controller.selectedTabIndex == 3) {
          //   stepperIndex = 4;
          //   controller.list?[index].requestStatus?.toList().asMap().forEach((loopIndex,element) {
          //     controller.stepperTimeDate[0] = convertDateFormat3(element.time??"");
          //     controller.stepperTimeDate[1] = convertDateFormat3(element.time??"");
          //     controller.stepperTimeDate[2] = convertDateFormat3(element.time??"");
          //     controller.stepperTimeDate[3] = convertDateFormat3(element.time??"");
          //   });
          // }
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BaseDetailData(prefixIcon: "assets/images/Vector (1).svg",detailsLabel:"Schedule Date", detailsValue:getFormattedDate(controller.list?[index].date??"")),
                  BaseDetailData(prefixIcon: "assets/images/time_icon.svg",detailsLabel:"Time Slot", detailsValue:getFormattedTime(controller.list?[index].time??"")),
                  BaseDetailData(prefixIcon: "assets/images/family_img.svg",detailsLabel:"Meeting with", detailsValue:controller.list?[index].user?.name??"N/A"),
                  BaseDetailData(prefixIcon: "assets/images/ic_designation.svg",detailsLabel:"Designation", detailsValue:"Teacher Admin"),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            BaseDetailData(
                                showDivider: false,
                                prefixIcon: "assets/images/Group (1).svg",
                                detailsLabel:"Meeting Type",
                                detailsValue:"Audio Call",
                                rightMargin: 2.w,
                            ),
                            GestureDetector(
                                onTap: (){Get.to(ChatingScreen());},
                                child: SvgPicture.asset("assets/images/chat_img.svg")),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: controller.selectedTabIndex.value == 0 || controller.selectedTabIndex.value == 1,
                        child: Expanded(flex: 1,child: BaseButton(title: controller.selectedTabIndex.value == 0 ? "Reminder" : "Start", onPressed: (){
                          if (controller.selectedTabIndex.value == 0) {
                            Get.to(AddTaskOrReminderScreen());
                          }
                        }, textSize: smallButtonTs,verticalPadding: 1.h)),
                      ),
                    ],
                  ),
                  const Divider(),
                  Visibility(
                    visible: controller.selectedTabIndex.value == 2,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              BaseDetailData(
                                showDivider: false,
                                prefixIcon: "assets/images/Group (1).svg",
                                detailsLabel:"Reason",
                                detailsValue: controller.list?[index].reason??"N/A",
                                rightMargin: 2.w,
                              ),
                              GestureDetector(
                                  onTap: (){Get.to(ChatingScreen());},
                                  child: SvgPicture.asset("assets/images/chat_img.svg")),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: controller.selectedTabIndex.value == 0 || controller.selectedTabIndex.value == 1,
                          child: Expanded(flex: 1,child: BaseButton(title: controller.selectedTabIndex.value == 0 ? "Reminder" : "Start", onPressed: (){
                            if (controller.selectedTabIndex.value == 0) {
                              Get.to(AddTaskOrReminderScreen());
                            }
                          }, textSize: smallButtonTs,verticalPadding: 1.h)),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                      visible: controller.selectedTabIndex.value == 2,
                      child: const Divider()),
                  Visibility(
                    visible: controller.selectedTabIndex.value == 0 || controller.selectedTabIndex.value == 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: BaseButton(removeHorizontalPadding: true,title: "RESCHEDULE", onPressed: (){
                            showGeneralDialog(
                              context: context,
                              pageBuilder:  (context, animation, secondaryAnimation) {
                                return ChooseMeetingDateTimePopup(title: "Reschedule",);
                              },
                            );
                          }, isActive: controller.selectedTabIndex.value == 0 ? false : true, textSize: 15.sp,rightMargin: 1.w),
                        ),
                        Visibility(
                          visible: controller.selectedTabIndex.value == 0 || controller.selectedTabIndex.value == 1,
                          child: Expanded(
                            child: BaseButton(title: "CANCEL", onPressed: (){
                              showGeneralDialog(
                                context: context,
                                pageBuilder:  (context, animation, secondaryAnimation) {
                                  return MeetingCancelReasonPopup(id: controller.list?[index].sId??"",);
                                },
                              );
                            }, isActive: false, textSize: 15.sp,leftMargin: 1.w,rightMargin: 1.w),
                          ),
                        ),
                        Visibility(
                          visible: controller.selectedTabIndex.value == 0,
                          child: Expanded(child: BaseButton(title: "ACCEPT", onPressed: (){
                            BaseOverlays().showConfirmationDialog(
                              title: "Are you sure, you want to accept this meeting ?",
                                onRightButtonPressed: (){
                              // controller.updateStatus(id: controller.list?[index].sId??"",type: "accept");
                            });
                          }, textSize: 15.sp,leftMargin: 1.w)),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.selectedTabIndex.value == 3,
                    child: (controller.list?[index].meetingFeedBackRating??"").isEmpty ? Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 100,
                        child: BaseButton(
                          title: "ADD RATING",
                          verticalPadding: 1.h,
                          textSize: smallButtonTs,
                          onPressed: () {
                            // isTap = true;
                            showMeetingFeedbackDialogue(context, index: index);
                            },
                        ),
                      ),
                    ):Align(
                      alignment: Alignment.centerLeft,
                      child: RatingBar.builder(
                        itemSize: 30,
                        initialRating: double.parse(controller.list?[index].meetingFeedBackRating??"0.0"),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(
                            CupertinoIcons.star_fill,
                            color: BaseColors.primaryColor,
                            size: 16.sp,
                          ),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  StepProgressView(
                    width: MediaQuery.of(context).size.width,
                    curStep: 2,
                    color: BaseColors.primaryColor,
                    titles: controller.selectedTabIndex == 2 ? cancelledStepperDates : pendingMeetingdates,
                    statuses: controller.selectedTabIndex == 2 ? cancelledStepperTitles : heading,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  showMeetingFeedbackDialogue(BuildContext context,{required index}) {
    TextEditingController descController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    double? selectedRating;
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) setState) {
                  return Dialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    insetPadding: EdgeInsets.all(10),
                    child: StatefulBuilder(builder: (context, setSta) {
                      return Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                Align(alignment: AlignmentDirectional.topEnd,
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.close,color: Colors.grey,),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: addAlignedText('Meeting Feedback', 18,
                                        Colors.black, FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h,),
                            RatingBar.builder(
                              itemSize: 30,
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Icon(
                                  CupertinoIcons.star_fill,
                                  color: BaseColors.primaryColor,
                                  size: 16.sp,
                                ),
                              ),
                              onRatingUpdate: (rating) {
                                selectedRating = rating;
                              },
                            ),
                            SizedBox(height: 2.h,),
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Form(
                                  key: formKey,
                                  child: CustomTextField(
                                    controller: descController,
                                    hintText: "Add feedback...",
                                    maxLine: 4,
                                    validator: (val){
                                      if((val??"").isEmpty){
                                        return "Please enter feedback";
                                      }
                                      return null;
                                    },
                                  ),
                                )),
                            SizedBox(height: 1.h,),
                            BaseButton(
                                btnType: 'mediumlarge',
                                title: 'SUBMIT',
                                onPressed: (){
                                  if (formKey.currentState?.validate()??false) {
                                    controller.updateStatus(
                                        id: controller.list?[index].sId??"",
                                        meetingFeedBackRating: selectedRating.toString(),
                                        meetingFeedBackDesc: descController.text.trim()
                                    );
                                  }
                                },borderRadius: 20
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const SizedBox();
        });
  }
}
