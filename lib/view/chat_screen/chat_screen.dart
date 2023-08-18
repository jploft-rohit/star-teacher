import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/chat_screen_ctrl.dart';
import 'package:staff_app/view/chat_screen/views/chat_list_tile.dart';

class ChatScreen extends StatefulWidget {
  final bool isFromBtmBar;
  ChatScreen({Key? key, required this.isFromBtmBar}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  late TabController tabCtrl;

  ChatScreenCtrl controller = Get.put(ChatScreenCtrl());
  DashboardScreenCtrl ctrl = Get.find<DashboardScreenCtrl>();

  @override
  void initState() {
    super.initState();
    controller.getChatHistory();
    tabCtrl = TabController(length: 4, vsync: this)..addListener(() {
      if (!(tabCtrl.indexIsChanging)) {
        controller.primarySelectedIndex.value = tabCtrl.index;
        controller.secondarySelectedIndex.value = 0;
        controller.getChatHistory();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  border: Border.all(color: Color(0xFFCECECE), width: 1)),
              child: Column(
                children: [
                  Row(
                    children: [
                            CustomFilterDropDown(initialValue: DummyLists.initialSchool, hintText: 'School', listData: DummyLists.schoolData, onChange: (value) {
                              setState(() {
                                DummyLists.initialSchool=value;
                              });
                            },icon: classTakenSvg,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  FilterTextFormField(onChange: (String val) {
                  }, hintText: "Search Star,ID...", keyBoardType: TextInputType.name,
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
                  ChatListTile(),
                  ChatListTile(),
                  ChatListTile(),
                  ChatListTile(),
                  // ChatParentsTab(),
                  // ChatStaffTab(),
                  // ChatAdminTab()
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
      ],
    );
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    super.dispose();
  }
}
