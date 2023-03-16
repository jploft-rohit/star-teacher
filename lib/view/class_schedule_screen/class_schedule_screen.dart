import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/class_schedule_screen/day_schedule_view.dart';
import 'package:staff_app/view/class_schedule_screen/notifiy_authority_popup.dart';
import 'package:staff_app/view/class_schedule_screen/week_schedule_view.dart';

class ClassScheduleScreen extends StatefulWidget {
  const ClassScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ClassScheduleScreen> createState() => _ClassScheduleScreenState();
}

class _ClassScheduleScreenState extends State<ClassScheduleScreen> {
  int index = 0;
  List<Widget> screenList = [
    DayScheduleView(),
    WeekScheduleView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithAction(context, translate(context).schedule, [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        index = 0;
                        setState(() {});
                      },
                      child: Container(
                        height: 40.0,
                        width: getWidth(context) * 50 / 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: index == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                            border: Border.all(
                                color: index == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                            ),
                            boxShadow: [
                              if(index == 0)
                                const BoxShadow(
                                    color: CustomColors.darkShadowColor,
                                    spreadRadius: 1.0,
                                    blurRadius: 2.0,
                                    offset: Offset(0, 3)
                                )
                            ],
                            borderRadius: BorderRadius.circular(15.sp)
                        ),
                        child: Text(translate(context).day, style: Style.montserratBoldStyle().copyWith(color: index == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        index = 1;
                        setState(() {});
                      },
                      child: Container(
                        height: 40.0,
                        width: getWidth(context) * 50 / 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: index == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                            border: Border.all(
                                color: index == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                            ),
                            boxShadow: [
                              if(index == 1)
                                const BoxShadow(
                                    color: CustomColors.darkShadowColor,
                                    spreadRadius: 1.0,
                                    blurRadius: 2.0,
                                    offset: Offset(0, 3)
                                )
                            ],
                            borderRadius: BorderRadius.circular(15.sp)
                        ),
                        child: Text(translate(context).week, style: Style.montserratBoldStyle().copyWith(color: index == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
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
                    Text("UAE Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                    const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              screenList[index],
            ],
          ),
        ),
      ),
    );
  }
}
