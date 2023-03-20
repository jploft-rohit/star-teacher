import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/audio_call_screen.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/chating_screen.dart';
import 'package:staff_app/view/chat_screen/video_call_screen.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen.dart';

class ChatScreen extends StatefulWidget {
  bool isFromBtmBar;
  ChatScreen({Key? key, required this.isFromBtmBar}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin{
  var tabCtrl;

  ChatScreenCtrl controller = Get.put(ChatScreenCtrl());
  DashboardScreenCtrl ctrl = Get.find<DashboardScreenCtrl>();

  @override
  void initState() {
    tabCtrl = TabController(length: 4, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithAction(context, "Chats", [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ], onPressed: (){
        if(widget.isFromBtmBar){
          ctrl.bottomNavigationKey.currentState?.setPage(2);
        }else{
          Navigator.pop(context);
        }
      }),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: CustomColors.borderColor,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Row(
                      children: [
                        SvgPicture.asset(classTakenSvg,height: 15,),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text("School", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_drop_down,
                        )
                      ],
                    ),
                  ),
                  const Divider(height: 0.0,),
                  CustomTextField(
                    controller: TextEditingController(),
                    hintText: translate(context).search_by_id,
                    borderColor: Colors.transparent,
                    hintTextColor: CustomColors.textLightGreyColor,
                    contentPadding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            buildTabBar(),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabCtrl,
                children: [
                  buildStarView(),
                  buildParentView(),
                  buildStaffView(),
                  buildAdminsView()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return Container(
      height: 35,
      width: 100.w,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: TabBar(
        controller: tabCtrl,
        labelPadding: EdgeInsets.zero,
        isScrollable: false,
        labelStyle: Style.montserratRegularStyle().copyWith(fontSize: 12),
        onTap: (value){

        },
        padding: const EdgeInsets.all(4),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]
        ),
        labelColor: CustomColors.primaryColor,
        unselectedLabelColor: Colors.black,
        tabs:  [
          Stack(
            alignment: Alignment.center,
            children: [
              const Tab(
                text: 'Stars',
              ),
              // Align(
              //   alignment: AlignmentDirectional.topEnd,
              //   child: Padding(
              //     padding: EdgeInsetsDirectional.only(start: 50.0),
              //     child: Container(
              //       height: 15.0,
              //       padding: EdgeInsets.all(2.0),
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: CustomColors.primaryColor
              //       ),
              //       child: Center(child: Text("10", style: Style.montserratRegularStyle().copyWith(color: Colors.white, fontSize: 13.sp),)),
              //     ),
              //   ),
              // )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              const Tab(
                text: 'Parents',
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 60.0),
                  child: Container(
                    height: 15.0,
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.primaryColor
                    ),
                    child: Center(child: Text("10", style: Style.montserratRegularStyle().copyWith(color: Colors.white, fontSize: 13.sp),)),
                  ),
                ),
              )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              const Tab(
                text: 'Staff',
              ),
              // Align(
              //   alignment: AlignmentDirectional.topEnd,
              //   child: Padding(
              //     padding: EdgeInsetsDirectional.only(start: 50.0),
              //     child: Container(
              //       height: 15.0,
              //       padding: EdgeInsets.all(2.0),
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: CustomColors.primaryColor
              //       ),
              //       child: Center(child: Text("10", style: Style.montserratRegularStyle().copyWith(color: Colors.white, fontSize: 13.sp),)),
              //     ),
              //   ),
              // )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              const Tab(
                text: 'Admins',
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 60.0),
                  child: Container(
                    height: 15.0,
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.primaryColor
                    ),
                    child: Center(child: Text("10", style: Style.montserratRegularStyle().copyWith(color: Colors.white, fontSize: 13.sp),)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStarView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Row(
            children: [
              Obx(() => Flexible(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    controller.selectedIndex.value = 0;
                  },
                  child: Container(
                    height: 40.0,
                    width: getWidth(context) * 50 / 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: controller.selectedIndex.value == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                        border: Border.all(
                            color: controller.selectedIndex.value == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                        ),
                        boxShadow: [
                          if(controller.selectedIndex.value == 0)
                            const BoxShadow(
                                color: CustomColors.darkShadowColor,
                                spreadRadius: 1.0,
                                blurRadius: 2.0,
                                offset: Offset(0, 3)
                            )
                        ],
                        borderRadius: BorderRadius.circular(15.sp)
                    ),
                    child: Text("Individual", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                  ),
                ),
              )),
              SizedBox(
                width: 2.w,
              ),
              Obx(() => Flexible(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    controller.selectedIndex.value = 1;
                  },
                  child: Container(
                    height: 40.0,
                    width: getWidth(context) * 50 / 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: controller.selectedIndex.value == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                        border: Border.all(
                            color: controller.selectedIndex.value == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                        ),
                        boxShadow: [
                          if(controller.selectedIndex.value == 1)
                            const BoxShadow(
                                color: CustomColors.darkShadowColor,
                                spreadRadius: 1.0,
                                blurRadius: 2.0,
                                offset: Offset(0, 3)
                            )
                        ],
                        borderRadius: BorderRadius.circular(15.sp)
                    ),
                    child: Text("Group", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex.value == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                  ),
                ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),

        Obx(() {
          return controller.selectedIndex.value == 1 ? ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: CustomColors.borderColor)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 70,
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(color: CustomColors.primaryColor)
                                ),
                                child: SvgPicture.asset("assets/images/Group 8090.svg"),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Class Group',
                                      style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                                      children: <TextSpan>[
                                        TextSpan(text: "(G1-H1)", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp,)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Message: ',
                                      style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                                      children: <TextSpan>[
                                        TextSpan(text: "Can you please tell...", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp,),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: InkWell(
                              onTap: (){
                                Get.to(const ChatingScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/images/chat_img.svg"),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  addText("Chats", 13.sp, CustomColors.textBlackColor, FontWeight.w700)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.primaryColor,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: addText("5", 13.sp, CustomColors.white, FontWeight.w700),
                      ),
                    )
                  ],
                ),
              );
            },
          ) :
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: CustomColors.borderColor)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 70,
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(color: CustomColors.primaryColor)
                                ),
                                child: SvgPicture.asset(girlSvg, height: 40,),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addText("Sania", 15.sp, CustomColors.primaryColor, FontWeight.w700),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'ID: ',
                                      style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),
                                      children: <TextSpan>[
                                        TextSpan(text: "#235543", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp,)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Message: ',
                                      style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                                      children: <TextSpan>[
                                        TextSpan(text: "Can you please tell...", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp,),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(const ScheduleMeetingScreen());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/calender_chat.svg"),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Text("Schedule\nMeeting", style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: CustomColors.textBlackColor,),textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: (){
                                Get.to(const ChatingScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/images/chat_img.svg"),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  addText("Chats", 13.sp, CustomColors.textBlackColor, FontWeight.w700)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.primaryColor,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: addText("5", 13.sp, CustomColors.white, FontWeight.w700),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        })
      ],
    );
  }
  Widget buildParentView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Row(
            children: [
              Obx(() => Flexible(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    controller.selectedIndex1.value = 0;
                  },
                  child: Container(
                    height: 40.0,
                    width: getWidth(context) * 50 / 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: controller.selectedIndex1.value == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                        border: Border.all(
                            color: controller.selectedIndex1.value == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                        ),
                        boxShadow: [
                          if(controller.selectedIndex1.value == 0)
                            const BoxShadow(
                                color: CustomColors.darkShadowColor,
                                spreadRadius: 1.0,
                                blurRadius: 2.0,
                                offset: Offset(0, 3)
                            )
                        ],
                        borderRadius: BorderRadius.circular(15.sp)
                    ),
                    child: Text("Individual", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex1.value == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                  ),
                ),
              )),
              SizedBox(
                width: 2.w,
              ),
              Obx(() => Flexible(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    controller.selectedIndex1.value = 1;
                  },
                  child: Container(
                    height: 40.0,
                    width: getWidth(context) * 50 / 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: controller.selectedIndex1.value == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                        border: Border.all(
                            color: controller.selectedIndex1.value == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                        ),
                        boxShadow: [
                          if(controller.selectedIndex1.value == 1)
                            const BoxShadow(
                                color: CustomColors.darkShadowColor,
                                spreadRadius: 1.0,
                                blurRadius: 2.0,
                                offset: Offset(0, 3)
                            )
                        ],
                        borderRadius: BorderRadius.circular(15.sp)
                    ),
                    child: Text("Group", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex1.value == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                  ),
                ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),

        Obx(() {
          return controller.selectedIndex1.value == 1 ?
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: CustomColors.borderColor)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 70,
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(color: CustomColors.primaryColor)
                                ),
                                child: SvgPicture.asset("assets/images/Group 8090.svg"),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Parents Group',
                                      style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                                    ),
                                  ),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Message: ',
                                      style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                                      children: <TextSpan>[
                                        TextSpan(text: "Can you please tell...", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp,),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: InkWell(
                              onTap: (){
                                Get.to(const ChatingScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/images/chat_img.svg"),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  addText("Chats", 13.sp, CustomColors.textBlackColor, FontWeight.w700)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.primaryColor,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: addText("5", 13.sp, CustomColors.white, FontWeight.w700),
                      ),
                    )
                  ],
                ),
              );
            },
          ) :
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: CustomColors.borderColor)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 70,
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(color: CustomColors.primaryColor)
                                ),
                                child: SvgPicture.asset(manSvg, height: 40,),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addText("Nawaj Alwam", 15.sp, CustomColors.primaryColor, FontWeight.w700),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  addText("Father/Sania", 13.sp, CustomColors.primaryColor, FontWeight.w700),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Message: ',
                                      style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                                      children: <TextSpan>[
                                        TextSpan(text: "Can you please tell...", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp,),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(const ScheduleMeetingScreen());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/calender_chat.svg"),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Text("Schedule\nMeeting", style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: CustomColors.textBlackColor,),textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: InkWell(
                              onTap: (){
                                Get.to(const ChatingScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/images/chat_img.svg"),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  addText("Chats", 13.sp, CustomColors.textBlackColor, FontWeight.w700)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.primaryColor,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: addText("5", 13.sp, CustomColors.white, FontWeight.w700),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        })
      ],
    );
  }
  Widget buildStaffView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Row(
            children: [
              Obx(() => Flexible(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    controller.selectedIndex2.value = 0;
                  },
                  child: Container(
                    height: 40.0,
                    width: getWidth(context) * 50 / 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: controller.selectedIndex2.value == 0 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                        border: Border.all(
                            color: controller.selectedIndex2.value == 0 ? Colors.transparent : CustomColors.txtFiledBorderColor
                        ),
                        boxShadow: [
                          if(controller.selectedIndex2.value == 0)
                            const BoxShadow(
                                color: CustomColors.darkShadowColor,
                                spreadRadius: 1.0,
                                blurRadius: 2.0,
                                offset: Offset(0, 3)
                            )
                        ],
                        borderRadius: BorderRadius.circular(15.sp)
                    ),
                    child: Text("Individual", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex2.value == 0 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                  ),
                ),
              )),
              SizedBox(
                width: 2.w,
              ),
              Obx(() => Flexible(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    controller.selectedIndex2.value = 1;
                  },
                  child: Container(
                    height: 40.0,
                    width: getWidth(context) * 50 / 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: controller.selectedIndex2.value == 1 ? CustomColors.backgroundColor : CustomColors.screenBackgroundColor,
                        border: Border.all(
                            color: controller.selectedIndex2.value == 1 ? Colors.transparent : CustomColors.txtFiledBorderColor
                        ),
                        boxShadow: [
                          if(controller.selectedIndex2.value == 1)
                            const BoxShadow(
                                color: CustomColors.darkShadowColor,
                                spreadRadius: 1.0,
                                blurRadius: 2.0,
                                offset: Offset(0, 3)
                            )
                        ],
                        borderRadius: BorderRadius.circular(15.sp)
                    ),
                    child: Text("Group", style: Style.montserratBoldStyle().copyWith(color: controller.selectedIndex2.value == 1 ? CustomColors.primaryColor : CustomColors.txtFiledBorderColor, fontSize: 16.sp),),
                  ),
                ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),

        Obx(() {
          return controller.selectedIndex2.value == 1 ?
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: CustomColors.borderColor)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 70,
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(color: CustomColors.primaryColor)
                                ),
                                child: SvgPicture.asset("assets/images/Group 8090.svg"),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Teacher Group',
                                      style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                                    ),
                                  ),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Message: ',
                                      style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                                      children: <TextSpan>[
                                        TextSpan(text: "Can you please tell...", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp,),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: InkWell(
                              onTap: (){
                                Get.to(const ChatingScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/images/chat_img.svg"),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  addText("Chats", 13.sp, CustomColors.textBlackColor, FontWeight.w700)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0.0,
                      top: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.primaryColor,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: addText("5", 13.sp, CustomColors.white, FontWeight.w700),
                      ),
                    )
                  ],
                ),
              );
            },
          ) :
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: CustomColors.borderColor)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 70,
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(color: CustomColors.primaryColor)
                                ),
                                child: SvgPicture.asset(manSvg, height: 40,),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addText("Nawaj Alwam", 15.sp, CustomColors.primaryColor, FontWeight.w700),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  addText("Teacher", 13.sp, CustomColors.primaryColor, FontWeight.w700),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Message: ',
                                      style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),
                                      children: <TextSpan>[
                                        TextSpan(text: "Can you please tell...", style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp,),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(const ScheduleMeetingScreen());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/calender_chat.svg"),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Text("Schedule\nMeeting", style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: CustomColors.textBlackColor,),textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: InkWell(
                              onTap: (){
                                Get.to(const ChatingScreen());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/images/chat_img.svg"),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  addText("Chats", 13.sp, CustomColors.textBlackColor, FontWeight.w700)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.primaryColor,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: addText("5", 13.sp, CustomColors.white, FontWeight.w700),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        })
      ],
    );
  }
  Widget buildAdminsView() {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: CustomColors.borderColor)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 70,
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: CustomColors.primaryColor)
                          ),
                          child: SvgPicture.asset(girlSvg, height: 40,),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addText("Salma", 14.sp, CustomColors.textBlackColor, FontWeight.w700),
                            SizedBox(
                              height: .5.h,
                            ),
                            addText("School Admin", 15.sp, CustomColors.primaryColor, FontWeight.w700),
                            SizedBox(
                              height: .5.h,
                            ),
                            addText("(Dubai Public School)", 14.sp, CustomColors.textBlackColor, FontWeight.w400),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Get.to(const ScheduleMeetingScreen());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/calender_chat.svg"),
                                SizedBox(
                                  height: .5.h,
                                ),
                                Text("Schedule\nMeeting", style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: CustomColors.textBlackColor,),textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(const ChatingScreen());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/chat_img.svg"),
                                SizedBox(
                                  height: .5.h,
                                ),
                                addText("Chats", 13.sp, CustomColors.textBlackColor, FontWeight.w700)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0.0,
                top: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.primaryColor,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: addText("5", 13.sp, CustomColors.white, FontWeight.w700),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
