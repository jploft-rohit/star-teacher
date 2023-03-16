import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class AttendanceAbsentView extends StatefulWidget {
  const AttendanceAbsentView({Key? key}) : super(key: key);

  @override
  State<AttendanceAbsentView> createState() => _AttendanceAbsentViewState();
}

class _AttendanceAbsentViewState extends State<AttendanceAbsentView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              height: 95,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  color: CustomColors.white,
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
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(calenderDateSvg, color: CustomColors.primaryColor,height: 13),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("01/03/2022", style: Style.montserratMediumStyle().copyWith(fontSize: 14.sp),),
                              SizedBox(
                                width: 10.w,
                              ),
                              SvgPicture.asset("assets/images/time_icon.svg"),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("09:13pm", style: Style.montserratMediumStyle().copyWith(fontSize: 14.sp),),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/teacher_icon.svg",),
                              SizedBox(
                                width: 2.w,
                              ),
                              buildInfoItems(translate(context).school, "UAE Public School")
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/report.svg"),
                              SizedBox(
                                width: 2.w,
                              ),
                              buildInfoItems(translate(context).reason_given, "No")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 95,
                    decoration: BoxDecoration(
                      color: CustomColors.greyColor,
                    ),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(translate(context).absent, style: Style.montserratBoldStyle().copyWith(color: CustomColors.white, fontSize: 15.sp),),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5, top: 5),
                          decoration: BoxDecoration(
                            color: CustomColors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              getBoxShadow()
                            ]
                          ),
                          child: Text(translate(context).reason, style: Style.montserratBoldStyle().copyWith(color: Color(0xff6B6B6B), fontSize: 13.sp),),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
