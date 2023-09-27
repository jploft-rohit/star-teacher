import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/class_response.dart';
import 'package:staff_app/backend/responses_model/class_section_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_student_filter.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/constant_images.dart';
import 'package:staff_app/utility/custom_filter_dropdown.dart';
import 'package:staff_app/utility/dummy_lists.dart';
import 'package:staff_app/utility/filter_textformfield.dart';
import 'package:staff_app/view/sos/sos_scanQR.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/attendance_list_tile.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/qr/attendance_qr_scanner.dart';
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
    controller.selectedAttendanceTabIndex.value = 0;
    controller.selectedFMOPos.value = 0;
    tabController = TabController(length: 3, vsync: this)..addListener(() {
      if (!tabController.indexIsChanging) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          controller.selectedAttendanceTabIndex.value = tabController.index;
          controller.getStarsAttendanceList();
          if (mounted) {
            setState(() {});
          }
        });
      }
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
                      onChange: (value) async {
                        controller.selectedSchoolId.value = value?.sId??"";
                        controller.selectedSchoolName.value = value?.name??"";
                        /// Clear Data
                        controller.searchController.clear();
                        controller.selectedClassId.value = "";
                        controller.selectedClassName.value = "";
                        controller.selectedSectionName.value = "";
                        controller.selectedSectionId.value = "";
                        await baseCtrl.getClassList(schoolId: controller.selectedSchoolId.value);
                        if (controller.selectedFMOPos.value == 2 && controller.selectedClassType.value == 0) {
                          controller.getManualStarAttendanceList();
                        }else{
                          controller.getStarsAttendanceList();
                        }
                      },icon: classTakenSvg),
                  const SizedBox(
                    height: 35,
                    width: 1,
                    child: VerticalDivider(
                      width: 1,
                    ),
                  ),
                  CustomFilterDropDown(
                      hintText: controller.selectedClassName.value.isEmpty ? 'Class' : controller.selectedClassName.value,
                      item: baseCtrl.classList?.map((ClassData value){
                        return DropdownMenuItem<ClassData>(
                            value: value,
                            child: addText(value.name??"", 16.sp, Colors.black, FontWeight.w400));
                      }).toList(),
                      onChange: (value) async {
                        controller.searchController.clear();
                        controller.selectedClassId.value = value?.sId??"";
                        controller.selectedClassName.value = value?.name??"";
                        /// Clear Data
                        controller.searchController.clear();
                        controller.selectedSectionName.value = "";
                        controller.selectedSectionId.value = "";
                        await baseCtrl.getClassSections(classId: controller.selectedClassId.value);
                        if (controller.selectedFMOPos.value == 2 && controller.selectedClassType.value == 0) {
                          controller.getManualStarAttendanceList();
                        }else{
                          controller.getStarsAttendanceList();
                        }
                      },icon: classTakenSvg,
                  ),
                ],
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              Row(
                children: [
                  CustomFilterDropDown(
                    hintText: controller.selectedSectionName.value.isEmpty ? 'Section' : controller.selectedSectionName.value,
                    item: baseCtrl.classSectionList?.map((ClassSectionData data){
                      return DropdownMenuItem<ClassSectionData>(
                        value: data,
                        child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                      );
                    }).toList(),
                    onChange: (value) async {
                      controller.searchController.clear();
                      controller.selectedSectionName.value = value.name;
                      controller.selectedSectionId.value = value.sId;
                      if (controller.selectedFMOPos.value == 2 && controller.selectedClassType.value == 0) {
                        controller.getManualStarAttendanceList();
                      }else{
                        controller.getStarsAttendanceList();
                      }
                    },
                    icon: classTakenSvg,
                  ),
                ],
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              FilterTextFormField(
                controller: controller.searchController,
                onChange: (value) {
                  controller.baseDebouncer.run((){
                  if (controller.selectedFMOPos.value == 2 && controller.selectedClassType.value == 0) {
                    controller.getManualStarAttendanceList();
                  }else{
                    controller.getStarsAttendanceList();
                  }
                });
                },
                hintText: "Search Star, ID...",
                keyBoardType: TextInputType.name,
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
              padding: const EdgeInsets.symmetric(horizontal: 1),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.fmoImageList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  // mainAxisSpacing: 15,
                  mainAxisExtent: 42
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        controller.selectedFMOPos.value = index;
                        starNfcListen();
                      }else if(index == 1){
                        stopNfcListen();
                        controller.selectedFMOPos.value = index;
                        Get.to(const AttendanceQRScanner());
                      }else if(index == 2) {
                        stopNfcListen();
                        if (controller.selectedSchoolId.value.isNotEmpty) {
                          controller.selectedFMOPos.value = index;
                          controller.getManualStarAttendanceList();
                        }else{
                          baseToast(message: "First Select School");
                        }
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
                  );
              })
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
                        Get.to(const AttendanceQRScanner());
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
                children: const [
                  AttendanceListTile(),
                  AttendanceListTile(),
                  AttendanceListTile(),
                ],
              ),
            );
          }else{
            return const SizedBox.shrink();
          }
        }),
        Obx(()=>Visibility(
            visible: controller.selectedFMOPos.value == 2,
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: BaseColors.primaryColor,
                  value: controller.isSelectAll.value,
                  side: const BorderSide(color: BaseColors.primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  onChanged: (bool? value) {
                    controller.manualList?.forEach((element) {
                      element.isSelected = controller.isSelectAll.value == false ? true : false;
                    });
                    controller.isSelectAll.value = (value??false);
                    controller.selectedFMOPos1.value = (value??false) ? 1 : 0;
                    if (controller.isSelectAll.value) {
                      controller.selectedManualStudentsId.value = [];
                      controller.manualList?.forEach((element) {
                        controller.selectedManualStudentsId.add(element.sId??"");
                      });
                    }else{
                      controller.selectedManualStudentsId.value = [];
                    }
                    print(" <---- Selected Manual Student's Id ---> ");
                    print(controller.selectedManualStudentsId.toString());
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
            child: Expanded(
                child: (controller.manualList?.length??0) == 0 ? const BaseNoData() : ListView.builder(
                  padding: EdgeInsets.only(bottom: 2.h),
                  itemCount: controller.manualList?.length??0,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return ManualAttendanceListTile(index: index);
                })),
          )),
        Obx(()=>Visibility(
            visible: controller.selectedFMOPos.value == 2,
            child: Padding(
              padding: EdgeInsets.only(top: 1.h,bottom: 1.h),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: BaseButton(title: translate(context).present.toUpperCase(), onPressed: (){
                      if (controller.isSelectAll.value) {
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return ConfirmationDialog(msg: "Are you sure you want mark present to all students?",isShowBtn: true,onTap: () {
                              BaseOverlays().dismissOverlay();
                              controller.updateManualAttendance(presentStatus: "1", attendanceType: "present");
                            },
                            );
                          },
                        );
                      }else{
                        baseToast(message: "Please Select All");
                      }
                    },btnType: mediumLargeButton,),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: BaseButton(title: translate(context).late.toUpperCase(), onPressed: (){
                      if (controller.isSelectAll.value) {
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return ConfirmationDialog(msg: "Are you sure you want mark late to all students?",isShowBtn: true, onTap: () {
                              BaseOverlays().dismissOverlay();
                              controller.updateManualAttendance(presentStatus: "0.75", attendanceType: "late").then((value){
                              });
                            },
                            );
                          },
                        );
                      }else{
                        baseToast(message: "Please Select All");
                      }
                    },btnType: mediumLargeButton,),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: BaseButton(title: translate(context).absent.toUpperCase(), onPressed: (){
                      if (controller.isSelectAll.value) {
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return ConfirmationDialog(msg: "Are you sure you want mark absent to all students?",isShowBtn: true,onTap: () {
                              BaseOverlays().dismissOverlay();
                              controller.updateManualAttendance(presentStatus: "0", attendanceType: "absent");
                            },
                            );
                          },
                        );
                      }else{
                        baseToast(message: "Please Select All");
                      }
                    },btnType: mediumLargeButton,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  starNfcListen() {
    RawKeyboard.instance.addListener(handleKeyPress);
    print('starNfcListen');
  }

  stopNfcListen() {
    RawKeyboard.instance.removeListener(handleKeyPress);
    print('stopNfcListen');
  }

  Future<void> handleKeyPress(RawKeyEvent event) async {
    if (event is RawKeyUpEvent) {
      FocusScope.of(Get.context!).unfocus();
      print(event.data.logicalKey.keyLabel);
      if (event.data.logicalKey.keyLabel == 'Enter' ||
          event.data.logicalKey.keyLabel == 'Shift') {
        controller.nfcValue.value = controller.nfcValue.value.replaceAll('Enter', '');
        await controller.searchStudentWithQRCode(keyword: controller.nfcValue.value);
        controller.nfcValue.value = '';
      }
      controller.nfcValue.value += event.data.logicalKey.keyLabel;
    }
  }

  callApi(data) async {
    try {
      stopNfcListen();
      Get.back();
      BaseOverlays().showLoader();
      await BaseAPI().get(url: '').then((response) {
        print(response);
        BaseOverlays().dismissOverlay();
        Get.back();
      });
    } catch (e) {
      print(e);
      BaseOverlays().dismissOverlay();
      Get.back();
      // BaseOverlays().showSnackBar(message: 'Tag number is not active', title: "Error");
      // showSnackBar(message: 'Tag number is not active', success: false);
    }
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
