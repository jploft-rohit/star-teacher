// Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';


ZegoUIKitPrebuiltCallController? callController;

/// on user login
void onUserLogin() {
  callController ??= ZegoUIKitPrebuiltCallController();

  /// 4/5. initialized ZegoUIKitPrebuiltCallInvitationService when account is logged in or re-logged in
  ZegoUIKitPrebuiltCallInvitationService().init(
    appID: 873900757,
    appSign: "210d224aca68738a704bd4b6be48bec9b301291d737729b629414b5a7a9aaa64" /*input your AppSign*/,
    userID: currentUser.id,
    userName: currentUser.name,
    notifyWhenAppRunningInBackgroundOrQuit: true,
    androidNotificationConfig: ZegoAndroidNotificationConfig(
      channelID: "CallInvitation",
      channelName: "Call Notifications",
      sound: "notification",
    ),
    iOSNotificationConfig: ZegoIOSNotificationConfig(
      isSandboxEnvironment: false,
      systemCallingIconName: 'CallKitIcon',
    ),
    plugins: [ZegoUIKitSignalingPlugin()],
    controller: callController,
    requireConfig: (ZegoCallInvitationData data) {
      final config = (data.invitees.length > 1)
          ? ZegoCallType.videoCall == data.type
          ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
          : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
          : ZegoCallType.videoCall == data.type
          ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

      config.avatarBuilder = customAvatarBuilder;

      /// support minimizing, show minimizing button
      config.topMenuBarConfig.isVisible = true;
      config.topMenuBarConfig.buttons
          .insert(0, ZegoMenuBarButtonName.minimizingButton);

      return config;
    },
  );
}

/// on user logout
void onUserLogout() {
  callController = null;

  /// 5/5. de-initialization ZegoUIKitPrebuiltCallInvitationService when account is logged out
  ZegoUIKitPrebuiltCallInvitationService().uninit();
}

Widget sendCallButton({
  required bool isVideoCall,
  required String username,
  required TextEditingController inviteeUsersIDTextCtrl,
  void Function(String code, String message, List<String>)? onCallFinished,
  required ButtonIcon buttonIcon,
  double? iconWidth, iconHeight,
  double? buttonWidth, buttonHeight,
}) {
  return ValueListenableBuilder<TextEditingValue>(
    valueListenable: inviteeUsersIDTextCtrl,
    builder: (context, inviteeUserID, _) {
      var invitees = ZegoUIKitUser(
        id: inviteeUsersIDTextCtrl.text,
        name: username,
      );

      return ZegoSendCallInvitationButton(
        isVideoCall: isVideoCall,
        invitees: [invitees],
        resourceID: "star_admincall",
        borderRadius: 0,
        iconSize:  Size(iconWidth??4.5.h, iconHeight??4.5.h),
        buttonSize:  Size(buttonWidth??4.5.h, buttonHeight??4.5.h),
        icon: buttonIcon,
        onPressed: onCallFinished,
      );
    },
  );
}

List<ZegoUIKitUser> getInvitesFromTextCtrl(String textCtrlText) {
  List<ZegoUIKitUser> invitees = [];

  var inviteeIDs = textCtrlText.trim().replaceAll('，', '');
  inviteeIDs.split(",").forEach((inviteeUserID) {
    if (inviteeUserID.isEmpty) {
      return;
    }

    invitees.add(ZegoUIKitUser(
      id: inviteeUserID,
      name: 'user_$inviteeUserID',
    ));
  });

  return invitees;
}

class UserInfo {
  String id = '';
  String name = '';

  UserInfo({
    required this.id,
    required this.name,
  });

  bool get isEmpty => id.isEmpty;

  UserInfo.empty();
}

UserInfo currentUser = UserInfo.empty();
Widget customAvatarBuilder(
    BuildContext context,
    Size size,
    ZegoUIKitUser? user,
    Map<String, dynamic> extraInfo,
    ) {
  return CachedNetworkImage(
    imageUrl: 'https://robohash.org/${user?.id}.png',
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        CircularProgressIndicator(value: downloadProgress.progress),
    errorWidget: (context, url, error) {
      ZegoLoggerService.logInfo(
        '$user avatar url is invalid',
        tag: 'live audio',
        subTag: 'live page',
      );
      return ZegoAvatar(user: user, avatarSize: size);
    },
  );
}
