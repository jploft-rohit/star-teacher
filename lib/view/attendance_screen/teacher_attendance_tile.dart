import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_ctrl.dart';
import 'package:staff_app/view/attendance_screen/reason_popup.dart';

import '../../utility/images_icon_path.dart';

class TeacherAttendanceTile extends StatefulWidget {
  const TeacherAttendanceTile({super.key});

  @override
  State<TeacherAttendanceTile> createState() => _TeacherAttendanceTileState();
}

class _TeacherAttendanceTileState extends State<TeacherAttendanceTile> {
  AttendanceScreenController controller = Get.find<AttendanceScreenController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=> (controller.list?.length??0) == 0
        ? BaseNoData(message: "No Attendance Found")
        : ListView.builder(
          itemCount: controller.list?.length??0,
          shrinkWrap: true,
          padding: const EdgeInsets.all(5),
          itemBuilder: (context, index) {
          return Container(
            height: controller.secondaryTabIndex.value == 0 ? 80 : 110,
            margin: const EdgeInsets.only(bottom: 10.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: BaseColors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  getBoxShadow()
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(calenderDateSvg, color: BaseColors.primaryColor, height: 13),
                            SizedBox(width: 2.w),
                            Text(formatBackendDate(controller.list?[index]?.date??""), style: Style.montserratMediumStyle().copyWith(fontSize: 14.sp),),
                            SizedBox(width: 10.w),
                            SvgPicture.asset("assets/images/time_icon.svg"),
                            SizedBox(width: 2.w),
                            Text(getFormattedTime(controller.list?[index]?.time??""), style: Style.montserratMediumStyle().copyWith(fontSize: 14.sp)),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/teacher_icon.svg"),
                            SizedBox(width: 2.w),
                            buildInfoItems(controller.primaryTabIndex.value == 2 ? "Status" : translate(context).school, controller.primaryTabIndex.value == 2 ? (controller.list?[index]?.liveStatus??"") : (controller.list?[index]?.school?.name??""))
                          ],
                        ),
                        Visibility(
                          visible: controller.secondaryTabIndex.value != 0,
                          child: Divider(),
                        ),
                        Visibility(
                          visible: controller.secondaryTabIndex.value != 0,
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/images/report.svg"),
                              SizedBox(
                                width: 2.w,
                              ),
                              buildInfoItems(translate(context).reason_given, (controller.list?[index]?.reason??"").toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: controller.secondaryTabIndex.value == 0 ? BaseColors.greenLight : controller.secondaryTabIndex.value == 1 ? BaseColors.greyColor : BaseColors.lightBlueColor,
                  ),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.secondaryTabIndex.value == 0 ? controller.primaryTabIndex.value == 2 ? translate(context).on_time : translate(context).present : controller.secondaryTabIndex.value == 1 ? controller.primaryTabIndex.value == 2 ? translate(context).late : translate(context).absent : translate(context).late, style: Style.montserratBoldStyle().copyWith(color: controller.secondaryTabIndex.value == 0 ? BaseColors.green : Colors.white, fontSize: 16.sp)),
                      Visibility(
                        visible: controller.secondaryTabIndex.value != 0,
                        child: GestureDetector(
                          onTap: (){
                            showGeneralDialog(
                              context: context,
                              pageBuilder: (context, animation, secondaryAnimation) {
                                return ReasonPopup(id: controller.list?[index]?.sId??"");
                              },
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5, top: 5),
                            decoration: BoxDecoration(
                                color: BaseColors.white,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  getBoxShadow()
                                ]
                            ),
                            child: Text(translate(context).reason, style: Style.montserratBoldStyle().copyWith(color: Color(0xff6B6B6B), fontSize: 13.sp),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

  }
}
