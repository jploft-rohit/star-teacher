import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';
import 'package:staff_app/view/star_attendance_screen/controller/star_attendance_screen_ctrl.dart';

import '../../../utility/images_icon_path.dart';
import '../../../utility/sizes.dart';

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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: Alignment.centerLeft,
        children: [
          GestureDetector(
            onTap: (){
              showGeneralDialog(
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return ConfirmationDialog(msg: translate(context).are_you_sure_youve_selected_present_stars,isShowBtn: true,);
                },
              );
            },
            child: Obx(() => Container(
              margin: const EdgeInsets.only(left: 15, right: 15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: controller.selectedFMOPos1.value == widget.index ? BaseColors.primaryColor : BaseColors.borderColor)),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8,8,8,8),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: BaseColors.primaryColor)),
                              child:SvgPicture.asset(girlSvg),
                            ),
                          ],
                        ),
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
                          child: Text('Roma #21', style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: BaseColors.primaryColor),),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                selectedRadioButton = "Present";
                                setState(() {});
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
                                        value: "Present",
                                        groupValue: selectedRadioButton,
                                        onChanged: (value){
                                          selectedRadioButton = "Present";
                                          setState(() {});
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
                                selectedRadioButton = "Late";
                                setState(() {});
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
                                        value: "Late",
                                        groupValue: selectedRadioButton,
                                        onChanged: (value){
                                          selectedRadioButton = value.toString();
                                          setState(() {});
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
                                selectedRadioButton = "Absent";
                                setState(() {});
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
                                        value: "Absent",
                                        groupValue: selectedRadioButton,
                                        onChanged: (value){
                                          selectedRadioButton = value.toString();
                                          setState(() {});
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
                            start: BorderSide(width: 1,color: controller.selectedFMOPos1.value == widget.index ? BaseColors.primaryColor : BaseColors.borderColor)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(chatSvg1),
                            SizedBox(height:1.1.h),
                            Text(translate(context).chat_with_parents,style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, color: const Color(0xff686868), ),textAlign: TextAlign.center,),
                          ],
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
                  controller.selectedFMOPos1.value = widget.index;
                  setState((){});
                },
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: controller.selectedFMOPos1.value == widget.index
                          ? BaseColors.backgroundColor
                          : BaseColors.borderColor,
                      boxShadow: [getLightBoxShadow()],
                      border: controller.selectedFMOPos1.value == widget.index
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
                        color: controller.selectedFMOPos1.value == widget.index
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
