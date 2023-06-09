import 'package:flutter/material.dart';
import 'package:staff_app/backend/responses_model/scheduled_meeting_response.dart';
import 'package:staff_app/view/schedule_meeting_screen/controller/schedule_meeting_screen_ctrl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/base_utility.dart';

class ChooseMeetingDateTimePopup extends StatefulWidget {
  final String title;
  final ScheduledMeetingData? data;
  ChooseMeetingDateTimePopup({Key? key, required this.title, this.data}) : super(key: key);

  @override
  State<ChooseMeetingDateTimePopup> createState() => _ChooseMeetingDateTimePopupState();
}

class _ChooseMeetingDateTimePopupState extends State<ChooseMeetingDateTimePopup> {
  List<Map<String, dynamic>> list = [
    {
      "title":"09:00:00",
      "isSelected":true,
    },
    {
      "title":"09:30:00",
      "isSelected":false,
    },
    {
      "title":"10:00:00",
      "isSelected":false,
    },
    {
      "title":"10:30:00",
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
                      firstDay: DateTime.now(),
                      lastDay: DateTime.utc(DateTime.now().year+1, 12, 1),
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
                      onDaySelected: (DateTime selectDay, DateTime focusDay) {
                        controller.selectedDay = selectDay;
                        controller.focusedDay = focusDay;
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
                GetBuilder<ScheduleMeetingScreenCtrl>(
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            for (var i in list) {
                              i['isSelected'] = false;
                            }
                            list[index]['isSelected'] = !list[index]['isSelected'];
                            for (var i in list) {
                              if(i['isSelected']){
                                controller.selectedTime.value = i['title'];
                              }
                            }
                            setState(() {});
                            Get.back();
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            padding: EdgeInsets.all(14.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                    color: BaseColors.primaryColor)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(""),
                                Text(list[index]['title'],
                                  style: Style.montserratMediumStyle().copyWith(
                                      color: BaseColors.primaryColor,
                                      fontSize: 17.sp),),
                                Checkbox(
                                  visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  side: BorderSide(color: Colors.transparent),
                                  activeColor: BaseColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  value: list[index]['isSelected'],
                                  onChanged: (value) {
                                    for (var i in list) {
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
