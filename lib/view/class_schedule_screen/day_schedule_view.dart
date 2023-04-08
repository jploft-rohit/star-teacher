import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/class_schedule_screen/notifiy_authority_popup.dart';

class DayScheduleView extends StatefulWidget {
  const DayScheduleView({Key? key}) : super(key: key);

  @override
  State<DayScheduleView> createState() => _DayScheduleViewState();
}

class _DayScheduleViewState extends State<DayScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 20.0,
              child: PageView.builder(
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Center(child: Text("Monday, 22/05/2022", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),));
                },
              ),
            ),
            Positioned(
              left: 0.0,
              child: IconButton(
                onPressed: (){},
                visualDensity: const VisualDensity(horizontal: -4,vertical: -4),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(maxHeight: 10),
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18.sp,
                  color: BaseColors.primaryColor,
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              child: IconButton(
                onPressed: (){},
                visualDensity: const VisualDensity(horizontal: -4,vertical: -4),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(maxHeight: 10),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 18.sp,
                  color: BaseColors.primaryColor,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        // BaseButton(text: translate(context).leave_request.toUpperCase(), onPressed: (){
        //   showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation) {
        //     return const NotifyAuthorityPopup();
        //   },);
        // },borderRadius: 5.0,btnHeight: 35,textSize: 16.sp,btnWidth: 40.w,),
        SizedBox(
          height: 3.h,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: BaseColors.borderColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildInfoItems(translate(context).class_name, "H1"),
                          SizedBox(
                            height: 1.h,
                          ),
                          buildInfoItems(translate(context).grade, "G1"),
                          SizedBox(
                            height: 1.h,
                          ),
                          buildInfoItems(translate(context).class_type, "Offline"),
                          SizedBox(
                            height: 1.h,
                          ),
                          buildInfoItems(translate(context).classroom, "43"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(translate(context).start_time, style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 14.sp),),
                              SizedBox(
                                width: 2.w,
                              ),
                              SvgPicture.asset("assets/images/time_icon.svg"),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("09:00AM", style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 3.0),
                                child: Text(translate(context).end_time, style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 14.sp),),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SvgPicture.asset("assets/images/time_icon.svg"),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("09:00AM", style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor,fontSize: 15.sp),),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                            width: 150,
                            height: 29,
                            child: BaseButton(btnType: mediumButton,verticalPadding: 0.0,removeHorizontalPadding: true,title: translate(context).notify_admin, onPressed: (){
                              showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation) {
                                return const NotifyAuthorityPopup();
                              });
                            },textSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
