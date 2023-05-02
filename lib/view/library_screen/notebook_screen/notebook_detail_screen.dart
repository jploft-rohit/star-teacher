import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/library_screen/notebook_screen/add_note_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen_ctrl.dart';

class NotebookDetailScreen extends StatefulWidget {
  const NotebookDetailScreen({Key? key}) : super(key: key);

  @override
  State<NotebookDetailScreen> createState() => _NotebookDetailScreenState();
}

class _NotebookDetailScreenState extends State<NotebookDetailScreen> {
  NotebookScreenCtrl controller = Get.put(NotebookScreenCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(title: "Notebook"),
      floatingActionButton: BaseFloatingActionButton(
        onTap: () {Get.to(const AddNoteScreen());},
        title: 'Add Note',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: BaseColors.borderColor)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: BaseColors.primaryColor)
                          ),
                          child: SvgPicture.asset(girlSvg, height: 6.h,),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sania", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
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
                            Text("#562665", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
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
                            Text("G3-H1", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: (){
                          showScanQrDialogue(context, false);
                        },
                        child: SvgPicture.asset(qrCodeSvg))
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Obx(() => Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        controller.selectedIndex1.value = 0;
                      },
                      child: Container(
                        height: 40.0,
                        width: getWidth(context) * 50 / 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.selectedIndex1.value == 0 ? BaseColors.backgroundColor : BaseColors.txtFieldTextColor,
                            border: Border.all(
                                color: controller.selectedIndex1.value == 0 ? Colors.transparent : BaseColors.txtFiledBorderColor
                            ),
                            boxShadow: [
                              if(controller.selectedIndex1.value == 0)
                                const BoxShadow(
                                    color: BaseColors.darkShadowColor,
                                    spreadRadius: 1.0,
                                    blurRadius: 2.0,
                                    offset: Offset(0, 3)
                                )
                            ],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Has Talent", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex1.value == 0 ? BaseColors.primaryColor : BaseColors.txtFiledBorderColor, fontSize: toggleButtonTs,
                            fontWeight: controller.selectedIndex1.value == 0?FontWeight.bold:FontWeight.w400),),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 2.w,
                  ),
                  Obx(() => Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        controller.selectedIndex1.value = 1;
                      },
                      child: Container(
                        height: 40.0,
                        width: getWidth(context) * 50 / 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.selectedIndex1.value == 1 ? BaseColors.backgroundColor : BaseColors.txtFieldTextColor,
                            border: Border.all(
                                color: controller.selectedIndex1.value == 1 ? Colors.transparent : BaseColors.txtFiledBorderColor
                            ),
                            boxShadow: [
                              if(controller.selectedIndex1.value == 1)
                                const BoxShadow(
                                    color: BaseColors.darkShadowColor,
                                    spreadRadius: 1.0,
                                    blurRadius: 2.0,
                                    offset: Offset(0, 3)
                                )
                            ],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Need Improvement", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex1.value == 1 ? BaseColors.primaryColor : BaseColors.txtFiledBorderColor, fontSize: toggleButtonTs,
                        fontWeight: controller.selectedIndex1.value == 1?FontWeight.bold:FontWeight.w400),),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              ListView.builder(
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    addText("Title: ", 16.sp, BaseColors.textBlackColor, FontWeight.w700),
                                    addText("Extra classes for her", 16.sp, BaseColors.primaryColor, FontWeight.w700),
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Get.to(const AddNoteScreen(isUpdating: true,));
                                      },
                                      child: Image.asset(editPng, color: BaseColors.primaryColor,height: 18.sp,),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        BaseOverlays().showConfirmationDialog(title: "Are you sure you want to\ndelete this Note?");
                                      },
                                      child: Icon(
                                        CupertinoIcons.delete,
                                        color: BaseColors.primaryColor,
                                        size: 18.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                buildInfoItems("Grade", "5th"),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  height: 20.0,
                                  width: 1,
                                  color: BaseColors.borderColor,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                SvgPicture.asset("assets/images/Group (1).svg", height: 15,),
                                SizedBox(
                                  width: 2.w,
                                ),
                                buildInfoItems("Date", "07/07/2022"),
                              ],
                            ),
                            const Divider(),
                            buildInfoItems("Description", "This star has good dance skills, so I recommend extra classes for her to improve more."),
                            const Divider(),
                            buildInfoItems("Teacher", "Ovaish Khan"),
                            const Divider(),
                            buildInfoItems("Subject", "Science"),
                            Obx(()=>Visibility(
                                visible: controller.selectedIndex1.value == 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Divider(),
                                    buildInfoItems("Comment", "Lorem Ipsum is simply dummy text..."),
                                    const Divider(),
                                    buildInfoItems("Recommendation", "Dance"),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
