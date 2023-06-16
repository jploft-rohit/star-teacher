import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class HomeDayScheduleView extends StatefulWidget {
  const HomeDayScheduleView({Key? key}) : super(key: key);

  @override
  State<HomeDayScheduleView> createState() => _HomeDayScheduleViewState();
}

class _HomeDayScheduleViewState extends State<HomeDayScheduleView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                Flexible(
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
                Flexible(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
