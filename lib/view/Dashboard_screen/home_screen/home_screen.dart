import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/home_class_schedule/home_class_schedule_screen.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/tabs/newsbroadcast_tab.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/tabs/star_gallery_tab.dart';
import 'package:staff_app/view/drawer_screen/drawer_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen.dart';
import 'package:staff_app/view/news_screen/news_details_screen.dart';
import 'package:staff_app/view/news_screen/news_screen.dart';
import 'package:staff_app/view/performance_screen/performance_screen.dart';
import 'package:staff_app/view/star_attendance_screen/star_attendance_screen.dart';
import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen.dart';
import 'package:staff_app/view/star_evaluation_screen/star_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                      color: BaseColors.borderColor
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
                        color: BaseColors.borderColor,
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
                      Text(translate(context).view_all, style: Style.montserratMediumStyle().copyWith(fontSize: 15.sp ,decoration: TextDecoration.underline, color: BaseColors.txtPrimaryColor),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
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
                                color: BaseColors.primaryColor
                              )
                            ),
                            padding: const EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0, bottom: 5.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${index+2}nd Slot (Hold)", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 16.sp),),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Text("Start in", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(2.0),
                                          decoration: BoxDecoration(
                                            color: BaseColors.backgroundColor,
                                            borderRadius: BorderRadius.circular(2.0),
                                            border: Border.all(
                                              color: BaseColors.primaryColor,
                                            ),
                                          ),
                                          child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(":", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(2.0),
                                          decoration: BoxDecoration(
                                            color: BaseColors.backgroundColor,
                                            borderRadius: BorderRadius.circular(2.0),
                                            border: Border.all(
                                              color: BaseColors.primaryColor,
                                            ),
                                          ),
                                          child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
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
                                              Text("Classroom 42", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Container(
                                          color: BaseColors.dividerColor,
                                          height: 1.0,
                                          width: getWidth(context) * 40 / 100,
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.person, color: BaseColors.primaryColor,size: 15.0,),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Text("G1 - H4", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Container(
                                              height: 15.0,
                                              width: 1.0,
                                              color: BaseColors.dividerColor,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            SvgPicture.asset(watchSvg),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Text("History", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Container(
                                          color: BaseColors.dividerColor,
                                          height: 1.0,
                                          width: getWidth(context) * 40 / 100,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Start time", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(2.0),
                                          decoration: BoxDecoration(
                                            color: BaseColors.backgroundColor,
                                            borderRadius: BorderRadius.circular(2.0),
                                            border: Border.all(
                                              color: BaseColors.primaryColor,
                                            ),
                                          ),
                                          child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(":", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(2.0),
                                          decoration: BoxDecoration(
                                            color: BaseColors.backgroundColor,
                                            borderRadius: BorderRadius.circular(2.0),
                                            border: Border.all(
                                              color: BaseColors.primaryColor,
                                            ),
                                          ),
                                          child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
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
                                        Text("Dubai international school", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                          child: Text("End time", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(2.0),
                                          decoration: BoxDecoration(
                                            color: BaseColors.backgroundColor,
                                            borderRadius: BorderRadius.circular(2.0),
                                            border: Border.all(
                                              color: BaseColors.primaryColor,
                                            ),
                                          ),
                                          child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(":", style: Style.montserratBoldStyle().copyWith(color: BaseColors.txtPrimaryColor, fontSize: 14.sp),),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(2.0),
                                          decoration: BoxDecoration(
                                            color: BaseColors.backgroundColor,
                                            borderRadius: BorderRadius.circular(2.0),
                                            border: Border.all(
                                              color: BaseColors.primaryColor,
                                            ),
                                          ),
                                          child: Text('05', style:  Style.montserratRegularStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
                        Get.to(PerformanceScreen(index: 0,));
                      },
                      child: Container(
                        height: 14.h,
                        width: 28.w,
                        padding: EdgeInsets.only(left: 15.sp, top: 18.sp, bottom: 18.sp, right: 15.sp, ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFDFDFD),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: BaseColors.primaryColor
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(translate(context).performance, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),textAlign: TextAlign.center,),
                            Text("4.3", style: Style.montserratBoldStyle().copyWith(fontSize: 21.sp, color: BaseColors.txtPrimaryColor),textAlign: TextAlign.center,),
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
                        height: 14.h,
                        width: 28.w,
                        padding: EdgeInsets.only(left: 15.sp, top: 18.sp, bottom: 18.sp, right: 15.sp, ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFDFDFD),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: BaseColors.primaryColor
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(translate(context).notebook, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),textAlign: TextAlign.center,),
                            Image.asset(calenderPng, height: 4.h,),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap:(){
                        Get.to(const StarEvaluationScreen());
                      },
                      child: Container(
                        height: 14.h,
                        width: 28.w,
                        padding: EdgeInsets.only(left: 15.sp, top: 18.sp, bottom: 18.sp, right: 15.sp, ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFDFDFD),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: BaseColors.primaryColor
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(translate(context).star_evaluation, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),textAlign: TextAlign.center,),
                            SvgPicture.asset(graphSvg,height: 3.5.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                BaseToggleTabBar(
                    controller: tabController,
                    tabs: [
                    BaseTabButton(title: "News/Broadcast", isSelected: tabController.index == 0),
                    BaseTabButton(title: "Star Gallery", isSelected: tabController.index == 1),
                ],bottomMargin: 2.h),
                AutoScaleTabBarView(
                  controller: tabController,
                  children: [
                    NewsBroadCastTab(),
                    StarGalleryTab(),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
