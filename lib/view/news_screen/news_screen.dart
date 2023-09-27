import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/class_response.dart';
import 'package:staff_app/backend/responses_model/class_section_response.dart';
import 'package:staff_app/backend/responses_model/news_broadcast_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/utility/base_views/base_school_selection.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/news_screen/controller/news_controller.dart';
import 'package:staff_app/view/news_screen/news_details_screen.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

import '../../utility/sizes.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsController controller = Get.put(NewsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(title: "News"),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addText("Latest Broadcasts & Events", 18.sp, BaseColors.textBlackColor, FontWeight.w700),
            /// Filter
            // Container(
            //   margin: EdgeInsets.only(bottom: 2.h,top: 2.h),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.0),
            //     border: Border.all(
            //         color: ColorConstants.borderColor
            //     ),
            //   ),
            //   child: Obx(()=>Column(
            //     children: [
            //       Row(
            //         children: [
            //           CustomFilterDropDown(
            //             hintText: controller.selectedSchoolName.value.isEmpty ? 'School' : controller.selectedSchoolName.value,
            //             item: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
            //               return DropdownMenuItem<SchoolData>(
            //                 value: data,
            //                 child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
            //               );
            //             }).toList(),
            //             onChange: (value) async {
            //               controller.selectedSchoolName.value = value.name;
            //               controller.selectedSchoolId.value = value.sId;
            //               await baseCtrl.getClassList(schoolId: controller.selectedSchoolId.value);
            //               controller.getBroadCastData();
            //             },
            //             icon: classTakenSvg,
            //           ),
            //         ],
            //       ),
            //       const Divider(
            //         height: 1,
            //         thickness: 1,
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           CustomFilterDropDown(
            //             hintText: controller.selectedClassName.value.isEmpty ? 'Class' : controller.selectedClassName.value,
            //             item: baseCtrl.classList?.map((ClassData data){
            //               return DropdownMenuItem<ClassData>(
            //                 value: data,
            //                 child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
            //               );
            //             }).toList(),
            //             onChange: (value) async {
            //               controller.selectedClassName.value = value.name;
            //               controller.selectedClassId.value = value.sId;
            //               await baseCtrl.getClassSections(classId: controller.selectedClassId.value);
            //               controller.getBroadCastData();
            //             },
            //             icon: classTakenSvg,
            //           ),
            //           SizedBox(
            //             height: 4.h,
            //             width: 1,
            //             child: const VerticalDivider(width: 1),
            //           ),
            //           CustomFilterDropDown(
            //             hintText: controller.selectedSectionName.value.isEmpty ? 'Section' : controller.selectedSectionName.value,
            //             item: baseCtrl.classSectionList?.map((ClassSectionData data){
            //               return DropdownMenuItem<ClassSectionData>(
            //                 value: data,
            //                 child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
            //               );
            //             }).toList(),
            //             onChange: (value) {
            //               controller.selectedSectionName.value = value.name;
            //               controller.selectedSectionId.value = value.sId;
            //               controller.getBroadCastData(showLoader: true);
            //             },
            //             icon: classTakenSvg,
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            //   ),
            // ),
            BaseSchoolDropDown(
              topMargin: 2.h,
              controller: controller.schoolController,
              onChanged: (value) async {
                controller.schoolController.text = value.name??"";
                controller.selectedSchoolId.value = value.sId??"";
                controller.getBroadCastData();
              },
            ),
            Expanded(
              child: Obx(()=>
              SmartRefresher(
                footer: const BasePaginationFooter(),
                controller: controller.refreshController,
                enablePullDown: enablePullToRefresh,
                enablePullUp: true,
                onLoading: (){
                  controller.getBroadCastData(refreshType: "load");
                },
                onRefresh: (){
                  controller.getBroadCastData(refreshType: "refresh");
                },
                child: (controller.list?.length??0) == 0
                    ? const BaseNoData()
                    : ListView.builder(
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
                                  SizedBox(height: 1.h),
                                  Text(controller.list?[index].message??"", style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp, color: const Color(0xff072D4B), height: 2.0),),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      addText("Added by "+(controller.list?[index].sender?.roleData?.displayName??""), 13.sp, Colors.grey, FontWeight.w400),
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
                                    Center(child: BaseButton(title: "AGREE", onPressed: (){
                                        controller.agreeNewsBroadCast(id: controller.list?[index].sId??"", index: index);
                                      },textSize: 17.sp),
                                    ),
                                  if(controller.list?[index].isRead.toString() != "false")
                                  Center(
                                    child: BaseButton(title: "AGREED", onPressed: (){}, isActive: false, textSize: 17.sp,),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
