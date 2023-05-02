import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen_ctrl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/utility.dart';

class ChooseMeetingDateTimePopup extends StatefulWidget {
  String title;

  ChooseMeetingDateTimePopup({Key? key, required this.title}) : super(key: key);

  @override
  State<ChooseMeetingDateTimePopup> createState() => _ChooseMeetingDateTimePopupState();
}

class _ChooseMeetingDateTimePopupState extends State<ChooseMeetingDateTimePopup> {
  List<Map<String, dynamic>> list = [
    {
      "title":"9:00am",
      "isSelected":true,
    },
    {
      "title":"9:30am",
      "isSelected":false,
    },
    {
      "title":"10:00am",
      "isSelected":false,
    },
    {
      "title":"10:30am",
      "isSelected":false,
    },
  ];
  List<String> weekDayList = [
    "M",
    "T",
    "W",
    "T",
    "F",
    "S",
    "S",
  ];
  List<String> monthList = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  @override
  Widget build(BuildContext context) {
    // final calendarCarouselNoHeader = CalendarCarousel<Event>(
    //   onDayPressed: (date, events) {},
    //   daysHaveCircularBorder: true,
    //   showOnlyCurrentMonthDate: false,
    //   selectedDateTime: DateTime.now(),
    //   weekendTextStyle: TextStyle(
    //       color: CustomColors.primaryColor,
    //       fontWeight: FontWeight.normal,
    //       fontSize: 16),
    //   daysTextStyle: TextStyle(
    //       color: CustomColors.textBlackColor,
    //       fontWeight: FontWeight.normal,
    //       fontSize: 16),
    //   // thisMonthDayBorderColor: Colors.grey,
    //   weekFormat: false,
    //   markedDatesMap: EventList<Event>(
    //     events: {},
    //   ),
    //   height: 45.h,
    //
    //   selectedDayButtonColor: Colors.transparent,
    //   selectedDayBorderColor: Colors.transparent,
    //   customGridViewPhysics: const NeverScrollableScrollPhysics(),
    //   leftButtonIcon: Icon(
    //     Icons.arrow_back_ios,
    //     color: CustomColors.primaryColor,
    //     size: 2.h,
    //   ),
    //   rightButtonIcon: Icon(
    //     Icons.arrow_forward_ios,
    //     color: CustomColors.primaryColor,
    //     size: 2.h,
    //   ),
    //   // markedDateMoreCustomTextStyle: const TextStyle(color: CustomColors.white),
    //   // markedDateMoreCustomDecoration: const BoxDecoration(color: CustomColors.gretTextColor, shape: BoxShape.circle),
    //   // markedDateCustomShapeBorder: const CircleBorder(side: BorderSide(color: CustomColors.blue,strokeAlign: StrokeAlign.inside)),
    //   markedDateCustomTextStyle: const TextStyle(
    //       color: CustomColors.textBlackColor,
    //       fontWeight: FontWeight.normal,
    //       fontSize: 16),
    //   // markedDateShowIcon: true,
    //   // markedDateIconMaxShown: 2,
    //   // markedDateIconBuilder: (event) {
    //   //   return event.icon;
    //   // },
    //   markedDateMoreShowTotal: true,
    //   showHeader: true,
    //   headerTextStyle: TextStyle(
    //       color: CustomColors.textBlackColor,
    //       fontWeight: FontWeight.bold,
    //       fontSize: 1.9.h),
    //   showHeaderButton: true,
    //   weekDayFormat: WeekdayFormat.narrow,
    //   todayTextStyle: TextStyle(
    //       color: CustomColors.textBlackColor,
    //       fontWeight: FontWeight.normal,
    //       fontSize: 16),
    //   todayButtonColor: Colors.transparent,
    //   todayBorderColor: Colors.transparent,
    //   selectedDayTextStyle: TextStyle(
    //       color: CustomColors.textLightGreyColor,
    //       fontWeight: FontWeight.normal,
    //       fontSize: 16),
    //   minSelectedDate: DateTime.now().subtract(const Duration(days: 360)),
    //   maxSelectedDate: DateTime.now().add(const Duration(days: 360)),
    //   prevDaysTextStyle: TextStyle(
    //       color: CustomColors.textLightGreyColor,
    //       fontWeight: FontWeight.normal,
    //       fontSize: 16),
    //   nextDaysTextStyle: TextStyle(
    //       color: CustomColors.textLightGreyColor,
    //       fontWeight: FontWeight.normal,
    //       fontSize: 16),
    //   weekdayTextStyle: TextStyle(
    //       color: CustomColors.primaryColor,
    //       fontWeight: FontWeight.normal,
    //       fontSize: 16),
    //   inactiveDaysTextStyle: TextStyle(
    //       color: CustomColors.textLightGreyColor,
    //       fontWeight: FontWeight.normal,
    //       fontSize: 16),
    //   onCalendarChanged: (DateTime date) {},
    //   onDayLongPressed: (DateTime date) {
    //     Get.log('long pressed date $date');
    //   },
    // );
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    Text("      ${widget.title}", style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: Colors.black),),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                GetBuilder<ScheduleMeetingScreenCtrl>(
                  builder: (controller) {
                    return TableCalendar(
                      // calendarStyle: ,
                      weekendDays: const [DateTime.sunday],
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: Style.montserratMediumStyle().copyWith(fontSize: 16.sp, color: BaseColors.primaryColor),
                        weekendStyle: Style.montserratMediumStyle().copyWith(fontSize: 16.sp, color: BaseColors.primaryColor),
                        dowTextFormatter: (date, locale) {
                          return weekDayList[date.weekday-1];
                        },
                      ),
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: Get.find<ScheduleMeetingScreenCtrl>().selectedDay,
                      calendarFormat: Get.find<ScheduleMeetingScreenCtrl>().format,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: BaseColors.textBlackColor),
                        titleTextFormatter: (date, locale) {
                          return "${monthList[date.month-1]}";
                        },
                        rightChevronIcon: Icon(Icons.chevron_right, color: BaseColors.primaryColor),
                        leftChevronIcon: Icon(
                          Icons.chevron_left,
                          color: BaseColors.primaryColor,
                        ),
                      ),

