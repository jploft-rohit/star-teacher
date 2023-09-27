import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/chat_screen/chating_screen.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';
import 'package:staff_app/view/star_attendance_screen/controller/star_attendance_screen_ctrl.dart';
import '../../../utility/images_icon_path.dart';

class ManualAttendanceListTile extends StatefulWidget {
  final int index;
  const ManualAttendanceListTile({Key? key, required this.index}) : super(key: key);

  @override
  State<ManualAttendanceListTile> createState() => _ManualAttendanceListTileState();
}

class _ManualAttendanceListTileState extends State<ManualAttendanceListTile> {
  String selectedRadioButton = "";
  StarAttendanceScreenCtrl controller = Get.find<StarAttendanceScreenCtrl>();
  @override
  void initState() {
    super.initState();
    selectedRadioButton = (controller.manualList?[widget.index].attendances?.attendanceType??"").toString().toLowerCase();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: Alignment.centerLeft,
        children: [
          GestureDetector(
            onTap: (){},
            child: Obx(() => Container(
              margin: const EdgeInsets.only(left: 15, right: 15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: (controller.manualList?[widget.index].isSelected??false)
                          ? BaseColors.primaryColor
                          : BaseColors.borderColor,
                  ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: BaseColors.primaryColor)),
                      child:BaseImageNetwork(
                        link: controller.manualList?[widget.index].user?.profilePic??"",
                        errorWidget: SvgPicture.asset(manSvg),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text('${controller.manualList?[widget.index].user?.name??""} #${controller.manualList?[widget.index].user?.uniqueId?.toString()??""}', style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: BaseColors.primaryColor),),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                if (selectedRadioButton != "present") {
                                  showGeneralDialog(
                                    context: context,
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return ConfirmationDialog(msg: "Are you sure you've selected present stars?",isShowBtn: true,
                                        onTap: () async {
                                        BaseOverlays().dismissOverlay();
                                        await controller.updateManualAttendance(presentStatus: "1", attendanceType: "present", singleStudentId: controller.manualList?[widget.index].sId??"").then((value){
                                          if (value) {
                                            selectedRadioButton = "present";
                                            setState(() {});
                                          }
                                        });
                                      },);
                                    },
                                  );
                                }
                              },
                              child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.only(bottom: 0.8.h,top: 0.8.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Transform.scale(
                                      scale: 0.6,
                                      child: Radio(
                                        value: "present",
                                        groupValue: selectedRadioButton,
                                        onChanged: (value){
                                          showGeneralDialog(
                                            context: context,
                                            pageBuilder: (context, animation, secondaryAnimation) {
                                              return ConfirmationDialog(msg: "Are you sure you've selected present stars?",isShowBtn: true,onTap: () async {
                                                BaseOverlays().dismissOverlay();
                                                  await controller.updateManualAttendance(presentStatus: "1", attendanceType: "present",singleStudentId: controller.manualList?[widget.index].sId??"").then((value){
                                                    if (value) {
                                                      selectedRadioButton = "present";
                                                      setState(() {});
                                                    }
                                                  });
                                                },
                                              );
                                            },
                                          );
                                        },
                                        splashRadius: 1.0,
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
                                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                        activeColor: Colors.green,
                                      ),
                                    ),
                                    Text("Present", style: Style.montserratBoldStyle().copyWith(fontSize: 10, color: Colors.green)),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                if (selectedRadioButton != "late") {
                                  showGeneralDialog(
                                    context: context,
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return ConfirmationDialog(msg: "Are you sure you've selected late stars?",isShowBtn: true,onTap: () async {
                                        BaseOverlays().dismissOverlay();
                                        await controller.updateManualAttendance(presentStatus: "0.75", attendanceType: "late",singleStudentId: controller.manualList?[widget.index].sId??"").then((value){
                                          if (value) {
                                            selectedRadioButton = "late";
                                            setState(() {});
                                          }
                                        });
                                      },
                                      );
                                    },
                                  );
                                }
                              },
                              child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.only(bottom: 0.8.h,top: 0.8.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Transform.scale(
                                      scale: 0.6,
                                      child: Radio(
                                        value: "late",
                                        groupValue: selectedRadioButton,
                                        onChanged: (value){
                                          showGeneralDialog(
                                            context: context,
                                            pageBuilder: (context, animation, secondaryAnimation) {
                                              return ConfirmationDialog(msg: "Are you sure you've selected late stars?",isShowBtn: true,onTap: () async {
                                                BaseOverlays().dismissOverlay();
                                                await controller.updateManualAttendance(presentStatus: "0.75", attendanceType: "late",singleStudentId: controller.manualList?[widget.index].sId??"").then((value){
                                                  if (value) {
                                                    selectedRadioButton = "late";
                                                    setState(() {});
                                                  }
                                                });
                                              },
                                              );
                                            },
                                          );
                                        },
                                        splashRadius: 1.0,
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        fillColor: MaterialStateColor.resolveWith((states) => const Color(0xffEC9C00)),
                                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                        activeColor: const Color(0xffEC9C00),
                                      ),
                                    ),
                                    Text("Late", style: Style.montserratBoldStyle().copyWith(fontSize: 10, color: const Color(0xffEC9C00))),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                if (selectedRadioButton != "absent") {
                                  showGeneralDialog(
                                    context: context,
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return ConfirmationDialog(msg: "Are you sure you've selected absent stars?",isShowBtn: true,onTap: () async {
                                        BaseOverlays().dismissOverlay();
                                        await controller.updateManualAttendance(presentStatus: "0", attendanceType: "absent",singleStudentId: controller.manualList?[widget.index].sId??"").then((value){
                                          if (value) {
                                            selectedRadioButton = "absent";
                                            setState(() {});
                                          }
                                        });
                                      },
                                      );
                                    },
                                  );
                                }
                              },
                              child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.only(bottom: 0.8.h,top: 0.8.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Transform.scale(
                                      scale: 0.6,
                                      child: Radio(
                                        value: "absent",
                                        groupValue: selectedRadioButton,
                                        onChanged: (value){
                                          showGeneralDialog(
                                            context: context,
                                            pageBuilder: (context, animation, secondaryAnimation) {
                                              return ConfirmationDialog(msg: "Are you sure you've selected absent stars?",isShowBtn: true,onTap: () async {
                                                BaseOverlays().dismissOverlay();
                                                await controller.updateManualAttendance(presentStatus: "0", attendanceType: "absent",singleStudentId: controller.manualList?[widget.index].sId??"").then((value){
                                                  if (value) {
                                                    selectedRadioButton = "absent";
                                                    setState(() {});
                                                  }
                                                });
                                              },
                                              );
                                            },
                                          );
                                        },
                                        splashRadius: 1.0,
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                        activeColor: Colors.red,
                                      ),
                                    ),
                                    Text("Absent", style: Style.montserratBoldStyle().copyWith(fontSize: 10, color: Colors.red)),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        border: BorderDirectional(
                            start: BorderSide(width: 1,color: (controller.manualList?[widget.index].isSelected??false) ? BaseColors.primaryColor : BaseColors.borderColor)),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(ChatingScreen(
                            receiverId: controller.manualList?[widget.index].user?.sId??"",
                            receiverName: controller.manualList?[widget.index].user?.name??"",
                            receiverProfilePic: controller.manualList?[widget.index].user?.profilePic??"",
                            schoolId: controller.manualList?[widget.index].school??"",
                            uniqueId: controller.manualList?[widget.index].studentId??"",
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              SvgPicture.asset(chatSvg1),
                              SizedBox(height:1.1.h),
                              Text("Chats",style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, color: const Color(0xff686868), ),textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
          Obx(()=>Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: GestureDetector(
                onTap: (){
                  controller.manualList?[widget.index].isSelected = !(controller.manualList?[widget.index].isSelected??false);
                  controller.manualList?.every((element) {
                    if (element.isSelected??false) {
                      controller.isSelectAll.value = true;
                      return true;
                    }else{
                      controller.isSelectAll.value = false;
                      return false;
                    }
                  });
                  setState((){});
                },
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: (controller.manualList?[widget.index].isSelected??false)
                          ? BaseColors.backgroundColor
                          : BaseColors.borderColor,
                      boxShadow: [getLightBoxShadow()],
                      border: (controller.manualList?[widget.index].isSelected??false)
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
                        color: (controller.manualList?[widget.index].isSelected??false)
                            ? BaseColors.primaryColor
                            : BaseColors.borderColor
                    ),
                    child: Center(
                      child: Icon(Icons.check, color: BaseColors.white,
                          size: 16.sp),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
