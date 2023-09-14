import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/roles_list_response.dart';
import 'package:staff_app/new_assignments/controller/new_assignment_ctrl.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class AssignmentSelectPerson extends StatefulWidget {
  final String screenName;
  const AssignmentSelectPerson({Key? key, required this.screenName}) : super(key: key);

  @override
  State<AssignmentSelectPerson> createState() => _AssignmentSelectPersonState();
}

class _AssignmentSelectPersonState extends State<AssignmentSelectPerson> {
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  NewAssignmentCtrl controller = Get.find<NewAssignmentCtrl>();
  TextEditingController searchCtrl = TextEditingController();

  int selectedFMOPos = -1;
  String selectedRoleId = "";

  @override
  void initState() {
    super.initState();
    DummyLists.initialRole = "Select Person";
    // controller.getStaffData(selectedRoleId: baseCtrl.rolesListResponse.data?.first.sId??"");
    if (widget.screenName == "Assessment" || widget.screenName == "Lab") {
      controller.getStaffData(selectedRoleId: "Star");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
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
                      child: const Icon(Icons.close, color: Colors.black))
                  ],
                ),
                SizedBox(height: 2.h),
                Visibility(
                  visible: widget.screenName == "Awareness & Courses" || widget.screenName == "Worksheet",
                  child: Container(
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
                                  DummyLists.initialRole=value.name??"";
                                  controller.selectedPersonId.value = value.name??"";
                                  controller.assignmentToCtrl.value.text = value.name;
                                  controller.getStaffData(selectedRoleId: controller.selectedPersonId.value);
                                  setState(() {});
                                },icon: jobDetailSvg,
                            ),
                          ],
                        ),
                        const Divider(height: 1,thickness: 1),
                        FilterTextFormField(onChange: (String val) {
                        }, hintText: "Search By ID...", keyBoardType: TextInputType.name,
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.screenName == "Awareness & Courses" || widget.screenName == "Worksheet",
                  child: SizedBox(height: 3.h),
                ),
                Obx(()=> controller.isStaffLoading.value
                    ? const Center(child: SizedBox(height: 30,width: 30,child: CircularProgressIndicator()))
                    : SizedBox(
                  height: 30.h,
                  child: (controller.staffData.isEmpty) ? const BaseNoData() : ListView.builder(
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
                            controller.assignmentToCtrl.value.text = controller.staffData[index].name??"";
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
                                      padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                                      margin: const EdgeInsets.only(left: 2),
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
                                          SizedBox(
                                            height: .5.h,
                                          ),
                                          Row(
                                            children: [
                                              buildInfoItems("Role", controller.staffData[index].role?.displayName??""),
                                              SizedBox(
                                                width: 1.w,
                                              ),
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
