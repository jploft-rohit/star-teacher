import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/roles_list_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_dropdown_2.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/schedule_meeting_screen/choose_meeting_date_time_popup.dart';
import 'package:staff_app/view/schedule_meeting_screen/controller/schedule_meeting_screen_ctrl.dart';
import 'package:staff_app/view/schedule_meeting_screen/select_person.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class CreateMeetingScreen extends StatefulWidget {
  const CreateMeetingScreen({Key? key}) : super(key: key);

  @override
  State<CreateMeetingScreen> createState() => _CreateMeetingScreenState();
}

class _CreateMeetingScreenState extends State<CreateMeetingScreen> {
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  ScheduleMeetingScreenCtrl controller = Get.find<ScheduleMeetingScreenCtrl>();
  @override
  void initState() {
    super.initState();
    controller.clearData();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Scaffold(
        appBar: const BaseAppBar(title: "Schedule Meeting"),
        body: Obx(()=>SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                children: [
                  BaseTextFormField(
                    controller: controller.selectSchoolController.value,
                    errorText: "Please select school",
                    isDropDown: true,
                    hintText: controller.selectSchoolController.value.text.isEmpty ? "Select School" : controller.selectSchoolController.value.text,
                    items: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
                      return DropdownMenuItem(
                        value: data,
                        child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                      );
                    }).toList(),
                    onChanged: (value) async {
                      controller.selectSchoolController.value.text = value?.name??"";
                      controller.selectedSchoolId.value = value?.sId??"";
                      /// Clear Others
                      controller.selectedRoleId.value = "";
                      controller.selectRoleController.value.text = "";
                    },
                  ),
                  GestureDetector(
                    onTap: (){
                      if (controller.selectedSchoolId.value.isNotEmpty) {
                        showGeneralDialog(
                          context: context,
                          pageBuilder:  (context, animation, secondaryAnimation) {
                            return SelectPersonPopup(selectedSchoolId: controller.selectedSchoolId.value);
                          },
                        ).then((value){
                          setState(() {});
                        });
                      }else{
                        baseToast(message: "Please first select school");
                      }
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: BaseTextFormField(
                        controller: controller.selectedPersonController.value,
                        hintText: "Select schedule with",
                        isDropDown: true,
                        errorText: "Please select schedule with",
                      ),
                    ),
                  ),
                  BaseTextFormField(
                    controller: controller.meetingTypeController.value,
                    hintText: "Meeting Type",
                    isDropDown: true,
                    errorText: "Please select meeting type",
                    items: ["Audio","Video"].map((e){
                      return DropdownMenuItem(
                        value: e,
                        child: addText(e, 15.sp, Colors.black, FontWeight.w400),
                      );
                    }).toList(),
                    onChanged: (value){
                      controller.meetingTypeController.value.text = value;
                    },
                  ),
                  BaseTextFormField(
                    controller: controller.dateController.value,
                    title:"Date:",
                    hintText: "Select Date",
                    prefixIcon: calenderDateSvg,
                    onTap: (){
                      showGeneralDialog(
                        context: context,
                        pageBuilder:  (context, animation, secondaryAnimation) {
                          return ChooseMeetingDateTimePopup(title: "Select Date & Time");
                        },
                      );
                    },
                    validator: (val){
                      if (controller.dateController.value.text.isEmpty) {
                        return "Please select date";
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Text("Selected Slot:", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: BaseColors.textBlackColor),),
                      SizedBox(width: 2.w),
                      GestureDetector(
                        // onTap: (){
                        //   showGeneralDialog(
                        //     context: context,
                        //     pageBuilder:  (context, animation, secondaryAnimation) {
                        //       return ChooseMeetingDateTimePopup(title: "Select Date & Time",);
                        //     },
                        //   );
                        // },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
                          decoration: BoxDecoration(
                              color: BaseColors.backgroundColor,
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(color: BaseColors.primaryColor)
                          ),
                          child: addText(controller.selectedTime.value.isEmpty ? "Time" : controller.selectedTime.value, 13.sp, BaseColors.primaryColor, FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  BaseButton(title: "SUBMIT", onPressed: (){
                    controller.createScheduledMeeting();
                  },btnType: largeButton,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
