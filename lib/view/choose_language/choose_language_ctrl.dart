import 'package:get/get.dart';
import 'package:staff_app/Utility/images_icon_path.dart';

class ChooseLanguageScreenCtrl extends GetxController{
  final languageList = ['Arabic', 'English'].obs;
  var languageImageList = [arabicFlagSvg, "assets/images/usa_flag.svg"];
  final selectedPos = 1.obs;
}