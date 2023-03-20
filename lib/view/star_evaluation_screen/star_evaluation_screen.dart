import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_evaluation_screen/assesment_view.dart';
import 'package:staff_app/view/star_evaluation_screen/behavior_view.dart';
import 'package:staff_app/view/star_evaluation_screen/star_view.dart';
import 'package:staff_app/view/star_evaluation_screen/teacher_view.dart';

class StarEvaluationScreen extends StatefulWidget {
  const StarEvaluationScreen({Key? key}) : super(key: key);

  @override
  State<StarEvaluationScreen> createState() => _StarEvaluationScreenState();
}

class _StarEvaluationScreenState extends State<StarEvaluationScreen> with TickerProviderStateMixin {
  TextEditingController searchCtrl = TextEditingController();
  TabController? tabCtrl;
  @override
  void initState() {
    tabCtrl = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(context, translate(context).star_evaluation, [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: CustomColors.borderColor
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                          child: Row(
                            children: [
                              SvgPicture.asset(classTakenSvg,height: 15,),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("School", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_drop_down,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 25,
                        color: CustomColors.borderColor,
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(classTakenSvg,height: 15,),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("Grade 3", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_drop_down,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 0.0,),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                          child: Row(
                            children: [
                              SvgPicture.asset(classTakenSvg,height: 15,),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("H1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_drop_down,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 25,
                        color: CustomColors.borderColor,
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(jobDetailSvg,height: 15,),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("Term 1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_drop_down,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 0.0,),
                  CustomTextField(
                    controller: searchCtrl,
                    hintText: translate(context).search_by_id,
                    hintTextColor: CustomColors.textLightGreyColor,
                    borderColor: Colors.transparent,
                    contentPadding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            buildTabBar(),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: TabBarView(
                controller: tabCtrl,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  BehaviourView(),
                  AssesmentView(),
                  TeacherView(),
                  // StarView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return Container(
      height: 40,
      width: 100.w,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: TabBar(
        controller: tabCtrl,
        isScrollable: false,
        padding: const EdgeInsets.all(4),
        labelPadding: EdgeInsets.zero,
        indicatorWeight: 0.0,

        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]
        ),
        labelColor: CustomColors.primaryColor,
        indicatorPadding: EdgeInsets.zero,
        labelStyle: Style.montserratMediumStyle().copyWith(fontSize: 15.sp),
        unselectedLabelColor: Colors.black,
        tabs:  [
          Tab(
            text: translate(context).behaviour,
          ),
          Tab(
            text: translate(context).assessment,
          ),
          Tab(
            text: translate(context).teacher,
          ),
          // Tab(
          //   text: translate(context).stars,
          // ),
        ],
      ),
    );
  }
}
