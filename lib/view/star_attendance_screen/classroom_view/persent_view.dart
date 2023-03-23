import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/performance_screen/performance_screen.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/change_status_popup.dart';
import 'package:staff_app/view/star_attendance_screen/star_attendance_screen_ctrl.dart';

class PresentView extends StatefulWidget {
  const PresentView({Key? key}) : super(key: key);

  @override
  State<PresentView> createState() => _PresentViewState();
}

class _PresentViewState extends State<PresentView> {
  StarAttendanceScreenCtrl controller = Get.find<StarAttendanceScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            alignment: Alignment.centerLeft,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: CustomColors.green)),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12.0,8,8,8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: CustomColors.primaryColor)),
                          child:SvgPicture.asset(girlSvg),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [

                            SizedBox(width: 2.w),
                            Column(
                              children: [
                                Text('Roma #21', style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: CustomColors.primaryColor),),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                InkWell(
                                  onTap: (){
                                    showGeneralDialog(
                                      context: context,
                                      pageBuilder: (context, animation, secondaryAnimation) {
                                        return ChangeStatusPopup(isFromLateView: false,);
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 82,
                                    height: 21,
                                    // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                                    decoration: BoxDecoration(
                                        color: CustomColors.backgroundColor,
                                        boxShadow: [getBoxShadow()],
                                        border: Border.all(color: CustomColors.borderColor, width: 1.5),
                                        borderRadius: BorderRadius.circular(30.0)),
                                    child: Center(child: Text(translate(context).change_Status, style: Style.montserratRegularStyle().copyWith(fontSize: 12.sp),)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: controller.selectedIndex.value == 2 ? 5.w : 12.w,),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Column(
                                children: [
                                  Text(controller.selectedIndex.value == 2 ? "Present Online" : translate(context).present, style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: CustomColors.green),),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text('7:30 am', style: Style.montserratMediumStyle().copyWith(fontSize: 13.sp, color: CustomColors.textBlackColor),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const VerticalDivider(
                        color: Colors.green,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(chatSvg1,),
                            SizedBox(height:.5.h),
                            Text(translate(context).chat_with_parents,style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, color: const Color(0xff686868), ),textAlign: TextAlign.center,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: InkWell(
                  onTap: (){
                    Get.to(PerformanceScreen(index: 2,));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          getBoxShadow()
                        ]
                    ),
                    child: SvgPicture.asset(starSvg, height: 18.sp,),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
