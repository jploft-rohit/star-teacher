import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/chat_screen/chating_screen.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen.dart';

class ChatStarTab extends StatefulWidget {
  const ChatStarTab({Key? key}) : super(key: key);

  @override
  State<ChatStarTab> createState() => _ChatStarTabState();
}

class _ChatStarTabState extends State<ChatStarTab> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          BaseToggleTabBar(
            controller: tabController,
            tabs: [
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: BaseButton(title: 'Individual',onPressed: null,verticalPadding: 0,isActive: tabController.index == 0 ? true : false,isToggle: tabController?.index == 0 ? true : false),
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: BaseButton(title: 'Group',onPressed: null,verticalPadding: 0,isActive: tabController.index == 1 ? true : false, isToggle: tabController?.index == 1 ? true : false),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: [
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
                  ),
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
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}