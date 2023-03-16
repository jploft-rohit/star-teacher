import 'package:get/get.dart';

class ChatScreenCtrl extends GetxController{
  final selectedIndex = 0.obs;
  final selectedIndex1 = 0.obs;
  final selectedIndex2 = 0.obs;

  RxList<Map<String, dynamic>> chatList = <Map<String, dynamic>>[
    {
      "msg":"Hi",
      "type":"1",
      "date":"3:30 PM"
    },
    {
      "msg":"Hello",
      "type":"0",
      "date":"5:30 PM"
    },
  ].obs;
}