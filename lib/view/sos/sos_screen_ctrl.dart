import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class SosScreenCtrl extends GetxController{
  var imageList = [
    fightSvg,
    fireSvg,
    medicalSupportSvg,
    otherSosSvg,
  ];
  var fmoImageList = [
    nfcSvg,
    barcodeSvg,
    handSvg,
  ];

  var sosTitles = [translate(Get.context!).fight, translate(Get.context!).fire_emergency, translate(Get.context!).medical_support, translate(Get.context!).other];

  var imageOtherMedicalImageList = [
    'assets/images/nfc.svg',
    'assets/images/qrcode.svg',
    'assets/images/hand.svg',
  ];

  final selectedPos = 0.obs;
  final selectedFMOPos = 0.obs;
  final selectedMedicalSupportPos = 0.obs;
  final selectedPassengers = <String>[].obs;
  final askForHelpSelectedPos = 0.obs;

  TextEditingController commentController = TextEditingController();
  TextEditingController searchCtrl = TextEditingController();
  var askForHelpList = [
    translate(Get.context!).im_stuck_at_my_location,
    translate(Get.context!).medical_help,
    translate(Get.context!).someone_is_stuck_at_report_location,
  ];

  TextEditingController classroomCtrl = TextEditingController();
}