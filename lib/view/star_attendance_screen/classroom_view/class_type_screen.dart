import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_student_filter.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/custom_filter_dropdown.dart';
import 'package:staff_app/utility/dummy_lists.dart';
import 'package:staff_app/utility/filter_textformfield.dart';
import 'package:staff_app/view/sos/sos_scanQR.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/attendance_list_tile.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/manual_attendance_list_tile.dart';
import 'package:staff_app/view/star_attendance_screen/controller/star_attendance_screen_ctrl.dart';

class ClassTypeScreen extends StatefulWidget {
  const ClassTypeScreen({Key? key}) : super(key: key);

  @override
  State<ClassTypeScreen> createState() => _ClassTypeScreenState();
}

class _ClassTypeScreenState extends State<ClassTypeScreen> with SingleTickerProviderStateMixin{
  StarAttendanceScreenCtrl controller = Get.find<StarAttendanceScreenCtrl>();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  late TabController tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.getStarsAttendanceList(selectedClassIndex: controller.selectedClassType.value, selectedAttendanceIndex: controller.selectedAttendanceTabIndex.value);
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        controller.selectedAttendanceTabIndex.value = tabController.index;
        await controller.getStarsAttendanceList(selectedClassIndex: controller.selectedClassType.value, selectedAttendanceIndex: controller.selectedAttendanceTabIndex.value);
        if (mounted) {
          setState(() {});
        }
      });
    });
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Top Section
        Obx(()=>Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: ColorConstants.borderColor
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFilterDropDown(
                      hintText: controller.selectedSchoolName.value.isEmpty ? 'School' : controller.selectedSchoolName.value,
                      item: baseCtrl.schoolListData.data?.data?.map((SchoolData value){
                        return DropdownMenuItem<SchoolData>(
                            value: value,
                            child: addText(value.name??"", 16.sp, Colors.black, FontWeight.w400));
                      }).toList(),
                      onChange: (value) {
                        controller.selectedSchoolId.value = value?.sId??"";
                        controller.selectedSchoolName.value = value?.name??"";
                        // setState(() {});
                      },icon: classTakenSvg),
                  Container(
                    child: VerticalDivider(
                      width: 1,
                    ),
                    height: 35,
                    width: 1,
                  ),
                  CustomFilterDropDown(
                      initialValue: DummyLists.initialGrade, hintText: 'Class',
                      listData: DummyLists.gradeData, onChange: (value) {
                    setState(() {
                      DummyLists.initialGrade=value;
                    });
                  },icon: classTakenSvg
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
                      initialValue: DummyLists.initialClass, hintText: 'H1',
                      listData: DummyLists.classData, onChange: (value) {
                    setState(() {
                      DummyLists.initialClass=value;
                    });
                  },icon: classTakenSvg),
                  Container(child: VerticalDivider(width: 1,),height: 4.h,width: 1,),
                  CustomFilterDropDown(
                    initialValue: DummyLists.initialTerm, hintText: 'Term 1',
                    listData: DummyLists.termData, onChange: (value) {
                    setState(() {
                      DummyLists.initialTerm=value;
                    });
                  },icon: classTakenSvg,),
                ],
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              FilterTextFormField(onChange: (String val) {
              }, hintText: "Search Star,ID...", keyBoardType: TextInputType.name,
              ),
            ],
          ),
        )),
        SizedBox(height: 2.h),
        // BaseTypeSearch(searchController: TextEditingController()),
        Obx((){
          return controller.selectedClassType.value == 0
              ? GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 1),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.fmoImageList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  // mainAxisSpacing: 15,
                  mainAxisExtent: 42
              ),
              itemBuilder: (context, index) =>
                  GestureDetector(
                    onTap: () {
                      controller.selectedFMOPos.value = index;
                      if(index == 1){
                        Get.to(ScanQrCodeScreen());
                      }
                    },
                    child: Obx(() {
                      return Container(
                        height: 40,
                        // padding: const EdgeInsets.symmetric(horizontal: 9),
                        decoration: BoxDecoration(
                            color: controller.selectedFMOPos.value == index
                                ? BaseColors.backgroundColor
                                : BaseColors.white,
                            boxShadow: [getBoxShadow()],
                            border: controller.selectedFMOPos.value == index
                                ? Border.all(
                                color: BaseColors.primaryColor, width: 1)
                                : null,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: BaseColors.white, width: 2),
                                  shape: BoxShape.circle,
                                  boxShadow: [getBoxShadow()],
                                  color: controller.selectedFMOPos.value == index
                                      ? BaseColors.primaryColor
                                      : BaseColors.borderColor
                              ),
                              child: Icon(Icons.check, color: BaseColors.white,
                                  size: 17.sp),
                            ),
                            Obx(() => SvgPicture.asset(controller.fmoImageList[index],height: 30,color: controller.selectedFMOPos.value==index ? BaseColors.primaryColor:Colors.black,))
                          ],
                        ),
                      );
                    }),
                  ))
              : const SizedBox();
        }),
        SizedBox(
          height: 1.5.h,
        ),
        Obx(()=>controller.selectedFMOPos.value != 2
            ? Row(
            children: [
              Expanded(child: buildTabBar()),
              controller.selectedFMOPos.value == 1
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: GestureDetector(child: SvgPicture.asset(qrCodeSvg, height: 25.sp,color: BaseColors.primaryColor,),onTap: (){
                      // showScanQrDialogue(context, true);
                      Get.to(ScanQrCodeScreen());
                    }))
                  : const SizedBox.shrink(),
            ],
           ) : const SizedBox.shrink(),
        ),
        Obx(()=> Visibility(visible: controller.selectedFMOPos.value != 2,child: SizedBox(height: 1.5.h))),
        ///
        Obx(() {
          if(controller.selectedFMOPos.value != 2){
            return Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  const AttendanceListTile(),
                  const AttendanceListTile(),
                  const AttendanceListTile(),
                ],
              ),
            );
          }else{
            return SizedBox.shrink();
          }
        }),
        Obx(()=>Visibility(
            visible: controller.selectedFMOPos.value == 2,
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: BaseColors.primaryColor,
                  value: controller.isRulesChecked.value,
                  side: const BorderSide(color: BaseColors.primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  onChanged: (bool? value) {
                    controller.isRulesChecked.value = value!;
                    setState(() {});
                  },
                ),
                Text(translate(context).select_all),
              ],
            ),
          ),
        ),
        Obx(()=>Visibility(
            visible: controller.selectedFMOPos.value == 2,
            child: ManualAttendanceListTile(),
          )),
        Obx(()=>Visibility(
            visible: controller.selectedFMOPos.value == 2,
            child: Padding(
              padding: EdgeInsets.only(top: 1.h,bottom: 1.h),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: BaseButton(title: translate(context).present.toUpperCase(), onPressed: (){},btnType: mediumLargeButton,),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: BaseButton(title: translate(context).absent.toUpperCase(), onPressed: (){},btnType: mediumLargeButton,),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: BaseButton(title: translate(context).late.toUpperCase(), onPressed: (){},btnType: mediumLargeButton,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget buildTabBar() {
    return BaseTabBar(
      controller: tabController,
      tabs:  [
        Tab(
          text: translate(context).present,
        ),
        Tab(
          text: translate(context).absent,
        ),
        Tab(
          text: translate(context).late,
        ),
      ],
    );
  }
}