                      onFormatChanged: (CalendarFormat _format) {
                        // controller.format = _format;
                        // controller.update();
                      },
                      //Day Changed on select
                      onDaySelected:
                          (DateTime selectDay, DateTime focusDay) {
                        controller.selectedDay =
                            selectDay;
                        controller.focusedDay =
                            focusDay;
                        controller.update();
                      },
                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(controller.selectedDay, date);
                      },

                      // calender style
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          border: Border.all(
                              color: BaseColors.primaryColor),
                          color: BaseColors.backgroundColor,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: const TextStyle(
                            color: BaseColors.primaryColor),

                        // today
                        todayDecoration: const BoxDecoration(
                          color: BaseColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        //  weekend
                        //   weekendDecoration: BoxDecoration(
                        //     // color: Colors.red,
                        //     shape: BoxShape.rectangle,
                        //     borderRadius: BorderRadius.circular(5.0),
                        //   ),
                        weekendTextStyle: const TextStyle(
                            color: BaseColors.primaryColor),
                        //   weekNumberTextStyle: const TextStyle(color: CustomColors.primaryColor)
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text("Select Time Slot", style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: Colors.black),),
                SizedBox(
                  height: 1.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        for(var i in list){
                          i['isSelected'] = false;
                        }
                        list[index]['isSelected'] = !list[index]['isSelected'];
                        setState(() {});
                        Get.back();
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        padding: EdgeInsets.all(14.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: BaseColors.primaryColor)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(""),
                            Text(list[index]['title'], style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 17.sp),),
                            Checkbox(
                              visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              side: BorderSide(color: Colors.transparent),
                              activeColor: BaseColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              value: list[index]['isSelected'],
                              onChanged: (value){
                                for(var i in list){
                                  i['isSelected'] = false;
                                }
                                list[index]['isSelected'] = !list[index]['isSelected'];
                                setState(() {});
                              },
                            )
                          ],
                        ),
                      ),
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
