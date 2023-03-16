import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';
import 'package:staff_app/view/task_or_reminder_screen/add_task_or_reminder_screen.dart';

import '../../Utility/custom_colors.dart';
import '../../Utility/utility.dart';

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
        appBar: appBarWithAction(context, translate(context).task_or_reminder, [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: SvgPicture.asset("assets/images/notification.svg"),
          )
        ],
          onPressed: (){
          if(widget.isFromBtmBar){
            ctrl.bottomNavigationKey.currentState?.setPage(2);
          }else{
            Navigator.pop(context);
          }
          }
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.small(
              onPressed: (){
                Get.to(AddTaskOrReminderScreen());
              },
              backgroundColor: CustomColors.backgroundColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: CustomColors.primaryColor
                  ),
                  borderRadius: BorderRadius.circular(50.0)
              ),
              child: Icon(
                Icons.add,
                size: 25.sp,
                color: CustomColors.primaryColor,
              ),
            ),
            Text(translate(context).add_task, style: Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),)
          ],
        ),
        body: ListView.builder(
          itemCount: 3,
          padding: EdgeInsets.all(15.sp),
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
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: CustomColors.backgroundColor),
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
              addText("Submit your daily log", 16.sp, CustomColors.textBlackColor, FontWeight.w700)
            ],
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset("assets/images/time_icon.svg"),
              SizedBox(width: 1.h),
              addText('09:13pm', 15.sp,
                  CustomColors.textBlackColor, FontWeight.w400),
            ],
          ),
          Divider(),
          Row(
            children: [
              SvgPicture.asset("assets/images/reminder 1.svg"),
              SizedBox(
                width: 2.w,
              ),
              RichText(
                text: TextSpan(
                  text: '${translate(context).remind_star} : ',
                  style: Style.montserratRegularStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                  children: <TextSpan>[
                    TextSpan(text: "Daily", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp, height: 1.2)),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/document 1.svg"),
              SizedBox(width:2.w),
              RichText(
                text: TextSpan(
                  text: '${translate(context).file} : ',
                  style: Style.montserratRegularStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                  children: <TextSpan>[
                    TextSpan(text: "Str_task.file", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp, height: 1.2)),
                  ],
                ),
              ),
              SizedBox(width:3.w),
              SvgPicture.asset(salarySlipDownloadSvg, height: 18.0,),
              SizedBox(
                width: 2.w,
              ),
              InkWell(onTap: (){
                showGeneralDialog(
                  context: context,
                  pageBuilder:  (context, animation, secondaryAnimation) {
                    return OpenPdfPopup(title: "");
                  },
                );
              },child: Icon(Icons.remove_red_eye_outlined,color: CustomColors.primaryColor,)),
            ],
          ),
          Divider(),
          Row(
            children: [
              SizedBox(width:3.h),
              Expanded(
                child: CustomButton(
                    boxShadow: [],
                    btnColor: CustomColors.white,
                    borderColor: CustomColors.borderColor,
                    borderRadius: 8,
                    btnHeight: 35,
                    text: translate(context).edit.toUpperCase(),
                    textColor: CustomColors.textLightGreyColor,
                    onPressed: () {}),
              ),
              SizedBox(width:2.h),
              Expanded(
                child: CustomButton(
                    borderRadius: 8,
                    btnHeight: 35,
                    text: translate(context).delete.toUpperCase(),
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return ConfirmationDialog(msg: translate(context).are_you_sure_to_cancel_this_reminder,isShowBtn: true,);
                        },
                      );
                    }),
              ),
              SizedBox(width:3.h),
            ],
          ),
        ],
      ),
    );
  }
}
