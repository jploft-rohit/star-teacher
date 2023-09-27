import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/qr/attendance_list_tile_qr.dart';
import 'package:staff_app/view/star_attendance_screen/controller/star_attendance_screen_ctrl.dart';

class AttendanceQRScanner extends StatefulWidget {
  const AttendanceQRScanner({Key? key}) : super(key: key);

  @override
  State<AttendanceQRScanner> createState() => _AttendanceQRScannerState();
}

class _AttendanceQRScannerState extends State<AttendanceQRScanner> {
  StarAttendanceScreenCtrl starAttendanceScreenCtrl = Get.find<StarAttendanceScreenCtrl>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool? flashOn = false;
  Barcode? result;
  bool scanned = false;
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
        scanned = true;
        result = scanData;
        controller.pauseCamera();
        // Get.toNamed(MyRouter.addItemOneScreen);
        print("object::"+(result?.code??""));
        if ((result?.code??"").isNotEmpty) {
          starAttendanceScreenCtrl.searchStudentWithQRCode(keyword: (result?.code??""));
        }
      });
    });

    // controller.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
    starAttendanceScreenCtrl.qrSearchedList?.value = [];
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
                    margin: const EdgeInsets.all(5),
                    child: scanned
                        ? GestureDetector(
                      onTap: (){
                        setState(() {
                          scanned = false;
                          controller?.resumeCamera();
                          starAttendanceScreenCtrl.qrSearchedList?.value = [];
                        });
                      },
                          child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: const Text("Scan Again",style: TextStyle(color: Colors.white),),
                          ),
                        )
                        : QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                          overlay: QrScannerOverlayShape(
                          borderColor: BaseColors.primaryColor,
                          borderRadius: 12,
                          borderLength: 30,
                          borderWidth: 10,
                          overlayColor: BaseColors.white
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0.h),
              const AttendanceListTileQR(),
              // SizedBox(height: 40.h,),
            ],
          ),
        )
    );
  }

}
