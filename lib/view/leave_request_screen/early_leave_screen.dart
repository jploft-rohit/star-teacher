import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/leave_request_screen/leave_permission_screen.dart';

import '../../Utility/images_icon_path.dart';

class EarlyLeaveScreen extends StatefulWidget {
  const EarlyLeaveScreen({Key? key}) : super(key: key);

  @override
  State<EarlyLeaveScreen> createState() => _EarlyLeaveScreenState();
}

class _EarlyLeaveScreenState extends State<EarlyLeaveScreen> {
  TextEditingController startDateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithAction(context, translate(context).early_leave, [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                color: CustomColors.backgroundColor,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: CustomColors.borderColor
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                  const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text("${translate(context).date}:", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: startDateCtrl,
                            onTap: (){
                              selectDate(context);
                            },
                            readOnly: true,
                            fillColor: CustomColors.txtFieldTextColor,
                            hintText: "dd/mm/yyyy",
                            borderRadius: 5.0,
                            suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text("${translate(context).leaving_time}:", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/time_icon1.svg"),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: startDateCtrl,
                            fillColor: CustomColors.txtFieldTextColor,
                            hintText: "10:30 AM",
                            borderRadius: 5.0,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text("${translate(context).reason}:", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg, color: CustomColors.white,),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: startDateCtrl,
                            fillColor: CustomColors.txtFieldTextColor,
                            hintText: translate(context).type_here,
                            borderRadius: 5.0,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              controller: startDateCtrl,
              hintText: translate(context).upload_file_or_photo,
              borderRadius: 5.0,
              fillColor: CustomColors.txtFieldTextColor,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: SvgPicture.asset("assets/images/upload_icon.svg",),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(text: translate(context).submit_btn_txt, onPressed: (){
              Get.back();
            })
          ],
        ),
      ),
    );
  }
}