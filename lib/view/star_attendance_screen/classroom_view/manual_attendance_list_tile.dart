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
  const ManualAttendanceListTile({Key? key}) : super(key: key);

  @override
  State<ManualAttendanceListTile> createState() => _ManualAttendanceListTileState();
}

class _ManualAttendanceListTileState extends State<ManualAttendanceListTile> {
  StarAttendanceScreenCtrl controller = Get.find<StarAttendanceScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(()=>ListView.builder(
          padding: EdgeInsets.only(bottom: 2.h),
          itemCount: controller.list?.length??0,
          shrinkWrap: true,
          itemBuilder: (context, index) {
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
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: controller.selectedFMOPos1.value == index ? BaseColors.primaryColor : BaseColors.borderColor)),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: BorderDirectional(
                                    end: BorderSide(width: 1,color: controller.selectedFMOPos1.value == index ? BaseColors.primaryColor : BaseColors.borderColor)
                                )),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12.0,8,8,8),
                              child: Row(
                                children: [

                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(
                                                color: BaseColors.primaryColor)),
                                        child:SvgPicture.asset(girlSvg),
                                      ),
                                      SizedBox(width: 2.w),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Roma #21', style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: BaseColors.primaryColor),),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Wrap(
                                            alignment: WrapAlignment.start,
                                            children: List.generate(controller.statusList.length, (index) {
                                              return Row(
                                                children: [
                                                  Transform.scale(
                                                    scale: 0.6,
                                                    child: Radio(value: index, groupValue: controller.statusList[index]['isSelected'], onChanged: (value){
                                                      for(var item in controller.statusList){
                                                        item['isSelected'] = false;
                                                      }
                                                      controller.statusList[index]['isSelected'] = value;
                                                      setState(() {});
                                                    },
                                                      splashRadius: 1.0,
                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                      fillColor: MaterialStateColor.resolveWith((states) => controller.statusList[index]['color']),
                                                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                                      activeColor: controller.statusList[index]['color'],
                                                    ),
                                                  ),
                                                  Text(controller.statusList[index]['title'], style: Style.montserratBoldStyle().copyWith(fontSize: radioButtonTitleTs, color: controller.statusList[index]['color']),),
                                                ],
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 2.w,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SvgPicture.asset(chatSvg1,),
                                  SizedBox(height:1.1.h),
                                  Text(translate(context).chat_with_parents,style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, color: const Color(0xff686868), ),textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: GestureDetector(
                      onTap: (){
                        controller.selectedFMOPos1.value = index;
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: controller.selectedFMOPos1.value == index
                                ? BaseColors.backgroundColor
                                : BaseColors.borderColor,
                            boxShadow: [getLightBoxShadow()],
                            border: controller.selectedFMOPos1.value == index
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
                              color: controller.selectedFMOPos1.value == index
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
