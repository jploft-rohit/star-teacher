import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_tab_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/wallet/sub_screens/events_view.dart';
import 'package:staff_app/view/wallet/sub_screens/purchases_view.dart';
import 'package:staff_app/view/wallet/wallet_controller.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> with SingleTickerProviderStateMixin{

  WalletController controller = Get.put(WalletController());
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: CustomColors.white,
        appBar: BaseAppBar(title: translate(context).wallet),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              BaseToggleTabBar(controller: tabController, tabs: [
                BaseTabButton(title: translate(context).purchase, isSelected: tabController.index == 0),
                BaseTabButton(title: translate(context).event, isSelected: tabController.index == 1)
              ]),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                    children: [
                      const PurchasesView(),
                      const EventsView()
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
