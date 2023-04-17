import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_container_decoration.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

import '../../Utility/base_detail_data.dart';
import '../../Utility/base_dialogs.dart';

class EventsDetailScreen extends StatefulWidget {
  const EventsDetailScreen({Key? key}) : super(key: key);

  @override
  State<EventsDetailScreen> createState() => _EventsDetailScreenState();
}

class _EventsDetailScreenState extends State<EventsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Event Details"),
      body: Container(
        decoration: baseContainerDecoration(),
        margin: EdgeInsets.only(right: scaffoldPadding,left: scaffoldPadding,bottom: scaffoldPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(15.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        addText("School Picnic", 16.sp, BaseColors.textBlackColor, FontWeight.w700),
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
                    const Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/report.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        Flexible(child: buildInfoItems("Event Type", "Outside school"))
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
                        Flexible(child: buildInfoItems("Description", "We are hosting a event as School Picnic for the stars to cheer up with the school mats inside the school will have a lot of activity to do for fun. all the interested stars can register for the event."))
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/Vector (1).svg",detailsLabel: 'Event Creation Date Time',detailsValue: "09/09/2022")),
                        Expanded(flex: 1,child: BaseDetailData(icon: "assets/images/time_icon.svg",detailsLabel: '09:13pm')),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/Vector (1).svg",detailsLabel: 'Start Date Time',detailsValue: "09/09/2022")),
                        Expanded(flex: 1,child: BaseDetailData(icon: "assets/images/time_icon.svg",detailsLabel: '09:13pm')),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/Vector (1).svg",detailsLabel: 'End Date Time',detailsValue: "09/09/2022")),
                        Expanded(flex: 1,child: BaseDetailData(icon: "assets/images/time_icon.svg",detailsLabel: '09:13pm')),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/Vector (1).svg",detailsLabel: 'Reporting Date Time',detailsValue: "09/09/2022")),
                        Expanded(flex: 1,child: BaseDetailData(icon: "assets/images/time_icon.svg",detailsLabel: '09:13pm')),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/Vector (1).svg",detailsLabel: 'End Date for Registration',detailsValue: "09/09/2022")),
                        Expanded(flex: 1,child: BaseDetailData(icon: "assets/images/time_icon.svg",detailsLabel: '09:13pm')),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/report.svg",detailsLabel: 'Transport Facility',detailsValue: "No")),
                        Expanded(flex: 2,child: BaseDetailData(detailsLabel: 'Canteen Facility',detailsValue: "Yes")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/user.svg",detailsLabel: 'Staff',detailsValue: "2")),
                        Expanded(flex: 2,child: BaseDetailData(detailsLabel: 'Teacher',detailsValue: "3")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/user.svg",detailsLabel: 'Nurse',detailsValue: "1")),
                        Expanded(flex: 2,child: BaseDetailData(detailsLabel: 'Security Staff',detailsValue: "3")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/report.svg",detailsLabel: 'Start Destination',detailsValue: "Jaipur")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 2,child: BaseDetailData(icon: "assets/images/report.svg",detailsLabel: 'End Destination',detailsValue: "Jaipur")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        BaseDetailData(icon: "assets/images/user.svg",detailsLabel: 'Budget',detailsValue: "100 AED"),
                      ],
                    ),
                    const Divider(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: BaseColors.borderColor),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Stars :",style: TextStyle(fontSize: primaryHeadingTs,fontWeight: FontWeight.w500)),
                          SizedBox(height: 8),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                            Expanded(child: Row(mainAxisSize: MainAxisSize.min,children: [SvgPicture.asset("assets/images/star 9.svg",height: 17,),SizedBox(width: 6),Text("Sania Khan")])),
                            Expanded(child: Row(mainAxisSize: MainAxisSize.min,children: [SvgPicture.asset("assets/images/star 9.svg",height: 17,),SizedBox(width: 6),Text("Sania Khan")])),
                          ]),
                          SizedBox(height: 8),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                            Expanded(child: Row(mainAxisSize: MainAxisSize.min,children: [SvgPicture.asset("assets/images/star 9.svg",height: 17,),SizedBox(width: 6),Text("Sania Khan")])),
                            Expanded(child: Row(mainAxisSize: MainAxisSize.min,children: [SvgPicture.asset("assets/images/star 9.svg",height: 17,),SizedBox(width: 6),Text("Sania Khan")])),
                          ]),
                          SizedBox(height: 8),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                            Expanded(child: Row(mainAxisSize: MainAxisSize.min,children: [SvgPicture.asset("assets/images/star 9.svg",height: 17,),SizedBox(width: 6),Text("Sania Khan")])),
                            Expanded(child: Row(mainAxisSize: MainAxisSize.min,children: [SvgPicture.asset("assets/images/star 9.svg",height: 17,),SizedBox(width: 6),Text("Sania Khan")])),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/report.svg",detailsLabel: 'Grade',detailsValue: "Grade4")),
                        Expanded(flex: 2,child: BaseDetailData(detailsLabel: 'Class',detailsValue: "H1,H2,H3")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/report.svg",detailsLabel: 'Stars',detailsValue: "40")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/report.svg",detailsLabel: 'Grade',detailsValue: "Grade5")),
                        Expanded(flex: 2,child: BaseDetailData(detailsLabel: 'Class',detailsValue: "H1,H2,H3")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/user.svg",detailsLabel: 'Stars',detailsValue: "40")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(flex: 3,child: BaseDetailData(icon: "assets/images/user.svg",detailsLabel: 'Total Passengers',detailsValue: "40")),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: BaseButton(title: "APPROVE", onPressed: (){
                          BaseDialogs().showOkDialog(title: "Your event approved!");
                        })),
                        SizedBox(width: 14),
                        Expanded(child: BaseButton(title: "REJECT", onPressed: (){
                          BaseDialogs().showRejectDialog(hintText: "Why are you rejecting this event?");
                        },isActive: false)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
