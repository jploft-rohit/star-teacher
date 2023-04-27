import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/notification_screen/bus_at_door_popup.dart';
import 'package:staff_app/view/notification_screen/clinic_visit_request.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with SingleTickerProviderStateMixin{
  int index = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
    });
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).notifications,showNotification: false),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            BaseToggleTabBar(controller: tabController, tabs: [
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: BaseButton(title: translate(context).school,onPressed: null,verticalPadding: 0,isActive: tabController.index == 0 ? true : false,isToggle: tabController.index == 0 ? true : false,btnType: toggleLargeButton,),
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: BaseButton(title: translate(context).transportation,onPressed: null,verticalPadding: 0,isActive: tabController.index == 1 ? true : false, isToggle: tabController.index == 1 ? true : false,btnType: toggleLargeButton,),
                ),
              ),
            ]),
            SizedBox(height: 2.h),
            Expanded(
              child: TabBarView(
                controller: tabController,
                  children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 15.sp),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return const BusAtDoorPopup();
                          },
                        );
                      },
                      child: buildTile("Sania", "Absent from English Class.", "7:30 pm  - 05/05/2022"),
                    );
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 15.sp),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return const ClinicVisitRequest();
                          },
                        );
                      },
                      child: buildTile("Sania", "No Show, Departure to school","7:30 pm  - 05/05/2022"),
                    );
                  },
                )
              ]),
            ),
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
          SizedBox(
            width: 3.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
              SizedBox(
                height: 0.5.h,
              ),
              Text(subtitle, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
            ],
          ),
          const Spacer(),
          Text(tralingText, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textLightGreyColor, fontSize: 14.sp),),
        ],
      ),
    );
  }
}
