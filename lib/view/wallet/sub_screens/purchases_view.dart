import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/wallet/sub_screens/topup_your_famaily_popup.dart';
import 'package:staff_app/view/wallet/sub_screens/transcation_tile.dart';
import 'package:staff_app/view/wallet/wallet_controller.dart';

class PurchasesView extends StatefulWidget {
  const PurchasesView({super.key});

  @override
  State<PurchasesView> createState() => _PurchasesViewState();
}

class _PurchasesViewState extends State<PurchasesView> with SingleTickerProviderStateMixin{
  WalletController controller = Get.find<WalletController>();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      if (!tabController.indexIsChanging) {
        controller.selectedTabIndex.value = tabController.index;
        controller.getHistory();
        setState(() {});
      }else{
        controller.list?.clear();
      }
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
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.w,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.25), blurRadius: 2)
              ],
              color: BaseColors.backgroundColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: BaseColors.primaryColor),
            ),
            child: Column(
              children: [
                SizedBox(height: 1.5.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(coinSvg),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: Column(
                        children: [
                          Text(translate(context).balance, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 20.sp),),
                          SizedBox(height: 1.h),
                          Obx(() => Text('${(controller.walletBalanceData?.value?.walletAmount??"0").toString()} AED', style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor,fontSize: 21.sp),),),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Container(
                      padding: EdgeInsets.all(0.5.h),
                      decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[3],
                          borderRadius: BorderRadius.circular(30),
                          color: BaseColors.backgroundColor,
                          border: Border.all(color: BaseColors.primaryColor)),
                      child: Material(
                        color: Colors.transparent,
                        child: GestureDetector(
                          onTap: () {
                            showGeneralDialog(
                              context: context,
                              pageBuilder:  (context, animation, secondaryAnimation) {
                                return const TopupYourFamilyPopup();
                              },
                            );
                          },
                          child: Icon(
                            Icons.add,
                            color: BaseColors.primaryColor,
                            size: 5.0.h,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          BaseToggleTabBar(controller: tabController, tabs: [
            BaseTabButton(title: translate(context).transaction, isSelected: tabController.index == 0,type: toggleLargeButton,),
            BaseTabButton(title: translate(context).top_up_record, isSelected: tabController.index == 1,type: toggleLargeButton,),
          ]),
          SizedBox(height: 1.5.h),
          Row(
            children: [
              Expanded(child: Obx(()=> calenderDownButton(isFrom: true))),
              SizedBox(width: 0.5.h),
              Expanded(child: Obx(()=> calenderDownButton(isFrom: false))),
            ],
          ),
          SizedBox(height: 2.h),
          const Text("Transactions",style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 1.h),
          Expanded(
            child: TabBarView(
              controller: tabController,
                // physics: NeverScrollableScrollPhysics(),
                children: [
                TransactionTile(),
                TransactionTile(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget calenderDownButton({required bool isFrom}) {
    return GestureDetector(
      onTap: (){
        showDatePicker(
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: BaseColors.primaryColor,
                ),
              ),
              child: child!,
            );
          },
            context: Get.context!,
            initialDate: isFrom ? controller.fromDate.value.isEmpty ? DateTime.now() : DateTime.parse(controller.fromDate.value.trim()) : controller.toDate.value.isEmpty ? DateTime.now() : DateTime.parse(controller.toDate.value.trim()),
            firstDate: DateTime(2023, 1, 1),
            lastDate: DateTime.now(),
        ).then((value){
              if (value != null) {
                if (isFrom) {
                  if (controller.toDate.value.isNotEmpty) {
                    DateTime toDate = DateTime.parse(controller.toDate.value);
                    if (toDate.isAfter(value) || toDate.isAtSameMomentAs(value)) {
                      controller.fromDate.value = formatFlutterDateTime(flutterDateTime: value);
                      if (controller.fromDate.value.isNotEmpty && controller.toDate.value.isNotEmpty) {
                        controller.getHistory();
                      }
                    }else{
                      baseToast(message: "\"From Date\" can't be less than \"To Date\"");
                    }
                  }else{
                    controller.fromDate.value = formatFlutterDateTime(flutterDateTime: value);
                  }
                }else{
                  if (controller.fromDate.value.isNotEmpty) {
                    DateTime fromDate = DateTime.parse(controller.fromDate.value);
                    if (fromDate.isBefore(value) || fromDate.isAtSameMomentAs(value)) {
                      controller.toDate.value = formatFlutterDateTime(flutterDateTime: value);
                      if (controller.fromDate.value.isNotEmpty && controller.toDate.value.isNotEmpty) {
                        controller.getHistory();
                      }
                    }else{
                      baseToast(message: "\"To Date\" can't be less than \"From Date\"");
                    }
                  }else{
                    controller.toDate.value = formatFlutterDateTime(flutterDateTime: value);
                  }
                }
              }
           },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: BaseColors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: BaseColors.borderColor),
        ),
        padding: EdgeInsets.symmetric(horizontal: 1.2.w, vertical: 0.6.h),
        child: Row(
          children: [
            SvgPicture.asset(calenderSvg, height: 2.h),
            SizedBox(width: 2.w),
            Text("${isFrom ? "From:  " : "To:  "}${isFrom ? controller.fromDate.value.isNotEmpty ? formatFlutterDateTime(flutterDateTime: DateTime.parse(controller.fromDate.value) , getDayFirst: true) : "" : controller.toDate.value.isNotEmpty ? formatFlutterDateTime(flutterDateTime: DateTime.parse(controller.toDate.value), getDayFirst: true) : ""}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textLightGreyColor, fontSize: 14.sp),),
          ],
        ),
      ),
    );
  }
}
