import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/Dashboard_screen/dashboard_screen_ctrl.dart';
import 'package:staff_app/view/my_profile_screen/account_view/account_view.dart';
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
  late TabController controller;
  DashboardScreenCtrl ctrl = Get.find<DashboardScreenCtrl>();
  
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    controller.animateTo(widget.index);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: appBarWithAction(context, translate(context).my_profile,[
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ],onPressed: (){
        if(widget.isFromDrawer){
          Navigator.pop(context);
        }else{
          ctrl.bottomNavigationKey.currentState?.setPage(2);
        }
      }),
      body: Container(
        width: 100.w,
        height: 100.h,
        margin: EdgeInsets.only(left: 15, right: 15, bottom: widget.isFromDrawer ? 10 : 90),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: CustomColors.borderColor),
          boxShadow: [getLightBoxShadow()],
        ),child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 8,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(10.0),
                border: Border.all(color: CustomColors.primaryColor),
                color: CustomColors.backgroundColor
            ),
            child: ClipRRect(
              borderRadius:  BorderRadius.circular(10.0),
              child: const LinearProgressIndicator(
                value: 0.5,
                valueColor: AlwaysStoppedAnimation<Color>(CustomColors.primaryColor),
                backgroundColor: CustomColors.backgroundColor,
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${translate(context).profile_complete} 50%", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 13.sp),),
              Text("${translate(context).complete_your_profile_till} 25 July, 2022", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textRedColor, fontSize: 13.sp),),
              // addText('Complete Your Profile Till: 25 July, 2022', getSmallTextFontSIze()-1, Colors.redAccent, FontWeight.w500),

            ],
          ),
          SizedBox(height: 3.h,),
          InkWell(
            onTap: (){
              Get.to(MyProfileView());
            },
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 12.sp, right: 12.sp),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: CustomColors.primaryColor
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: SvgPicture.asset(manSvg),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rafiq Khan", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 17.sp),),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '${translate(context).designation} : ',
                        style: Style.montserratRegularStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 14.sp),
                        children: <TextSpan>[
                          TextSpan(text: 'Teacher', style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 14.sp)),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    showScanQrDialogue(context, false);
                  },
                    child: SvgPicture.asset(qrCodeSvg)),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Row(
            children: [
              Flexible(flex: 1,child: CustomButton(text: translate(context).print_QR,  textSize: 15.sp,onPressed: (){
                Get.to(PrintQrScreen());
              },btnHeight: 30,),),
              SizedBox(
                width: 2.w,
              ),
              Flexible(flex: 1,child: CustomButton(text: translate(context).programme_NFC, textSize: 15.sp, onPressed: (){
                showNFCDialog(context,"");
              },btnHeight: 30,)),
            ],
          ),
          SizedBox(height: 2.h,),

          buildTabBar(),
          SizedBox(height: 2.h,),
          Expanded(
            child: TabBarView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
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
  Widget buildTabBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: TabBar(
        controller: controller,
        isScrollable: false,
        padding: const EdgeInsets.all(4),
        labelPadding: EdgeInsets.only(left: 0, right: 0),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColors.backgroundColor,
            boxShadow: [getBoxShadow()]
        ),
        labelColor: CustomColors.primaryColor,
        unselectedLabelColor: Colors.black,
        tabs:  [
          Tab(
            text: translate(context).account,
          ),
          Tab(
            text: translate(context).details,
          ),
          Tab(
            text: translate(context).statistics,
          ),
          Tab(
            text: translate(context).school,
          ),
        ],
      ),
    );
  }
}
