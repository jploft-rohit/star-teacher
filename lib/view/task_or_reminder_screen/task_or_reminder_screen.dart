import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';


import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';
import 'package:staff_app/view/task_or_reminder_screen/add_task_or_reminder_screen.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import '../../Utility/base_utility.dart';

class TaskOrReminderScreen extends StatefulWidget {
  bool isFromBtmBar;
  TaskOrReminderScreen({Key? key, required this.isFromBtmBar}) : super(key: key);

  @override
  State<TaskOrReminderScreen> createState() => _TaskOrReminderScreenState();
}

class _TaskOrReminderScreenState extends State<TaskOrReminderScreen> {
  DashboardScreenCtrl ctrl = Get.find<DashboardScreenCtrl>();
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
        body: ListView.builder(
          itemCount: 3,
          padding: EdgeInsets.all(14.sp),
          itemBuilder: (context, index) {
            return buildDailyTaskCard();
          },
        ),
      ),
    );
  }
  Widget buildDailyTaskCard() {
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
              addText("Submit your daily log", 15.sp, BaseColors.textBlackColor, FontWeight.w700)
            ],
          ),
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset("assets/images/time_icon.svg"),
              SizedBox(width: 1.h),
              addText('09:13pm', 14.sp,
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
                    TextSpan(text: "Daily", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp, height: 1.2)),
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
                    TextSpan(text: "Str_task.file", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp, height: 1.2)),
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
                    onPressed: () {Get.to(const AddTaskOrReminderScreen(isUpdating: true));},btnType: mediumLargeButton,),
              ),
              SizedBox(width:2.h),
              Expanded(
                child: BaseButton(
                    title: translate(context).delete.toUpperCase(),
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return ConfirmationDialog(msg: translate(context).are_you_sure_to_cancel_this_reminder,isShowBtn: true,);
                        },
                      );
                    },btnType: mediumLargeButton,),
              ),
              SizedBox(width:3.h),
            ],
          ),
        ],
      ),
    );
  }
}
