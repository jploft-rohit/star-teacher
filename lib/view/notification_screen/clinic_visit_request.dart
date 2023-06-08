import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/notification_screen/reschedule_visit_request_popup.dart';
import 'package:staff_app/view/star_evaluation_screen/star_rating_popup.dart';
import '../../Utility/sizes.dart';

class ClinicVisitRequest extends StatefulWidget {
  const ClinicVisitRequest({Key? key}) : super(key: key);

  @override
  State<ClinicVisitRequest> createState() => _ClinicVisitRequestState();
}

class _ClinicVisitRequestState extends State<ClinicVisitRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(""),
                    Text(translate(context).clinic_visit_request, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15.sp),
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: BaseColors.borderColor
                          )
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: BaseColors.primaryColor
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: SvgPicture.asset(manSvg),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text("Abdul Khan", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                              SizedBox(
                                height: .5.h,
                              ),
                              Text("#632541", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                            ],
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildInfoItems(translate(context).school, "UAE Public School"),
                                SizedBox(
                                  height: 1.h,
                                ),
                                buildInfoItems(translate(context).school_id, "#89455632"),
                                SizedBox(
                                  height: 1.h,
                                ),
                                buildInfoItems(translate(context).blood_type, "A+"),
                                SizedBox(
                                  height: 1.h,
                                ),
                                buildInfoItems(translate(context).user_type, "Star"),
                                SizedBox(
                                  height: 1.h,
                                ),
                                buildInfoItems(translate(context).visit_date_time, "12-07-2022, 10:20AM"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        // Get.to(DriverRatingScreen(title: 'Driver Rating',));
                        BaseOverlays().dismissOverlay();
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return const StarRatingPopup();
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
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
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: BaseButton(borderRadius: 100,title: translate(context).reschedule_caps, onPressed: (){
                          Get.back();
                          showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation) {
                            return const RescheduleVisitRequestPopup();
                          },);
                        },btnType: toggleLargeButton,),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Center(
                        child: BaseButton(removeHorizontalPadding: true,borderRadius: 100,title: translate(context).acknowledge, onPressed: (){
                          Get.back();
                        },btnType: toggleLargeButton,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
