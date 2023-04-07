import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_colors.dart';
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
                    InkWell(
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
                                        // InkWell(
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
                                        JustTheTooltip(
                                          controller: tooltipController,
                                          tailBaseWidth: 10,
                                          tailLength: 10,
                                          elevation: 10.0,
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Material(
                                            shape: const CircleBorder(),
                                            elevation: 4.0,
                                            child: SvgPicture.asset("assets/images/information-button(1) 1.svg"),
                                          ),
                                          content:  Padding(
                                              padding: EdgeInsets.all(18.sp),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  addText(translate(context).evidence_required_for_the_approval, 14, Colors.black, FontWeight.w700),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: 3.0,
                                                        height: 3.0,
                                                        alignment: Alignment.center,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: Colors.black
                                                        ),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      addText("Medical Certificate Health", 12, Colors.black, FontWeight.normal),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: .5.h,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.center,
                                                        width: 3.0,
                                                        height: 3.0,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: Colors.black
                                                        ),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      addText("Health Condition Certificate", 12, Colors.black, FontWeight.normal),
                                                    ],
                                                  ),
                                                ],
                                              )
                                          ),
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
