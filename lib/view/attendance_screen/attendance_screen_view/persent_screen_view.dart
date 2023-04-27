import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class AttendancePresentView extends StatefulWidget {
  const AttendancePresentView({Key? key}) : super(key: key);

  @override
  State<AttendancePresentView> createState() => _AttendancePresentViewState();
}

class _AttendancePresentViewState extends State<AttendancePresentView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: 80,
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
                            SvgPicture.asset(calenderDateSvg, color: BaseColors.primaryColor,height: 13),
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
                      ],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: BaseColors.greenLight,
                  ),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  alignment: Alignment.center,
                  child: Text(translate(context).present, style: Style.montserratBoldStyle().copyWith(color: BaseColors.green, fontSize: 16.sp),),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
