import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/chating_screen.dart';
import 'package:staff_app/view/chat_screen/group_chatting_screen.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen.dart';

class ChatListTile extends StatefulWidget {
  const ChatListTile({Key? key}) : super(key: key);

  @override
  State<ChatListTile> createState() => _ChatListTileState();
}

class _ChatListTileState extends State<ChatListTile> with SingleTickerProviderStateMixin{
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  ChatScreenCtrl controller = Get.find<ChatScreenCtrl>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0)..addListener(() {
      if (!(tabController.indexIsChanging)) {
        controller.secondarySelectedIndex.value = tabController.index;
        if (controller.secondarySelectedIndex.value == 0) {
          controller.getChatHistory();
        }else{
          controller.getGroupChatHistory();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(
        children: [
          Visibility(
            visible: controller.primarySelectedIndex.value != 3,
            child: BaseToggleTabBar(
              controller: tabController,
              tabs: [
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(right: isRTL ? 0 : 6, left: isRTL ? 6 : 0),
                    child: BaseButton(title: 'Individual',onPressed: null,verticalPadding: 0,isActive: controller.secondarySelectedIndex.value == 0 ? true : false,isToggle: controller.secondarySelectedIndex.value == 0 ? true : false),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.only(right: isRTL ? 6 : 0, left: isRTL ? 0 : 6),
                    child: BaseButton(title: 'Group',onPressed: null,verticalPadding: 0,isActive: controller.secondarySelectedIndex.value == 1 ? true : false, isToggle: controller.secondarySelectedIndex.value == 1 ? true : false),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: TabBarView(
                controller: tabController,
                physics: controller.primarySelectedIndex.value == 3 ? NeverScrollableScrollPhysics() : ScrollPhysics(),
                children: [
                  listTile(),
                  listTile(),
                ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listTile(){
    return ListView.builder(
      itemCount: (controller.chatHistoryList?.length??0),
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
                    border: Border.all(color: BaseColors.borderColor)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: BaseColors.primaryColor)
                            ),
                            child: BaseImageNetwork(
                              link: controller.secondarySelectedIndex.value == 0 ? (controller.chatHistoryList?[index]?.profilePic??"") : (controller.chatHistoryList?[index]?.groupProfile??""),
                              borderRadius: 10,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              errorWidget: SvgPicture.asset(girlSvg, height: 40),
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText(controller.secondarySelectedIndex.value == 0 ? (controller.chatHistoryList?[index]?.name??"") : (controller.chatHistoryList?[index]?.title??""), 15.sp, BaseColors.primaryColor, FontWeight.w700),
                              Visibility(visible: controller.secondarySelectedIndex.value != 1,child: SizedBox(height: 0.5.h)),
                              Visibility(
                                visible: controller.secondarySelectedIndex.value != 1,
                                child: controller.primarySelectedIndex.value == 0 && controller.secondarySelectedIndex.value == 0
                                  ? RichText(
                                  text: TextSpan(
                                    text: 'ID: ',
                                    style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),
                                    children: <TextSpan>[
                                      TextSpan(text: "#${controller.chatHistoryList?[index]?.uniqueId?.toString()??""}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp,)),
                                    ],
                                   ),
                                  ) : addText(
                                  controller.chatHistoryList?[index]?.role?.name??"",
                                  15.sp,
                                  BaseColors.primaryColor,
                                  FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 0.5.h),
                              controller.primarySelectedIndex.value != 3 || controller.secondarySelectedIndex.value == 1
                                 ? RichText(
                                text: TextSpan(
                                  text: 'Message: ',
                                  style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),
                                  children: <TextSpan>[
                                    // TextSpan(text: controller.secondarySelectedIndex.value == 0 ? (controller.chatHistoryList?[index]?.message?.message??"") : (controller.chatHistoryList?[index]?.groupMessage??""), style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp,),),
                                  ],
                                ),
                              ) : addText(
                                "${(controller.chatHistoryList?[index]?.role?.name??"")}",
                                15.sp,
                                BaseColors.primaryColor,
                                FontWeight.w700,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Visibility(
                        visible: controller.primarySelectedIndex.value == 3,
                        child: GestureDetector(
                          onTap: (){
                            Get.to(const ScheduleMeetingScreen());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/calender_chat.svg"),
                              SizedBox(height: 0.5.h),
                              Text("Schedule\nMeeting", style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,),textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          Get.to(GroupChattingScreen(roomId: (controller.chatHistoryList?[index]?.roomId??""), groupId: (controller.chatHistoryList?[index]?.sId??""),));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/images/chat_img.svg"),
                            SizedBox(
                              height: .5.h,
                            ),
                            addText("Chats", 13.sp, BaseColors.textBlackColor, FontWeight.w700)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: int.parse(controller.chatHistoryList?[index]?.unreadCount?.toString()??"0") > 0,
                child: Align(
                  alignment: isRTL ? AlignmentDirectional.topStart : AlignmentDirectional.topEnd,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: BaseColors.primaryColor,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: addText(controller.chatHistoryList?[index]?.unreadCount?.toString()??"0", 13.sp, BaseColors.white, FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
