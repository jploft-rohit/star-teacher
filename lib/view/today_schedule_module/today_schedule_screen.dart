import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:staff_app/view/today_schedule_module/controller/today_schedule_controller.dart';

class ScheduledClassScreen extends StatefulWidget {
  final String type; // This Week, Classes Taken, Today Schedule
  const ScheduledClassScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<ScheduledClassScreen> createState() => _ScheduledClassScreenState();
}

class _ScheduledClassScreenState extends State<ScheduledClassScreen> {

  TodayScheduleController controller = Get.put(TodayScheduleController());
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void initState() {
    super.initState();
    controller.selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
    controller.schoolController.text = baseCtrl.schoolListData.data?.data?.first.name??"";
    controller.type.value = widget.type;
    controller.getDayData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: widget.type),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            BaseSchoolDropDown(
              controller: controller.schoolController,
              onChanged: (value) async {
                controller.schoolController.text = value?.name??"";
                controller.selectedSchoolId.value = value?.sId??"";
                controller.list?.clear();
                controller.getDayData();
              },
            ),
            Expanded(
              child: Obx(()=> SmartRefresher(
                footer: const BasePaginationFooter(),
                controller: controller.refreshController,
                enablePullDown: enablePullToRefresh,
                enablePullUp: true,
                onLoading: (){
                  controller.getDayData(refreshType: "load");
                },
                onRefresh: (){
                  controller.getDayData(refreshType: "refresh");
                },
                child: (controller.list?.length??0) == 0
                    ?  const BaseNoData()
                    :  ListView.builder(
                        padding: EdgeInsets.only(bottom: 8.h),
                        shrinkWrap: true,
                        itemCount: controller.list?.length??0,
                        itemBuilder: (context, index) {
                        return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
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
                                    buildInfoItems(translate(context).class_name, controller.list?[index]?.classes?.name??""),
                                    SizedBox(height: 1.h),
                                    buildInfoItems(translate(context).grade, controller.list?[index]?.section?.name??""),
                                    SizedBox(height: 1.h),
                                    buildInfoItems(translate(context).class_type, controller.list?[index]?.classType??""),
                                    SizedBox(height: 1.h),
                                    buildInfoItems(translate(context).classroom, controller.list?[index]?.section?.roomNo??""),
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
                                        SizedBox(width: 2.w),
                                        SvgPicture.asset("assets/images/time_icon.svg"),
                                        SizedBox(width: 2.w),
                                        Text(getFormattedTime(controller.list?[index]?.startTime??""), style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
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
                                        SizedBox(width: 2.w),
                                        Text(getFormattedTime(controller.list?[index]?.endTime??""), style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
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
                                        Text(formatBackendDate(controller.list?[index]?.completeDateTime??""), style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    SizedBox(height: 26,child: BaseButton(removeHorizontalPadding: true,
                                      verticalPadding: 0,title: toBeginningOfSentenceCase(controller.list?[index]?.status.toString()??"N/A")??"N/A", onPressed: (){},btnType: mediumButton,textSize: 14.sp,))
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
