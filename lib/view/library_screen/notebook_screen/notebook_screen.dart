import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/class_response.dart';
import 'package:staff_app/backend/responses_model/class_section_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_detail_screen.dart';
import 'package:staff_app/view/library_screen/ctrl/notebook_ctrl.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

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
    /// Clearing Data
    controller.selectedSchoolId.value = "";
    controller.selectedSchoolName.value = "";
    controller.selectedClassId.value = "";
    controller.selectedClassName.value = "";
    controller.selectedSectionId.value = "";
    controller.selectedSectionName.value = "";
    controller.selectedStarId.value = "";
    baseCtrl.getStarsList();
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
                    Divider(
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
                            controller.selectedClassName.value = value.name;
                            controller.selectedClassId.value = value.sId;
                            baseCtrl.getClassSections(classId: controller.selectedClassId.value);
                            baseCtrl.getStarsList(schoolId: controller.selectedSchoolId.value,classId: controller.selectedClassId.value,sectionId: controller.selectedSectionId.value);
                          },
                          icon: classTakenSvg,
                        ),
                        Container(
                          child: VerticalDivider(width: 1),
                          height: 4.h,
                          width: 1,
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
                            controller.selectedSectionName.value = value.name;
                            controller.selectedSectionId.value = value.sId;
                            baseCtrl.getStarsList(schoolId: controller.selectedSchoolId.value,classId: controller.selectedClassId.value,sectionId: controller.selectedSectionId.value);
                          },
                          icon: classTakenSvg,
                        )
                      ],
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    FilterTextFormField(
                      onChange: (String val) {},
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
              (baseCtrl.starsList?.length??0) == 0
                  ? BaseNoData()
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
                      margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: BaseColors.borderColor)
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: BaseColors.primaryColor)
                            ),
                            child: SvgPicture.asset(girlSvg, height: 6.h),
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
                                  Text(formatBackendDate(baseCtrl.starsList?[index].lastCommentDate??""), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
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
                                  Text(((baseCtrl.starsList?[index].totalNotes.toString())??"0"), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
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
          ],
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Colors.black,
      ),
    );
  }
}
