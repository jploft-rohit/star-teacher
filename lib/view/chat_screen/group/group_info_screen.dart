import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/intl/intl.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/group/group_select_person.dart';

import '../../../utility/base_utility.dart';

class GroupInfoScreen extends StatefulWidget {
  final String groupId;
  final String? groupImage, groupName, schoolId;
  const GroupInfoScreen({super.key, required this.groupId, this.groupImage, this.groupName, this.schoolId});

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  ChatScreenCtrl controller = Get.find<ChatScreenCtrl>();

  @override
  void initState() {
    super.initState();
    controller.selectedSchoolId.value = widget.schoolId??"";
    controller.getGroupInfo(groupID: widget.groupId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {
          showGeneralDialog(
            context: context,
            pageBuilder:  (context, animation, secondaryAnimation) {
              return GroupSelectPerson(
                  isOnlyAdding: true,
                  groupId: widget.groupId,
                  isUpdating: true,
              );
            },
          ).then((value) {
            controller.getGroupInfo(groupID: widget.groupId);
          });
        },
        title: 'Add Member',
      ),
      appBar: const BaseAppBar(
        title: "Group Info",
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 4.h),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: (){
                    BaseOverlays().showMediaPickerDialog(
                        onCameraClick: () async {
                          BaseOverlays().dismissOverlay();
                          ImagePicker picker = ImagePicker();
                          await picker.pickImage(source: ImageSource.camera).then((value){
                            if (value != null) {
                              controller.selectedFile?.value = File(value.path);
                              controller.uploadController.text = value.path.split("/").last;
                            }
                          },
                         );
                        },
                        onGalleryClick: () async {
                          BaseOverlays().dismissOverlay();
                          ImagePicker picker = ImagePicker();
                          await picker.pickImage(source: ImageSource.gallery).then((value){
                            if (value != null) {
                              controller.selectedFile?.value = File(value.path);
                              controller.uploadController.text = value.path.split("/").last;
                            }
                          });
                        },
                    );
                  },
                  child: BaseImageNetwork(
                    link: widget.groupImage??"",
                    borderRadius: 10,
                    width: 90,
                    height: 90,
                  ),
                ),
                Positioned(
                  bottom: -1,
                  right: -1,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: BaseColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/images/ic_edit.svg",color: Colors.white,height: 8,width: 8,),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.h, bottom: 5.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.groupName??"",
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: BaseColors.primaryColor),
                ),
                SizedBox(width: 2.w),
                SvgPicture.asset(
                  "assets/images/ic_edit.svg",
                  height: 16,
                  width: 16,
                ),
              ],
            ),
          ),
          Obx(()=>ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: scaffoldPadding),
                itemCount: controller.groupData?.length??0,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          // color: (controller.groupData[index].isSelected??false) ? BaseColors.backgroundColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
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
                                padding: const EdgeInsets.only(top: 2, bottom: 2, left: 2, right: 2),
                                margin: const EdgeInsets.only(left: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: BaseColors.primaryColor
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white,
                                ),
                                child: BaseImageNetwork(
                                  link: controller.groupData?[index].profilePic??"",
                                  width: 40,
                                  height: 40,
                                  borderRadius: 7,
                                  // errorWidget: SvgPicture.asset(
                                  //   manSvg,
                                  //   height: 40,
                                  //   width: 70,
                                  // ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.groupData?[index].name??"", style: Style.montserratBoldStyle().copyWith(
                                      color: BaseColors.textBlackColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                     ),
                                    ),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    buildInfoItems("Designation", toBeginningOfSentenceCase(controller.groupData?[index].role?.name??"")??""),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              BaseOverlays().showConfirmationDialog(
                                title: "Are you sure, you want to remove this user ?",
                                onRightButtonPressed: (){
                                  controller.removeGroupUser(userId: controller.groupData?[index].sId??"", index: index, groupId: widget.groupId);
                                }
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "Remove",
                                style: TextStyle(
                                  color: BaseColors.primaryColor,
                                  fontSize: 12
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: BaseButton(
              topMargin: scaffoldPadding,
              rightMargin: scaffoldPadding,
              leftMargin: scaffoldPadding,
              title: "Delete Group",
              onPressed: (){
                BaseOverlays().showConfirmationDialog(
                  title: "Are you sure, you want to delete this group ?",
                  onRightButtonPressed: (){
                    BaseOverlays().dismissOverlay();
                    controller.deleteGroup(groupID: widget.groupId);
                  }
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
