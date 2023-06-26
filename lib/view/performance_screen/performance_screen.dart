import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/performance_screen/controller/performance_screen_ctrl.dart';

class PerformanceScreen extends StatefulWidget {
  final int index;
  PerformanceScreen({Key? key,required this.index }) : super(key: key);

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> with TickerProviderStateMixin {
  late TabController tabCtrl;
  PerformanceController controller = Get.put(PerformanceController());

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 4, vsync: this)..addListener(() {
      if (!(tabCtrl.indexIsChanging)) {
        controller.selectedTabIndex.value = tabCtrl.index;
        controller.getData();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).performance),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 18.sp),
                decoration: BoxDecoration(
                  color: BaseColors.backgroundColor,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!,
                      offset: const Offset(0.0, 5.0,),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                    )
                  ]
                ),
                child: Column(
                  children: [
                    addText(translate(context).average_rating, 15.sp, BaseColors.primaryColor, FontWeight.w400),
                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(()=> addText(controller.averageRating.toString(), 20.sp, BaseColors.textBlackColor, FontWeight.w700)),
                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(()=>RatingBar.builder(
                        initialRating: controller.averageRating.value,
                        minRating: 1,
                        maxRating: 5,
                        ignoreGestures: true,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemSize: 28,
                        itemBuilder: (context, _) => const Icon(
                          CupertinoIcons.star_fill,
                          color: BaseColors.primaryColor,
                        ),
                        unratedColor: BaseColors.primaryColor.withOpacity(0.3),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            buildTabBar(),
            SizedBox(
              height: 2.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 5.5.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    addText("${translate(context).filter_by}:", 16.sp, BaseColors.textBlackColor, FontWeight.w700),
                    SizedBox(
                      width: 2.w,
                    ),
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Obx(() => GestureDetector(
                          onTap: (){
                            controller.selectedRatingIndex.value = index;
                            controller.getData();
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 4.h,
                                margin: EdgeInsets.only(right: 2.w),
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: controller.selectedRatingIndex.value == index ? BaseColors.backgroundColor : BaseColors.screenBackgroundColor,
                                    border: Border.all(
                                        color: controller.selectedRatingIndex.value == index ? Colors.transparent : BaseColors.txtFiledBorderColor
                                    ),
                                    boxShadow: [
                                      if(controller.selectedRatingIndex.value == index)
                                        const BoxShadow(
                                            color: BaseColors.darkShadowColor,
                                            spreadRadius: 1.0,
                                            blurRadius: 2.0,
                                            offset: Offset(0, 3)
                                        )
                                    ],
                                    borderRadius: BorderRadius.circular(15.sp)
                                ),
                                child: Row(
                                  children: [
                                    Text("${index + 1}", style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 17.sp),),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      color: BaseColors.primaryColor,
                                      size: 18.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabCtrl,
                children: [
                  tabBarViews(),
                  tabBarViews(),
                  tabBarViews(),
                  tabBarViews(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return BaseTabBar(
      controller: tabCtrl,
      tabs:  [
        Tab(
          text: translate(context).management,
        ),
        Tab(
          text: translate(context).staff,
        ),
        Tab(
          text: translate(context).stars,
        ),
        Tab(
          text: translate(context).parents,
        ),
      ],
    );
  }
  Widget tabBarViews(){
    return Obx(()=>ListView.builder(
        itemCount: controller.list?.length??0,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0, bottom: 10.0),
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: BaseColors.borderColor)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: double.parse(controller.list?[index]?.rating.toString()??"0.0"),
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      maxRating: 5,
                      minRating: 1,
                      itemCount: 5,
                      itemSize: 20.sp,
                      ignoreGestures: true,
                      itemBuilder: (context, _) => const Icon(
                        CupertinoIcons.star_fill,
                        color: BaseColors.primaryColor,
                      ),
                      unratedColor: BaseColors.primaryColor.withOpacity(0.3),
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    if((controller.list?[index]?.comment??"").toString().isNotEmpty)
                      Tooltip(
                        showDuration: const Duration(seconds: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        textStyle: TextStyle(
                          color: BaseColors.primaryColor,
                          fontSize: 1.8.h - 1,
                        ),
                        decoration: BoxDecoration(
                          color: BaseColors.secondaryColor,
                          border: Border.all(color: BaseColors.primaryColor),
                          // boxShadow: [getDeepBoxShadow()],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(20),
                        message: controller.list?[index]?.comment??"N/A",
                        triggerMode: TooltipTriggerMode.tap,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: BaseColors.backgroundColor,
                              border: Border.all(color: BaseColors.primaryColor)
                          ),
                          child: addText(controller.list?[index]?.comment??"N/A", 14.sp, BaseColors.primaryColor, FontWeight.w400),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/time_icon.svg"),
                    SizedBox(
                      width: 1.w,
                    ),
                    addText(getFormattedTime(controller.list?[index]?.createdAt??""), 15.sp, BaseColors.textBlackColor, FontWeight.w400),
                    SizedBox(
                      width: 10.w,
                    ),
                    SvgPicture.asset("assets/images/teacher_icon.svg"),
                    SizedBox(
                      width: 1.w,
                    ),
                    addText(controller.list?[index]?.ratedBy?.name??"", 15.sp, BaseColors.textBlackColor, FontWeight.w400),
                    SizedBox(
                      width: 1.w,
                    ),
                    addText("(${controller.list?[index]?.ratedBy?.role?.displayName??""})", 13.sp, BaseColors.primaryColor, FontWeight.w400)
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
