import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  TextEditingController titleController = TextEditingController();

  var isPurachses = true.obs;
  var isEvents = false.obs;
  var amount = [10, 20, 30, 40, 50];
  var selectedAmount = 1000.obs;
  var walletBalance = 213.obs;
  var isTransaction = true.obs;
  var isTopUpRecord = false.obs;
  var selectedPaymentIndex = 0.obs;

  purchasesSelected() {
    isPurachses.value = true;
    isEvents.value = false;
  }

  eventsSelected() {
    isEvents.value = true;
    isPurachses.value = false;
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
}
