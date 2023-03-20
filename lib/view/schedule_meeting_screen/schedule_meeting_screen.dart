import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/schedule_meeting_screen/choose_meeting_date_time_popup.dart';
import 'package:staff_app/view/schedule_meeting_screen/create_meeting_screen.dart';
import 'package:staff_app/view/schedule_meeting_screen/meeting_cancel_reason_popup.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen_ctrl.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_with_popup.dart';

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
    tabCtrl = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(context, translate(context).schedule_meeting, [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: (){
              Get.to(const CreateMeetingScreen());
            },
            backgroundColor: CustomColors.backgroundColor,
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: CustomColors.primaryColor
                ),
                borderRadius: BorderRadius.circular(50.0)
            ),
            child: Icon(
              Icons.add,
              size: 25.sp,
              color: CustomColors.primaryColor,
            ),
          ),
          Text("Schedule\nMeeting", style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),textAlign: TextAlign.center,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                color: CustomColors.backgroundColor,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: CustomColors.borderColor
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                  const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                ],
              ),
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
                physics: const NeverScrollableScrollPhysics(),
                controller: tabCtrl,
                children: [
                  buildPendingView(),
                  buildPlannedView(),
                  buildCanceledView(),
                  buildCompletedView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return Container(
      height: 35,
      width: 100.w,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: TabBar(
        controller: tabCtrl,
        isScrollable: false,
        labelStyle: Style.montserratRegularStyle().copyWith(fontSize: 12),
        onTap: (value){

        },
        padding: const EdgeInsets.all(4),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]
        ),
        labelColor: CustomColors.primaryColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
        unselectedLabelColor: Colors.black,
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
      ),
    );
  }
  Widget buildPendingView(){
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/images/Vector (1).svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Schedule Date", "01/03/2022"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/time_icon.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Time Slot", "08:00 AM - 08:10 AM"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/family_img.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Meeting with", "Mohammad Usman"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/hat 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Designation", "Teacher Admin"),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/Group (1).svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Meeting Type", "Audio Call"),
                        SizedBox(
                          width: 2.w,
                        ),
                        SvgPicture.asset("assets/images/chat_img.svg"),
                      ],
                    ),
                    CustomButton(text: "Reminder", onPressed: (){}, btnHeight: 22,btnWidth: 22.w,textSize: 14.sp,),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: CustomButton(text: "RESCHEDULE", onPressed: (){}, btnHeight: 35, boxShadow: const [], borderRadius: 10.0, btnColor: Colors.white, borderColor: CustomColors.borderColor,textColor: CustomColors.textLightGreyColor, textSize: 15.sp,),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: CustomButton(text: "CANCEL", onPressed: (){

                      }, btnHeight: 35, boxShadow: const [], borderRadius: 10.0, btnColor: Colors.white, borderColor: CustomColors.borderColor,textColor: CustomColors.textLightGreyColor, textSize: 15.sp,),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: CustomButton(text: "ACCEPT", onPressed: (){}, btnHeight: 35, borderRadius: 10.0,textSize: 15.sp,),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: 1,
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
  Widget buildPlannedView(){
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/images/Vector (1).svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Schedule Date", "01/03/2022"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/time_icon.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Time Slot", "08:00 AM - 08:10 AM"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/family_img.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Meeting with", "Mohammad Usman"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/hat 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Designation", "Teacher Admin"),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/Group (1).svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        buildInfoItems("Meeting Type", "Audio Call"),
                        SizedBox(
                          width: 2.w,
                        ),
                        SvgPicture.asset("assets/images/chat_img.svg"),
                      ],
                    ),
                    CustomButton(text: "Start", onPressed: (){}, btnHeight: 22,btnWidth: 22.w,textSize: 14.sp,),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: CustomButton(text: "RESCHEDULE", onPressed: (){
                        showGeneralDialog(
                          context: context,
                          pageBuilder:  (context, animation, secondaryAnimation) {
                            return ChooseMeetingDateTimePopup(title: "Reschedule",);
                          },
                        );
                      }, btnHeight: 35, borderRadius: 10.0,textSize: 15.sp,),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Flexible(
                      flex: 1,
                      child: CustomButton(text: "CANCEL", onPressed: (){
                        showGeneralDialog(
                          context: context,
                          pageBuilder:  (context, animation, secondaryAnimation) {
                            return const MeetingCancelReasonPopup();
                          },
                        );
                      }, btnHeight: 35, boxShadow: const [], borderRadius: 10.0, btnColor: Colors.white, borderColor: CustomColors.borderColor,textColor: CustomColors.textLightGreyColor, textSize: 15.sp,),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: 1,
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
  Widget buildCanceledView(){
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/images/Vector (1).svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Schedule Date", "01/03/2022"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/time_icon.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Time Slot", "08:00 AM - 08:10 AM"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/family_img.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Meeting with", "Mohammad Usman"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/hat 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Designation", "Teacher Admin"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/Group (1).svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Meeting Type", "Audio Call"),
                    SizedBox(
                      width: 2.w,
                    ),
                    SvgPicture.asset("assets/images/chat_img.svg"),
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
                    Flexible(child: buildInfoItems("Reason", "This concern can be solved VIA chat, therefore, an appointment is not needed.")),
                    Image.asset(editPng, color: CustomColors.primaryColor, height: 18.sp,)
                  ],
                ),
                const Divider(),
                // Row(
                //   children: [
                //     Flexible(
                //       flex: 1,
                //       child: CustomButton(text: "RESCHEDULE", onPressed: (){
                //         showGeneralDialog(
                //           context: context,
                //           pageBuilder:  (context, animation, secondaryAnimation) {
                //             return ChooseMeetingDateTimePopup(title: "Reschedule",);
                //           },
                //         );
                //       }, btnHeight: 35, borderRadius: 10.0,textSize: 15.sp,),
                //     ),
                //     SizedBox(
                //       width: 2.w,
                //     ),
                //     Flexible(
                //       flex: 1,
                //       child: CustomButton(text: "CANCEL", onPressed: (){
                //         showGeneralDialog(
                //           context: context,
                //           pageBuilder:  (context, animation, secondaryAnimation) {
                //             return const MeetingCancelReasonPopup();
                //           },
                //         );
                //       }, btnHeight: 35, boxShadow: const [], borderRadius: 10.0, btnColor: Colors.white, borderColor: CustomColors.borderColor,textColor: CustomColors.textLightGreyColor, textSize: 15.sp,),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 2.h,
                ),
                StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: 2,
                  color: CustomColors.primaryColor,
                  titles: pendingMeetingdates1,
                  statuses: heading1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget buildCompletedView(){
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/images/Vector (1).svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Schedule Date", "01/03/2022"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/time_icon.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Time Slot", "08:00 AM - 08:10 AM"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/family_img.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Meeting with", "Mohammad Usman"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/hat 1.svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Designation", "Teacher Admin"),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/Group (1).svg"),
                    SizedBox(
                      width: 2.w,
                    ),
                    buildInfoItems("Meeting Type", "Audio Call"),
                    SizedBox(
                      width: 2.w,
                    ),
                    SvgPicture.asset("assets/images/chat_img.svg"),
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
                    Flexible(child: buildInfoItems("Meeting conclude", "Concern Solved")),
                    SizedBox(
                      width: 2.w,
                    ),
                    Image.asset(editPng, color: CustomColors.primaryColor, height: 17.sp,)
                  ],
                ),
                const Divider(),
                if(isTap)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Feedback: ",style: Style.montserratRegularStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
                    Icon(
                      CupertinoIcons.star_fill,
                      color: CustomColors.primaryColor,
                      size: 16.sp,
                    ),
                    SizedBox(
                      width: .5.w,
                    ),
                    Icon(
                      CupertinoIcons.star_fill,
                      color: CustomColors.primaryColor,
                      size: 16.sp,
                    ),
                    SizedBox(
                      width: .5.w,
                    ),
                    Icon(
                      CupertinoIcons.star_fill,
                      color: CustomColors.primaryColor,
                      size: 16.sp,
                    ),
                    SizedBox(
                      width: .5.w,
                    ),
                    Icon(
                      CupertinoIcons.star_fill,
                      color: CustomColors.primaryColor,
                      size: 16.sp,
                    ),
                    SizedBox(
                      width: .5.w,
                    ),
                    Icon(
                      CupertinoIcons.star_fill,
                      color: CustomColors.primaryColor,
                      size: 16.sp,
                    ),
                  ],
                ),
                if(isTap)
                const Divider(),
                if(!isTap)
                CustomButton(
                    btnHeight: 20,
                    text: "ADD RATING",
                    btnWidth: 22.w,
                    textSize: 10,
                    onPressed: () {
                      isTap = true;
                      setState(() {});
                    }),
                SizedBox(
                  height: 1.5.h,
                ),
                StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: 4,
                  height: 20,
                  btnWidth: 20,
                  textSize: 13.sp,
                  color: CustomColors.primaryColor,
                  titles: pendingMeetingdates2,
                  statuses: heading2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
