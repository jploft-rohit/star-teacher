import 'package:get/get.dart';

class NotebookScreenCtrl extends GetxController{
  final selectedIndex = 0.obs;
  final selectedIndex1 = 0.obs;
  final selectedIndex3 = 0.obs;
  final selectedColor = 0.obs;
  final isChecked = false.obs;

  List<String> colorList = [
    "FFE7E9",
    "FFF7AA",
    "037D00",
    "EDB494",
    "FFD081",
    "E1C4EB",
    "B5E3B9",
    "CECECE",
  ];
}