import 'package:get/get.dart';

class CardTagCtrl extends GetxController{
  var shopStarShopList = [
    {
      'image': 'assets/delete/Rectangle 429.png',
      'name': 'NFC Tags',
      'price': '5 AED',
    },
    {
      'image': 'assets/delete/Rectangle 430.png',
      'name': 'NFC Card',
      'price': '15 AED',
    },
    {
      'image': 'assets/delete/Rectangle 434.png',
      'name': 'NFC Wristband',
      'price': '10 AED',
    },
    {
      'image': 'assets/delete/Rectangle 436.png',
      'name': 'NFC Card',
      'price': '15 AED',
    },
  ];
  var isHomeDelivery = true.obs;
  var isSchoolDelivery = false.obs;
  schoolDelivertSelected() {
    isHomeDelivery.value = false;
    isSchoolDelivery.value = true;
  }
  homeDelivertSelected() {
    isHomeDelivery.value = true;
    isSchoolDelivery.value = false;
  }
}