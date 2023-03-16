import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/notification_screen/bus_at_door_popup.dart';
import 'package:staff_app/view/notification_screen/clinic_visit_request.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(context, translate(context).notifications, [
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
                      child: Text(translate(context).school, style: Style.montserratBoldStyle().copyWith(color: index == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
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
                      child: Text(translate(context).transportation, style: Style.montserratBoldStyle().copyWith(color: index == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                    ),
                  ),
                ),
              ],
            ),
            if(index == 0)...[
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 15.sp),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return BusAtDoorPopup();
                        },
                      );
                    },
                    child: buildTile("Sania", "Absent from English Class.", "7:30 pm  - 05/05/2022"),
                  );
                },
              )
            ] else...[
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 15.sp),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return ClinicVisitRequest();
                        },
                      );
                    },
                    child: buildTile("Sania", "No Show, Departure to school","7:30 pm  - 05/05/2022"),
                  );
                },
              )
            ]
          ],
        ),
      ),
    );
  }
  Widget buildTile(String title, String subtitle, String tralingText){
    return Padding(
      padding: EdgeInsets.only(bottom: 15.sp),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 12.sp, right: 12.sp),
            decoration: BoxDecoration(
              border: Border.all(
                  color: CustomColors.primaryColor
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SvgPicture.asset(girlSvg),
          ),
          SizedBox(
            width: 3.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 17.sp),),
              SizedBox(
                height: 0.5.h,
              ),
              Text(subtitle, style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),),
            ],
          ),
          Spacer(),
          Text(tralingText, style: Style.montserratMediumStyle().copyWith(color: CustomColors.textLightGreyColor, fontSize: 14.sp),),
        ],
      ),
    );
  }
}
