import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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

class _WalletViewState extends State<WalletView> {

  WalletController controller = Get.put(WalletController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: appBarWithAction(context, translate(context).wallet, [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Obx(
              () => walletToogleButton(
                  () {
                    controller.purchasesSelected();
                  },
                  controller.isPurachses.value,
                  () {
                    controller.eventsSelected();
                  },
                  controller.isEvents.value,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Obx(
                    () => Column(
                      children: [
                        controller.isPurachses.value
                            ? PurchasesView()
                            : SizedBox.shrink(),
                        controller.isEvents.value
                            ? EventsView()
                            : SizedBox.shrink(),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
