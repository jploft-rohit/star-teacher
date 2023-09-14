import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/task_or_reminder_screen/add_task_or_reminder_screen.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/view/task_or_reminder_screen/controller/task_reminder_ctrl.dart';
import '../../Utility/base_utility.dart';

class TaskOrReminderScreen extends StatefulWidget {
  final bool isFromBtmBar;
  const TaskOrReminderScreen({Key? key, required this.isFromBtmBar}) : super(key: key);

  @override
  State<TaskOrReminderScreen> createState() => _TaskOrReminderScreenState();
}

class _TaskOrReminderScreenState extends State<TaskOrReminderScreen> {
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  DashboardScreenCtrl ctrl = Get.find<DashboardScreenCtrl>();
  TaskReminderCtrl controller = Get.put(TaskReminderCtrl());

  @override
  void initState() {
    super.initState();
    controller.getTaskReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).task_or_reminder,
        onBackPressed: (){
        if(widget.isFromBtmBar){
          ctrl.bottomNavigationKey.currentState?.setPage(2);
        }else{
          Navigator.pop(context);
         }
        }
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: widget.isFromBtmBar ? 10.h : 0),
        child: BaseFloatingActionButton(
          onTap: () {Get.to(const AddTaskOrReminderScreen());},
          title: translate(context).add_task,
        ),
      ),
      body: Obx(()=>SmartRefresher(
        footer: const BasePaginationFooter(),
        controller: controller.refreshController,
        enablePullDown: enablePullToRefresh,
        enablePullUp: true,
        onLoading: (){
          controller.getTaskReminders(refreshType: "load");
        },
        onRefresh: (){
          controller.getTaskReminders(refreshType: "refresh");
        },
        child: (controller.list?.length??0) == 0
            ? const BaseNoData()
            : ListView.builder(
            itemCount: controller.list?.length??0,
            padding: EdgeInsets.only(left: 14.sp, right: 14.sp, top: 14.sp, bottom: widget.isFromBtmBar ? 20.h : 14.sp),
            itemBuilder: (context, index) {
              return buildDailyTaskCard(index: index);
            },
          ),
      ),
      ),
    );
  }
  Widget buildDailyTaskCard({index}) {
    String na = translate(context).na;
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(bottom: 2.h),
      width: 100.w,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: BoxDecoration(
        color: BaseColors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: BaseColors.backgroundColor),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 3)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgPicture.asset("assets/images/bell(1) 1.svg", height: 26,),
              SizedBox(
                width: 2.w,
              ),
              addText(toBeginningOfSentenceCase(controller.list?[index].remider??na)??na, 15.sp, BaseColors.textBlackColor, FontWeight.w700)
            ],
          ),
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset("assets/images/time_icon.svg"),
              SizedBox(width: 1.h),
              addText(getFormattedTime4(controller.list?[index].time??""), 14.sp,
                  BaseColors.textBlackColor, FontWeight.w400),
            ],
          ),
          const Divider(),
          Row(
            children: [
              SvgPicture.asset("assets/images/reminder 1.svg"),
              SizedBox(
                width: 2.w,
              ),
              RichText(
                text: TextSpan(
                  text: 'Reminder : ',
                  style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),
                  children: <TextSpan>[
                    TextSpan(text: toBeginningOfSentenceCase(controller.list?[index].type)??"", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp, height: 1.2)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          Visibility(
            visible: (controller.list?[index].document??"").isNotEmpty,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/document 1.svg"),
                SizedBox(width:2.w),
                RichText(
                  text: TextSpan(
                    text: '${translate(context).file} : ',
                    style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),
                    children: <TextSpan>[
                      TextSpan(text: "", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp, height: 1.2)),
                    ],
                  ),
                ),
                SizedBox(width:3.w),
                BaseIcons().download(onRightButtonPressed: (){
                  BaseOverlays().dismissOverlay();
                  downloadFile(url: (controller.list?[index].document??""));
                }),
                SizedBox(width: 2.w),
                BaseIcons().view(url: controller.list?[index].document??"",concatBaseUrl: true)
              ],
            ),
          ),
          Visibility(
              visible: (controller.list?[index].document??"").toString().isNotEmpty,
              child: const Divider()),
          Row(
            children: [
              SizedBox(width:3.h),
              Expanded(
                child: BaseButton(
                    isActive: false,
                    title: translate(context).edit.toUpperCase(),
                    onPressed: () {
                      Get.to(AddTaskOrReminderScreen(isUpdating: true,data: controller.list?[index]));
                      },
                    btnType: mediumLargeButton,
                ),
              ),
              SizedBox(width:2.h),
              Expanded(
                child: BaseButton(
                    title: translate(context).delete.toUpperCase(),
                    onPressed: () {
                      BaseOverlays().showConfirmationDialog(
                        title: "Are you sure you want to delete this Task or Reminder ?",
                        onRightButtonPressed: (){
                          controller.deleteTaskReminder(id: controller.list?[index].sId??"", index: index);
                        }
                      );
                    },btnType: mediumLargeButton),
              ),
              SizedBox(width:3.h),
            ],
          ),
        ],
      ),
    );
  }
}
