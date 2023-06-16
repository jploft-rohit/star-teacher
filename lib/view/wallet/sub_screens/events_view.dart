import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/wallet/event_screen.dart';
import 'package:staff_app/view/wallet/wallet_controller.dart';

class EventsView extends StatefulWidget {
  const EventsView({super.key});

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  WalletController controller = Get.find<WalletController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 2.h),
          topLabel(translate(context).action_required, () {}),
          SizedBox(height: 1.h),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => buildActionRequiredEventCard(
                controller.actionRequiredEventsList[index]['day']!,
                controller.actionRequiredEventsList[index]['month']!,
                controller.actionRequiredEventsList[index]['title']!,
                controller.actionRequiredEventsList[index]['totalcost']!,
                controller.actionRequiredEventsList[index]['eventcost']!,
                controller.actionRequiredEventsList[index]['starbudget']!),
            itemCount: controller.actionRequiredEventsList.length,
          ),
          Divider(),
          topLabel("Events", () {Get.to(EventScreen());}),
          SizedBox(height: 1.h),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => buildEventCard(
                index,
                controller.eventsList[index]['day']!,
                controller.eventsList[index]['month']!,
                controller.eventsList[index]['title']!,
                controller.eventsList[index]['totalcost']!,
                controller.eventsList[index]['eventcost']!,
                controller.eventsList[index]['starbudget']!),
            itemCount: controller.eventsList.length,
          ),
        ],
      ),
    );
  }

  Widget topLabel(label, onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: BaseColors.textBlackColor),),
        TextButton(
            child: Text(translate(context).view_all, style: Style.montserratRegularStyle().copyWith(fontSize: 15.sp, color: BaseColors.textLightGreyColor, decoration: TextDecoration.underline),),
            onPressed: onTap),
      ],
    );
  }

  Widget buildActionRequiredEventCard(
      day, month, title, totalcost, eventcost, starbudget) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
      decoration: BoxDecoration(
          color: BaseColors.white,
          boxShadow: kElevationToShadow[2],
          border: Border.all(color: BaseColors.greyColor, width: 0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 12.h,
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              decoration: BoxDecoration(
                  color: BaseColors.backgroundColor,
                  border: Border.all(color: BaseColors.primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(day, style: Style.montserratBoldStyle().copyWith(fontSize: 22.sp, color: BaseColors.primaryColor),),
                  Text(month, style: Style.montserratRegularStyle().copyWith(fontSize: 18.sp, color: BaseColors.primaryColor),),
                ],
              ),
            ),
          ),
          SizedBox(width: 1.h),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp, color: BaseColors.textBlackColor),),
                      Row(
                        children: [
                          Text('${translate(context).total_cost} : ', style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.primaryColor),),
                          Text(totalcost,  style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(eventcost, style: Style.montserratRegularStyle().copyWith(fontSize: 14.sp, color: BaseColors.textBlackColor),),
                          Text(translate(context).event_cost,  style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.greyColor),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                coinSvg,
                                height: 1.8.h,
                              ),
                              addText(starbudget, 15.sp,
                                  BaseColors.textBlackColor, FontWeight.w400),
                            ],
                          ),
                          addText(translate(context).star_budget, 13.sp,
                              BaseColors.greyColor, FontWeight.w700),
                        ],
                      ),
                      SizedBox(width: 0.5.h),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseButton(
                        verticalPadding: 0.7.h,
                        title: translate(context).accept,
                        onPressed: () {}),
                    SizedBox(
                      height: 2,
                    ),
                    Text(translate(context).or,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textLightGreyColor,fontSize: 12),),
                    SizedBox(
                      height: 2,
                    ),
                    BaseButton(
                        verticalPadding: 0.7.h,
                        isActive: false,
                        title: translate(context).reject,
                        onPressed: () {}),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget buildEventCard(
      index, day, month, title, totalcost, eventcost, starbudget) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
      height: 38.sp,
      decoration: BoxDecoration(
          color: BaseColors.white,
          boxShadow: kElevationToShadow[2],
          border: Border.all(color: BaseColors.greyColor, width: 0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: BaseColors.backgroundColor,
                  border: Border.all(color: BaseColors.primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        addText(day, 22.sp,
                            BaseColors.primaryColor, FontWeight.w700),
                        addText(month, 18.sp,
                            BaseColors.primaryColor, FontWeight.w400),
                      ],
                    ),
            ),
          ),
          SizedBox(width: 1.h),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addText(title, 15.sp,
                          BaseColors.textBlackColor, FontWeight.w700),
                      Row(
                        children: [
                          addText('${translate(context).total_cost} : ', 14.sp,
                              BaseColors.primaryColor, FontWeight.w700),
                          addText(totalcost, 14.sp,
                              BaseColors.textBlackColor, FontWeight.w700),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addText(eventcost, 13.sp,
                              BaseColors.textBlackColor, FontWeight.w400),
                          addText(translate(context).event_cost, 13.sp,
                              BaseColors.greyColor, FontWeight.w700),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                coinSvg,
                                height: 1.8.h,
                              ),
                              addText(starbudget, 13.sp,
                                  BaseColors.textBlackColor, FontWeight.w400),
                            ],
                          ),
                          addText(translate(context).star_budget, 13.sp,
                              BaseColors.greyColor, FontWeight.w700),
                        ],
                      ),
                      SizedBox(width: 0.5.h),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    addText(
                        controller.eventsList[index]['status']!,
                        15.sp,
                        controller.eventsList[index]['status'] == 'Accepted'
                            ? BaseColors.green
                            : BaseColors.textRedColor,
                        FontWeight.w700),
                    SizedBox(height: .5.h),
                    // controller.eventsList[index]['status'] == 'Accepted'
                    //     ? BaseButton(
                    //         color: CustomColors.white,
                    //         shadow: [],
                    //         borderRadius: BorderRadius.circular(8),
                    //         height: 20,
                    //         child: addText('Change', getSmallTextFontSIze() - 1,
                    //             CustomColors.primaryColor, FontWeight.w700),
                    //         onTap: () {})
                        addText(
                            controller.eventsList[index]['event']!,
                            14.sp,
                            BaseColors.textBlackColor,
                            FontWeight.w400),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
