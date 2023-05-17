import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


import '../../constants-classes/color_constants.dart';
import 'annual_schedule.dart';

class AnnualViewCalendarScreen extends StatefulWidget {
  String? icon;
  Color? bg;
  Color? iconColor;
  String? title;
  String? time;
  AnnualViewCalendarScreen({Key? key,required this.title,required this.icon,required this.time,required this.bg,required this.iconColor}) : super(key: key);

  @override
  State<AnnualViewCalendarScreen> createState() => _AnnualViewCalendarScreenState();
}

class _AnnualViewCalendarScreenState extends State<AnnualViewCalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar:BaseAppBar(
        title: widget.title,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          calendar(),
          SizedBox(height: 3.h,),
          card(
            icon: widget.icon!,
            bg: widget.bg!,
            iconColor: widget.iconColor!,
            title: widget.title!,
            time: widget.time!, context: context,
            isNextSCreen: false
          ),
        ],
      ),

    );
  }
  calendar() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFF8F8F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 13,
                      width: 13,
                      decoration: BoxDecoration(
                        color: ColorConstants.primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Holiday',
                      style: TextStyle(
                        color: Color(0XFF7C7C7C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Container(
                      height: 13,
                      width: 13,
                      decoration: BoxDecoration(
                        color: Color(0xff19AD54),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Exam',
                      style: TextStyle(
                        color: Color(0XFF7C7C7C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 2.h,),
            AbsorbPointer(
              child: SfDateRangePicker(
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    color: ColorConstants.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Arial",
                  ),
                ),
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(
                    DateTime.now().subtract(const Duration(days: 2)),
                    DateTime.now().add(const Duration(days: 3))),
                minDate: DateTime(2010, 10, 16),
                maxDate: DateTime(2030, 3, 14),
                initialDisplayDate: DateTime.now(),
                startRangeSelectionColor: widget.iconColor,
                endRangeSelectionColor: widget.iconColor,
                rangeSelectionColor: widget.bg,
                monthViewSettings: DateRangePickerMonthViewSettings(
                  // showWeekNumber: true,
                  firstDayOfWeek: 1,
                  showTrailingAndLeadingDates: true,

                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                    backgroundColor: Colors.transparent,
                    textStyle: TextStyle(
                      color: ColorConstants.primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
                selectionShape: DateRangePickerSelectionShape.rectangle,
                selectionTextStyle: TextStyle(
                  color: Colors.white,
                ),
                onSelectionChanged:
                    (DateRangePickerSelectionChangedArgs range) {
                  // Add your code here to handle selected date range
                },
                monthCellStyle: DateRangePickerMonthCellStyle(
                  startRangeSelectionColor: widget.iconColor,
                  endRangeSelectionColor: widget.iconColor,
                  todayTextStyle: TextStyle(
                    color: ColorConstants.primaryColor,
                  ),
                  weekendTextStyle: const TextStyle(
                    color: ColorConstants.primaryColor,
                  ),
                  selectionColor: widget.iconColor,
                  // selectionRadius: 12,
                  // selectionBorderColor: widget.iconColor ?? Colors.transparent,
                  leadingDatesTextStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


