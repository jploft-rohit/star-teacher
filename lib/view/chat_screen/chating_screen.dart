import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/chat_screen/audio_call_screen.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/video_call_screen.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen.dart';

class ChatingScreen extends StatefulWidget {
  const ChatingScreen({Key? key}) : super(key: key);

  @override
  State<ChatingScreen> createState() => _ChatingScreenState();
}

class _ChatingScreenState extends State<ChatingScreen> {
  ChatScreenCtrl ctrl = Get.put(ChatScreenCtrl());

  TextEditingController msgCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(Get.width, 100),
          child: Container(
            decoration: const BoxDecoration(
              color: CustomColors.backgroundColor,
              border: Border(
                bottom: BorderSide(color: CustomColors.primaryColor)
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                          addText("Sania", 14.sp, CustomColors.primaryColor, FontWeight.w700),
                          SizedBox(
                            height: .5.h,
                          ),
                          addText("Father", 14.sp, CustomColors.primaryColor, FontWeight.w700),
                          SizedBox(
                            height: .5.h,
                          ),
                          addText("G3 - H2", 14.sp, CustomColors.primaryColor, FontWeight.w700),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // InkWell(
                      //   onTap: (){
                      //
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(bottom: 5.0),
                      //     child: InkWell(
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
                      InkWell(
                        onTap: (){
                          Get.to(const VideoCallScreen());
                        },
                        child: SvgPicture.asset("assets/images/video.svg", height: 25.0,),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      InkWell(
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
        body: Stack(
          children: [
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.sp),
              itemCount: ctrl.chatList.length,
              itemBuilder: (context, index) {
                return GetBuilder<ChatScreenCtrl>(
                  builder: (ctrl) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: index == ctrl.chatList.length -1 ? 60.0 : 10.0),
                      child: ctrl.chatList[index]['type'] == '1' ? Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 2.w),
                                  constraints: BoxConstraints(minWidth: 40.w, maxWidth: 80.w),
                                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: CustomColors.darkShadowColor.withOpacity(0.5),
                                          blurRadius: 8.0,
                                        )
                                      ]
                                  ),
                                  child: Text(ctrl.chatList[index]['msg'], style: Style.montserratMediumStyle().copyWith(fontSize:16.sp, color: CustomColors.textBlackColor, fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                                ),
                                const Icon(Icons.translate_rounded,size: 18,)
                              ],
                            ),
                            SizedBox(
                              height: .8.h,
                            ),
                            addText(ctrl.chatList[index]['date'], 14.sp, CustomColors.textBlackColor, FontWeight.w400),
                          ],
                        ),
                      )
                          : Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(minWidth: 40.w, maxWidth: 80.w),
                              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                  color: CustomColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CustomColors.darkShadowColor.withOpacity(0.6),
                                      blurRadius: 8.0,
                                    )
                                  ]
                              ),
                              child: Text(ctrl.chatList[index]['msg'], style: Style.montserratMediumStyle().copyWith(fontSize:16.sp, color: CustomColors.textBlackColor, fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                            ),
                            SizedBox(
                              height: .8.h,
                            ),
                            addText(ctrl.chatList[index]['date'], 14.sp, CustomColors.textBlackColor, FontWeight.w400),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
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
                            color: CustomColors.textLightGreyColor,
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
                        hintTextColor: CustomColors.textLightGreyColor,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: (){
                        ctrl.chatList.add(
                          {
                            "msg": msgCtrl.text.toString().trim(),
                            "type":ctrl.chatList.last['type'] == "1" ? "0" : "1",
                            "date":DateFormat('hh:mm a').format(DateTime.now())
                          },
                        );
                        ctrl.update();
                        msgCtrl.clear();
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColors.backgroundColor,
                            border: Border.all(color: CustomColors.primaryColor)
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
            ),
          ],
        ),
      ),
    );
  }
}
