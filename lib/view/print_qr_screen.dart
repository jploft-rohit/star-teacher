import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';

class PrintQrScreen extends StatefulWidget {
  const PrintQrScreen({Key? key}) : super(key: key);

  @override
  State<PrintQrScreen> createState() => _PrintQrScreenState();
}

class _PrintQrScreenState extends State<PrintQrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBarWithAction(context, "QR Code", [
      ]),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: 100.w,
          height: Get.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/barcode2.svg",
                fit: BoxFit.scaleDown,
              ),
              SizedBox(height:5.h),
              CustomButton(text: "PRINT QR", onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
