import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:staff_app/utility/base_utility.dart';

class BaseQr extends StatelessWidget {
  final String? data;
  const BaseQr({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          showScanQrDialogue(context, false,data: data??"");
        },
        child: QrImageView(
          data: data??"",
          version: QrVersions.auto,
          size: 70,
          gapless: false,
        ),
    );
  }
}
