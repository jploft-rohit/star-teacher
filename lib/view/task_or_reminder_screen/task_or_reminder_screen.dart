import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';


import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';
import 'package:staff_app/view/task_or_reminder_screen/add_task_or_reminder_screen.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/view/task_or_reminder_screen/controller/task_reminder_ctrl.dart';
import '../../Utility/base_utility.dart';

class TaskOrReminderScreen extends StatefulWidget {
  final bool isFromBtmBar;
  TaskOrReminderScreen({Key? key, required this.isFromBtmBar}) : super(key: key);

  @override
  State<TaskOrReminderScreen> createState() => _TaskOrReminderScreenState();
}

class _TaskOrReminderScreenState extends State<TaskOrReminderScreen> {
  DashboardScreenCtrl ctrl = Get.find<DashboardScreenCtrl>();
  TaskReminderCtrl controller = Get.put(TaskReminderCtrl());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BaseAppBar(title: translate(context).task_or_reminder,
          onBackPressed: (){
          if(widget.isFromBtmBar){
            ctrl.bottomNavigationKey.currentState?.setPage(2);
          }else{
            Navigator.pop(context);
           }
          }
        ),
        floatingActionButton: BaseFloatingActionButton(
          onTap: () {Get.to(const AddTaskOrReminderScreen());},
          title: translate(context).add_task,
        ),
        body: Obx(()=>ListView.builder(
            itemCount: controller.list?.length??0,
            padding: EdgeInsets.all(14.sp),
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
              addText(DateFormat.Hm().format(DateTime.parse(controller.list?[index].time??"")), 14.sp,
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
                  text: '${translate(context).remind_star} : ',
                  style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),
                  children: <TextSpan>[
                    TextSpan(text: toBeginningOfSentenceCase(controller.list?[index].type??na)??na, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp, height: 1.2)),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
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
              SvgPicture.asset(salarySlipDownloadSvg, height: 18.0,),
              SizedBox(
                width: 2.w,
              ),
              GestureDetector(onTap: (){
                showGeneralDialog(
                  context: context,
                  pageBuilder:  (context, animation, secondaryAnimation) {
                    return OpenPdfPopup(title: "");
                  },
                );
              },child: const Icon(Icons.remove_red_eye_outlined,color: BaseColors.primaryColor,)),
            ],
          ),
          const Divider(),
          Row(
            children: [
              SizedBox(width:3.h),
              Expanded(
                child: BaseButton(
                    isActive: false,
                    title: translate(context).edit.toUpperCase(),
                    onPressed: () {Get.to(AddTaskOrReminderScreen(isUpdating: true,data: controller.list?[index]));},
                    btnType: mediumLargeButton),
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
