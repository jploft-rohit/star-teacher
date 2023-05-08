import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/my_profile_screen/account_view/account_view.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';
import 'package:staff_app/view/my_profile_screen/detail_view/detail_view.dart';
import 'package:staff_app/view/my_profile_screen/my_profile_view/my_profile_view.dart';
import 'package:staff_app/view/my_profile_screen/schools_view/schools_view.dart';
import 'package:staff_app/view/my_profile_screen/statistics_view/statistics_view.dart';
import 'package:staff_app/view/print_qr_screen.dart';

class MyProfileScreen extends StatefulWidget {
  bool isFromDrawer;
  int index;
  MyProfileScreen({Key? key, required this.isFromDrawer, required this.index}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> with SingleTickerProviderStateMixin{

  late TabController tabCtrl;
  MyProfileCtrl controller = Get.put(MyProfileCtrl());
  DashboardScreenCtrl dashboardCtrl = Get.find<DashboardScreenCtrl>();
  String na = translate(Get.context!).na;
  
  @override
  void initState() {
    tabCtrl = TabController(length: 4, vsync: this);
    tabCtrl.animateTo(widget.index);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(title: translate(context).my_profile,onBackPressed: (){
        if(widget.isFromDrawer){
          Navigator.pop(context);
        }else{
          dashboardCtrl.bottomNavigationKey.currentState?.setPage(2);
        }
      }),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: widget.isFromDrawer ? 10 : 90),
        padding: EdgeInsets.all(scaffoldPadding),
        decoration: BoxDecoration(
          color: BaseColors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: BaseColors.borderColor),
          boxShadow: [getLightBoxShadow()],
        ),child: Column(
        children: [
          profileProgress(value: (controller.response.value.data?.profileCompletePercentage??50).toDouble(), profileCompletionData: (controller.response.value.data?.profileCompleteDate??"25 July, 2022").toString()),
          GestureDetector(
            onTap: (){
              Get.to(const MyProfileView());
            },
            child: Obx(()=> Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 12.sp, right: 12.sp),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: BaseColors.primaryColor
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: SvgPicture.asset(manSvg),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.response.value.data?.name??"Rafiq Khan", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 17.sp)),
                          SizedBox(height: 0.5.h),
                          BaseDetailData(detailsLabel: translate(context).designation,detailsValue: controller.response.value.data?.role??"Teacher"),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: (){
                            showScanQrDialogue(context, false,data: controller.response.value.data?.barcode??na);
                          },
                        child: QrImage(
                          data: controller.response.value.data?.barcode??na,
                          version: QrVersions.auto,
                          size: 70,
                          gapless: false,
                        )),
                  ],
                ),
            ),
            ),
          ),
          Row(
            children: [
              Expanded(flex: 3,child: BaseButton(title: translate(context).print_QR, textSize: mediumButtonTs,onPressed: (){
                Get.to(const PrintQrScreen());
              },borderRadius: 100,verticalPadding: 1.h,rightMargin: 1.5.w,)),
              Expanded(flex: 4,child: BaseButton(title: translate(context).programme_NFC, textSize: mediumButtonTs, onPressed: (){
                showNFCDialog(context,"");
              },borderRadius: 100,verticalPadding: 1.h,leftMargin: 1.5.w)),
            ],
          ),
          buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: tabCtrl,
              children: const [
                AccountView(),
                DetailView(),
                StatisticsView(),
                SchoolsView()
              ],
            ),
          )
        ],
      ),
      ),
    );
  }
  Widget profileProgress({required double value,double? bottomMargin, required String profileCompletionData}){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 1.h),
          width: double.infinity,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: BaseColors.primaryColor),
              color: BaseColors.backgroundColor
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: LinearProgressIndicator(
              value: value/100,
              valueColor: AlwaysStoppedAnimation<Color>(BaseColors.primaryColor),
              backgroundColor: BaseColors.backgroundColor,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${(translate(context).profile_complete)+" "+value.toString()}%", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 13.sp),),
            Text("${translate(context).complete_your_profile_till +" "+profileCompletionData}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textRedColor, fontSize: 13.sp),),
            // addText('Complete Your Profile Till: 25 July, 2022', getSmallTextFontSIze()-1, Colors.redAccent, FontWeight.w500),
          ],
        ),
        SizedBox(height: bottomMargin??3.h),
      ],
    );
  }
  Widget buildTabBar() {
    return BaseTabBar(
      bottomMargin: 2.h,
      topMargin: 2.h,
      controller: tabCtrl,
      tabs:  [
        Tab(text: translate(context).account),
        Tab(text: translate(context).details),
        Tab(text: translate(context).statistics),
        Tab(text: translate(context).school),
      ],
    );
  }
}
