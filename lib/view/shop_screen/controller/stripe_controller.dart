// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:staff_app/backend/api_end_points.dart';
// import 'package:staff_app/backend/base_api.dart';
// import 'package:staff_app/backend/responses_model/base_success_response.dart';
// import 'package:staff_app/language_classes/language_constants.dart';
// import 'package:staff_app/utility/base_utility.dart';
// import 'package:staff_app/utility/base_views/base_overlays.dart';
//
// class StripeController extends GetxController{
//   // var clientkey = "sk_test_5103erp2Y5xYsh7PXGr8h1vKRzJDD9gYMQKz29TpMGur1jXMnzYgfWafS1qwdIGlR67BxZefLDJV4g5xxvFjx8g3L00i7whhAGp";//// test yash sir
//   // var clientkey = "sk_live_MuOKr652Quftctg9OnjtVAie";//// live yash sir
//   String ? paymentIntentId;
//   Map<String,dynamic> ?pgData;
//   String  clientkey="sk_test_51NLl4oBJG0qcZ8qIe4Ts2wCV86jaqreoJv8Bsg4HpahrS1d33gdDj1Xdab9lBh6LmOr6jwR4DNnkkqTh1O8gVwea00HWjCM5Vx";
//   Map<String, dynamic>? paymentIntent;
//   Future<bool> makePayment(String amountPay) async {
//     bool mainResult=false;
//     try {
//       String payAbleAmount;
//       try {
//         double amount =double.parse(amountPay);
//         int myInt=amount.toInt()*100;
//         if(myInt<=100){
//           baseToast(message: "Amount should be greater then 1");
//           return false;
//         }
//         payAbleAmount=myInt.toString();
//       } catch (e) {
//         baseToast(message: "Invalid Amount");
//         return false;
//       }
//       paymentIntent = await createPaymentIntent(payAbleAmount,'AED');
//       var gPay = const PaymentSheetGooglePay(merchantCountryCode: "AE", currencyCode: "AED", testEnv: true);
//       var aPay = const PaymentSheetApplePay( merchantCountryCode: "AE");
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//             paymentIntentClientSecret: paymentIntent!['client_secret'],
//             googlePay: gPay,
//            // applePay: aPay,
//             style: ThemeMode.light,
//             merchantDisplayName: 'Charles',
//             customFlow: false,
//         ),
//       ).then((value) {
//         print("value of sheet opening$value");
//       });
//      bool result= await displayPaymentSheet();
//       print("result after sheetOpen$result");
//       mainResult= result;
//     } catch (e, s) {
//       String ss = "exception 1 :$e";
//       String s2 = "reason :$s";
//       mainResult=false;
//     }
//     print("reaching here result");
//     return mainResult;
//   }
//
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': amount,
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };
//       // TODO: POST request to stripe
//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         headers: {
//           'Authorization': 'Bearer $clientkey',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         },
//         body: body,
//       );
//       log('Payment Intent Body->>> ${response.body.toString()}');
//       var data = jsonDecode(response.body);
//       paymentIntentId = data['id'].toString();
//       return jsonDecode(response.body);
//     } catch (err) {
//       baseToast(message:"Something went wrong!!!");
//       log('err charging user: ${err.toString()}');
//     }
//   }
//
//  Future <bool> displayPaymentSheet() async {
//    bool result=false;
//     try {
//       await Stripe.instance.presentPaymentSheet().then((value) async{
//         // showDialog(
//         //   context:Get.context!,
//         //   builder: (_) => const AlertDialog(
//         //     content: Column(
//         //       mainAxisSize: MainAxisSize.min,
//         //       children: [
//         //         Row(
//         //           children: [
//         //             Padding(
//         //               padding: EdgeInsets.symmetric(horizontal: 10),
//         //               child: Icon(
//         //                 Icons.check_circle,
//         //                 color: Colors.green,
//         //               ),
//         //             ),
//         //             Text("Payment Successfully"),
//         //           ],
//         //         ),
//         //       ],
//         //     ),
//         //   ),
//         // );
//        bool result1= await checkPaymentStatus();
//         print("result after check--$result1");
//         paymentIntent = null;
//         result=result1;
//       }).onError((error, stackTrace) {
//         String ss = "exception 2 :$error";
//         String s2 = "reason :$stackTrace";
//         print("On Error >>>>>>$ss---$s2");
//         result= false;
//       });
//     } on StripeException catch (e) {
//       print('StripeException Error is:---> $e');
//       result= false;
//     } catch (e) {
//       print('Catch Error is:---> $e');
//       result= false;
//     }
//     print("returning from here");
//     return result;
//   }
//
//  Future <bool> checkPaymentStatus()async {
//     bool result=false;
//       try{
//         if(paymentIntentId!=null) {
//           BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
//           await BaseAPI().get(url: ApiEndPoints().checkStripeStatus + (paymentIntentId??""),
//               showLoader: false).then((value) async {print("value---$value");
//             if (value?.statusCode == 200) {
//               baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
//               pgData = baseSuccessResponse.data;
//               result= true;
//             } else {
//               BaseOverlays().showSnackBar(
//                   message: translate(Get.context!).something_went_wrong,
//                   title:"Error",
//               );
//               result = false;
//             }
//           });
//         }else{
//           result= false;
//         }
//       } catch(e) {
//         print("error>>>>>>>$e");
//         result= false;
//       }
//       return result;
//     }
// }