import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/base_dialogs.dart';
import 'package:staff_app/Utility/base_floating_action_button.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen_ctrl.dart';

import '../library_screen/notebook_screen/add_todo_note.dart';

class MyNotesScreen extends StatefulWidget {
  const MyNotesScreen({Key? key}) : super(key: key);

  @override
  State<MyNotesScreen> createState() => _MyNotesScreenState();
}

class _MyNotesScreenState extends State<MyNotesScreen> {
  late NotebookScreenCtrl notesController;

  @override
  void initState() {
    notesController = Get.put(NotebookScreenCtrl());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {Get.to(const AddToDoNote(isEditing: false));},
        title: 'Add Note',
      ),
      appBar: BaseAppBar(title: "My Notes"),
      body: Padding(
        padding: EdgeInsets.all(scaffoldPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(()=>StaggeredGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: List.generate(notesController.unDoneNotesList.length, (index){
                    return Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: index == 2 || index == 3 ? const Color(0xffFFF7AA) : const Color(0xffFFE7E9),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 4,
                            color: index == 2 || index == 3 ? const Color(0xffFDD900) : const Color(0xffE54345),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text(notesController.unDoneNotesList[index].heading,style: TextStyle(fontSize: 15.sp,color: BaseColors.textBlackColor,fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis)),
                                    Row(
                                      children: [
                                        const SizedBox(width: 1),
                                        SizedBox(
                                          height: 10,
                                          width: 10,
                                          child: Checkbox(
                                            checkColor: Colors.white,
                                            activeColor: BaseColors.primaryColor,
                                            value: notesController.unDoneNotesList[index].isTaskDone,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            side: const BorderSide(color: BaseColors.primaryColor),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(3),
                                            ),
                                            onChanged: (bool? value) {
                                              notesController.unDoneNotesList[index].isTaskDone = value!;
                                              notesController.doneNotesList.add(notesController.unDoneNotesList[index]);
                                              notesController.unDoneNotesList.removeAt(index);
                                              notesController.update();
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            Get.to(AddToDoNote(isEditing: true));
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 3.5.w,right: 2.w),
                                            child: Image.asset(editPng, height: 15.0,),
                                          ),
                                        ),
                                        GestureDetector(onTap: (){
                                          BaseDialogs().showConfirmationDialog(
                                              title: "Are you sure you want to delete this Note?",
                                              onRightButtonPressed: (){
                                                notesController.unDoneNotesList.removeAt(index);
                                                notesController.update();
                                                Get.back();
                                              }
                                          );
                                        },child: SvgPicture.asset("assets/images/delete 4.svg")),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    MyBullet(),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    addText("Hang washing", 14.sp, BaseColors.textBlackColor, FontWeight.w400),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    MyBullet(),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    addText("Hang washing", 14.sp, BaseColors.textBlackColor, FontWeight.w400),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    MyBullet(),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    addText("Hang washing", 14.sp, BaseColors.textBlackColor, FontWeight.w400),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                )),
              Obx(()=>Visibility(
                  visible: notesController.doneNotesList.length > 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text("Done",style: TextStyle(color: Colors.grey.shade400,fontSize: 12)),
                  ),
                )),
              Obx(()=>StaggeredGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: List.generate(notesController.doneNotesList.length, (index){
                    return Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 4,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text(notesController.doneNotesList[index].heading,style: TextStyle(fontSize: 15.sp,color: BaseColors.textBlackColor,fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis)),
                                    Row(
                                      children: [
                                        const SizedBox(width: 1),
                                        SizedBox(
                                          height: 10,
                                          width: 10,
                                          child: Checkbox(
                                            checkColor: Colors.white,
                                            activeColor: BaseColors.primaryColor,
                                            value: notesController.doneNotesList[index].isTaskDone,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            side: const BorderSide(color: BaseColors.primaryColor),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(3),
                                            ),
                                            onChanged: (bool? value) {
                                              notesController.doneNotesList[index].isTaskDone = value!;
                                              notesController.unDoneNotesList.add(notesController.doneNotesList[index]);
                                              notesController.doneNotesList.removeAt(index);
                                              notesController.update();
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3.5.w,
                                        ),
                                        Image.asset(editPng, height: 15.0,),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        SvgPicture.asset("assets/images/delete 4.svg"),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    MyBullet(),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    addText("Hang washing", 14.sp, BaseColors.textBlackColor, FontWeight.w400),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    MyBullet(),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    addText("Hang washing", 14.sp, BaseColors.textBlackColor, FontWeight.w400),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    MyBullet(),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    addText("Hang washing", 14.sp, BaseColors.textBlackColor, FontWeight.w400),
                                  ],
                                ),
                                Divider(color: Colors.white),
                                Center(child: Text(translate(context).completed,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,color: BaseColors.primaryColor),)),
                              ],
                            ),
                          )
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
