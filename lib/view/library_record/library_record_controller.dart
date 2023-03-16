import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryRecordsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController libraryRecordsController;
  var selectedIndex = 0.obs;
  var isTypeA = true.obs;
  var isTypeB = false.obs;
  var isTypeC = false.obs;
  var isTypeD = false.obs;

  typeAselected() {
    isTypeA.value = true;
    isTypeB.value = false;
    isTypeC.value = false;
    isTypeD.value = false;
  }

  typeBselected() {
    isTypeA.value = false;
    isTypeB.value = true;
    isTypeC.value = false;
    isTypeD.value = false;
  }

  typeCselected() {
    isTypeA.value = false;
    isTypeB.value = false;
    isTypeC.value = true;
    isTypeD.value = false;
  }

  typeDselected() {
    isTypeA.value = false;
    isTypeB.value = false;
    isTypeC.value = false;
    isTypeD.value = true;
  }

  final List<String> reuesteddates = ['July 2,\n8:30PM', '', ''];
  final List<String> incustodydates = [
    'July 2,\n8:30PM',
    'July 2,\n9:30PM',
    ''
  ];
  final List<String> returndates = [
    'July 2,\n8:30PM',
    'July 2,\n9:30PM',
    'July 2,\n9:30PM'
  ];
  final List<String> reuestedheading = [
    'Request\nRaised',
    'Received',
    'Returned',
  ];
  LibraryRecordsController() {
    libraryRecordsController = TabController(vsync: this, length: 3);
  }
}
