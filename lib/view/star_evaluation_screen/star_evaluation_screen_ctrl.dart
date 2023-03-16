import 'package:get/get.dart';
import 'package:staff_app/Utility/images_icon_path.dart';

class StarEvaluationScreenCtrl extends GetxController{
  final isChecked = false.obs;

  RxList<Map<String, dynamic>> list = <Map<String, dynamic>>[
    {
      "count":1.obs,
      "isSelected":false.obs,
    },
    {
      "count":1.obs,
      "isSelected":false.obs,
    },
    {
      "count":1.obs,
      "isSelected":false.obs,
    },
  ].obs;
  List<Map<String, dynamic>> ratingList = <Map<String, dynamic>>[
    {
      "rating":2,
      "img":earSvg,
      "title":"Listening",
    },
    {
      "rating":2,
      "img":teethSvg,
      "title":"Brush teeth",
    },
    {
      "rating":3,
      "img":schoolBagSvg,
      "title":"Ready for sch..",
    },
    {
      "rating":2,
      "img":booksSvg,
      "title":"Reading",
    },
    {
      "rating":3,
      "img":bedSvg,
      "title":"Ready for bed",
    },
    {
      "rating":2,
      "img":bedSvg1,
      "title":"Out of bed",
    },
    {
      "rating":3,
      "img":handSvg1,
      "title":"Helping",
    },
    {
      "rating":2,
      "img":numberBlocksSvg,
      "title":"Learning time",
    },
    {
      "rating":2,
      "img":parkSvg,
      "title":"Outside time",
    },
  ];

  final selectedIndex = 0.obs;
}