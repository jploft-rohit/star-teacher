// import 'package:flutter/material.dart';
// import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:staff_app/backend/api_end_points.dart';
// import 'package:staff_app/constants-classes/color_constants.dart';
// import 'package:staff_app/utility/base_utility.dart';
// import 'package:staff_app/view/attendance_screen/attendance_screen_ctrl.dart';
// import '../../../utility/intl/src/intl/date_format.dart';
//
// class CalendarView extends StatefulWidget {
//   const CalendarView({Key? key}) : super(key: key);
//
//   @override
//   State<CalendarView> createState() => _CalendarViewState();
// }
//
// class _CalendarViewState extends State<CalendarView> {
//   // var controller = Get.find<AttendanceController>();
//   AttendanceScreenController controller = Get.find<AttendanceScreenController>();
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
//
// // class CalendarView extends GetView<AttendanceController> {
// //    CalendarView({super.key});
//   List<DateTime> value = [];
//   // String selectedAttendanceType = "present";
//   String selectedAttendanceType = "present";
//   @override
//   void initState() {
//     super.initState();
//
//   }
//   @override
//   void didChangeDependencies() async{
//     await controller.getData(getMonthData: true).then((value) =>setState((){}));
//     super.didChangeDependencies();
//   }
//   @override
//   Widget build(BuildContext context) {
//     value = [];
//     // List<AttendanceDatum> list = controller.getDataForAttendance(type: selectedAttendanceType);
//     controller.list?.forEach((element) {
//       value.add(DateTime.parse(element?.date.toString().split("T")[0]??""));
//     });
//
//     final calendarCarouselNoHeader = CalendarCarousel<Event>(
//       onDayPressed: (date, events) {},
//       daysHaveCircularBorder: true,
//       showOnlyCurrentMonthDate: false,
//       customDayBuilder: (
//           bool isSelectable,
//           int index,
//           bool isSelectedDay,
//           bool isToday,
//           bool isPrevMonthDay,
//           TextStyle textStyle,
//           bool isNextMonthDay,
//           bool isThisMonthDay,
//           DateTime day,
//           ) {
//
//         if (value.contains(day)) {
//           return Container(
//             height: 30,
//             decoration: BoxDecoration(
//                 color: selectedAttendanceType == "absent" ? ColorConstants.lightTextColor :selectedAttendanceType == "present"?ColorConstants.lightGreen: ColorConstants.blue,
//                 borderRadius: BorderRadius.circular(12)),
//             child: Center(
//               child: Text(
//                 day.day.toString(),
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           );
//         } else {
//           return null;
//         }
//
//       },
//       weekendTextStyle: TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.normal, fontSize: getNormalTextFontSIze()),
//       daysTextStyle: TextStyle(color: ColorConstants.gretTextColor, fontWeight: FontWeight.normal, fontSize: getNormalTextFontSIze()),
//       // thisMonthDayBorderColor: Colors.grey,
//       weekFormat: false,
//       markedDatesMap: controller.markedDateMap,
//       height: 45.h,
//       selectedDayButtonColor: Colors.transparent,
//       selectedDayBorderColor: Colors.transparent,
//       customGridViewPhysics: const NeverScrollableScrollPhysics(),
//       leftButtonIcon: Icon(
//         Icons.arrow_back_ios,
//         color: ColorConstants.primaryColor,
//         size: getHeadingTextFontSIze(),
//       ),
//       rightButtonIcon: Icon(
//         Icons.arrow_forward_ios,
//         color: ColorConstants.primaryColor,
//         size: getHeadingTextFontSIze(),
//       ),
//       markedDateCustomTextStyle: TextStyle(color: ColorConstants.lightTextColor, fontWeight: FontWeight.normal, fontSize: getNormalTextFontSIze()),
//       markedDateMoreShowTotal: true,
//       showHeader: true,
//       headerTextStyle: TextStyle(color: ColorConstants.black, fontWeight: FontWeight.bold, fontSize: getSubheadingTextFontSIze()),
//       showHeaderButton: true,
//       weekDayFormat: WeekdayFormat.narrow,
//       todayTextStyle: TextStyle(color: ColorConstants.black, fontWeight: FontWeight.normal, fontSize: getNormalTextFontSIze()),
//       todayButtonColor: Colors.transparent,
//       todayBorderColor: Colors.transparent,
//       selectedDayTextStyle: TextStyle(color: ColorConstants.lightTextColor, fontWeight: FontWeight.normal, fontSize: getNormalTextFontSIze()),
//       minSelectedDate: DateTime.now().subtract(const Duration(days: 360)),
//       maxSelectedDate: DateTime.now().add(const Duration(days: 360)),
//       prevDaysTextStyle: TextStyle(color: ColorConstants.lightGreyColor, fontWeight: FontWeight.normal, fontSize: getNormalTextFontSIze()),
//       nextDaysTextStyle: TextStyle(color: ColorConstants.lightTextColor, fontWeight: FontWeight.normal, fontSize: getNormalTextFontSIze()),
//       weekdayTextStyle: TextStyle(color: ColorConstants.primaryColor, fontWeight: FontWeight.normal, fontSize: getNormalTextFontSIze()),
//       inactiveDaysTextStyle: TextStyle(color: ColorConstants.lightTextColor, fontWeight: FontWeight.normal, fontSize: getNormalTextFontSIze()),
//       onCalendarChanged: (DateTime date) {
//         final formatter = DateFormat('yyyy-MM');
//         var month = formatter.format(date);
//         print(month);
//         // if(!controller.isLoading.value){
//         //   controller.getAttendanceDataMonthWise(month:month).then((value) =>setState((){}));
//         // }
//
//       },
//       onDayLongPressed: (DateTime date) {
//         Get.log('long pressed date $date');
//       },
//       onRightArrowPressed: () {},
//       onLeftArrowPressed: () {},
//     );
//
//     return Scaffold(
//       backgroundColor: ColorConstants.white,
//       // appBar: PreferredSize(
//       //     preferredSize: Size.fromHeight(5.h),
//       //     child: AppHeader(
//       //       showBackIcon: true,
//       //       title: 'Calendar',
//       //     )),
//       body: Column(
//         children: [
//           /*   Container(
//             margin: const EdgeInsets.all(20),
//             padding: const EdgeInsets.all(15),
//             decoration: BoxDecoration(borderRadius: getCurvedBorderRadius(), border: Border.all(color: ColorConstants.borderColor2)),
//             child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     borderRadius: getCurvedBorderRadius(),
//                     border: Border.all(color: ColorConstants.primaryColor),
//                   ),
//                   child: SvgPicture.asset(
//                     'assets/images/ic_driver.svg',
//                     height: getLargeTextFontSIze() * 2,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     addText('Nawaz Alam', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
//                     const SizedBox(
//                       height: 2,
//                     ),
//                     addText('#632541', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
//                     const SizedBox(
//                       height: 2,
//                     ),
//                     addText('Driver', getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.normal),
//                   ],
//                 ),
//                 const Spacer(),
//                 InkWell(
//                     onTap: () {
//                       showQrDialog();
//                     },
//                     child: SvgPicture.asset('assets/images/qrcode.svg'))
//               ],
//             ),
//           ),*/
//           Container(
//             margin: const EdgeInsets.all(20),
//             padding: const EdgeInsets.all(15),
//             decoration: BoxDecoration(borderRadius: getCurvedBorderRadius(), border: Border.all(color: ColorConstants.borderColor2)),
//             child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(0),
//                   decoration: BoxDecoration(
//                     borderRadius: getCurvedBorderRadius(),
//                     border: Border.all(color: ColorConstants.primaryColor),
//                   ),
//                   child: controller.attendanceResponse.value?.user.profilePic != ""
//                       ? ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: SizedBox(
//                         height: 70,
//                         width: 70,
//                         child: Image.network(ApiEndPoints().imageBaseUrl + controller.attendanceResponse.value?.user.profilePic, fit: BoxFit.cover,
//                             loadingBuilder: (context, child, progress) {
//                               if (progress == null) return child;
//                               return const CircularProgressIndicator();
//                             }),
//                       ))
//                       : SvgPicture.asset(
//                     'assets/images/user.svg',
//                     height: getLargeTextFontSIze() * 2,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     addText(controller.attendanceResponse.value?.user.name, getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.w600),
//                     const SizedBox(
//                       height: 2,
//                     ),
//                     addText("#"+controller.attendanceResponse.value?.user.uniqueId, getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.w600),
//                     const SizedBox(
//                       height: 2,
//                     ),
//                     addText(controller.attendanceResponse.value?.user.role.displayName, getNormalTextFontSIze(), ColorConstants.primaryColor, FontWeight.w600),
//
//                   ],
//                 ),
//                 const Spacer(),
//                 // QrImageViewView(
//                 //   data: controller.attendanceResponse.value?.user.barcode ?? '',
//                 //   version: QrVersions.auto,
//                 //   size: 70,
//                 //   gapless: false,
//                 // ),
//                 // InkWell(
//                 //     onTap: () {
//                 //       showDialogBox();
//                 //     },
//                 //     child: SvgPicture.asset('assets/images/qrcode.svg'))
//               ],
//             ),
//           ),
//           buildTabs(),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             margin: const EdgeInsets.all(20),
//             decoration: BoxDecoration(color: const Color(0xFF0F8F8F8), borderRadius: getBorderRadius()),
//             // child: _calendarCarouselNoHeader,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 3.h,
//                 ),
//                 Row(
//                   children: [
//                     buildColors(ColorConstants.lightTextColor, 'Absent'),
//                     SizedBox(
//                       width: 6.w,
//                     ),
//                     buildColors(ColorConstants.blue, 'Late'),
//                     SizedBox(
//                       width: 6.w,
//                     ),
//                     buildColors(ColorConstants.primaryColor, 'Holiday'),
//                   ],
//                 ),
//                 calendarCarouselNoHeader
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildTabs() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         // color: const Color(0xFFEEEEEE),
//           borderRadius: getBorderRadius()),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Obx(() => GestureDetector(
//             onTap: () {
//               controller.calendarSelectedPos.value = 1;
//               selectedAttendanceType = "present";
//               setState(() {});
//             },
//             child: Container(
//               width: 28.w,
//               padding: EdgeInsets.symmetric(vertical: 1.h),
//               decoration: controller.calendarSelectedPos.value == 1 ? getPrimaryDecoration2() : getEditTextDecoration(),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Center(
//                   child: addText('Present', getSubheadingTextFontSIze(),
//                       controller.calendarSelectedPos.value == 1 ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.w500),
//                 ),
//               ),
//             ),
//           )),
//           Obx(() => GestureDetector(
//             onTap: () {
//               controller.calendarSelectedPos.value = 2;
//               selectedAttendanceType = "absent";
//               setState(() {});
//             },
//             child: Container(
//               width: 28.w,
//               padding: EdgeInsets.symmetric(vertical: 1.h),
//               decoration: controller.calendarSelectedPos.value == 2 ? getPrimaryDecoration2() : getEditTextDecoration(),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Center(
//                   child: addText('Absent', getSubheadingTextFontSIze(),
//                       controller.calendarSelectedPos.value == 2 ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.w500),
//                 ),
//               ),
//             ),
//           )),
//           Obx(() => GestureDetector(
//             onTap: () {
//               controller.calendarSelectedPos.value = 3;
//               selectedAttendanceType = "late";
//               setState(() {});
//             },
//             child: Container(
//               width: 28.w,
//               padding: EdgeInsets.symmetric(vertical: 1.h),
//               decoration: controller.calendarSelectedPos.value == 3 ? getPrimaryDecoration2() : getEditTextDecoration(),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Center(
//                   child: addText('Late', getSubheadingTextFontSIze(),
//                       controller.calendarSelectedPos.value == 3 ? ColorConstants.primaryColor : ColorConstants.borderColor, FontWeight.w500),
//                 ),
//               ),
//             ),
//           )),
//         ],
//       ),
//     );
//   }
//
//   Widget buildColors(Color color, String name) {
//     return Row(
//       children: [
//         Container(
//           width: 10,
//           height: 10,
//           decoration: BoxDecoration(shape: BoxShape.circle, color: color),
//         ),
//         SizedBox(
//           width: 3.w,
//         ),
//         addText(name, getSmallTextFontSIze(), ColorConstants.lightTextColor, FontWeight.normal)
//       ],
//     );
//   }
// }
