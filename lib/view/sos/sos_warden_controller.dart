import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class SosWardenController extends GetxController{

  var fmoImageList = [
    nfcSvg,
    barcodeSvg,
    handSvg,
  ];

  var sosTitles1 = [translate(Get.context!).remaining_for_evacuation, translate(Get.context!).need_help];
  var sosTitlesValue = ['50/800', '20'];
  final selectedNFCTabPos = 0.obs; // its for Remaining & Stamped

  final mapRemaining = [
    {'title': "Sania", 'id':"#455285",'assembly no':"Assembly Point No. 2",'Reported Location':"Lab01-F1"},
    {'title': "Abdul Khan", 'id':"#455286", 'assembly no':"Assembly Point No. 3",'Reported Location':"Lab01-F1"},
    {'title': "Apsana", 'id':"#455287", 'assembly no':"Assembly Point No. 2",'Reported Location':"Lab01-F1"},
    {'title': "Muskan", 'id':"#455288", 'assembly no':"Assembly Point No. 3",'Reported Location':"Lab01-F1"},
    {'title': "Abbas Ali", 'id':"#455289", 'assembly no':"Assembly Point No. 2",'Reported Location':"Lab01-F1"},
    {'title': "Nazia", 'id':"#455290", 'assembly no':"Assembly Point No. 3",'Reported Location':"Lab01-F1"},
  ];

  final selectedPos = 0.obs;
  final selectedFMOPos = 0.obs;
  TextEditingController searchCtrl = TextEditingController();
}