import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/custom_models/custom_product_list_model.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/shop_category_list_response.dart';
import 'package:staff_app/backend/responses_model/shop_order_response.dart';
import 'package:staff_app/backend/responses_model/shop_product_response.dart';
import 'package:staff_app/backend/responses_model/single_order_detail_response.dart';
import 'package:staff_app/backend/responses_model/user_cart_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/shop_screen/controller/stripe_controller.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';

class ShopScreenCtrl extends GetxController{
  RxInt primaryTabIndex = 0.obs;
  RxInt secondaryTabIndex = 0.obs;
  RxInt ordersTabIndex = 0.obs;
  RxInt dynamicTabIndex = 0.obs;
  RxBool isThisWeek = true.obs;
  RxBool isEveryWeek = false.obs;
  RxBool collecting = true.obs;
  RxBool deliver = false.obs;
  RxBool isNormalSelected = true.obs;
  RxBool isPreOrderSelected = false.obs;
  RxInt selectedPaymentPos = 0.obs;
  var selectedWeekDays = [];
  RxString selectedShipping = "HOME_DELIVERY".obs;
  RxString selectedPreOrderType = "NORMAL".obs;
  RxString selectedPaymentMode = "".obs;
  RxString selectedServingTime = "".obs;
  Rx<UserCartData?>? userCartData = UserCartData().obs;
  RxList<CartProductsData?>? cartProductsList = <CartProductsData>[].obs;
  RxList<String> statusTime = ["","",""].obs;
  RxList<String> statusTitle = ["Order Placed", "Confirmed", "Served"].obs;
  Rx<SingleOrderProductData?>? singleOrderProductData = SingleOrderProductData().obs;
  RxList<SingleOrderProduct?>? singleOrderProductList = <SingleOrderProduct>[].obs;
  Rx<TextEditingController> servingTime = TextEditingController().obs;
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController deliveryTime = TextEditingController();
  TextEditingController servingPlace = TextEditingController();
  var weekList = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  var paymentImageList = [
    'assets/images/ic_wallet.svg',
    'assets/images/ic_master_card.svg',
    'assets/images/ic_cash.svg',
  ];

  var paymentTitleList = [

    'Wallet',
    'Visa/Mastercard',
    'Cash',
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
      "isAvailable":true,
    }).then((value){
      if (value?.statusCode ==  200) {
        list?.value = ShopProductsResponse.fromJson(value?.data).data ?? [];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  getUserCart({bool? callGetData}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    var data = {
      "type": secondaryTabIndex.value == 0 ? "STATIONARY" : secondaryTabIndex.value == 1 ? "STARS_STORE" : "CANTEEN",
    };
    await BaseAPI().get(url: ApiEndPoints().getUserCart+userId,queryParameters: data).then((value){
      if (value?.statusCode ==  200) {
        userCartData?.value = UserCartResponse.fromJson(value?.data).data;
        cartProductsList?.value = UserCartResponse.fromJson(value?.data).data?.items ?? [];
        if (callGetData??true) {
          getData();
        }
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
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
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
    getUserCart();
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
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  cancelOrder({required String id, required int index}) {
    BaseOverlays().dismissOverlay();
    BaseAPI().put(url: ApiEndPoints().cancelOrder+id).then((value) async {
      if (value?.statusCode ==  200) {
        // shopOrdersList?.removeAt(index);
        BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  removeCartItem({required String productId}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    await BaseAPI().deleteWithQueryParam(url: ApiEndPoints().removeCartItem,data: {"productId" : productId, "userId":userId}).then((value) async {
      if (value?.statusCode ==  200) {
        await getUserCart(callGetData: false);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  createOrder({required bool isFromCart}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    var data;
    if (selectedPaymentPos.value == 1) {
      data = {
        "cartId": userCartData?.value?.sId??"",
        "userId": userId,
        "shippingType": selectedShipping.value,
        "paymentMode": selectedPaymentPos.value ==  0 ? "WALLET" : selectedPaymentPos.value ==  1 ? "CARD" : "CASH",
        "orderType":selectedPreOrderType.value,
        "startDate":flipDate(date: fromDateController.text.trim()),
        "endDate":flipDate(date: toDateController.text.trim()),
        "deliveryBreakTime":selectedServingTime.value,
        "servingPlace":servingPlace.text.trim(),
        "deliveryTime":deliveryTime.text.trim(),
        "txnId": Get.find<StripeController>().paymentIntentId??"",
        "txnResponse": Get.find<StripeController>().pgData??"",
      };
    }else{
      if (fromDateController.text.isNotEmpty && toDateController.text.isNotEmpty) {
        data = {
          "cartId": userCartData?.value?.sId??"",
          "userId": userId,
          "shippingType": selectedShipping.value,
          "paymentMode": selectedPaymentPos.value ==  0 ? "WALLET" : selectedPaymentPos.value ==  1 ? "CARD" : "CASH",
          "orderType":selectedPreOrderType.value,
          "startDate":flipDate(date: fromDateController.text.trim()),
          "endDate":flipDate(date: toDateController.text.trim()),
          "deliveryBreakTime":selectedServingTime.value,
          "servingPlace":servingPlace.text.trim(),
          "deliveryTime":deliveryTime.text.trim(),
        };
      }else{
        data = {
          "cartId": userCartData?.value?.sId??"",
          "userId": userId,
          "shippingType": selectedShipping.value,
          "paymentMode": selectedPaymentPos.value ==  0 ? "WALLET" : selectedPaymentPos.value ==  1 ? "CARD" : "CASH",
          "orderType":selectedPreOrderType.value,
          "deliveryBreakTime":selectedServingTime.value,
          "servingPlace":servingPlace.text.trim(),
          "deliveryTime":deliveryTime.text.trim(),
        };
      }
    }
    await BaseAPI().post(url: ApiEndPoints().createOrder,
        data: data).then((value) async {
      if (value?.statusCode ==  200) {
        BaseOverlays().showOkDialog(title: "Order Successfully Placed!", onBtnPressed: (){
          BaseOverlays().dismissOverlay();
          if (isFromCart) {
            Get.back();
          }else{
            Get.back();
          }
        }, onClose: (){
          BaseOverlays().dismissOverlay();
          if (isFromCart) {
            Get.back();
          }else{
            Get.back();
          }
        });
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  updateOrder({required String id,List<ProductList?>? productList, bool? isFromCart}) async {
    var data = {
      "shippingType": userCartData?.value?.sId??"",
      "products": productList,
    };
    await BaseAPI().post(url: ApiEndPoints().createOrder,data: data).then((value) async {
      if (value?.statusCode ==  200) {
        BaseOverlays().showOkDialog(title: "Order Successfully Placed!",onBtnPressed: (){

        });
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
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
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  Future<bool> addItemToCart({required String productId, required int quantity, required int index}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    bool returnValue = false;
    var data = {
      "productId": productId,
      "userId": userId,
      "quantity":quantity
    };
    await BaseAPI().post(url: ApiEndPoints().addItemToCart, data: data).then((value) async {
      if (value?.statusCode ==  200) {
        BaseOverlays().showSnackBar(message: await BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
        await getUserCart(callGetData: false);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
    return returnValue;
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

  /// Pre-Order
  normalSelected() {
    isNormalSelected.value = true;
    isPreOrderSelected.value = false;
  }

  preOrderSelected() {
    isNormalSelected.value = false;
    isPreOrderSelected.value = true;
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