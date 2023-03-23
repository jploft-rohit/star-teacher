import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/home_class_schedule/home_class_schedule_screen.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen.dart';
import 'package:staff_app/view/class_schedule_screen/class_schedule_screen.dart';
import 'package:staff_app/view/drawer_screen/drawer_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen.dart';
import 'package:staff_app/view/news_screen/news_details_screen.dart';
import 'package:staff_app/view/news_screen/news_screen.dart';
import 'package:staff_app/view/notification_screen/notification_screen.dart';
import 'package:staff_app/view/notification_setting_screen/notification_setting_screen.dart';
import 'package:staff_app/view/performance_screen/performance_screen.dart';
import 'package:staff_app/view/sos/sos_screen.dart';
import 'package:staff_app/view/star_attendance_screen/star_attendance_screen.dart';
import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen.dart';
import 'package:staff_app/view/star_evaluation_screen/star_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      extendBody: true,
      backgroundColor: Colors.white,
      drawer: const DrawerScreen(),
      appBar: BaseAppBar(
        onDrawerPressed: (){_key.currentState?.openDrawer();},
        showSos: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 15.sp, bottom: 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: CustomColors.borderColor
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(const HomeClassScheduleScreen(index: 1));
                      },
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              // selectDate(context);
                            },
                              child: InkWell(
                                  onTap: (){
                                    // selectDate(context);
                                  },
                                  child: SvgPicture.asset(calenderSvg)),),
                          SizedBox(
                            width: 20.sp,
                          ),
                          Text(translate(context).this_week, style: Style.montserratRegularStyle().copyWith(fontSize: 15.sp),)
                        ],
                      ),
                    ),
                    Container(
                      height:double.infinity,
                      width: 1.0,
                      color: CustomColors.borderColor,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(const HomeClassScheduleScreen(index: 0));
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(classTakenSvg),
                          SizedBox(
                            width: 15.sp,
                          ),
                          Text("21 ${translate(context).classes_taken}", style: Style.montserratRegularStyle().copyWith(fontSize: 15.sp),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(translate(context).today_schedule, style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp),),
                    Text(translate(context).view_all, style: Style.montserratMediumStyle().copyWith(fontSize: 15.sp ,decoration: TextDecoration.underline, color: CustomColors.txtPrimaryColor),),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                padding: const EdgeInsets.only(left: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 2),
                                spreadRadius: 0.0,
                                blurRadius: 5.0
                              )
                            ],
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: CustomColors.primaryColor
                            )
                          ),
                          padding: const EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0, bottom: 5.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${index+2}nd Slot (Hold)", style: Style.montserratBoldStyle().copyWith(color: CustomColors.txtPrimaryColor, fontSize: 16.sp),),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Text("Start in", style: Style.montserratBoldStyle().copyWith(color: CustomColors.txtPrimaryColor, fontSize: 14.sp),),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: CustomColors.backgroundColor,
                                          borderRadius: BorderRadius.circular(2.0),
                                          border: Border.all(
                                            color: CustomColors.primaryColor,
                                          ),
                                        ),
                                        child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(":", style: Style.montserratBoldStyle().copyWith(color: CustomColors.txtPrimaryColor, fontSize: 14.sp),),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: CustomColors.backgroundColor,
                                          borderRadius: BorderRadius.circular(2.0),
                                          border: Border.all(
                                            color: CustomColors.primaryColor,
                                          ),
                                        ),
                                        child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          Get.to(const StarAttendanceScreen());
                                        },
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(classTakenSvg, height: 15.0,),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Text("Classroom 42", style: Style.montserratBoldStyle().copyWith(color: CustomColors.txtPrimaryColor, fontSize: 14.sp),),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2.0,
                                      ),
                                      Container(
                                        color: CustomColors.dividerColor,
                                        height: 1.0,
                                        width: getWidth(context) * 40 / 100,
                                      ),
                                      const SizedBox(
                                        height: 2.0,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.person, color: CustomColors.primaryColor,size: 15.0,),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          Text("G1 - H4", style: Style.montserratBoldStyle().copyWith(color: CustomColors.txtPrimaryColor, fontSize: 14.sp),),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Container(
                                            height: 15.0,
                                            width: 1.0,
                                            color: CustomColors.dividerColor,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          SvgPicture.asset(watchSvg),
                                          const SizedBox(
                                            width: 5.0,
                                          ),
                                          Text("History", style: Style.montserratBoldStyle().copyWith(color: CustomColors.txtPrimaryColor, fontSize: 14.sp),),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 2.0,
                                      ),
                                      Container(
                                        color: CustomColors.dividerColor,
                                        height: 1.0,
                                        width: getWidth(context) * 40 / 100,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Start time", style: Style.montserratBoldStyle().copyWith(color: CustomColors.txtPrimaryColor, fontSize: 14.sp),),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: CustomColors.backgroundColor,
                                          borderRadius: BorderRadius.circular(2.0),
                                          border: Border.all(
                                            color: CustomColors.primaryColor,
                                          ),
                                        ),
                                        child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(":", style: Style.montserratBoldStyle().copyWith(color: CustomColors.txtPrimaryColor, fontSize: 14.sp),),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: CustomColors.backgroundColor,
                                          borderRadius: BorderRadius.circular(2.0),
                                          border: Border.all(
                                            color: CustomColors.primaryColor,
                                          ),
                                        ),
                                        child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(classTakenSvg, height: 15.0,),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                      Text("Dubai international school", style: Style.montserratBoldStyle().copyWith(color: CustomColors.txtPrimaryColor, fontSize: 14.sp),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                        child: Text("End time", style: Style.montserratBoldStyle().copyWith(color: CustomColors.txtPrimaryColor, fontSize: 14.sp),),),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: CustomColors.backgroundColor,
                                          borderRadius: BorderRadius.circular(2.0),
                                          border: Border.all(
                                            color: CustomColors.primaryColor,
                                          ),
                                        ),
                                        child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(":", style: Style.montserratBoldStyle().copyWith(color: CustomColors.txtPrimaryColor, fontSize: 14.sp),),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: CustomColors.backgroundColor,
                                          borderRadius: BorderRadius.circular(2.0),
                                          border: Border.all(
                                            color: CustomColors.primaryColor,
                                          ),
                                        ),
                                        child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: -10,
                        child: InkWell(
                          onTap: (){
                            Get.to(const StarView());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  getBoxShadow()
                                ]
                            ),
                            child: SvgPicture.asset(starSvg, height: 18.sp,),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 2.h,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(translate(context).news_broadcast, style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp),),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          height: 20.0,
                          padding: const EdgeInsets.all(2.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColors.primaryColor
                          ),
                          child: Center(child: Text("10", style: Style.montserratRegularStyle().copyWith(color: Colors.white),)),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(const NewsScreen());
                      },
                      child: Text(translate(context).view_all, style: Style.montserratMediumStyle().copyWith(fontSize: 15.sp ,decoration: TextDecoration.underline, color: CustomColors.txtPrimaryColor),),),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              ListView.builder(
                itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 4.h),
                  itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    Get.to(const NewsDetailScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 10),
                    child: Container(
                      width: getWidth(context),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: index == 0 ? const Color(0xFFF8F4E9) : const Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(
                              color: CustomColors.borderColor,
                              blurRadius: 8.0,
                              spreadRadius: 5
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Principal’s Honouring Ceremony", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mauris arcu eleifend aliquam...", style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp, color: const Color(0xff072D4B), height: 2.0),maxLines: 2,overflow: TextOverflow.ellipsis,),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              addText("School Admin", 14.sp,  const Color(0xff072D4B), FontWeight.w400),
                              SizedBox(
                                width: 10.w,
                              ),
                              addText("15 mins ago", 14.sp,  const Color(0xff072D4B), FontWeight.w400),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap:(){
                      Get.to(PerformanceScreen(index: 0,));
                    },
                    child: Container(
                      height: 15.h,
                      width: 28.w,
                      padding: EdgeInsets.only(left: 15.sp, top: 18.sp, bottom: 18.sp, right: 15.sp, ),
                      decoration: BoxDecoration(
                        color: const Color(0xffFDFDFD),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: CustomColors.primaryColor
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(translate(context).performance, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),textAlign: TextAlign.center,),
                          Text("4.3", style: Style.montserratBoldStyle().copyWith(fontSize: 25.sp, color: CustomColors.txtPrimaryColor),textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      // Get.to(const AttendanceScreen());
                      Get.to(const NoteBookScreen());
                    },
                    child: Container(
                      height: 15.h,
                      width: 28.w,
                      padding: EdgeInsets.only(left: 15.sp, top: 18.sp, bottom: 18.sp, right: 15.sp, ),
                      decoration: BoxDecoration(
                        color: const Color(0xffFDFDFD),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: CustomColors.primaryColor
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(translate(context).notebook, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),textAlign: TextAlign.center,),
                          Image.asset(calenderPng, height: 5.h,),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      Get.to(const StarEvaluationScreen());
                    },
                    child: Container(
                      height: 15.h,
                      width: 28.w,
                      padding: EdgeInsets.only(left: 15.sp, top: 18.sp, bottom: 18.sp, right: 15.sp, ),
                      decoration: BoxDecoration(
                        color: const Color(0xffFDFDFD),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: CustomColors.primaryColor
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(translate(context).star_evaluation, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),textAlign: TextAlign.center,),
                          SvgPicture.asset(graphSvg),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
