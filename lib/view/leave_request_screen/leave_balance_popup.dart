import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class LeaveBalancePopup extends StatefulWidget {
  const LeaveBalancePopup({Key? key}) : super(key: key);

  @override
  State<LeaveBalancePopup> createState() => _LeaveBalancePopupState();
}

class _LeaveBalancePopupState extends State<LeaveBalancePopup> {

  List<Map<String, dynamic>> leaveBalanceList = [
    {
      "title": "Annual leave",
      "balance": "2",
      "balance1": "2",
    },
    {
      "title": "Compassionate leave",
      "balance": "6",
      "balance1": "6",
    },
    {
      "title": "Sick leave",
      "balance": "1",
      "balance1": "1",
    },
    {
      "title": "Local escort leave",
      "balance": "6",
      "balance1": "6",
    },
    {
      "title": "Abroad escort leave",
      "balance": "2",
      "balance1": "2",
    },
    {
      "title": "National service leave",
      "balance": "1",
      "balance1": "1",
    },
    {
      "title": "Event leave",
      "balance": "1",
      "balance1": "1",
    },
    {
      "title": "Hajj leave",
      "balance": "6",
      "balance1": "6",
    },
    {
      "title": "Paternity Leave",
      "balance": "2",
      "balance1": "2",
    },
    {
      "title": "Maternity Leave",
      "balance": "2",
      "balance1": "2",
    },
    {
      "title": "Leave without pay",
      "balance": "1",
      "balance1": "1",
    },

  ];

  final tooltipController = JustTheController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    Text(translate(context).leave_balance, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  color: Colors.white,
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(1.5),
                      2: FlexColumnWidth(1),
                    },
                    children: [
                      TableRow(
                          children: [
                            Text(translate(context).leave_type,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                            Text(translate(context).allocated,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                            Text(translate(context).balance,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                          ]),

                    ],
                  ),
                ),
                Divider(),
                ListView.builder(
                  itemCount: leaveBalanceList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const {
                              0: FlexColumnWidth(3),
                              1: FlexColumnWidth(1.5),
                              2: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                  children: [
                                    Row(
                                      children: [
                                        Text(leaveBalanceList[index]['title'], style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        // GestureDetector(
                                        //   onTap: (){
                                        //     SuperTooltip(
                                        //       popupDirection: TooltipDirection.down,
                                        //       content: new Material(
                                        //           child: Text(
                                        //             "Lorem ipsum dolor sit amet, consetetur sadipscingelitr, "
                                        //                 "sed diam nonumy eirmod tempor invidunt ut laboreet dolore magna aliquyam erat, "
                                        //                 "sed diam voluptua. At vero eos et accusam et justoduo dolores et ea rebum. ",
                                        //             softWrap: true,
                                        //           )),
                                        //     ).show(context);
                                        //   },
                                        //   child: SvgPicture.asset("assets/images/information-button(1) 1.svg"),)
                                        Tooltip(
                                          showDuration: const Duration(seconds: 10),
                                          margin: const EdgeInsets.symmetric(horizontal: 30),
                                          textStyle: TextStyle(
                                            color: BaseColors.primaryColor,
                                            fontSize: 1.8.h - 1,
                                          ),
                                          decoration: BoxDecoration(
                                            color: BaseColors.secondaryColor,
                                            border: Border.all(color: BaseColors.primaryColor),
                                            // boxShadow: [getDeepBoxShadow()],
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          triggerMode: TooltipTriggerMode.tap,
                                          padding: const EdgeInsets.symmetric(horizontal: 6),
                                          // controller: tooltipController,
                                          // tailBaseWidth: 10,
                                          // tailLength: 10,
                                          // elevation: 10.0,
                                          // borderRadius: BorderRadius.circular(10.0),
                                          // child: Material(
                                          //   shape: const CircleBorder(),
                                          //   elevation: 4.0,
                                          //   child: SvgPicture.asset("assets/images/information-button(1) 1.svg"),
                                          // ),
                                          message: "Medical Certificate Health",
                                          child:  SvgPicture.asset("assets/images/information-button(1) 1.svg"),
                                        )
                                      ],
                                    ),
                                    Text(leaveBalanceList[index]['balance'], style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                    Text(leaveBalanceList[index]['balance'], style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                  ]),
                            ],
                          ),
                        ),
                        if(leaveBalanceList.length - 1 != index)
                        Divider(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
