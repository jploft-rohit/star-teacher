import 'package:get/get.dart';

class RatingScreenCtrl extends GetxController {
  final totalRating = 4.0.obs;
  final isChecked = true.obs;

  final List<String> busItems = [
    '29789',
    '29490',
    '29093',
    '08834',
    '098389',
  ];

  final selectedbus = '29789'.obs;
}
