import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreenCtrl extends GetxController{
  @override
  void onInit() {

    super.onInit();
  }
  final currentIndex = 2.obs;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
}