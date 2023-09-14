import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:ui' as ui;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/chating_screen.dart';
import 'package:staff_app/view/chat_screen/group/create_group_screen.dart';
import 'package:staff_app/view/chat_screen/group_chatting_screen.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen.dart';

import '../../../utility/sizes.dart';

class GroupChatListTile extends StatefulWidget {
  final int secondarySelectedIndex;
  const GroupChatListTile({Key? key, required this.secondarySelectedIndex}) : super(key: key);

  @override
  State<GroupChatListTile> createState() => _GroupChatListTileState();
}

class _GroupChatListTileState extends State<GroupChatListTile> with SingleTickerProviderStateMixin{
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  ChatScreenCtrl controller = Get.find<ChatScreenCtrl>();
  late TabController tabController;
  late final String userId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    });
    tabController = TabController(length: 2, vsync: this, initialIndex: 0)..addListener(() async {
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
      return Obx(()=>listTile());
  }

  listTile()  {
    return SmartRefresher(
      footer: const BasePaginationFooter(),
      controller: controller.refreshController,
      enablePullDown: enablePullToRefresh,
      enablePullUp: true,
      onLoading: (){
        controller.getGroupChatHistory(refreshType: "load");
      },
      onRefresh: (){
        controller.getGroupChatHistory(refreshType: "refresh");
      },
      child: ListView.builder(
        itemCount: (controller.chatHistoryList?.length??0),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Get.to(
                GroupChattingScreen(
                  roomId: (controller.chatHistoryList?[index]?.roomId??""),
                  groupId: (controller.chatHistoryList?[index]?.sId??""),
                  groupImage: (controller.chatHistoryList?[index]?.groupProfile??""),
                  groupName: (controller.chatHistoryList?[index]?.title??""),
                  schoolId: (controller.chatHistoryList?[index]?.school?.sId??""),
                ),
              );
            },
            child: Padding(
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
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: BaseColors.primaryColor)
                                ),
                                child: BaseImageNetwork(
                                  link: (controller.chatHistoryList?[index]?.groupProfile??""),
                                  borderRadius: 10,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                  errorWidget: SvgPicture.asset(controller.primarySelectedIndex.value != 4 ? girlSvg : "assets/images/Group 8090.svg", height: 40),
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addText((controller.chatHistoryList?[index]?.title??""), 15.sp, BaseColors.primaryColor, FontWeight.w700),
                                  Visibility(
                                      visible: controller.secondarySelectedIndex.value != 1,
                                      child: SizedBox(height: 0.5.h,
                                      ),
                                  ),
                                  SizedBox(height: 0.5.h),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Message: ',
                                      style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),
                                      children: <TextSpan>[
                                        TextSpan(text: (controller.chatHistoryList?[index]?.message?.message??"").toString().split("/").last, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp,),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Visibility(
                        //     visible: controller.primarySelectedIndex.value == 3,
                        //     child: GestureDetector(
                        //       onTap: (){
                        //         Get.to(const ScheduleMeetingScreen());
                        //       },
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           SvgPicture.asset("assets/images/calender_chat.svg"),
                        //           SizedBox(height: 0.5.h),
                        //           Text("Schedule\nMeeting", style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,),textAlign: TextAlign.center,),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Visibility(
                        //     visible: controller.primarySelectedIndex.value == 4 && (controller.chatHistoryList?[index]?.createdBy??"") == (userId),
                        //     child: BaseIcons().delete(
                        //       showDeleteReason: false,
                        //       rightMargin: 0,
                        //       onRightButtonPressed: (){
                        //         controller.deleteGroup(groupID: (controller.chatHistoryList?[index]?.sId??""), index: index);
                        //       }
                        //     ),
                        //   ),
                        // ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Visibility(
                        //     visible: controller.primarySelectedIndex.value == 4 && (controller.chatHistoryList?[index]?.createdBy??"") == (userId),
                        //     child: BaseIcons().edit(
                        //         rightMargin: 0,
                        //         onRightButtonPressed: (){
                        //           Get.to(CreateGroupScreen(data: controller.chatHistoryList?[index]));
                        //       }
                        //     ),
                        //   ),
                        // ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SvgPicture.asset("assets/images/chat_img.svg"),
                        //       SizedBox(
                        //         height: .5.h,
                        //       ),
                        //       addText("Chats", 13.sp, BaseColors.textBlackColor, FontWeight.w700)
                        //     ],
                        //   ),
                        // ),
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
