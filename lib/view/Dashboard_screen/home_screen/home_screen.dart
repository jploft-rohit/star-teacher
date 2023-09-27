import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/tabs/newsbroadcast_tab.dart';
import 'package:staff_app/view/Dashboard_screen/home_screen/tabs/star_gallery_tab.dart';
import 'package:staff_app/view/Dashboard_screen/today_schedule_tile.dart';
import 'package:staff_app/view/drawer_screen/drawer_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen.dart';
import 'package:staff_app/view/performance_screen/performance_screen.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:staff_app/view/star_gallery/create_gallery_screen.dart';
import 'package:staff_app/view/today_schedule_module/today_schedule_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin{

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  DashboardScreenCtrl controller = Get.find<DashboardScreenCtrl>();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  late TabController tabController;
  late ScrollController scrollController;
  bool? fixedScroll;
  String selectedLanguageCode = "";

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      controller.selectedTabIndex.value = tabController.index;
      setState((){});
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      selectedLanguageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
      print("Selected Language Code -> $selectedLanguageCode");
    });
  }

  scrollListener() {
    if (fixedScroll??false) {
      scrollController.jumpTo(0);
    }
  }

  smoothScrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        floatingActionButton: Obx(()=>Visibility(
            visible: controller.selectedTabIndex.value == 1,
            child: Padding(
              padding: EdgeInsets.only(bottom: 9.h),
              child: BaseFloatingActionButton(onTap: () {
                Get.to(const CreateGalleryScreen());
              }, title: 'Create\nGallery',),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: scaffoldPadding),
          child: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(child: Column(
                  children: [
                    GetBuilder<DashboardScreenCtrl>(
                      builder: (controller) {
                        return BaseSchoolDropDown(
                          controller: controller.dashboardSchoolController.value,
                          onChanged: (value) async {
                            controller.dashboardSchoolController.value.text = value?.name??"";
                            controller.selectedDashboardSchoolId.value = value?.sId??"";
                            controller.getHomeData();
                            controller.getBroadCastData(showLoader: false);
                          },
                        );
                      },
                    ),
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: BaseColors.borderColor
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Get.to(const ScheduledClassScreen(type: 'This Week'));
                              },
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(calenderSvg),
                                    SizedBox(width: 20.sp),
                                    Text(translate(context).this_week, style: Style.montserratRegularStyle().copyWith(fontSize: 15.sp),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height:double.infinity,
                            width: 1.0,
                            color: BaseColors.borderColor,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Get.to(const ScheduledClassScreen(type: 'Classes Taken'));
                              },
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(classTakenSvg),
                                    SizedBox(
                                      width: 15.sp,
                                    ),
                                    Obx(()=> Text("${controller.numberOfClassesTaken?.value.toString()??""} ${translate(context).classes_taken}", style: Style.montserratRegularStyle().copyWith(fontSize: 15.sp),))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(translate(context).today_schedule, style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp),),
                          GestureDetector(
                              onTap: (){
                                Get.to(const ScheduledClassScreen(type: 'Today Schedule'));
                              },
                              child: Text(translate(context).view_all, style: Style.montserratMediumStyle().copyWith(fontSize: 15.sp ,decoration: TextDecoration.underline, color: BaseColors.txtPrimaryColor),)),
                        ],
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Obx(()=> (controller.todayScheduledList?.length??0) == 0
                        ? BaseNoData(message: translate(context).no_scheduled_class_found, topMargin: 3.h, bottomMargin: 3.h)
                        : ListView.builder(
                           shrinkWrap: true,
                           itemCount: (controller.todayScheduledList?.length??0) > 1 ? 2 : (controller.todayScheduledList?.length??0),
                           padding: const EdgeInsets.only(left: 10),
                           physics: const NeverScrollableScrollPhysics(),
                           itemBuilder: (context, index) {
                           return TodayScheduleTile(index: index);
                         },
                       ),
                     ),
                    SizedBox(height: 2.h),
                    SizedBox(
                      height: 12.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap:(){
                                Get.to(const PerformanceScreen(index: 0));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 2.w),
                                decoration: BoxDecoration(
                                  color: const Color(0xffFDFDFD),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: BaseColors.primaryColor
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(translate(context).performance, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),textAlign: TextAlign.center,),
                                    Obx(()=> Text(controller.rationOfPerformance?.value.toString()??"", style: Style.montserratBoldStyle().copyWith(fontSize: 21.sp, color: BaseColors.txtPrimaryColor),textAlign: TextAlign.center,)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap:(){
                                // Get.to(const AttendanceScreen());
                                Get.to(const NoteBookScreen());
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 2.w,right: 2.w),
                                decoration: BoxDecoration(
                                  color: const Color(0xffFDFDFD),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                      color: BaseColors.primaryColor
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(translate(context).notebook, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),textAlign: TextAlign.center,),
                                    Image.asset(calenderPng, height: 4.h,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap:(){
                                // Get.to(const StarEvaluationScreen());
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 2.w),
                                decoration: BoxDecoration(
                                  color: const Color(0xffFDFDFD),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                      color: BaseColors.primaryColor
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(translate(context).star_evaluation, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),textAlign: TextAlign.center,),
                                    SvgPicture.asset(graphSvg,height: 3.5.h),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
                ),
                SliverToBoxAdapter(
                  child: BaseToggleTabBar(
                      controller: tabController,
                      tabs: [
                        BaseTabButton(title: translate(context).news_slash_broadcast, isSelected: tabController.index == 0,type: toggleLargeButton),
                        BaseTabButton(title: translate(context).star_gallery, isSelected: tabController.index == 1,type: toggleLargeButton),
                      ],bottomMargin: 2.h,
                  ),
                ),
              ];
            },
            body: TabBarView(
                controller: tabController,
                children: const [
                  NewsBroadCastTab(),
                  StarGalleryTab(),
                ]),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
