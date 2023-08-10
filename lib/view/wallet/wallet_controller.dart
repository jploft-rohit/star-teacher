import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/transactions_history_response.dart';
import 'package:staff_app/backend/responses_model/wallet_balance_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/shop_screen/controller/stripe_controller.dart';

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

  @override
  void onInit() {
    super.onInit();
    getHistory();
    getWalletData();
  }

  var purchasesList = [
    {
      'image': 'assets/images/image 20.png',
      'item': 'Cookies',
      'amount': '2 AED',
      'starname': 'Zoya ',
      'time': '09:00:30pm',
      'date': '20/10/2022',
    },
    {
      'image': 'assets/images/image 21.png',
      'item': 'Lunch',
      'amount': '13 AED',
      'starname': 'Sania',
      'time': '09:00:30pm',
      'date': '20/10/2022',
    },
    {
      'image': 'assets/images/image 19.png',
      'item': 'Mango Juice',
      'amount': '4 AED',
      'starname': 'Zoya',
      'time': '09:00:30pm',
      'date': '20/10/2022',
    },
  ];

  var feesList = [
    {
      'id': '89786',
      'term': 'Academic Fees Term 1',
      'starname': 'Thurayya Suheil',
      'duedate': '10 May',
      'status': 'Pending',
      'amount': '1000 AED',
    },
    {
      'id': '89786',
      'term': 'Academic Fees Term 2',
      'starname': 'Najma Suheil',
      'duedate': '10 May',
      'status': 'Due',
      'amount': '1000 AED',
    },
    {
      'id': '89786',
      'term': 'Academic Fees Term 3',
      'starname': 'Thurayya Suheil',
      'duedate': '10 May',
      'status': 'Paid',
      'amount': '1000 AED',
    },
  ];

  var paymentMethodList2 = [
    {'title': 'Registration', 'body': 'Registration: ', 'amount': '500 AED'},
    {
      'title': 'Transportation Registration',
      'body': 'Transportation Registration: ',
      'amount': '500 AED'
    },
    {
      'title': 'Pay Full Year Fees',
      'body': 'Term 1 Fees: ',
      'amount': '1000 AED'
    },
    {'title': 'Pay Term', 'body': 'Full Year Fees: ', 'amount': '5000 AED'},
    {'title': 'Pay Monthly', 'body': 'Monthly Fees: ', 'amount': '1200 AED'},
    {'title': 'Pay at School', 'body': '', 'amount': ''},
  ];

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

  getHistory() async {
    list?.clear();
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    BaseAPI().get(url: ApiEndPoints().getTransactionHistory+userId,queryParameters: {"from":fromDate.value,"to":toDate.value,"txnType":selectedTabIndex.value == 0 ? "TRANSACTION" : "TOPUP", "limit":100}).then((value){
      if (value?.statusCode ==  200) {
        list?.value = TransactionsHistoryResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    },
    );
  }
}
