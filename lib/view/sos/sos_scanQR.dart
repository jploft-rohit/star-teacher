import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/base_dialogs.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool? flashOn = false;
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid && controller!=null) {
      controller!.pauseCamera();
    } else if (Platform.isIOS && controller!=null) {
      controller!.resumeCamera();
    }
  }
  _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.dispose();
        // Get.toNamed(MyRouter.addItemOneScreen);
        print("object::"+result!.code.toString());
      });
    });
    controller.pauseCamera();
    controller.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppBar(title: translate(context).qr_scanner),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 240,
                    width: 230,
                    margin: EdgeInsets.all(5),
                    // padding: EdgeInsets.all(30),
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //     image: AssetImage(Assets.imagesScannerBorder))
                    // ),
                    child: QRView(
                      key: qrKey,
                      // overlayMargin: EdgeInsets.all(10.0),

                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                          borderColor: BaseColors.primaryColor,
                          borderRadius: 12,
                          borderLength: 30,
                          borderWidth: 10,
                          // borderRadius: 20.0,
                          // borderLength: 0.0,
                          // borderWidth: 0.0,
                          // cutOutSize: 250,
                          overlayColor: BaseColors.white
                      ),
                    ),
                  ),
                  // Positioned(
                  //     bottom: 0,top: 0,left: 0,right: 0,
                  //     child: SvgPicture.asset(Assets.imagesSosScanSuccess,width: 230,))
                ],
              ),
              SizedBox(height: 5.0.h),
              Container(
                height: 46,
                decoration: BoxDecoration(
                  border: Border.all(color: BaseColors.borderColor),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                margin: const EdgeInsets.symmetric(horizontal: 32),
                // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      height: 12.w,width: 12.w,
                        padding: EdgeInsets.symmetric(horizontal: 13.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: BaseColors.primaryColor),
                        ),
                      child: SvgPicture.asset(
                        girlSvg
                      ),),
                    SizedBox(width: 1.5.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sania",style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp, color: BaseColors.textBlackColor),),
                        Text("#455285",style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp, color: BaseColors.primaryColor),),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        BaseDialogs().showConfirmationDialog(
                          title: "Are you sure you want to delete this Star?",
                        );
                      },
                      child: Icon(
                        CupertinoIcons.delete,
                        color: BaseColors.primaryColor,
                        size: 18.sp,
                      ),
                    ),
                    SizedBox(width: 1.4.h),

                  ],
                ),

              )
              // SizedBox(height: 40.h,),

            ],
          ),
        )
    );
  }

}
