import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart' as toast;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/video_call_zego_utility/login_service.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:translator/translator.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class ChatingScreen extends StatefulWidget {
  final String? receiverId, receiverName, receiverProfilePic, schoolId, uniqueId;
  const ChatingScreen({Key? key, this.receiverId, this.receiverName, this.receiverProfilePic, this.schoolId, this.uniqueId}) : super(key: key);

  @override
  State<ChatingScreen> createState() => _ChatingScreenState();
}

class _ChatingScreenState extends State<ChatingScreen> {
  final translator = GoogleTranslator();
  ChatScreenCtrl ctrl = Get.put(ChatScreenCtrl());
  String userID = "";
  int selectedIndex = -1;
  TextEditingController msgCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // BaseOverlays().showLoader();
      ctrl.messageList?.clear();
      userID = await BaseSharedPreference().getString(SpKeys().userId);
      ctrl.connectSocket(receiverId: (widget.receiverId??""),schoolId: (widget.schoolId??""));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (ctrl.showEmojiPicker.value) {
          ctrl.showEmojiPicker.value = false;
          return false;
        }
        return true;
      },
      child: Scaffold(
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
                        GestureDetector(child: const Icon(Icons.arrow_back_ios,size: 24,),onTap: (){
                          Get.back();
                        },
                        ),
                        SizedBox(width: 1.h),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0,8,0,8),
                          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: BaseColors.primaryColor)),
                          child:BaseImageNetwork(
                              link: widget.receiverProfilePic??"",
                              concatBaseUrl: false,
                              height: 4.h,
                              errorWidget: SvgPicture.asset("assets/images/ic_supervisor.svg",height: 30,width: 30,),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addText(widget.receiverName??"", 14.sp, BaseColors.primaryColor, FontWeight.w700),
                            SizedBox(height: 0.5.h),
                            addText(widget.uniqueId??"", 14.sp, BaseColors.primaryColor, FontWeight.w700),
                            // SizedBox(height: 0.5.h),
                            // addText("G3 - H2", 14.sp, BaseColors.primaryColor, FontWeight.w700),
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
                        sendCallButton(
                          isVideoCall: true,
                          username: widget.receiverName??"",
                          inviteeUsersIDTextCtrl: TextEditingController()..text = (widget.receiverId??""),
                          buttonIcon: ButtonIcon(
                            icon:  SvgPicture.asset("assets/images/video.svg"),
                          ),
                          onCallFinished: onSendCallInvitationFinished,
                        ),
                        SizedBox(width: 4.w),
                        sendCallButton(
                          isVideoCall: false,
                          username: widget.receiverName??"",
                          inviteeUsersIDTextCtrl: TextEditingController()..text = (widget.receiverId??""),
                          buttonIcon: ButtonIcon(
                            icon:  SvgPicture.asset("assets/images/phone.svg"),
                          ),
                          onCallFinished: onSendCallInvitationFinished,
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
                    child: Text(ctrl.formatDateToTodayOrYesterday(ctrl.messageList?[index1].date??""),style: TextStyle(
                        color: Colors.grey.shade600
                    ),
                   ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(15.sp),
                    reverse: false,
                    itemCount: ctrl.messageList?[index1].chatList?.length??0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: index == (ctrl.messageList?[index1].chatList?.length??0) -1 ? 60.0 : 10.0),
                        child: Align(
                          alignment: (ctrl.messageList?[index1].chatList?[index].senderId?.sId??"") != userID ? Alignment.topLeft : Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: (ctrl.messageList?[index1].chatList?[index].senderId?.sId??"") != userID ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: (ctrl.messageList?[index1].chatList?[index].senderId?.sId??"") != userID ? 2.w : 0),
                                    constraints: BoxConstraints(minWidth: 40.w, maxWidth: 80.w),
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: (ctrl.messageList?[index1].chatList?[index].senderId?.sId??"") != userID ? Colors.white : BaseColors.backgroundColor,
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
                                          ctrl.messageList?[index1].chatList?[index].message??"",
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
                                    visible: (ctrl.messageList?[index1].chatList?[index].senderId?.sId??"") != userID,
                                    child: GestureDetector(
                                      onTap: () async {
                                        selectedIndex = index;
                                        ctrl.messageList?.refresh();
                                        if (ctrl.messageList?[index1].chatList?[index].isEnglish??true) {
                                          Translation value = await translator.translate((ctrl.messageList?[index1].chatList?[index].message??""), from: 'en', to: 'ar');
                                          ctrl.messageList?[index1].chatList?[index].message = value.text;
                                          ctrl.messageList?[index1].chatList?[index].isEnglish = false;
                                        }
                                        else{
                                          ctrl.messageList?[index1].chatList?[index].message = ctrl.copiedMessageList?[index1].chatList?[index].message;
                                          ctrl.messageList?[index1].chatList?[index].isEnglish = true;
                                        }
                                        selectedIndex = -1;
                                        ctrl.messageList?.refresh();
                                      },
                                      child: selectedIndex == index
                                          ? const Padding(
                                            padding: EdgeInsets.only(left: 8),
                                            child: SizedBox(
                                               height: 21,
                                               width: 21,
                                            child: CircularProgressIndicator(color: BaseColors.primaryColor,strokeWidth: 3,)),
                                          )
                                          : Container(
                                              margin: const EdgeInsets.only(left: 5),
                                              padding: const EdgeInsets.all(6),
                                              decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle,boxShadow: [
                                              BoxShadow(offset: const Offset(0,0),spreadRadius: 1,blurRadius: 3,color: Colors.grey.withOpacity(0.8))
                                        ],
                                        ),child: SvgPicture.asset("assets/images/google_translate.svg",height: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.8.h),
                              addText(getFormattedTime(ctrl.messageList?[index1].chatList?[index].createdAt??""), 14.sp, Colors.grey.shade600, FontWeight.w400),
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
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 10.h,
              color: Colors.white,
              padding: EdgeInsets.all(15.sp),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: msgCtrl,
                      focusNode: ctrl.focusNode,
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
                            SizedBox(width: 2.w),
                            SvgPicture.asset("assets/images/Group 7724.svg"),
                          ],
                        ),
                      ),
                      fillColor: const Color(0xffF4F4F4),
                      borderRadius: 50,
                      hintTextColor: BaseColors.textLightGreyColor,
                    ),
                  ),
                  SizedBox(
                    width: 2.w
                  ),
                  GestureDetector(
                    onTap: (){
                      if (msgCtrl.text.trim().isNotEmpty) {
                        ctrl.sendMessage(widget.receiverId, msgCtrl.text.trim(), "text");
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
            Obx(
                  () => Visibility(
                visible: ctrl.showEmojiPicker.value,
                child: SizedBox(
                    height: 250,
                    child: EmojiPicker(
                      textEditingController: msgCtrl,
                      // onBackspacePressed: _onBackspacePressed,
                      config: Config(
                        columns: 7,
                        // Issue: https://github.com/flutter/flutter/issues/28894
                        emojiSizeMax: 32 * (
                            foundation.defaultTargetPlatform == TargetPlatform.iOS
                                ? 1.30
                                : 1.0),
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        gridPadding: EdgeInsets.zero,
                        initCategory: Category.RECENT,
                        bgColor: const Color(0xFFF2F2F2),
                        indicatorColor: ColorConstants.primaryColor,
                        iconColor: Colors.grey,
                        iconColorSelected: ColorConstants.primaryColor,
                        backspaceColor: ColorConstants.primaryColor,
                        skinToneDialogBgColor: Colors.white,
                        skinToneIndicatorColor: Colors.grey,
                        enableSkinTones: true,
                        recentTabBehavior: RecentTabBehavior.RECENT,
                        recentsLimit: 28,
                        replaceEmojiOnLimitExceed: false,
                        noRecents: const Text(
                          'No Recents',
                          style:
                          TextStyle(fontSize: 20, color: Colors.black26),
                          textAlign: TextAlign.center,
                        ),
                        loadingIndicator: const SizedBox.shrink(),
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: const CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL,
                        checkPlatformCompatibility: true,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void onSendCallInvitationFinished(
      String code,
      String message,
      List<String> errorInvitees,
      ) {
    if (errorInvitees.isNotEmpty) {
      String userIDs = "";
      for (int index = 0; index < errorInvitees.length; index++) {
        if (index >= 5) {
          userIDs += '... ';
          break;
        }

        var userID = errorInvitees.elementAt(index);
        userIDs += userID + ' ';
      }
      if (userIDs.isNotEmpty) {
        userIDs = userIDs.substring(0, userIDs.length - 1);
      }

      var message = 'User doesn\'t exist or is offline: $userIDs';
      if (code.isNotEmpty) {
        message += ', code: $code, message:$message';
      }
      toast.showToast(
        message,
        position: StyledToastPosition.top,
        context: context,
      );
    } else if (code.isNotEmpty) {
      toast.showToast(
        'code: $code, message:$message',
        position: StyledToastPosition.top,
        context: context,
      );
    }
  }
}
