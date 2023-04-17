import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_dropdown.dart';
import 'package:staff_app/Utility/base_textformfield.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/schedule_meeting_screen/choose_meeting_date_time_popup.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_with_popup.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_with_popup1.dart';

class CreateMeetingScreen extends StatefulWidget {
  const CreateMeetingScreen({Key? key}) : super(key: key);

  @override
  State<CreateMeetingScreen> createState() => _CreateMeetingScreenState();
}

class _CreateMeetingScreenState extends State<CreateMeetingScreen> {
  TextEditingController meetingTypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Schedule Meeting"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: BaseColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: BaseColors.borderColor
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
                height: 2.h,
              ),
              CustomTextField(
                controller: TextEditingController(),
                hintText: "Select Role",
                readOnly: true,
                onTap: (){
                  showGeneralDialog(
                    context: context,
                    pageBuilder:  (context, animation, secondaryAnimation) {
                      return const ScheduleWithPopup();
                    },
                  );
                },
                borderRadius: 5.0,
                suffixIcon: const Padding(
                  padding: EdgeInsetsDirectional.only(end: 15.0),
                  child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: TextEditingController(),
                hintText: "Select schedule with",
                borderRadius: 5.0,
                readOnly: true,
                onTap: (){
                  showGeneralDialog(
                    context: context,
                    pageBuilder:  (context, animation, secondaryAnimation) {
                      return const ScheduleWithPopup1();
                    },
                  );
                },
                suffixIcon: const Padding(
                  padding: EdgeInsetsDirectional.only(end: 15.0),
                  child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              BaseTextFormField(
                controller: meetingTypeController,
                hintText: "Meeting type",
                isDropDown: true,
                dropDownValue: meetingTypeController.text,
                onChanged: (newValue){
                  setState(() {
                    meetingTypeController.text = newValue.toString();
                  });},
                items: DummyLists().list1.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                }).toList(),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                      child: Text("Date:", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: BaseColors.textBlackColor),)),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: "02/06/2022",
                      readOnly: true,
                      onTap: (){
                        showGeneralDialog(
                          context: context,
                          pageBuilder:  (context, animation, secondaryAnimation) {
                            return ChooseMeetingDateTimePopup(title: "Select Date & Time",);
                          },
                        );
                      },
                      borderRadius: 5.0,
                      hintTxtSize: 15.sp,
                      suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 20.0),
                        child: SvgPicture.asset(calenderDateSvg),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Text("Selected Slot:", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: BaseColors.textBlackColor),),
                  SizedBox(
                    width: 2.w,
                  ),
                  InkWell(
                    onTap: (){
                      showGeneralDialog(
                        context: context,
                        pageBuilder:  (context, animation, secondaryAnimation) {
                          return ChooseMeetingDateTimePopup(title: "Select Date & Time",);
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
                      decoration: BoxDecoration(
                          color: BaseColors.backgroundColor,
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(color: BaseColors.primaryColor)
                      ),
                      child: addText("09:00 AM", 13.sp, BaseColors.primaryColor, FontWeight.w700),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              BaseButton(title: "SUBMIT", onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
