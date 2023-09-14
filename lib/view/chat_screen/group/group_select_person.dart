import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/roles_list_response.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class GroupSelectPerson extends StatefulWidget {
  final bool? isOnlyAdding, isUpdating;
  final String? groupId;
  const GroupSelectPerson({Key? key, this.isOnlyAdding, this.groupId, this.isUpdating}) : super(key: key);

  @override
  State<GroupSelectPerson> createState() => _GroupSelectPersonState();
}

class _GroupSelectPersonState extends State<GroupSelectPerson> {
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  ChatScreenCtrl controller = Get.find<ChatScreenCtrl>();
  TextEditingController searchCtrl = TextEditingController();

  String selectedRoleId = "";

  @override
  void initState() {
    super.initState();
    DummyLists.initialRole = "Select Person";
    controller.staffData.clear();
    controller.selectedGroupUserID.value = [];
    // if (widget.isOnlyAdding??false) {
    //   controller.chatHistoryList?.forEach((element) {
    //     if ((widget.groupId??"") == (element?.sId??"")) {
    //       (element?.groupUsers??[]).asMap.forEach((index, userId) {
    //
    //       });
    //     }
    //   });
    // }
    // controller.getStaffData(selectedRoleId: baseCtrl.rolesListResponse.data?.first.sId??"");
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
                      child: const Icon(Icons.close, color: Colors.black),
                    )
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
                              hintText: DummyLists.initialRole??'Select Person',
                              item: baseCtrl.rolesListResponse.data?.map((RolesData value){
                                return DropdownMenuItem<RolesData>(
                                    value: value,
                                    child: addText(value.name??"", 16.sp, Colors.black, FontWeight.w400));
                              }).toList(),
                              onChange: (value) {
                                DummyLists.initialRole=value.name??"";
                                controller.selectedRoleId.value = value.name??"";
                                controller.selectedRoleName.value = value.name??"";
                                controller.getStaffData(selectedRoleId: controller.selectedRoleId.value);
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
                SizedBox(
                  height: 3.h,
                ),
                Obx(()=> controller.isStaffLoading.value
                  ? const Center(child: SizedBox(height: 30,width: 30,child: CircularProgressIndicator()))
                  : SizedBox(
                  height: 30.h,
                  child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.staffData.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: GestureDetector(
                          onTap: () async {
                            final String userID = await BaseSharedPreference().getString(SpKeys().userId);
                            controller.staffData[index].isSelected = !(controller.staffData[index].isSelected??false);
                            controller.selectedGroupUserID.clear();
                            controller.selectedGroupUserNames.clear();
                            for (var element in controller.staffData) {
                              if (element.isSelected??false) {
                                controller.selectedGroupUserID.add(element.sId??"");
                                controller.selectedGroupUserNames.add(element.name??"");
                                controller.selectedGroupUserID.add(userID);
                              }
                             }
                            controller.staffData.refresh();
                            setState(() {});
                            print("Selected Group User IDs");
                            print(controller.selectedGroupUserID.join(","));
                            print(controller.selectedGroupUserNames.join(",  "));
                            controller.personController.text = controller.selectedGroupUserNames.join(",  ");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: (controller.staffData[index].isSelected??false) ? BaseColors.backgroundColor : Colors.transparent,
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
                                              buildInfoItems("ID", controller.staffData[index].uniqueId.toString()??""),
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
                                        color: (controller.staffData[index].isSelected??false)
                                            ? BaseColors.backgroundColor
                                            : BaseColors.borderColor,
                                        boxShadow: [getLightBoxShadow()],
                                        border: (controller.staffData[index].isSelected??false)
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
                                          color: (controller.staffData[index].isSelected??false)
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
                    if (widget.isUpdating??false) {
                      controller.updateGroup(groupId: widget.groupId??"");
                    }else{
                      Get.back();
                    }
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
