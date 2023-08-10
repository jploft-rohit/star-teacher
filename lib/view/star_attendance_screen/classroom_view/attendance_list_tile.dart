import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/view/chat_screen/chating_screen.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/change_status_popup.dart';
import 'package:staff_app/view/star_attendance_screen/controller/star_attendance_screen_ctrl.dart';
import 'package:staff_app/view/star_evaluation_screen/star_rating_popup.dart';

class AttendanceListTile extends StatefulWidget {
  const AttendanceListTile({Key? key}) : super(key: key);

  @override
  State<AttendanceListTile> createState() => _AttendanceListTileState();
}

class _AttendanceListTileState extends State<AttendanceListTile> {
  StarAttendanceScreenCtrl controller = Get.find<StarAttendanceScreenCtrl>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>ListView.builder(
        itemCount: controller.list?.length??0,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: controller.selectedAttendanceTabIndex == 0 ? BaseColors.green : controller.selectedAttendanceTabIndex == 1 ? BaseColors.textRedColor : Color(0xffEC9C00))),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(16,8,0,8),
                            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: BaseColors.primaryColor)),
                            child:BaseImageNetwork(link: controller.list?[index].student?.user?.profilePic??"",concatBaseUrl: false,height: 4.h),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('${toBeginningOfSentenceCase(controller.list?[index].student?.user?.name??"")} #${controller.list?[index].student?.studentId??""}', style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp, color: BaseColors.primaryColor),),
                                      SizedBox(height: 0.8.h),
                                      GestureDetector(
                                        onTap: (){
                                          showGeneralDialog(
                                            context: context,
                                            pageBuilder: (context, animation, secondaryAnimation) {
                                              return ChangeStatusPopup(isFromLateView: false, index: index);
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 12.h,
                                          height: 3.h,
                                          margin: EdgeInsets.only(bottom: 2),
                                          // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                                          decoration: BoxDecoration(
                                              color: BaseColors.backgroundColor,
                                              boxShadow: [getBoxShadow()],
                                              border: Border.all(color: BaseColors.borderColor, width: 1.5),
                                              borderRadius: BorderRadius.circular(30.0)),
                                          child: Center(child: Text(translate(context).change_Status, style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp),)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(toBeginningOfSentenceCase(controller.list?[index].attendanceType??"")??"", style: Style.montserratBoldStyle().copyWith(fontSize: 14.sp,
                                      color: controller.selectedAttendanceTabIndex == 0 ? BaseColors.green : controller.selectedAttendanceTabIndex == 1 ? BaseColors.textRedColor : Color(0xffEC9C00)),),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(getFormattedTime(controller.list?[index].time??""), style: Style.montserratMediumStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(color: controller.selectedAttendanceTabIndex == 0 ? BaseColors.green : controller.selectedAttendanceTabIndex == 1 ? BaseColors.textRedColor : Color(0xffEC9C00)),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: (){
                              Get.to(ChatingScreen(
                                  receiverId: controller.list?[index].student?.user?.sId??"",
                                  receiverName: controller.list?[index].student?.user?.name??"",
                                  receiverProfilePic: controller.list?[index].student?.user?.profilePic??"",
                              ),
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(chatSvg1,),
                                SizedBox(height:.5.h),
                                Text("Chat"/*translate(context).chat_with_parents*/,style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, color: const Color(0xff686868), ),textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: GestureDetector(
                    onTap: (){
                      // Get.to(PerformanceScreen(index: 2,));
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const StarRatingPopup();
                        },
                      );
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
      ),
    );
  }
}
