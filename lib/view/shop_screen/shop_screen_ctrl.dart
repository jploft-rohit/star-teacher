import 'package:get/get.dart';

class ShopScreenCtrl extends GetxController{
  final selectedIndex = 0.obs;
  final selectedIndex1 = 0.obs;
  var isThisWeek = false.obs;
  var isEveryWeek = true.obs;
  var collecting = true.obs;
  var deliver = false.obs;
  var selectedWeekDays = [];
  var weekList = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  final List<String> canteenThisWeekDates = [
    'July 2,\n8:30PM',
    ' July 3,\n10:30PM',
    ' July 4,\n9:30AM'
  ];
  final List<String> shopOrderDates = [
    'July 2,\n8:30PM',
    ' July 3,\n10:30PM',
    ''
  ];
  final List<String> shopOrderHeading = [
    'Order\nPlaced',
    'Ready for\nCollection',
    'Completed',
  ];
  final List<String> canteenThisWeekHeading = [
    'Order\nPlaced',
    'Confirmed',
    'Served',
  ];
  final List<String> canteenEveryWeekDates = [
    'July 2,\n8:30PM',
    ' July 3,\n10:30PM',
  ];
  final List<String> canteenEveryWeekDates2 = [
    'July 2,\n8:30PM',
    ' July 3,\n10:30PM',
    '',
    ''
  ];
  final List<String> canteenEveryWeekHeading = [
    'Order\nPlaced',
    'Inprosess',
  ];
  final List<String> canteenEveryWeekHeading2 = [
    'Order\nPlaced',
    'Order\nCancelled',
    'Refund\nRequest',
    'Refund\nApproved'
  ];
  var shopStationaryList = [
    {
      'image': 'assets/delete/pen_notebook.png',
      'name': 'Notebook',
      'price': '15 AED'
    },
    {
      'image': 'assets/delete/school_bag.png',
      'name': 'School Bag',
      'price': '50 AED'
    },
    {
      'image': 'assets/delete/pen.png',
      'name': 'Blue Pen',
      'price': '7 AED',
    },
    {
      'image': 'assets/delete/color_pencil.png',
      'name': 'Colored pencils',
      'price': '5 AED'
    },
  ];
  var shopStarShopList = [
    {
      'image': 'assets/images/Rectangle 429.png',
      'name': 'NFC Tags',
      'price': '5 AED',
    },
    {
      'image': 'assets/images/Rectangle 430.png',
      'name': 'NFC Card',
      'price': '15 AED',
    },
    {
      'image': 'assets/images/Rectangle 434.png',
      'name': 'NFC Wristband',
      'price': '10 AED',
    },
    {
      'image': 'assets/images/Rectangle 436.png',
      'name': 'NFC Card',
      'price': '15 AED',
    },
  ];
  var canteenShopList = [
    {
      'image': 'assets/images/image 20.png',
      'name': 'Cookies',
      'price': '1 AED',
    },
    {
      'image': 'assets/images/image 21.png',
      'name': 'Lunch',
      'price': '13 AED',
    },
    {
      'image': 'assets/images/image 19.png',
      'name': 'Mango Juice',
      'price': '4 AED',
    },
  ];

  thisWeekSelected() {
    isThisWeek.value = true;
    isEveryWeek.value = false;
  }

  everyWeekSelected() {
    isThisWeek.value = false;
    isEveryWeek.value = true;
  }

  collectingSelected() {
    collecting.value = true;
    deliver.value = false;
  }

  deliverSelected() {
    collecting.value = false;
    deliver.value = true;
  }

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