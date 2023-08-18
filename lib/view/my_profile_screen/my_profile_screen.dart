import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
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
  final bool isFromDrawer;
  final int index;
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
    super.initState();
    tabCtrl = TabController(length: 4, vsync: this);
    tabCtrl.animateTo(widget.index);
    Future.delayed(Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(
        title: translate(context).my_profile,
        onBackPressed: (){
        if(widget.isFromDrawer){
          Navigator.pop(context);
        }else{
          dashboardCtrl.bottomNavigationKey.currentState?.setPage(2);
        }
      }),
      body: Obx(()=>Container(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: widget.isFromDrawer ? 10 : 90),
          padding: EdgeInsets.all(scaffoldPadding),
          decoration: BoxDecoration(
            color: BaseColors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: BaseColors.borderColor),
            boxShadow: [getLightBoxShadow()],
          ),child: Column(
          children: [
            profileProgress(value: double.parse((controller.response.value.data?.profileCompletePercentage??"0").toString()), profileCompletionData: (controller.response.value.data?.profileCompleteDate).toString()),
            GestureDetector(
              onTap: (){
                Get.to(const MyProfileView());
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 7.h,
                        padding: EdgeInsets.only(top: 3, bottom: 3, left: 3, right: 3),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: BaseColors.primaryColor
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: BaseImageNetwork(
                          link: controller.response.value.data?.profilePic??"",
                          borderRadius: 10,
                          errorWidget: SvgPicture.asset(manSvg),
                        ),//controller.response.value.data?.designation??"Teacher"
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.response.value.data?.name??na, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 17.sp)),
                          SizedBox(height: 0.5.h),
                          BaseDetailData(bottomMargin: 1.5.h, showDivider: false, detailsLabel: translate(context).designation,detailsValue: controller.response.value.data?.designation??"Teacher"),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: (controller.response.value.data?.currentStatus??"").toString().toLowerCase() == "inactive",
                          child: GestureDetector(
                            onTap: (){
                              // Get.to(DeactivationDetailScreen(data: controller.response.value.data?.deactivateData));
                            },
                            child: Container(
                              width: 80,
                              height: 18,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: BaseColors.primaryColor),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text("DEACTIVATED",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700,color: BaseColors.primaryColor)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            showScanQrDialogue(context, false,data: controller.response.value.data?.barcode??na);
                          },
                          child: QrImage(
                            data: controller.response.value.data?.barcode??na,
                            version: QrVersions.auto,
                            size: 55,
                            gapless: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(flex: 3,child: BaseButton(title: translate(context).print_QR,  textSize: mediumButtonTs,onPressed: (){
                  Get.to(const PrintQrScreen());
                },borderRadius: 100,verticalPadding: 1.h)),
                SizedBox(width: 2.w),
                Expanded(flex: 4,child: BaseButton(title: translate(context).programme_NFC, textSize: mediumButtonTs, onPressed: (){
                  showNFCDialog(context,"");
                },borderRadius: 100,verticalPadding: 1.h)),
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
            Text("${(translate(context).profile_complete)+" "+(controller.response.value.data?.profileCompletePercentage.toString()??"")}%", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 13.sp),),
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
