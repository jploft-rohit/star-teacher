import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen.dart';
import 'package:staff_app/view/library_screen/ctrl/notebook_ctrl.dart';
import 'package:staff_app/view/my_notes/add_todo_note.dart';
import 'package:staff_app/view/my_notes/ctrl/sticky_note_ctrl.dart';

class MyNotesScreen extends StatefulWidget {
  const MyNotesScreen({Key? key}) : super(key: key);

  @override
  State<MyNotesScreen> createState() => _MyNotesScreenState();
}

class _MyNotesScreenState extends State<MyNotesScreen> {
  StickyNoteCtrl controller = Get.put(StickyNoteCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {
          Get.to(const AddToDoNote(isEditing: false));
        },
        title: 'Add Note',
      ),
      appBar: BaseAppBar(title: "My Notes"),
      body: Padding(
        padding: EdgeInsets.all(scaffoldPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => (controller.unCheckedNotes?.length??0) == 0 && (controller.checkedNotes?.length??0) == 0
                  ? BaseNoData(topMargin: 40.h)
                  : StaggeredGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    children: List.generate(controller.unCheckedNotes?.length??0, (index) {
                      return Container(
                        height: 15.h,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Color(int.tryParse("0xff${controller.unCheckedNotes?[index].color??""}")??0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 4,
                              color: index == 2 || index == 3
                                  ? const Color(0xffFDD900)
                                  : const Color(0xffE54345),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(
                                              controller.unCheckedNotes?[index].title??"",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color:
                                                      BaseColors.textBlackColor,
                                                  fontWeight: FontWeight.w700),
                                              overflow: TextOverflow.ellipsis)),
                                      Row(
                                        children: [
                                          const SizedBox(width: 1),
                                          SizedBox(
                                            height: 10,
                                            width: 10,
                                            child: Checkbox(
                                              checkColor: Colors.white,
                                              activeColor: BaseColors.primaryColor,
                                              value: ((controller.unCheckedNotes?[index].noteStatus?.name??"") != "completed" ? false : true),
                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              side: const BorderSide(color: BaseColors.primaryColor),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3),),
                                              onChanged: (bool? value) {
                                                controller.updateStickyNoteStatus(id: controller.unCheckedNotes?[index].sId??"",index: index);
                                                // controller.unCheckedNotes?[index].noteStatus?.name = "completed";
                                                // controller.checkedNotes?.add(controller.unCheckedNotes![index]);
                                                // controller.unCheckedNotes?.removeAt(index);
                                              },
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              BaseOverlays().showConfirmationDialog(
                                                  title: "Are you sure you want to edit this Note?",
                                                  onRightButtonPressed: () {
                                                    BaseOverlays().dismissOverlay();
                                                    Get.to(AddToDoNote(isEditing: true, data: controller.unCheckedNotes?[index]));
                                                  },
                                              );
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 3.5.w, right: 2.w),
                                              child: Image.asset(
                                                editPng,
                                                height: 15.0,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                BaseOverlays().showConfirmationDialog(
                                                        title: "Are you sure you want to delete this Note?",
                                                        onRightButtonPressed: () {
                                                          controller.deleteStickyNote(id: controller.unCheckedNotes?[index].sId??"", index: index,isChecked: false);
                                                        });
                                              },
                                              child: SvgPicture.asset(
                                                  "assets/images/delete 4.svg")),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 1.5.h),
                                  addText(
                                      controller.unCheckedNotes?[index].description??"",
                                      14.sp,
                                      BaseColors.textBlackColor,
                                      FontWeight.w400,
                                  ),
                                  SizedBox(height: 2.h),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  )),
              Obx(() => Visibility(
                    visible: (controller.checkedNotes?.length??0) > 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text("Completed",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16.sp,fontWeight: FontWeight.bold)),
                    ),
                  )),
              Obx(() => StaggeredGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    children: List.generate(controller.checkedNotes?.length??0, (index) {
                      return Container(
                        height: 15.h,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(
                                              controller.checkedNotes?[index].title??"",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: BaseColors.textBlackColor,
                                                  fontWeight: FontWeight.w700,
                                                  ),
                                                  overflow: TextOverflow.ellipsis),
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 1),
                                          SizedBox(width: 3.5.w),
                                          GestureDetector(
                                            onTap: () {
                                              BaseOverlays().showConfirmationDialog(
                                                title: "Are you sure you want to edit this Note?",
                                                onRightButtonPressed: () {
                                                  BaseOverlays().dismissOverlay();
                                                  Get.to(AddToDoNote(isEditing: true, data: controller.checkedNotes?[index]));
                                                },
                                              );
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 3.5.w, right: 2.w),
                                              child: Image.asset(
                                                editPng,
                                                height: 15.0,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                BaseOverlays().showConfirmationDialog(
                                                    title: "Are you sure you want to delete this Note?",
                                                    onRightButtonPressed: () {
                                                      controller.deleteStickyNote(id: controller.checkedNotes?[index].sId??"", index: index,isChecked: true);
                                                    });
                                              },
                                              child: SvgPicture.asset(
                                                  "assets/images/delete 4.svg")),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                      controller.checkedNotes?[index].description??"",
                                      maxLines: 3,
                                      style: TextStyle(fontSize: 14.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400),
                                  ),
                                  Spacer(),
                                  Divider(color: Colors.white),
                                  Center(
                                      child: Text(
                                    translate(context).completed,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: BaseColors.primaryColor),
                                  )),
                                ],
                              ),
                            ),
                            Container(
                              height: 4,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      );
                    }),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
