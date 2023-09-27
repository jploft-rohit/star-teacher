import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:ui' as ui;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/chating_screen.dart';
import 'package:staff_app/view/chat_screen/group_chatting_screen.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen.dart';

import '../../../utility/sizes.dart';

class ChatListTile extends StatefulWidget {
  final int secondarySelectedIndex;
  const ChatListTile({Key? key, required this.secondarySelectedIndex}) : super(key: key);

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
        controller.secondarySelectedIndex.value = widget.secondarySelectedIndex;
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
    return Obx(()=>listTile(),
    );
  }

  Widget listTile(){
    return SmartRefresher(
      footer: const BasePaginationFooter(),
      controller: controller.refreshController,
      enablePullDown: enablePullToRefresh,
      enablePullUp: true,
      onLoading: (){
        controller.getChatHistory(refreshType: "load");
      },
      onRefresh: (){
        controller.getChatHistory(refreshType: "refresh");
      },
      child: (controller.chatHistoryList?.length??0) == 0 ? const BaseNoData() : ListView.builder(
        itemCount: (controller.chatHistoryList?.length??0),
        shrinkWrap: true,
        // padding: EdgeInsets.only(bottom: 100),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
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
                              padding: const EdgeInsets.all(8),
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
                                errorWidget: SvgPicture.asset(controller.primarySelectedIndex.value != 4
                                    ? "assets/images/ic_supervisor.svg"
                                    : "assets/images/Group 8090.svg",
                                    height: 40,
                                ),
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: Column(
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
                                        TextSpan(text: controller.secondarySelectedIndex.value == 0 ? (controller.chatHistoryList?[index]?.message?.message??"") : (controller.chatHistoryList?[index]?.groupMessage??""), style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp,),),
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
                      // Expanded(
                      //   flex: 1,
                      //   child: Visibility(
                      //     visible: controller.primarySelectedIndex.value == 4,
                      //     child: BaseIcons().delete(
                      //       showDeleteReason: false,
                      //       rightMargin: 0,
                      //       onRightButtonPressed: (){
                      //
                      //       }
                      //     ),
                      //   ),
                      // ),
                      // Expanded(
                      //   flex: 1,
                      //   child: Visibility(
                      //     visible: controller.primarySelectedIndex.value == 4,
                      //     child: BaseIcons().edit(
                      //         rightMargin: 0,
                      //         onRightButtonPressed: (){
                      //
                      //         }
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                              Get.to(ChatingScreen(
                                receiverId: (controller.chatHistoryList?[index]?.sId??""),
                                receiverProfilePic: (controller.chatHistoryList?[index]?.profilePic??""),
                                receiverName: (controller.chatHistoryList?[index]?.name??""),
                                uniqueId: controller.chatHistoryList?[index]?.uniqueId,
                              ),
                              );
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
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
