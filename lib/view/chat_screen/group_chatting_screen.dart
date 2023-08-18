import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/chat_screen/audio_call_screen.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/video_call_screen.dart';
import 'package:translator/translator.dart';

class GroupChattingScreen extends StatefulWidget {
  final String? roomId, groupId;
  const GroupChattingScreen({Key? key, this.roomId, this.groupId}) : super(key: key);

  @override
  State<GroupChattingScreen> createState() => _GroupChattingScreenState();
}

class _GroupChattingScreenState extends State<GroupChattingScreen> {
  final translator = GoogleTranslator();
  ChatScreenCtrl ctrl = Get.put(ChatScreenCtrl());
  String userID = "";
  int selectedIndex = -1;
  TextEditingController msgCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BaseOverlays().showLoader();
      ctrl.messageList?.clear();
      userID = await BaseSharedPreference().getString(SpKeys().userId);
      ctrl.connectGroupSocket(reqRoomId: widget.roomId??"");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 100),
        child: Container(
          decoration: const BoxDecoration(
            color: BaseColors.backgroundColor,
            border: Border(
              bottom: BorderSide(color: BaseColors.primaryColor)
            )
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(child: Icon(Icons.arrow_back_ios,size: 24,),onTap: (){
                        Get.back();
                      },
                      ),
                      SizedBox(width: 1.h),
                      // Container(
                      //   margin: const EdgeInsets.fromLTRB(16,8,0,8),
                      //   padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       border: Border.all(color: BaseColors.primaryColor)),
                      //   child:BaseImageNetwork(
                      //       link: widget.receiverProfilePic??"",
                      //       concatBaseUrl: false,
                      //       height: 4.h,
                      //   ),
                      // ),
                      SizedBox(width: 2.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // addText(widget.receiverName??"", 14.sp, BaseColors.primaryColor, FontWeight.w700),
                          SizedBox(height: .5.h),
                          addText("Father", 14.sp, BaseColors.primaryColor, FontWeight.w700),
                          SizedBox(height: .5.h),
                          addText("G3 - H2", 14.sp, BaseColors.primaryColor, FontWeight.w700),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // GestureDetector(
                      //   onTap: (){
                      //
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(bottom: 5.0),
                      //     child: GestureDetector(
                      //       onTap: (){
                      //         Get.to(ScheduleMeetingScreen());
                      //       },
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.end,
                      //         children: [
                      //           SvgPicture.asset("assets/images/calender_chat.svg"),
                      //           SizedBox(
                      //             height: .5.h,
                      //           ),
                      //           Text("Schedule\nMeeting", style: Style.montserratBoldStyle().copyWith(fontSize:  12.sp, color: CustomColors.primaryColor, fontWeight: FontWeight.w700),textAlign: TextAlign.center,)
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 2.w,
                      // ),
                      // GestureDetector(onTap: (){
                      //
                      // },child: Container(
                      //     margin: EdgeInsets.only(right: 4.w,left: 4.w,top: 2.w,bottom: 2.w),
                      //     padding: EdgeInsets.all(6),
                      //     decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle,boxShadow: [
                      //   BoxShadow(offset: Offset(0,0),spreadRadius: 1,blurRadius: 3,color: Colors.grey.withOpacity(0.8))
                      // ]),child: SvgPicture.asset("assets/images/google_translate.svg"))),
                      GestureDetector(
                        onTap: (){
                          Get.to(const VideoCallScreen());
                        },
                        child: SvgPicture.asset("assets/images/video.svg", height: 25.0,),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(const AudioCallScreen());
                        },
                        child: SvgPicture.asset("assets/images/phone.svg", height: 22.0),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(()=>ListView.builder(
          controller: ctrl.scrollController,
          reverse: false,
          padding: EdgeInsets.only(bottom: 2.h),
          itemCount: (ctrl.messageList?.length??0),
          itemBuilder: (context, index1) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.h,bottom: 1.h),
                  child: Text(ctrl.formatDateToTodayOrYesterday(ctrl.messageList?[index1]?.date??""),style: TextStyle(
                      color: Colors.grey.shade600
                  ),
                 ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(15.sp),
                  reverse: false,
                  itemCount: ctrl.messageList?[index1]?.chatList?.length??0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: index == (ctrl.messageList?[index1]?.chatList?.length??0) -1 ? 60.0 : 10.0),
                      child: Align(
                        alignment: (ctrl.messageList?[index1]?.chatList?[index].senderId?.sId??"") != userID ? Alignment.topLeft : Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: (ctrl.messageList?[index1]?.chatList?[index].senderId?.sId??"") != userID ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: (ctrl.messageList?[index1]?.chatList?[index].senderId?.sId??"") != userID ? 2.w : 0),
                                  constraints: BoxConstraints(minWidth: 40.w, maxWidth: 80.w),
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: (ctrl.messageList?[index1]?.chatList?[index].senderId?.sId??"") != userID ? Colors.white : BaseColors.backgroundColor,
                                      borderRadius: BorderRadius.circular(5.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: BaseColors.darkShadowColor.withOpacity(0.5),
                                          blurRadius: 8.0,
                                        )
                                      ]
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        ctrl.messageList?[index1]?.chatList?[index].message??"",
                                        style: Style.montserratMediumStyle().copyWith(
                                          fontSize:16.sp,
                                          color: BaseColors.textBlackColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: (ctrl.messageList?[index1]?.chatList?[index].senderId?.sId??"") != userID,
                                  child: GestureDetector(
                                    onTap: () async {
                                      selectedIndex = index;
                                      ctrl.messageList?.refresh();
                                      if (ctrl.messageList?[index1]?.chatList?[index].isEnglish??true) {
                                        Translation value = await translator.translate((ctrl.messageList?[index1]?.chatList?[index].message??""), from: 'en', to: 'ar');
                                        ctrl.messageList?[index1]?.chatList?[index].message = value.text;
                                        ctrl.messageList?[index1]?.chatList?[index].isEnglish = false;
                                      }else{
                                        Translation value = await translator.translate((ctrl.messageList?[index1]?.chatList?[index].message??""), from: 'ar', to: 'en');
                                        ctrl.messageList?[index1]?.chatList?[index].message = value.text;
                                        ctrl.messageList?[index1]?.chatList?[index].isEnglish = true;
                                      }
                                      selectedIndex = -1;
                                      ctrl.messageList?.refresh();
                                    },
                                    child: selectedIndex == index
                                        ? Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: SizedBox(
                                             height: 21,
                                             width: 21,
                                          child: CircularProgressIndicator(color: BaseColors.primaryColor,strokeWidth: 3,)),
                                        )
                                        : Container(
                                            margin: EdgeInsets.only(left: 5),
                                            padding: EdgeInsets.all(6),
                                            decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle,boxShadow: [
                                            BoxShadow(offset: Offset(0,0),spreadRadius: 1,blurRadius: 3,color: Colors.grey.withOpacity(0.8))
                                      ],
                                      ),child: SvgPicture.asset("assets/images/google_translate.svg",height: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 0.8.h),
                            addText(getFormattedTime(ctrl.messageList?[index1]?.chatList?[index].createdAt??""), 14.sp, Colors.grey.shade600, FontWeight.w400),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: Container(
        height: 10.h,
        color: Colors.white,
        padding: EdgeInsets.all(15.sp),
        child: Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: msgCtrl,
                hintText: "Message",
                borderColor: Colors.transparent,
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.emoji_emotions_outlined,
                    color: BaseColors.textLightGreyColor,
                    size: 20,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset("assets/images/gridicons_attachment.svg"),
                      SizedBox(
                        width: 2.w,
                      ),
                      SvgPicture.asset("assets/images/Group 7724.svg"),
                    ],
                  ),
                ),
                fillColor: const Color(0xffF4F4F4),
                borderRadius: 50.0,
                hintTextColor: BaseColors.textLightGreyColor,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            GestureDetector(
              onTap: (){
                if (msgCtrl.text.trim().isNotEmpty) {
                  ctrl.sendGroupMessage(roomId: widget.roomId,message: msgCtrl.text.trim(), groupId: widget.groupId);
                  ctrl.update();
                  msgCtrl.clear();
                  setState(() {});
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: BaseColors.backgroundColor,
                    border: Border.all(color: BaseColors.primaryColor)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: SvgPicture.asset("assets/images/Layer 47.svg"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
