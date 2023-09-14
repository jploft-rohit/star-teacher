import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/class_response.dart';
import 'package:staff_app/backend/responses_model/class_section_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:staff_app/view/star_reward_screen/reward_screen_ctrl.dart';
import 'package:staff_app/view/star_reward_screen/rewards_screen.dart';

import '../../utility/sizes.dart';

class StarRewardScreen extends StatefulWidget {
  const StarRewardScreen({Key? key}) : super(key: key);

  @override
  State<StarRewardScreen> createState() => _StarRewardScreenState();
}

class _StarRewardScreenState extends State<StarRewardScreen> {

  TextEditingController searchCtrl = TextEditingController();
  RewardScreenCtrl controller = Get.put(RewardScreenCtrl());
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void initState() {
    super.initState();
    controller.selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
    controller.selectedSchoolName.value = baseCtrl.schoolListData.data?.data?.first.name??"";
    /// Clearing Data
    controller.selectedClassId.value = "";
    controller.selectedClassName.value = "";
    controller.selectedSectionId.value = "";
    controller.selectedSectionName.value = "";
    controller.selectedStarId.value = "";
    baseCtrl.searchController.clear();
    baseCtrl.getStarsList(schoolId: controller.selectedSchoolId.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).star_rewards),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 2.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: ColorConstants.borderColor
                ),
              ),
              child: Obx(()=>Column(
                children: [
                  Row(
                    children: [
                      CustomFilterDropDown(
                        hintText: controller.selectedSchoolName.value.isEmpty ? 'School' : controller.selectedSchoolName.value,
                        item: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
                          return DropdownMenuItem<SchoolData>(
                            value: data,
                            child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                          );
                        }).toList(),
                        onChange: (value) async {
                          baseCtrl.searchController.clear();
                          controller.selectedSchoolName.value = value.name;
                          controller.selectedSchoolId.value = value.sId;
                          await baseCtrl.getClassList(schoolId: controller.selectedSchoolId.value);
                          baseCtrl.getStarsList(schoolId: controller.selectedSchoolId.value,classId: controller.selectedClassId.value,sectionId: controller.selectedSectionId.value);
                        },
                        icon: classTakenSvg,
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      CustomFilterDropDown(
                        hintText: controller.selectedClassName.value.isEmpty ? 'Class' : controller.selectedClassName.value,
                        item: baseCtrl.classList?.map((ClassData data){
                          return DropdownMenuItem<ClassData>(
                            value: data,
                            child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                          );
                        }).toList(),
                        onChange: (value) async {
                          baseCtrl.searchController.clear();
                          controller.selectedClassName.value = value.name;
                          controller.selectedClassId.value = value.sId;
                          await baseCtrl.getClassSections(classId: controller.selectedClassId.value);
                          baseCtrl.getStarsList(schoolId: controller.selectedSchoolId.value,classId: controller.selectedClassId.value,sectionId: controller.selectedSectionId.value);
                        },
                        icon: classTakenSvg,
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // CustomFilterDropDown(
                      //   hintText: controller.selectedClassName.value.isEmpty ? 'Select Class' : controller.selectedClassName.value,
                      //   item: baseCtrl.classList?.map((ClassData data){
                      //     return DropdownMenuItem<ClassData>(
                      //       value: data,
                      //       child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                      //     );
                      //   }).toList(),
                      //   onChange: (value) {
                      //     controller.selectedClassName.value = value.name;
                      //     controller.selectedClassId.value = value.sId;
                      //     baseCtrl.getClassSections(classId: controller.selectedClassId.value);
                      //     baseCtrl.getStarsList(schoolId: controller.selectedSchoolId.value,classId: controller.selectedClassId.value,sectionId: controller.selectedSectionId.value);
                      //   },
                      //   icon: classTakenSvg,
                      // ),
                      SizedBox(
                        height: 4.h,
                        width: 1,
                        child: const VerticalDivider(width: 1),
                      ),
                      CustomFilterDropDown(
                        hintText: controller.selectedSectionName.value.isEmpty ? 'Section' : controller.selectedSectionName.value,
                        item: baseCtrl.classSectionList?.map((ClassSectionData data){
                          return DropdownMenuItem<ClassSectionData>(
                            value: data,
                            child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                          );
                        }).toList(),
                        onChange: (value) {
                          baseCtrl.searchController.clear();
                          controller.selectedSectionName.value = value.name;
                          controller.selectedSectionId.value = value.sId;
                          baseCtrl.getStarsList(schoolId: controller.selectedSchoolId.value,classId: controller.selectedClassId.value,sectionId: controller.selectedSectionId.value);
                        },
                        icon: classTakenSvg,
                      )
                    ],
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  FilterTextFormField(
                    controller: baseCtrl.searchController,
                    onChange: (val)=> controller.baseDebouncer.run(()=> baseCtrl.getStarsList(
                      schoolId: controller.selectedSchoolId.value,
                      sectionId: controller.selectedSectionId.value,
                      classId: controller.selectedClassId.value,
                    )),
                    hintText: "Search Star,ID...",
                    keyBoardType: TextInputType.name,
                  ),
                ],
              ),
             ),
            ),
            Expanded(
              child: Obx(()=>SmartRefresher(
                footer: const BasePaginationFooter(),
                controller: baseCtrl.refreshController,
                enablePullDown: enablePullToRefresh,
                enablePullUp: true,
                onLoading: (){
                  baseCtrl.getStarsList(refreshType: "load", schoolId: controller.selectedSchoolId.value, classId: controller.selectedClassId.value, sectionId: controller.selectedSectionId.value);
                },
                onRefresh: (){
                  baseCtrl.getStarsList(refreshType: "refresh", schoolId: controller.selectedSchoolId.value, classId: controller.selectedClassId.value, sectionId: controller.selectedSectionId.value);
                },
                child: (baseCtrl.starsList?.length??0) == 0
                    ? BaseNoData(message: "No Stars Found",topMargin: 28.h,)
                    : ListView.builder(
                       itemCount: baseCtrl.starsList?.length??0,
                       shrinkWrap: true,
                       itemBuilder: (context, index) {
                       return GestureDetector(
                        onTap: (){
                            controller.selectedStarId.value = baseCtrl.starsList?[index].user?.sId??"";
                            controller.selectedSchoolId.value = baseCtrl.starsList?[index].school??"";
                            controller.getRewards();
                            Get.to(const RewardsScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: BaseColors.borderColor
                                )
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 6.h,
                                  width: 6.h,
                                  padding: EdgeInsets.all(7.sp),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: BaseColors.primaryColor),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: BaseImageNetwork(
                                    link: baseCtrl.starsList?[index].user?.profilePic??"",
                                    concatBaseUrl: false,
                                    height: 3.h,
                                    width: 3.h,
                                    borderRadius: 5,
                                    errorWidget: SvgPicture.asset(manSvg),
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Padding(
                                  padding: EdgeInsets.all(10.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addText(toBeginningOfSentenceCase(baseCtrl.starsList?[index].user?.name??"N/A")??"N/A", 16.sp, BaseColors.primaryColor, FontWeight.w700),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          addText("ID: ", 14.sp, BaseColors.textBlackColor, FontWeight.w700),
                                          addText("#${baseCtrl.starsList?[index].studentId??"N/A"}", 14.sp, BaseColors.primaryColor, FontWeight.w700),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
