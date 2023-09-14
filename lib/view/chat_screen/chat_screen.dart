import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/group/create_group_screen.dart';
import 'package:staff_app/view/chat_screen/views/chat_list_tile.dart';
import 'package:staff_app/view/chat_screen/views/group_chat_list_tile.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class ChatScreen extends StatefulWidget {
  final bool isFromBtmBar;
  const ChatScreen({Key? key, required this.isFromBtmBar}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  late TabController tabCtrl;

  ChatScreenCtrl controller = Get.put(ChatScreenCtrl());
  DashboardScreenCtrl ctrl = Get.find<DashboardScreenCtrl>();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

  @override
  void initState() {
    super.initState();
    controller.selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
    controller.schoolController.text = baseCtrl.schoolListData.data?.data?.first.name??"";
    controller.selectedSchoolName.value = baseCtrl.schoolListData.data?.data?.first.name??"";
    controller.primarySelectedIndex.value = 0;
    controller.getChatHistory();
    tabCtrl = TabController(length: 5, vsync: this)..addListener(() {
      if (!(tabCtrl.indexIsChanging)) {
        controller.primarySelectedIndex.value = tabCtrl.index;
        if (tabCtrl.index != 4) {
          controller.getChatHistory();
        }else{
          controller.getGroupChatHistory();
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Obx(()=>Visibility(
          visible: controller.primarySelectedIndex.value == 4,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: BaseFloatingActionButton(
                onTap: () {
                  Get.to(const CreateGroupScreen());
                },
                title: 'Add Group',
            ),
          ),
        ),
      ),
      appBar: BaseAppBar(
          title: "Chats",
          onBackPressed: (){
            if(widget.isFromBtmBar){
              ctrl.bottomNavigationKey.currentState?.setPage(2);
            }else{
              Navigator.pop(context);
            }
          },
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFCECECE), width: 1)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(()=>CustomFilterDropDown(
                          hintText: controller.selectedSchoolName.value.isEmpty ? 'Select School' : controller.selectedSchoolName.value,
                          item: baseCtrl.schoolListData.data?.data?.map((SchoolData data){
                            return DropdownMenuItem<SchoolData>(
                              value: data,
                              child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                            );
                          }).toList(),
                          onChange: (value) {
                            baseCtrl.searchController.clear();
                            controller.selectedSchoolName.value = value.name??"";
                            controller.selectedSchoolId.value = value.sId??"";
                            if (tabCtrl.index != 4) {
                              controller.getChatHistory();
                            }else{
                              controller.getGroupChatHistory();
                            }
                          },
                          icon: classTakenSvg,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  FilterTextFormField(
                    onChange: (String val) {},
                    hintText: "Search Star,ID...",
                    keyBoardType: TextInputType.name,
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
                children: const [
                  ChatListTile(secondarySelectedIndex: 0),
                  ChatListTile(secondarySelectedIndex: 0),
                  ChatListTile(secondarySelectedIndex: 0),
                  ChatListTile(secondarySelectedIndex: 0),
                  GroupChatListTile(secondarySelectedIndex: 1),
                  // ChatParentsTab(),
                  // ChatStaffTab(),
                  // ChatAdminTab()
                ],
              ),
            ),
            // SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
  Widget buildTabBar() {
    return BaseTabBar(
      controller: tabCtrl,
      tabs:  const [
        Stack(
          alignment: Alignment.center,
          children: [
            Tab(
              text: 'Stars',
            ),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Tab(
              text: 'Parents',
            ),
            // Align(
            //   alignment: AlignmentDirectional.topEnd,
            //   child: Padding(
            //     padding: const EdgeInsetsDirectional.only(start: 60.0),
            //     child: Container(
            //       height: 15.0,
            //       padding: const EdgeInsets.all(2.0),
            //       decoration: const BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: BaseColors.primaryColor
            //       ),
            //       child: Center(child: Text("10", style: Style.montserratRegularStyle().copyWith(color: Colors.white, fontSize: 13.sp),)),
            //     ),
            //   ),
            // ),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
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
            Tab(
              text: 'Admins',
            ),
            // Align(
            //   alignment: AlignmentDirectional.topEnd,
            //   child: Padding(
            //     padding: const EdgeInsetsDirectional.only(start: 60.0),
            //     child: Container(
            //       height: 15.0,
            //       padding: const EdgeInsets.all(2.0),
            //       decoration: const BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: BaseColors.primaryColor
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
            Tab(
              text: 'Group',
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    super.dispose();
  }
}
