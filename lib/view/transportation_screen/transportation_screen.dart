import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/chat_screen/chating_screen.dart';
import 'package:staff_app/view/rating_screens/driver_rating_screen.dart';
import 'package:staff_app/view/transportation_screen/bus_arriving_soon_screen.dart';
import 'package:staff_app/view/transportation_screen/location_screen.dart';
import 'package:staff_app/view/transportation_screen/notify_authority_screen.dart';
import 'package:staff_app/view/transportation_screen/transportation_screen_ctrl.dart';

class TransportationScreen extends StatefulWidget {
  const TransportationScreen({Key? key}) : super(key: key);

  @override
  State<TransportationScreen> createState() => _TransportationScreenState();
}

class _TransportationScreenState extends State<TransportationScreen> with SingleTickerProviderStateMixin{
  TransportationScreenCtrl controller = Get.put(TransportationScreenCtrl());
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
      appBar: BaseAppBar(title: translate(context).transportation),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: BaseColors.borderColor
                    )
                ),
                child: ListTile(
                  visualDensity: VisualDensity(horizontal: -4),
                  contentPadding: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 15.sp, bottom: 15.sp),
                  leading: Container(
                    height: double.infinity,
                    padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: BaseColors.primaryColor
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: SvgPicture.asset(manSvg),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nawaj Alam", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text("#12344534", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text("English Teacher", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                    ],
                  ),
                  trailing: GestureDetector(onTap: (){
                    showScanQrDialogue(context, false);
                  },child: SvgPicture.asset(qrCodeSvg)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              BaseButton(title: translate(context).notify_authority, onPressed: (){
                Get.to(NotifyAuthorityForBusScreen());
              },btnType: buttonIcon,),
              SizedBox(height: 1.h,),
              BaseButton(title: translate(context).location, onPressed: (){
                Get.to(LocationScreen());
              },btnType: buttonIcon,),
              SizedBox(height: 1.h,),
              BaseButton(title: translate(context).bus_notifications, onPressed: (){
                Get.to(BusArrivingSoonScreen());
              },btnType: buttonIcon,),
              SizedBox(
                height: 1.h,
              ),
              BaseToggleTabBar(controller: tabController, tabs: [
                BaseTabButton(title: translate(context).departure_information, isSelected: tabController.index == 0,type: toggleLargeButton,),
                BaseTabButton(title: translate(context).return_information, isSelected: tabController.index == 1,type: toggleLargeButton,)
              ]),
              SizedBox(
                height: 2.h,
              ),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: BaseColors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      getBoxShadow()
                    ]
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(busSvg),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  buildInfoItems(translate(context).driver, "Amir Saikh")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  SvgPicture.asset(mobileSvg1),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  buildInfoItems(translate(context).mobile_no, "567645675")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  SvgPicture.asset(supervisorSvg),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  buildInfoItems(translate(context).supervisor, "Ali Khan")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  SvgPicture.asset(mobileSvg1),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  buildInfoItems(translate(context).mobile_no, "34536345645")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  SvgPicture.asset(schoolIdSvg),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  buildInfoItems(translate(context).bus_school_id, "524675")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/images/plate_no.svg"),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  buildInfoItems(translate(context).plate_no, "4545454")
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(ChatingScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF8F8F8),
                          ),
                          padding: EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(chatSvg1),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(translate(context).chat, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Divider(),
              SizedBox(
                height: 3.h,
              ),
              Text("${translate(context).rate}: ", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: BaseButton(title: translate(context).driver.toUpperCase(), onPressed: (){
                      Get.to(DriverRatingScreen(title: "Driver"));
                    }, textSize: 15.sp),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: BaseButton(title: translate(context).bus.toUpperCase(), onPressed: (){
                      Get.to(DriverRatingScreen(title: "Bus"));
                    }, textSize: 15.sp),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Flexible(
                    flex: 1,
                    child: BaseButton(title: translate(context).supervisor.toUpperCase(), onPressed: (){
                      Get.to(DriverRatingScreen(title: "Supervisor"));
                    },textSize: 15.sp,removeHorizontalPadding: true),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTile(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: BaseColors.primaryColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 17.sp),),
          Icon(
            Icons.arrow_forward,
            color: BaseColors.primaryColor,
            size: 20.sp,
          )
        ],
      ),
    );
  }
}
