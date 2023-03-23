import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class AddLeaveRequestView extends StatefulWidget {
  const AddLeaveRequestView({Key? key}) : super(key: key);

  @override
  State<AddLeaveRequestView> createState() => _AddLeaveRequestViewState();
}

class _AddLeaveRequestViewState extends State<AddLeaveRequestView> {
  TextEditingController startDateCtrl = TextEditingController();
  var leaveTypeDropdownData = [
    // 'Leave Type'
    'Annual leave',
    'Compassionate leave',
    'Sick leave',
    'Local escort leave',
    'Abroad escort leave',
    'National service leave',
    'Event leave',
    'Hajj leave',
    'Paternity Leave',
    'Maternity Leave',
    'Leave without pay',
  ];
  String? initialLeaveType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: translate(context).leave_request),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                  child: Text("${translate(context).leave_type}:", style: Style.montserratBoldStyle().copyWith(fontSize: textFormFieldLabelTs, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      SvgPicture.asset(calenderDateSvg),
                      SizedBox(
                        width: 2.w,
                      ),
                      // Expanded(
                      //   child: CustomTextField(
                      //     controller: startDateCtrl,
                      //     hintText: "Select Leave Type",
                      //
                      //     borderRadius: 5.0,
                      //     suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
                      //   ),
                      // )
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 13.sp, bottom: 13.sp),
                          decoration: BoxDecoration(
                            color: CustomColors.txtFieldTextColor,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                                color: CustomColors.txtFiledBorderColor
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<dynamic>(
                                isExpanded: true,
                                isDense: true,
                                value: initialLeaveType,
                                alignment: Alignment.centerLeft,
                                hint: Text("Leave Type",style: TextStyle(color: Colors.black,fontSize: textFormFieldHintTs),),
                                icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
                                itemPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                items: leaveTypeDropdownData.map((String leave) {
                                  return DropdownMenuItem(
                                    value: leave,
                                    child: addText(leave, 16.sp, Colors.black, FontWeight.w400),);
                                }).toList(),
                                onChanged: (dynamic newValue){
                                  setState(() {
                                    initialLeaveType = newValue;
                                  });
                                }),
                          ),
                        ),
                      ),
                    ],
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
                  child: Text("${translate(context).leave_start}:", style: Style.montserratBoldStyle().copyWith(fontSize: textFormFieldLabelTs, color: CustomColors.textBlackColor),),
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
                            readOnly: true,
                            onTap: (){
                              selectDate(context);
                            },
                            hintText: "dd/mm/yyyy",
                            fillColor: CustomColors.txtFieldTextColor,
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
                  child: Text("${translate(context).leave_end}:", style: Style.montserratBoldStyle().copyWith(fontSize: textFormFieldLabelTs, color: CustomColors.textBlackColor),),
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
                            fillColor: CustomColors.txtFieldTextColor,
                            readOnly: true,
                            onTap: (){
                              selectDate(context);
                            },
                            hintText: "dd/mm/yyyy",
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
                  child: Text("${translate(context).reason}:", style: Style.montserratBoldStyle().copyWith(fontSize: textFormFieldLabelTs, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
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
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              controller: startDateCtrl,
              hintText: translate(context).upload_file_or_photo,
              fillColor: CustomColors.txtFieldTextColor,
              borderRadius: 5.0,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: SvgPicture.asset("assets/images/upload_icon.svg",),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            BaseButton(title: translate(context).submit_btn_txt, onPressed: (){},textSize: largeButtonTs)
          ],
        ),
      ),
    );
  }
}
