import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_detail_screen.dart';
import 'package:staff_app/view/library_screen/ctrl/notebook_ctrl.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

import '../../../utility/sizes.dart';

class NoteBookScreen extends StatefulWidget {
  const NoteBookScreen({Key? key}) : super(key: key);

  @override
  State<NoteBookScreen> createState() => _NoteBookScreenState();
}

class _NoteBookScreenState extends State<NoteBookScreen>{
  NotebookCtrl controller = Get.put(NotebookCtrl());
  BaseCtrl baseCtrl = Get.put(BaseCtrl());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(title: "Notebook"),
      // floatingActionButton: BaseFloatingActionButton(
      //   onTap: () {Get.to(const AddToDoNote());},
      //   title: 'Add Note',
      // ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            /// Filter
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
                          hintText: controller.selectedSchoolName.value.isEmpty ? 'Select School' : controller.selectedSchoolName.value,
                          item: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
                            return DropdownMenuItem<SchoolData>(
                              value: data,
                              child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                            );
                          }).toList(),
                          onChange: (value) {
                            baseCtrl.searchController.clear();
                            controller.selectedSchoolName.value = value.name;
                            controller.selectedSchoolId.value = value.sId;
                            baseCtrl.getClassList(schoolId: controller.selectedSchoolId.value);
                            baseCtrl.getStarsList(schoolId: controller.selectedSchoolId.value,classId: controller.selectedClassId.value,sectionId: controller.selectedSectionId.value);
                            // controller.getNotebookNotes(type: , pageIndex: );
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
                        CustomFilterDropDown(
                          hintText: controller.selectedClassName.value.isEmpty ? 'Select Class' : controller.selectedClassName.value,
                          item: baseCtrl.classList?.map((ClassData data){
                            return DropdownMenuItem<ClassData>(
                              value: data,
                              child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                            );
                          }).toList(),
                          onChange: (value) {
                            baseCtrl.searchController.clear();
                            controller.selectedClassName.value = value.name;
                            controller.selectedClassId.value = value.sId;
                            baseCtrl.getClassSections(classId: controller.selectedClassId.value);
                            baseCtrl.getStarsList(schoolId: controller.selectedSchoolId.value,classId: controller.selectedClassId.value,sectionId: controller.selectedSectionId.value);
                          },
                          icon: classTakenSvg,
                        ),
                        SizedBox(
                          height: 4.h,
                          width: 1,
                          child: const VerticalDivider(width: 1),
                        ),
                        CustomFilterDropDown(
                          hintText: controller.selectedSectionName.value.isEmpty ? 'Select Section' : controller.selectedSectionName.value,
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
            /// Data
            Expanded(
              child: Obx(()=>
              SmartRefresher(
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
                    ? const BaseNoData()
                    : ListView.builder(
                      itemCount: baseCtrl.starsList?.length??0,
                      padding: EdgeInsets.only(bottom: 12.h),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                      return GestureDetector(
                      onTap: (){
                        controller.selectedStarId.value = baseCtrl.starsList?[index].user?.sId??"";
                        Get.to(const NotebookDetailScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.all(15.sp),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: BaseColors.borderColor)
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.w,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(color: BaseColors.primaryColor)
                              ),
                              child: BaseImageNetwork(
                                link: baseCtrl.starsList?[index].user?.profilePic??"",
                                width: 20.w,
                                height: 20.w,
                                fit: BoxFit.fill,
                                errorWidget: SvgPicture.asset(girlSvg, height: 6.h),
                              ),
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(baseCtrl.starsList?[index].user?.name??"", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Container(
                                  width: 30.w,
                                  height: 1,
                                  color: BaseColors.borderColor,
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Text("# ${baseCtrl.starsList?[index].studentId??""}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Container(
                                  width: 30.w,
                                  height: 1,
                                  color: BaseColors.borderColor,
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Row(
                                  children: [
                                    Text("Last Comment Date : ", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                                    Text(formatBackendDate(baseCtrl.starsList?[index].lastcommentdate??""), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                                  ],
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Container(
                                  width: 30.w,
                                  height: 1,
                                  color: BaseColors.borderColor,
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Row(
                                  children: [
                                    Text("Total Notes : ", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                                    Text(((baseCtrl.starsList?[index].totalnotes.toString())??"0"), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                                  ],
                                ),
                              ],
                            ),
                          ],
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

class MyBullet extends StatelessWidget{
  const MyBullet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.0,
      width: 5.0,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
    );
  }
}
