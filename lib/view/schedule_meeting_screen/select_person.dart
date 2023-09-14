import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/roles_list_response.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/schedule_meeting_screen/controller/schedule_meeting_screen_ctrl.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class SelectPersonPopup extends StatefulWidget {
  final String selectedSchoolId;
  const SelectPersonPopup({Key? key, required this.selectedSchoolId}) : super(key: key);

  @override
  State<SelectPersonPopup> createState() => _SelectPersonPopupState();
}

class _SelectPersonPopupState extends State<SelectPersonPopup> {
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  ScheduleMeetingScreenCtrl controller = Get.find<ScheduleMeetingScreenCtrl>();
  TextEditingController searchCtrl = TextEditingController();

  int selectedFMOPos = -1;

  @override
  void initState() {
    super.initState();
    DummyLists.initialRole = "Select Person";
    controller.staffData.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(""),
                    Text("Select Person", style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                SizedBox(height: 2.h),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: const Color(0xFFCECECE),width: 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomFilterDropDown(
                              initialValue: DummyLists.initialRole,
                              hintText: DummyLists.initialRole??'Select Person',
                              item: baseCtrl.rolesListResponse.data?.map((RolesData value){
                                return DropdownMenuItem<RolesData>(
                                    value: value,
                                    child: addText(value.name??"", 16.sp, Colors.black, FontWeight.w400));
                              }).toList(),
                              onChange: (value) {
                                controller.selectedRoleId.value = value.name??"";
                                controller.selectedRoleName.value = value.name??"";
                                setState(() {
                                  DummyLists.initialRole=value.name??"";
                                });
                              controller.getStaffData(selectedRoleId: controller.selectedRoleId.value, selectedSchoolId: widget.selectedSchoolId);
                              },icon: jobDetailSvg),
                        ],
                      ),
                      const Divider(height: 1,thickness: 1),
                      FilterTextFormField(onChange: (String val) {
                      }, hintText: "Search By ID...", keyBoardType: TextInputType.name,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Obx(()=> controller.isStaffLoading.value
                    ? const Center(child: SizedBox(height: 30,width: 30,child: CircularProgressIndicator()))
                    : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.staffData.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: GestureDetector(
                        onTap: (){
                          selectedFMOPos = index;
                          controller.selectedPersonId.value = controller.staffData[index].sId??"";
                          controller.selectedPersonController.value.text = controller.staffData[index].name??"";
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedFMOPos == index ? BaseColors.backgroundColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: BaseColors.borderColor
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 10.sp, right: 10.sp),
                                    margin: const EdgeInsets.only(left: 2,bottom: 2,top: 2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: BaseColors.primaryColor
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                    ),
                                    child: SvgPicture.asset(manSvg,height: 30,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.staffData[index].name??"", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                                        SizedBox(height: 0.5.h),
                                        Row(
                                          children: [
                                            buildInfoItems("Role", controller.staffData[index].role?.displayName??""),
                                            SizedBox(width: 1.w),
                                            buildInfoItems("ID", controller.staffData[index].uniqueId??""),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 10.0, left: 0.0),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  // padding: const EdgeInsets.symmetric(horizontal: 9),
                                  decoration: BoxDecoration(
                                      color: selectedFMOPos == index
                                          ? BaseColors.backgroundColor
                                          : BaseColors.borderColor,
                                      boxShadow: [getLightBoxShadow()],
                                      border: selectedFMOPos == index
                                          ? Border.all(
                                          color: BaseColors.primaryColor, width: 1.5)
                                          : Border.all(
                                          color: Colors.transparent, width: 1.5),
                                      borderRadius: BorderRadius.circular(30.0)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: BaseColors.white, width: 1.5),
                                        shape: BoxShape.circle,
                                        boxShadow: [getBoxShadow()],
                                        color: selectedFMOPos == index
                                            ? BaseColors.primaryColor
                                            : BaseColors.borderColor
                                    ),
                                    child: Center(
                                      child: Icon(Icons.check, color: BaseColors.white,
                                          size: 16.sp),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: BaseButton(title: "SAVE", onPressed: (){
                    Get.back();
                  },btnType: mediumButton,borderRadius: 20,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}