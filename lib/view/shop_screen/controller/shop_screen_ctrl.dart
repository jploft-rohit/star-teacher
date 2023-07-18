import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/shop_category_list_response.dart';
import 'package:staff_app/backend/responses_model/shop_order_response.dart';
import 'package:staff_app/backend/responses_model/shop_product_response.dart';
import 'package:staff_app/backend/responses_model/single_order_detail_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class ShopScreenCtrl extends GetxController{
  RxInt primaryTabIndex = 0.obs;
  RxInt secondaryTabIndex = 0.obs;
  RxInt ordersTabIndex = 0.obs;
  RxInt dynamicTabIndex = 0.obs;
  RxBool isThisWeek = false.obs;
  RxBool isEveryWeek = true.obs;
  RxBool collecting = true.obs;
  RxBool deliver = false.obs;
  var selectedWeekDays = [];
  RxList<String> statusTime = ["","",""].obs;
  RxList<String> statusTitle = ["Order Placed", "Confirmed", "Served"].obs;
  Rx<SingleOrderProductData?>? singleOrderProductData = SingleOrderProductData().obs;
  RxList<SingleOrderProduct?>? singleOrderProductList = <SingleOrderProduct>[].obs;
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
  ///
  RxList<ShopProductData?>? list = <ShopProductData>[].obs;
  RxList<ShopCategoryListData?>? shopCategoryList = <ShopCategoryListData>[].obs;
  RxList<ShopOrderData?>? shopOrdersList = <ShopOrderData>[].obs;
  TextEditingController schoolController = TextEditingController();
  RxString selectedSchoolId = "".obs;
  RxString selectedTabBarId = "".obs;

  getData() async {
    list?.clear();
    await BaseAPI().get(url: ApiEndPoints().getShopProducts, queryParameters: {
      "school":selectedSchoolId.value,
      "shopType":secondaryTabIndex.value == 0 ? "STATIONARY" : secondaryTabIndex.value == 1 ? "STARS_STORE" : "CANTEEN",
      "category":selectedTabBarId.value,
    }).then((value){
      if (value?.statusCode ==  200) {
        list?.value = ShopProductsResponse.fromJson(value?.data).data ?? [];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  getShopCategoryListData() async {
    shopCategoryList?.clear();
    await BaseAPI().get(url: ApiEndPoints().getShopCategoryListData, queryParameters: {
      "shopType":secondaryTabIndex.value == 0 ? "STATIONARY" : secondaryTabIndex.value == 1 ? "STARS_STORE" : "CANTEEN",
    }).then((value){
      if (value?.statusCode ==  200) {
        shopCategoryList?.value = ShopCategoryListResponse.fromJson(value?.data).data ?? [];
        shopCategoryList?.insert(0, ShopCategoryListData(title: "All",sId:"",shopType:""));
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
    getData();
  }

  getShopOrders() {
    shopOrdersList?.clear();
    BaseAPI().get(url: ApiEndPoints().getShopOrdersData, queryParameters: {
      "multipleShopType":ordersTabIndex.value == 0 ? "STATIONARY,STARS_STORE" : "CANTEEN",
      "school":selectedSchoolId.value
    }).then((value){
      if (value?.statusCode ==  200) {
        shopOrdersList?.value = ShopOrderResponse.fromJson(value?.data).data ?? [];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  cancelOrder({required String id, required int index}) {
    BaseOverlays().dismissOverlay();
    BaseAPI().put(url: ApiEndPoints().cancelOrder+id).then((value) async {
      if (value?.statusCode ==  200) {
        shopOrdersList?.removeAt(index);
        BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: "Success");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  getSingleOrderDetail({required String id}) {
    singleOrderProductList?.clear();
    singleOrderProductData?.value = SingleOrderProductData();
    BaseAPI().get(url: ApiEndPoints().getSingleOrderDetail+id).then((value) async {
      if (value?.statusCode ==  200) {
        singleOrderProductData?.value = SingleOrderDetailResponse.fromJson(value?.data).data;
        singleOrderProductList?.value = SingleOrderDetailResponse.fromJson(value?.data).data?.products??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  addItemToCart({required String productId, required int quantity}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    var data = {
      "productId": productId,
      "userId": userId,
      "quantity":quantity
    };
    BaseAPI().post(url: ApiEndPoints().addItemToCart, data: data).then((value) async {
      if (value?.statusCode ==  200) {
        BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: "Success");

      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

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