import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_tab_bar.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/audio_call_screen.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/chating_screen.dart';
import 'package:staff_app/view/chat_screen/video_call_screen.dart';
import 'package:staff_app/view/chat_screen/views/chat_admins_tab.dart';
import 'package:staff_app/view/chat_screen/views/chat_parents_tab.dart';
import 'package:staff_app/view/chat_screen/views/chat_staff_tab.dart';
import 'package:staff_app/view/chat_screen/views/chat_star_tab.dart';
import 'package:staff_app/view/schedule_meeting_screen/schedule_meeting_screen.dart';

class ChatScreen extends StatefulWidget {
  final bool isFromBtmBar;
  ChatScreen({Key? key, required this.isFromBtmBar}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  var tabCtrl;
  late TabController tabController;

  ChatScreenCtrl controller = Get.put(ChatScreenCtrl());
  DashboardScreenCtrl ctrl = Get.find<DashboardScreenCtrl>();

  @override
  void initState() {
    tabCtrl = TabController(length: 4, vsync: this);
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: "Chats", onBackPressed: (){
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
                  color: BaseColors.borderColor,
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
                    hintTextColor: BaseColors.textLightGreyColor,
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
                  ChatStarTab(),
                  ChatParentsTab(),
                  ChatStaffTab(),
                  ChatAdminTab()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return BaseTabBar(
      controller: tabCtrl,
      tabs:  [
        Stack(
          alignment: Alignment.center,
          children: const [
            Tab(
              text: 'Stars',
            ),
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
                      color: BaseColors.primaryColor
                  ),
                  child: Center(child: Text("10", style: Style.montserratRegularStyle().copyWith(color: Colors.white, fontSize: 13.sp),)),
                ),
              ),
            )
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: const [
            Tab(
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
                      color: BaseColors.primaryColor
                  ),
                  child: Center(child: Text("10", style: Style.montserratRegularStyle().copyWith(color: Colors.white, fontSize: 13.sp),)),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
