import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_switch.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingScreen> createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  int index = 0;

  bool performanceRating = true;

  List<Map<String, dynamic>> list = [];
  List<Map<String, dynamic>> list1 = [
    {
      "title": "Get Ready for Pickup",
      "isSelected": true,
    },
    {
      "title": "Estimation Time is Changed by Driver",
      "isSelected": true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    list = [
      {
        "title": translate(context).wallet_credit_debits,
        "isSelected": true,
      },
      {
        "title": translate(context).performance_rating_received,
        "isSelected": true,
      },
      {
        "title": translate(context).task_assigned,
        "isSelected": true,
      },
      {
        "title": translate(context).event_updates,
        "isSelected": true,
      },
      {
        "title": translate(context).stars_chats,
        "isSelected": true,
      },
      {
        "title": translate(context).parents_chats,
        "isSelected": true,
      },
      {
        "title": translate(context).teachers_chats,
        "isSelected": true,
      },
    ];
    return Scaffold(
      appBar: appBarWithAction(context, translate(context).notification_settings, [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      index = 0;
                      setState(() {});
                    },
                    child: Container(
                      height: 40.0,
                      width: getWidth(context) * 50 / 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: index == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                        border: Border.all(
                          color: index == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                        ),
                        boxShadow: [
                          if(index == 0)
                          const BoxShadow(
                              color: CustomColors.darkShadowColor,
                              spreadRadius: 1.0,
                              blurRadius: 2.0,
                              offset: Offset(0, 3)
                          )
                        ],
                        borderRadius: BorderRadius.circular(15.sp)
                      ),
                      child: Text("School", style: Style.montserratBoldStyle().copyWith(color: index == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      index = 1;
                      setState(() {});
                    },
                    child: Container(
                      height: 40.0,
                      width: getWidth(context) * 50 / 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: index == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                          border: Border.all(
                              color: index == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                          ),
                          boxShadow: [
                            if(index == 1)
                              const BoxShadow(
                                  color: CustomColors.darkShadowColor,
                                  spreadRadius: 1.0,
                                  blurRadius: 2.0,
                                  offset: Offset(0, 3)
                              )
                          ],
                          borderRadius: BorderRadius.circular(15.sp)
                      ),
                      child: Text("Transportation", style: Style.montserratBoldStyle().copyWith(color: index == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                    ),
                  ),
                ),
              ],
            ),
            if(index == 0)...[
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return buildTile(index);
                },
              )
            ] else...[
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list1.length,
                itemBuilder: (context, index) {
                  return buildTile1(index);
                },
              )
            ]
          ],
        ),
      ),
    );
  }
  Widget buildTile(int index){
    return Column(
      children: [
        Divider(
          color: CustomColors.borderColor,
          thickness: 1.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(list[index]['title'], style: Style.montserratMediumStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
            CustomSwitch(
              key: GlobalKey(),
              value: list[index]['isSelected'],
              enableColor: CustomColors.primaryColor,
              enableSwitchColor: CustomColors.white,
              disableColor: CustomColors.textLightGreyColor,
              width: 45,
              height: 22,
              switchHeight: 20,
              switchWidth: 20,
              onChanged: (bool value) {
                list[index]['isSelected'] = !list[index]['isSelected'];
                setState(() {});
              },)
          ],
        ),
      ],
    );
  }
  Widget buildTile1(int index){
    return Column(
      children: [
        Divider(
          color: CustomColors.borderColor,
          thickness: 1.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(list1[index]['title'], style: Style.montserratMediumStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
            CustomSwitch(
              key: GlobalKey(),
              value: list1[index]['isSelected'],
              enableColor: CustomColors.backgroundColor,
              enableSwitchColor: CustomColors.primaryColor,
              disableColor: CustomColors.textLightGreyColor,
              width: 45,
              height: 22,
              switchHeight: 20,
              switchWidth: 20,
              onChanged: (bool value) {
                list1[index]['isSelected'] = !list1[index]['isSelected'];
                setState(() {});
              },)
          ],
        ),
      ],
    );
  }
}
