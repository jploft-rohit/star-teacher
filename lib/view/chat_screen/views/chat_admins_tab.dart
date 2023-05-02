import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/chat_screen/chating_screen.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen.dart';

class ChatAdminTab extends StatefulWidget {
  const ChatAdminTab({Key? key}) : super(key: key);

  @override
  State<ChatAdminTab> createState() => _ChatAdminTabState();
}

class _ChatAdminTabState extends State<ChatAdminTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
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
                    Row(
                      children: [
                        Container(
                          height: 70,
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: BaseColors.primaryColor)
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
                            addText("Salma", 14.sp, BaseColors.textBlackColor, FontWeight.w700),
                            SizedBox(
                              height: .5.h,
                            ),
                            addText("School Admin", 15.sp, BaseColors.primaryColor, FontWeight.w700),
                            SizedBox(
                              height: .5.h,
                            ),
                            addText("(Dubai Public School)", 14.sp, BaseColors.textBlackColor, FontWeight.w400),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        children: [
                          GestureDetector(
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
                                Text("Schedule\nMeeting", style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,),textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(
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
                                addText("Chats", 13.sp, BaseColors.textBlackColor, FontWeight.w700)
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
                    color: BaseColors.primaryColor,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: addText("5", 13.sp, BaseColors.white, FontWeight.w700),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
