import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/view/chat_screen/chating_screen.dart';
import 'package:staff_app/view/schedule_meeting_screen/choose_meeting_date_time_popup.dart';
import 'package:staff_app/view/schedule_meeting_screen/create_meeting_screen.dart';
import 'package:staff_app/view/schedule_meeting_screen/meeting_cancel_reason_popup.dart';
import 'package:staff_app/view/schedule_meeting_screen/controller/schedule_meeting_screen_ctrl.dart';
import 'package:staff_app/view/schedule_meeting_screen/tabs/schedule_meeting_list_tile.dart';
import 'package:staff_app/view/task_or_reminder_screen/add_task_or_reminder_screen.dart';

import '../../language_classes/language_constants.dart';

class ScheduleMeetingScreen extends StatefulWidget {
  const ScheduleMeetingScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleMeetingScreen> createState() => _ScheduleMeetingScreenState();
}

class _ScheduleMeetingScreenState extends State<ScheduleMeetingScreen> with SingleTickerProviderStateMixin {
  TabController? tabCtrl;
  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', '', '', ""];
  final List<String> pendingMeetingdates2 = ['July 2, 8:30PM', 'July 2, 8:30PM', 'July 3, 10:30AM', "July 3, 10:30AM"];
  final List<String> pendingMeetingdates1 = ['July 2, 8:30PM', 'July 3, 10:30AM',];
  ScheduleMeetingScreenCtrl ctrl = Get.put(ScheduleMeetingScreenCtrl());
  final List<String> heading = [
    'Request\nRaised',
    'Accepted',
    'Planned On',
    'Completed',
  ];
  final List<String> heading2 = [
    'Request\nRaised',
    'Accepted',
    'Planned On',
    'Completed',
  ];
  final List<String> heading1 = [
    'Request\nRaised',
    'Request\nCancelled',
  ];
  bool isTap = false;
  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 4, vsync: this)..addListener(() {
      ctrl.selectedTabIndex.value = tabCtrl?.index??0;
      ctrl.stepperTimeDate.value = ["","","",""];
      ctrl.getScheduledMeetingData(type: ctrl.selectedTabIndex.value == 0 ? "request raised" : ctrl.selectedTabIndex.value == 1 ? "planned on" : ctrl.selectedTabIndex.value == 2 ? "cancelled" : "completed");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).schedule_meeting),
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {Get.to(const CreateMeetingScreen());},
        title: 'Schedule\nMeeting',
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            CustomDropDown(
              initialValue: DummyLists.initialSchool,
              hintText: "Select School",
              listData:DummyLists.schoolData,
              onChange: (value) {
                setState(() {
                  DummyLists.initialSchool=value;
                });
              },
              topPadding: 5,
              bottomPadding: 5,
              icon: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25),
            ),
            SizedBox(
              height: 2.h,
            ),
            buildTabBar(),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabCtrl,
                children: [
                  ScheduleMeetingListTile(),
                  ScheduleMeetingListTile(),
                  ScheduleMeetingListTile(),
                  ScheduleMeetingListTile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return BaseTabBar(
      controller: tabCtrl,
      tabs:  const [
        Tab(
          text: 'Pending',
        ),
        Tab(
          text: 'Planned',
        ),
        Tab(
          text: 'Cancelled',
        ),
        Tab(
          text: 'Completed',
        ),
      ],
    );
  }
  // Widget buildPendingView(){
  //   return ListView.builder(
  //     itemCount: 1,
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     itemBuilder: (context, index) {
  //       return Card(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10.0),
  //         ),
  //         child: Padding(
  //           padding: EdgeInsets.all(15.sp),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/Vector (1).svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Schedule Date", "01/03/2022"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/time_icon.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Time Slot", "08:00 AM - 08:10 AM"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/family_img.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Meeting with", "Mohammad Usman"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/hat 1.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Designation", "Teacher Admin"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Expanded(
  //                     flex: 2,
  //                     child: Row(
  //                       children: [
  //                         SvgPicture.asset("assets/images/Group (1).svg"),
  //                         SizedBox(
  //                           width: 2.w,
  //                         ),
  //                         buildInfoItems("Meeting Type", "Audio Call"),
  //                         SizedBox(
  //                           width: 2.w,
  //                         ),
  //                         GestureDetector(
  //                             onTap: (){Get.to(ChatingScreen());},
  //                             child: SvgPicture.asset("assets/images/chat_img.svg")),
  //                       ],
  //                     ),
  //                   ),
  //                   Expanded(flex: 1,child: BaseButton(title: "Reminder", onPressed: (){
  //                     Get.to(AddTaskOrReminderScreen());
  //                   }, textSize: smallButtonTs,verticalPadding: 1.h)),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   Flexible(
  //                     flex: 1,
  //                     child: BaseButton(removeHorizontalPadding: true,title: "RESCHEDULE", onPressed: (){
  //                       showGeneralDialog(
  //                         context: context,
  //                         pageBuilder:  (context, animation, secondaryAnimation) {
  //                           return ChooseMeetingDateTimePopup(title: "Reschedule",);
  //                         },
  //                       );
  //                     }, isActive: false, textSize: 15.sp),
  //                   ),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   Flexible(
  //                     flex: 1,
  //                     child: BaseButton(title: "CANCEL", onPressed: (){
  //                       showGeneralDialog(
  //                         context: context,
  //                         pageBuilder:  (context, animation, secondaryAnimation) {
  //                           return MeetingCancelReasonPopup(id: ctr,);
  //                         },
  //                       );
  //                     }, isActive: false, textSize: 15.sp,),
  //                   ),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   Flexible(
  //                     flex: 1,
  //                     child: BaseButton(title: "ACCEPT", onPressed: (){}, textSize: 15.sp),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 2.h,
  //               ),
  //               StepProgressView(
  //                 width: MediaQuery.of(context).size.width,
  //                 curStep: 1,
  //                 color: BaseColors.primaryColor,
  //                 titles: pendingMeetingdates,
  //                 statuses: heading,
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  // Widget buildPlannedView(){
  //   return ListView.builder(
  //     itemCount: 1,
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     itemBuilder: (context, index) {
  //       return Card(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10.0),
  //         ),
  //         child: Padding(
  //           padding: EdgeInsets.all(15.sp),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/Vector (1).svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Schedule Date", "01/03/2022"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/time_icon.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Time Slot", "08:00 AM - 08:10 AM"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/family_img.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Meeting with", "Mohammad Usman"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/hat 1.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Designation", "Teacher Admin"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Expanded(
  //                     flex: 2,
  //                     child: Row(
  //                       children: [
  //                         SvgPicture.asset("assets/images/Group (1).svg"),
  //                         SizedBox(
  //                           width: 2.w,
  //                         ),
  //                         buildInfoItems("Meeting Type", "Audio Call"),
  //                         SizedBox(
  //                           width: 2.w,
  //                         ),
  //                         GestureDetector(
  //                             onTap: (){Get.to(ChatingScreen());},
  //                             child: SvgPicture.asset("assets/images/chat_img.svg")),
  //                       ],
  //                     ),
  //                   ),
  //                   Expanded(child: BaseButton(title: "Start", onPressed: (){}, textSize: smallButtonTs,verticalPadding: 1.h)),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   Flexible(
  //                     flex: 1,
  //                     child: BaseButton(title: "RESCHEDULE", onPressed: (){
  //                       showGeneralDialog(
  //                         context: context,
  //                         pageBuilder:  (context, animation, secondaryAnimation) {
  //                           return ChooseMeetingDateTimePopup(title: "Reschedule",);
  //                         },
  //                       );
  //                     }, textSize: 15.sp,),
  //                   ),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   Flexible(
  //                     flex: 1,
  //                     child: BaseButton(title: "CANCEL", onPressed: (){
  //                       showGeneralDialog(
  //                         context: context,
  //                         pageBuilder:  (context, animation, secondaryAnimation) {
  //                           return const MeetingCancelReasonPopup();
  //                         },
  //                       );
  //                     }, isActive: false, textSize: 15.sp,),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 2.h,
  //               ),
  //               StepProgressView(
  //                 width: MediaQuery.of(context).size.width,
  //                 curStep: 1,
  //                 color: BaseColors.primaryColor,
  //                 titles: pendingMeetingdates,
  //                 statuses: heading,
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  // Widget buildCanceledView(){
  //   return ListView.builder(
  //     itemCount: 1,
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     itemBuilder: (context, index) {
  //       return Card(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10.0),
  //         ),
  //         child: Padding(
  //           padding: EdgeInsets.all(15.sp),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/Vector (1).svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Schedule Date", "01/03/2022"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/time_icon.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Time Slot", "08:00 AM - 08:10 AM"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/family_img.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Meeting with", "Mohammad Usman"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/hat 1.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Designation", "Teacher Admin"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/Group (1).svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Meeting Type", "Audio Call"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   GestureDetector(
  //                       onTap: (){Get.to(ChatingScreen());},
  //                       child: SvgPicture.asset("assets/images/chat_img.svg")),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   SvgPicture.asset("assets/images/report.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   Flexible(child: buildInfoItems("Reason", "This concern can be solved VIA chat, therefore, an appointment is not needed.")),
  //                   Image.asset(editPng, color: BaseColors.primaryColor, height: 18.sp,)
  //                 ],
  //               ),
  //               const Divider(),
  //               // Row(
  //               //   children: [
  //               //     Flexible(
  //               //       flex: 1,
  //               //       child: BaseButton(title: "RESCHEDULE", onPressed: (){
  //               //         showGeneralDialog(
  //               //           context: context,
  //               //           pageBuilder:  (context, animation, secondaryAnimation) {
  //               //             return ChooseMeetingDateTimePopup(title: "Reschedule",);
  //               //           },
  //               //         );
  //               //       }, btnHeight: 35, borderRadius: 10.0,textSize: 15.sp,),
  //               //     ),
  //               //     SizedBox(
  //               //       width: 2.w,
  //               //     ),
  //               //     Flexible(
  //               //       flex: 1,
  //               //       child: BaseButton(title: "CANCEL", onPressed: (){
  //               //         showGeneralDialog(
  //               //           context: context,
  //               //           pageBuilder:  (context, animation, secondaryAnimation) {
  //               //             return const MeetingCancelReasonPopup();
  //               //           },
  //               //         );
  //               //       }, btnHeight: 35, boxShadow: const [], borderRadius: 10.0, btnColor: Colors.white, borderColor: CustomColors.borderColor,textColor: CustomColors.textLightGreyColor, textSize: 15.sp,),
  //               //     ),
  //               //   ],
  //               // ),
  //               SizedBox(
  //                 height: 2.h,
  //               ),
  //               StepProgressView(
  //                 width: MediaQuery.of(context).size.width,
  //                 curStep: 2,
  //                 color: BaseColors.primaryColor,
  //                 titles: pendingMeetingdates1,
  //                 statuses: heading1,
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  // Widget buildCompletedView(){
  //   return ListView.builder(
  //     itemCount: 1,
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     itemBuilder: (context, index) {
  //       return Card(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10.0),
  //         ),
  //         child: Padding(
  //           padding: EdgeInsets.all(15.sp),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/Vector (1).svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Schedule Date", "01/03/2022"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/time_icon.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Time Slot", "08:00 AM - 08:10 AM"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/family_img.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Meeting with", "Mohammad Usman"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/hat 1.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Designation", "Teacher Admin"),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 children: [
  //                   SvgPicture.asset("assets/images/Group (1).svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   buildInfoItems("Meeting Type", "Audio Call"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   GestureDetector(
  //                       onTap: (){Get.to(ChatingScreen());},
  //                       child: SvgPicture.asset("assets/images/chat_img.svg")),
  //                 ],
  //               ),
  //               const Divider(),
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   SvgPicture.asset("assets/images/report.svg"),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   Flexible(child: buildInfoItems("Meeting conclude", "Concern Solved")),
  //                   SizedBox(
  //                     width: 2.w,
  //                   ),
  //                   Image.asset(editPng, color: BaseColors.primaryColor, height: 17.sp,)
  //                 ],
  //               ),
  //               const Divider(),
  //               if(isTap)
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text("Feedback: ",style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
  //                   Icon(
  //                     CupertinoIcons.star_fill,
  //                     color: BaseColors.primaryColor,
  //                     size: 16.sp,
  //                   ),
  //                   SizedBox(
  //                     width: .5.w,
  //                   ),
  //                   Icon(
  //                     CupertinoIcons.star_fill,
  //                     color: BaseColors.primaryColor,
  //                     size: 16.sp,
  //                   ),
  //                   SizedBox(
  //                     width: .5.w,
  //                   ),
  //                   Icon(
  //                     CupertinoIcons.star_fill,
  //                     color: BaseColors.primaryColor,
  //                     size: 16.sp,
  //                   ),
  //                   SizedBox(
  //                     width: .5.w,
  //                   ),
  //                   Icon(
  //                     CupertinoIcons.star_fill,
  //                     color: BaseColors.primaryColor,
  //                     size: 16.sp,
  //                   ),
  //                   SizedBox(
  //                     width: .5.w,
  //                   ),
  //                   Icon(
  //                     CupertinoIcons.star_fill,
  //                     color: BaseColors.primaryColor,
  //                     size: 16.sp,
  //                   ),
  //                 ],
  //               ),
  //               if(isTap)
  //               const Divider(),
  //               if(!isTap)
  //               BaseButton(
  //                   title: "ADD RATING",
  //                   verticalPadding: 1.h,
  //                   textSize: smallButtonTs,
  //                   onPressed: () {
  //                     isTap = true;
  //                     showMeetingFeedbackDialogue(context);
  //                     setState(() {});
  //                   },
  //               ),
  //               SizedBox(
  //                 height: 1.5.h,
  //               ),
  //               StepProgressView(
  //                 width: MediaQuery.of(context).size.width,
  //                 curStep: 4,
  //                 height: 20,
  //                 btnWidth: 20,
  //                 color: BaseColors.primaryColor,
  //                 titles: pendingMeetingdates2,
  //                 statuses: heading2,
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  showMeetingFeedbackDialogue(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: Dialog(
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
                          initialRating: 5,
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
                        SizedBox(height: 2.h,),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextField(
                              controller: TextEditingController(),
                              hintText: "Add feedback...",
                              maxLine: 4,
                            )),
                        SizedBox(height: 1.h,),
                        BaseButton(
                          btnType: 'mediumlarge',
                          title: 'SUBMIT',
                          onPressed: (){
                            Navigator.pop(context);
                          },borderRadius: 20,),
                        SizedBox(height: 2.h,),
                      ],
                    ),
                  );
                }),
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
