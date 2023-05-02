import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_tab_button.dart';
import 'package:staff_app/utility/base_views/base_toggle_tab_bar.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
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

class _WalletViewState extends State<WalletView> {

  WalletController controller = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(title: translate(context).wallet),
      body: Padding(
        padding: EdgeInsets.all(scaffoldPadding),
        child: PurchasesView()
      ),
    );
  }
}
