import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/view/annual_schedule/controller/annual_schedule_ctrl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


import '../../constants-classes/color_constants.dart';
import '../../utility/images_icon_path.dart';
import 'annual_schedule.dart';

class AnnualViewCalendarScreen extends StatefulWidget {
  final int index;
  const AnnualViewCalendarScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<AnnualViewCalendarScreen> createState() => _AnnualViewCalendarScreenState();
}

class _AnnualViewCalendarScreenState extends State<AnnualViewCalendarScreen> {
  AnnualScheduleCtrl controller = Get.find<AnnualScheduleCtrl>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar:BaseAppBar(
        title: controller.list?[widget.index].title??"",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          calendar(),
          SizedBox(height: 3.h),
          ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(controller.list?[widget.index].title??"",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 17.sp)),
            leading: BaseImageNetwork(link: controller.list?[widget.index].icon??"",height: 2.h,width: 2.h),
            tileColor: Color(int.parse(controller.list?[widget.index].color??"")),
              subtitle: Text("${getMonthDate(controller.list?[widget.index].startDate??"")} ${translate(context).to} ${getMonthDate(controller.list?[widget.index].endDate??"")}",style: TextStyle(color: Colors.grey.shade700,fontSize: 15.sp)),
            trailing: SvgPicture.asset(calenderDateSvg),
            minLeadingWidth: 0,
          )
        ],
      ),

    );
  }
  calendar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0XFFF8F8F8),
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
                    const SizedBox(width: 5),
                    Text(
                      translate(context).holiday,
                      style: TextStyle(
                        color: const Color(0XFF7C7C7C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    Container(
                      height: 13,
                      width: 13,
                      decoration: BoxDecoration(
                        color: const Color(0xff19AD54),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      translate(context).exam,
                      style: TextStyle(
                        color: const Color(0XFF7C7C7C),
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
              absorbing: false,
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
                    DateTime.parse(controller.list?[widget.index].startDate??""),
                    DateTime.parse(controller.list?[widget.index].endDate??""),
                ),
                minDate: DateTime(2010, 10, 16),
                maxDate: DateTime(2030, 3, 14),
                initialDisplayDate: DateTime.parse(controller.list?[widget.index].startDate??""),
                startRangeSelectionColor: Color(int.parse(controller.list?[widget.index].color??"")),
                endRangeSelectionColor: Color(int.parse(controller.list?[widget.index].color??"")),
                rangeSelectionColor: Color(int.parse(controller.list?[widget.index].color??"")).withOpacity(0.5),
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
                selectionTextStyle: const TextStyle(
                  color: Colors.black,
                ),
                onSelectionChanged:
                    (DateRangePickerSelectionChangedArgs range) {
                  // Add your code here to handle selected date range
                },
                monthCellStyle: DateRangePickerMonthCellStyle(
                  startRangeSelectionColor: Color(int.parse(controller.list?[widget.index].color??"")),
                  endRangeSelectionColor: Color(int.parse(controller.list?[widget.index].color??"")),
                  todayTextStyle: const TextStyle(
                    color: ColorConstants.primaryColor,
                  ),
                  weekendTextStyle: const TextStyle(
                    color: ColorConstants.primaryColor,
                  ),
                  selectionColor: Color(int.parse(controller.list?[widget.index].color??"")),
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


