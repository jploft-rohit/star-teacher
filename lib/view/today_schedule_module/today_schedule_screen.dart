import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/home_class_schedule/home_day_schedule_view.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/home_class_schedule/home_week_schedule_view.dart';
import 'package:staff_app/view/class_schedule_screen/day_schedule_view.dart';
import 'package:staff_app/view/class_schedule_screen/notifiy_authority_popup.dart';
import 'package:staff_app/view/class_schedule_screen/week_schedule_view.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:staff_app/view/today_schedule_module/controller/today_schedule_controller.dart';

class TodayScheduleScreen extends StatefulWidget {
  const TodayScheduleScreen({Key? key}) : super(key: key);

  @override
  State<TodayScheduleScreen> createState() => _TodayScheduleScreenState();
}

class _TodayScheduleScreenState extends State<TodayScheduleScreen> {

  TodayScheduleController controller = Get.put(TodayScheduleController());
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: "Today Schedule"),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            BaseTextFormField(
              controller: controller.schoolController,
              errorText: "Please Select School",
              isDropDown: true,
              hintText: controller.schoolController.value.text.isEmpty ? "Select School" : controller.schoolController.value.text,
              items: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
                return DropdownMenuItem<SchoolData>(
                  value: data,
                  child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                );
              }).toList(),
              onChanged: (value) async {
                controller.schoolController.text = value?.name??"";
                controller.selectedSchoolId.value = value?.sId??"";
                controller.getData();
              },
            ),
            Expanded(
              child: Obx(()=> ListView.builder(
                      padding: EdgeInsets.only(bottom: 8.h),
                      shrinkWrap: true,
                      itemCount: controller.list?.length??0,
                      itemBuilder: (context, index) {
                      return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: BaseColors.borderColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildInfoItems(translate(context).class_name, "H1"),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  buildInfoItems(translate(context).grade, "G1"),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  buildInfoItems(translate(context).class_type, "Offline"),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  buildInfoItems(translate(context).classroom, "43"),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(translate(context).start_time, style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 14.sp),),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      SvgPicture.asset("assets/images/time_icon.svg"),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text("09:00AM", style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 3.0),
                                        child: Text(translate(context).end_time, style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 14.sp),),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      SvgPicture.asset("assets/images/time_icon.svg"),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text("09:00AM", style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 3.0),
                                        child: Text(translate(context).completed, style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 14.sp),),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      SvgPicture.asset("assets/images/calender_chat.svg",width: 13),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text("09:00AM", style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(height: 26,child: BaseButton(removeHorizontalPadding: true,
                                    verticalPadding: 0,title: "Completed", onPressed: (){},btnType: mediumButton,textSize: 14.sp,))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
