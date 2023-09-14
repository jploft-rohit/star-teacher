import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/Utility/base_container_decoration.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

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
        margin: EdgeInsets.only(
            right: scaffoldPadding,
            left: scaffoldPadding,
            bottom: 80),
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
                        addText("School Picnic", 16.sp,
                            BaseColors.textBlackColor, FontWeight.w700),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 1.4.h),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: BaseColors.primaryColorLight,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              width: 1, color: BaseColors.primaryColor),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 0),
                                color: Colors.grey,
                                blurRadius: 6)
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                              "assets/images/ic-coin.svg",
                              height: 22,
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Text.rich(
                              textAlign: TextAlign.center,
                                TextSpan(
                                    children: [
                              TextSpan(text: "Allocated Budget:",style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: ColorConstants.primaryColor,fontWeight: FontWeight.w400)),
                              const WidgetSpan(child: SizedBox(width: 2)),
                              TextSpan(text: "5000 AED",style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: ColorConstants.primaryColor,fontWeight: FontWeight.w700)),
                            ])),
                          ),
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                              "assets/images/ic-coin.svg",
                              height: 22,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/images/Vector (1).svg"),
                          SizedBox(
                            width: 2.w,
                          ),
                          Flexible(
                              child:
                                  buildInfoItems("Create Date", "01/03/2022"))
                        ],
                      ),
                    ),
                    const Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/images/time_icon.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        Flexible(
                            child: buildInfoItems("Create Time", "09:13pm"))
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
                        Flexible(
                            child:
                                buildInfoItems("Event Type", "Outside school"))
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
                        Flexible(
                            child: buildInfoItems("Description",
                                "We are hosting a event as School Picnic for the stars to cheer up with the school mats inside the school will have a lot of activity to do for fun. all the interested stars can register for the event."))
                      ],
                    ),
                    // const Divider(),
                    // // Row(
                    // //   children: [
                    // //     Expanded(
                    // //         flex: 3,
                    // //         child: BaseDetailData(
                    // //             icon: "assets/images/Vector (1).svg",
                    // //             detailsLabel: 'Event Creation Date Time',
                    // //             detailsValue: "09/09/2022")),
                    // //     Expanded(
                    // //         flex: 1,
                    // //         child: BaseDetailData(
                    // //             icon: "assets/images/time_icon.svg",
                    // //             detailsLabel: '09:13pm')),
                    // //   ],
                    // // ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/Vector (1).svg",
                                detailsLabel: 'Start Date Time',
                                detailsValue: "09/09/2022")),
                        Expanded(
                            flex: 1,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/time_icon.svg",
                                detailsLabel: '09:13pm')),
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
                        Flexible(
                            child: buildInfoItems(
                                "Start Destination", "Ignite Public School"))
                      ],
                    ),

                    Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/Vector (1).svg",
                                detailsLabel: 'End Date Time',
                                detailsValue: "09/09/2022")),
                        Expanded(
                            flex: 1,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/time_icon.svg",
                                detailsLabel: '09:13pm')),
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
                        Flexible(
                            child: buildInfoItems(
                                "End Destination", "Ignite Public School"))
                      ],
                    ),
                    Divider(),

                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/Vector (1).svg",
                                detailsLabel: 'Reporting Date Time',
                                detailsValue: "09/09/2022")),
                        Expanded(
                            flex: 1,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/time_icon.svg",
                                detailsLabel: '09:13pm')),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/Vector (1).svg",
                                detailsLabel: 'End Date for Registration',
                                detailsValue: "09/09/2022")),
                        Expanded(
                            flex: 1,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/time_icon.svg",
                                detailsLabel: '09:13pm')),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/report.svg",
                                detailsLabel: 'Transport Facility',
                                detailsValue: "No")),
                        Expanded(
                            flex: 2,
                            child: BaseDetailData(
                                detailsLabel: 'Canteen Facility',
                                detailsValue: "Yes")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/user.svg",
                                detailsLabel: 'Staff',
                                detailsValue: "2")),
                        Expanded(
                            flex: 2,
                            child: BaseDetailData(
                                detailsLabel: 'Teacher', detailsValue: "3")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/user.svg",
                                detailsLabel: 'Nurse',
                                detailsValue: "1")),
                        Expanded(
                            flex: 2,
                            child: BaseDetailData(
                                detailsLabel: 'Security Staff',
                                detailsValue: "3")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/report.svg",
                                detailsLabel: 'Estimated Entrance Cost',
                                detailsValue: "10 AED")),
                      ],
                    ),

                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/report.svg",
                                detailsLabel: 'Estimated Trip Cost',
                                detailsValue: "40 AED")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/report.svg",
                                detailsLabel: 'Estimated Food Cost',
                                detailsValue: "40 AED")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        BaseDetailData(
                            prefixIcon: "assets/images/report.svg",
                            detailsLabel: 'Estimated Cost Per Star',
                            detailsValue: "100 AED"),
                      ],
                    ),
                    const Divider(),
                    // Container(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: BaseColors.borderColor),
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text("Stars :",
                    //           style: TextStyle(
                    //               fontSize: primaryHeadingTs,
                    //               fontWeight: FontWeight.w500)),
                    //       SizedBox(height: 8),
                    //       Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //             Expanded(
                    //                 child: Row(
                    //                     mainAxisSize: MainAxisSize.min,
                    //                     children: [
                    //                   SvgPicture.asset(
                    //                     "assets/images/star 9.svg",
                    //                     height: 17,
                    //                   ),
                    //                   SizedBox(width: 6),
                    //                   Text("Sania Khan")
                    //                 ])),
                    //             Expanded(
                    //                 child: Row(
                    //                     mainAxisSize: MainAxisSize.min,
                    //                     children: [
                    //                   SvgPicture.asset(
                    //                     "assets/images/star 9.svg",
                    //                     height: 17,
                    //                   ),
                    //                   SizedBox(width: 6),
                    //                   Text("Sania Khan")
                    //                 ])),
                    //           ]),
                    //       SizedBox(height: 8),
                    //       Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //             Expanded(
                    //                 child: Row(
                    //                     mainAxisSize: MainAxisSize.min,
                    //                     children: [
                    //                   SvgPicture.asset(
                    //                     "assets/images/star 9.svg",
                    //                     height: 17,
                    //                   ),
                    //                   SizedBox(width: 6),
                    //                   Text("Sania Khan")
                    //                 ])),
                    //             Expanded(
                    //                 child: Row(
                    //                     mainAxisSize: MainAxisSize.min,
                    //                     children: [
                    //                   SvgPicture.asset(
                    //                     "assets/images/star 9.svg",
                    //                     height: 17,
                    //                   ),
                    //                   SizedBox(width: 6),
                    //                   Text("Sania Khan")
                    //                 ])),
                    //           ]),
                    //       SizedBox(height: 8),
                    //       Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: [
                    //             Expanded(
                    //                 child: Row(
                    //                     mainAxisSize: MainAxisSize.min,
                    //                     children: [
                    //                   SvgPicture.asset(
                    //                     "assets/images/star 9.svg",
                    //                     height: 17,
                    //                   ),
                    //                   SizedBox(width: 6),
                    //                   Text("Sania Khan")
                    //                 ])),
                    //             Expanded(
                    //                 child: Row(
                    //                     mainAxisSize: MainAxisSize.min,
                    //                     children: [
                    //                   SvgPicture.asset(
                    //                     "assets/images/star 9.svg",
                    //                     height: 17,
                    //                   ),
                    //                   SizedBox(width: 6),
                    //                   Text("Sania Khan")
                    //                 ])),
                    //           ]),
                    //     ],
                    //   ),
                    // ),

                    // SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/report.svg",
                                detailsLabel: 'Grade',
                                detailsValue: "Grade4")),
                        Expanded(
                            flex: 2,
                            child: BaseDetailData(
                                detailsLabel: 'Class',
                                detailsValue: "H1,H2,H3")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/report.svg",
                                detailsLabel: 'Stars',
                                detailsValue: "40")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/report.svg",
                                detailsLabel: 'Grade',
                                detailsValue: "Grade5")),
                        Expanded(
                            flex: 2,
                            child: BaseDetailData(
                                detailsLabel: 'Class',
                                detailsValue: "H1,H2,H3")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/user.svg",
                                detailsLabel: 'Stars',
                                detailsValue: "40")),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: BaseDetailData(
                                prefixIcon: "assets/images/user.svg",
                                detailsLabel: 'Total Passengers',
                                detailsValue: "40")),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                            child: BaseButton(
                                title: "APPROVE",
                                onPressed: () {
                                  BaseOverlays().showOkDialog(
                                      title: "Your event approved!");
                                },btnType: mediumLargeButton,)),
                        SizedBox(width: 14),
                        Expanded(
                            child: BaseButton(
                                title: "REJECT",
                                onPressed: () {
                                  BaseOverlays().showRejectDialog(
                                      hintText:
                                          "Why are you rejecting this event?");
                                },
                                isActive: false,btnType: mediumLargeButton,)),
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
