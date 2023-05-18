import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_qr.dart';
import 'package:staff_app/view/library_screen/notebook_screen/add_note_screen.dart';
import 'package:staff_app/view/library_screen/ctrl/notebook_ctrl.dart';

class NotebookDetailScreen extends StatefulWidget {
  const NotebookDetailScreen({Key? key}) : super(key: key);

  @override
  State<NotebookDetailScreen> createState() => _NotebookDetailScreenState();
}

class _NotebookDetailScreenState extends State<NotebookDetailScreen> {
  final String na = translate(Get.context!).na;
  NotebookCtrl controller = Get.find<NotebookCtrl>();

  @override
  void initState() {
    super.initState();
    controller.getNotebookNotes(type: "talent", pageIndex: 1);
  }

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
              Obx(()=>Container(
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
                              Text(controller.starData?.value.user?.name??na, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                              SizedBox(height: 0.5.h,),
                              Container(
                                width: 30.w,
                                height: 1,
                                color: BaseColors.borderColor,
                              ),
                              SizedBox(
                                height: .5.h,
                              ),
                              Text("#"+(controller.starData?.value.studentId??na), style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
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
                              Text("${controller.starData?.value.classes?.name??na}-${controller.starData?.value.classsection?.name??na}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                            ],
                          ),
                        ],
                      ),
                      BaseQr(data: controller.starData?.value.barcode??"")
                    ],
                  ),
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
                        controller.getNotebookNotes(type: "talent", pageIndex: 1);
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
                        controller.getNotebookNotes(type: "improvement", pageIndex: 1);
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
              Obx(()=>(controller.notebookList?.length??0) == 0
                  ? BaseNoData(topMargin: Get.height/4)
                  : ListView.builder(
                  itemCount: controller.notebookList?.length??0,
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
                                      addText(controller.notebookList?[index].title??na,
                                          16.sp, BaseColors.primaryColor, FontWeight.w700),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          Get.to(AddNoteScreen(isUpdating: true,data: controller.notebookList?[index]));
                                        },
                                        child: Image.asset(
                                          editPng,
                                          color: BaseColors.primaryColor,
                                          height: 18.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          BaseOverlays().showReasonDeleteDialog(
                                              title: "Delete Note",
                                              controller: controller.reasonController,
                                              onProceed: (){
                                                controller.deleteNotebook(notebookId: controller.notebookList?[index].sId??"",index: index);
                                              }
                                          );
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
                                  buildInfoItems("Date", getFormattedDate(controller.notebookList?[index].date??na)),
                                  // buildInfoItems("Date", "07/07/2022"),
                                ],
                              ),
                              const Divider(),
                              buildInfoItems("Description", controller.notebookList?[index].description??na),
                              const Divider(),
                              buildInfoItems("Teacher", controller.notebookList?[index].teacher??na),
                              const Divider(),
                              buildInfoItems("Subject", controller.notebookList?[index].subject?.name??na),
                          Visibility(
                            visible: controller.selectedIndex1.value == 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Divider(),
                                buildInfoItems("Comment", controller.notebookList?[index].description??na),
                                const Divider(),
                                buildInfoItems("Recommendation", controller.notebookList?[index].recommandation??na),
                                SizedBox(
                                  height: 1.h,
                                ),
                              ],
                            ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
