import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/transactions_history_response.dart';
import 'package:staff_app/backend/responses_model/wallet_balance_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/shop_screen/controller/stripe_controller.dart';

import '../../utility/sizes.dart';

class WalletController extends GetxController {

  TextEditingController titleController = TextEditingController();
  var amount = [10, 20, 30, 40, 50];
  RxInt selectedAmount = 0.obs;
  RxInt selectedTabIndex = 0.obs;
  var selectedPaymentIndex = 0.obs;
  RxString fromDate = "".obs;
  RxString toDate = "".obs;
  Rx<WalletBalanceData?>? walletBalanceData = WalletBalanceData().obs;
  RxList<TransactionHistoryData?>? list = <TransactionHistoryData>[].obs;
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    getHistory();
    getWalletData();
  }

  var actionRequiredEventsList = [
    {
      'day': '10',
      'month': 'May',
      'totalcost': '55 AED',
      'title': 'Picnic',
      'eventcost': '30 AED',
      'starbudget': '25 AED',
    },
    {
      'day': '24',
      'month': 'May',
      'totalcost': '55 AED',
      'title': 'Honorary Ceremony',
      'eventcost': '30 AED',
      'starbudget': '25 AED',
    },
    {
      'day': '9',
      'month': 'May',
      'totalcost': '55 AED',
      'title': 'PTA',
      'eventcost': '30 AED',
      'starbudget': '25 AED',
    },
  ];

  var eventsList = [
    {
      'day': '10',
      'month': 'July',
      'totalcost': '55 AED',
      'title': 'Peal Jam',
      'eventcost': '30 AED',
      'starbudget': '25 AED',
      'status': 'Accepted',
      'event': 'Upcoming',
    },
    {
      'day': '9',
      'month': 'June',
      'totalcost': '55 AED',
      'title': 'Peal Jam',
      'eventcost': '30 AED',
      'starbudget': '25 AED',
      'status': 'Rejected',
      'event': 'Upcoming',
    },
    {
      'day': '9',
      'month': 'June',
      'totalcost': '55 AED',
      'title': 'Peal Jam',
      'eventcost': '30 AED',
      'starbudget': '25 AED',
      'status': 'Rejected',
      'event': 'Concluded',
    },
  ];

  addWalletMoney() async {
      final String userId = await BaseSharedPreference().getString(SpKeys().userId);
      var data = {
        "user": userId,
        "wallet": "6464dbb5c129601ee8c610ed",
        "txnId": Get.find<StripeController>().paymentIntentId??"",
        "txnResponse": Get.find<StripeController>().pgData??"",
        "txnFor": "TOPUP", // purchase , fee
        "txnType": "TOPUP", // transaction , topup
        "txnMethod": "ONLINE", // online
        "txnAmount": selectedAmount.value,
        "description":"Top Up",
        "paymentType": "Received",
        "title": "Top Up",
        "txnStatus": "SUCCESS",
        "txnDueDate":await DateTime.now().toString(),
        "paymentSlot": "payment slot"
      };
        BaseAPI().post(url: ApiEndPoints().addWalletMoney,data: data).then((value){
          if (value?.statusCode ==  200) {
            BaseOverlays().dismissOverlay();
            BaseOverlays().showOkDialog(
                title: translate(Get.context!).wallet_amount_has_been_credited_successful,
                barrierDismissible: false,
                onClose: (){
                  BaseOverlays().dismissOverlay();
                  getWalletData();
                  getHistory();
                },
                onBtnPressed: (){
                  BaseOverlays().dismissOverlay();
                  getWalletData();
                  getHistory();
                });
          }else{
            BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
          }
         },
     );
  }

  getWalletData() async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    BaseAPI().get(url: ApiEndPoints().getWalletData+userId).then((value){
      if (value?.statusCode ==  200) {
        walletBalanceData?.value = WalletBalanceResponse.fromJson(value?.data).data;
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    },
    );
  }

  getHistory({String? refreshType}) async {
    // list?.clear();
    if (refreshType == 'refresh' || refreshType == null) {
      list?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    BaseAPI().get(url: ApiEndPoints().getTransactionHistory+userId,queryParameters: {
      "from":fromDate.value,
      "to":toDate.value,
      "txnType":selectedTabIndex.value == 0 ? "TRANSACTION" : "TOPUP",
      "limit":apiItemLimit,
      "page":page.value.toString()
    },showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        // list?.value = TransactionsHistoryResponse.fromJson(value?.data).data??[];
        if(refreshType == 'refresh'){
          list?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((TransactionsHistoryResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        list?.addAll(TransactionsHistoryResponse.fromJson(value?.data).data??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    },
    );
  }
}
