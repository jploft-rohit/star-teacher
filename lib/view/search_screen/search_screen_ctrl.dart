import 'package:get/get.dart';
import 'package:staff_app/Utility/images_icon_path.dart';

class SearchScreenCtrl extends GetxController{
  final selectedIndex = 0.obs;
  var fmoImageList = [
    nfcSvg,
    barcodeSvg,
    handSvg,
  ];
  final selectedFMOPos = 0.obs;
}