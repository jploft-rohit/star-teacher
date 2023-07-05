import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/news_broadcast_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/news_screen/news_details_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final DashboardScreenCtrl controller = Get.find<DashboardScreenCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: "News"),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addText("Latest Broadcasts & Events", 18.sp, BaseColors.textBlackColor, FontWeight.w700),
            Container(
              margin: EdgeInsets.only(top: 1.5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: ColorConstants.borderColor
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomFilterDropDown(
                        initialValue: DummyLists.initialSchool, hintText: 'School',
                        listData: DummyLists.schoolData, onChange: (value) {
                        setState(() {
                          DummyLists.initialSchool=value;
                        });
                      },icon: classTakenSvg,),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFilterDropDown(
                        initialValue: DummyLists.initialGrade, hintText: 'Grade',
                        listData: DummyLists.gradeData, onChange: (value) {
                        setState(() {
                          DummyLists.initialGrade=value;
                        });
                      },icon: classTakenSvg,),
                      Container(child: VerticalDivider(width: 1,),height: 4.h,width: 1,),
                      CustomFilterDropDown(
                        initialValue: DummyLists.initialClass, hintText: 'Class',
                        listData: DummyLists.classData, onChange: (value) {
                        setState(() {
                          DummyLists.initialClass=value;
                        });
                      },icon: classTakenSvg,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: Obx(()=> ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 8.h),
                  itemCount: controller.list?.length??0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(NewsBroadCastData());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: controller.list?[index].isRead.toString() == "false" ? const Color(0xFFF8F4E9) : const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xffF2F2F2),
                                  spreadRadius: 5.0,
                                  blurRadius: 5.0,
                              )
                            ]
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.list?[index].title??"", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp),),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(controller.list?[index].message??"", style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp, color: const Color(0xff072D4B), height: 2.0),),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    addText(controller.list?[index].user?.name??"", 13.sp, Colors.grey, FontWeight.w400),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    addText(formatBackendDate(controller.list?[index].updatedAt??""), 13.sp, Colors.grey, FontWeight.w400),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                if(controller.list?[index].isRead.toString() == "false")
                                  Center(
                                    child: BaseButton(title: "AGREED", onPressed: (){
                                      controller.agreeNewsBroadCast(id: controller.list?[index].sId??"", index: index);
                                    },textSize: 17.sp),
                                  ),
                                if(controller.list?[index].isRead.toString() != "false")
                                Center(
                                  child: BaseButton(title: "Acknowledged", onPressed: (){

                                  }, isActive: false, textSize: 17.sp,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
