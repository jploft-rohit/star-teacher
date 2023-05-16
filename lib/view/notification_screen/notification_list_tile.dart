import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/view/notification_screen/bus_at_door_popup.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/notification_screen/clinic_visit_request.dart';
import 'package:staff_app/view/notification_screen/controller/notification_ctrl.dart';
import '../../utility/images_icon_path.dart';

class NotificationListTile extends StatelessWidget {
  NotificationListTile({Key? key}) : super(key: key);

  final NotificationCtrl controller = Get.find<NotificationCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 15.sp),
        itemCount: controller.list?.length??0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              if (controller.tabIndex.value == 0) {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const BusAtDoorPopup();
                  },
                );
              }else{
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const ClinicVisitRequest();
                  },
                );
              }
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 15.sp),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: BaseColors.primaryColor
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7.5),
                    child: SvgPicture.asset(girlSvg,height: 5.h,width: 5.h,),
                  ),
                  SizedBox(width: 3.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.list?[index].sender?.name??"N/A", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                      SizedBox(height: 0.5.h),
                      Text(controller.list?[index].message??"", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                    ],
                  ),
                  const Spacer(),
                  Text(getFormattedDate(controller.list?[index].sender?.createdAt??""), style: Style.montserratMediumStyle().copyWith(color: BaseColors.textLightGreyColor, fontSize: 14.sp),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
