import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/shop_screen/controller/stripe_controller.dart';
import 'package:staff_app/view/wallet/sub_screens/cartd_detail_popup.dart';
import 'package:staff_app/view/wallet/wallet_controller.dart';

class TopupYourFamilyPopup extends StatefulWidget {
  const TopupYourFamilyPopup({Key? key}) : super(key: key);

  @override
  State<TopupYourFamilyPopup> createState() => _TopupYourFamilyPopupState();
}

class _TopupYourFamilyPopupState extends State<TopupYourFamilyPopup> {
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  TextEditingController amtCtrl = TextEditingController();
  StripeController stripeController = Get.put(StripeController());
  WalletController controller = Get.put(WalletController());
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    amtCtrl.text = '1000';
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Dialog(
          insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white
            ),
            child: GetBuilder<WalletController>(
              builder: (controller) {
                return Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: '${translate(context).top_up_your} ',
                              style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),
                              children: <TextSpan>[
                                TextSpan(text: translate(context).family_wallet, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 16.sp, height: 1.2)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(Icons.close, color: Colors.black,),)
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Form(
                        key: formKey,
                        child: CustomTextField(
                          controller: amtCtrl,
                          hintText: "0",
                          maxLength: 6,
                          onChanged: (val){
                            amtCtrl.selection = TextSelection.collapsed(offset: amtCtrl.text.length);
                            amtCtrl.selection = TextSelection.fromPosition(TextPosition(offset: amtCtrl.text.length));
                            Get.find<WalletController>().update();
                          },
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: isRTL ? 0 : 2.w, right: isRTL ? 2.w : 0, bottom: 1),
                            child: Text("AED ",style: TextStyle(fontSize: 11)),
                          ),
                          textInputFormatter: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                          textInputType: TextInputType.number,
                          borderColor: BaseColors.textBlackColor,
                          validator: (val){
                            if ((val??"").isEmpty) {
                              return "Please enter or select amount";
                            }
                            if ((int.parse((val??"").toString()) < 10)) {
                              return "Amount can't be less than AED 10";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 3.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 3),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              amtCtrl.text = controller.amount[index].toString();
                              amtCtrl.selection = TextSelection.collapsed(offset: amtCtrl.text.length);
                              amtCtrl.selection = TextSelection.fromPosition(TextPosition(offset: amtCtrl.text.length));
                              Get.find<WalletController>().update();
                            },
                            child: Container(
                              height: 3.h,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: BaseColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 0.3,
                                      color: BaseColors.primaryColor)),
                              child: addText("+AED ${Get.find<WalletController>().amount[index]}",
                                  14.sp,
                                  BaseColors.primaryColor,
                                  FontWeight.w700),
                            ),
                          ),
                          itemCount: Get.find<WalletController>().amount.length,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                        child: BaseButton(
                          title: "${translate(context).top_up.toUpperCase()} ${amtCtrl.text.trim()}",
                          btnWidth: 50.w,
                          textSize: 15.sp,
                          borderRadius: 20,
                          onPressed: (){
                            if (formKey.currentState?.validate()??false) {
                              controller.selectedAmount.value = int.parse(amtCtrl.text.trim());
                              stripeController.makePayment(controller.selectedAmount.value.toString()).then((value) {
                                if (value) {
                                  controller.addWalletMoney();
                                }
                              });
                              // Get.back();

                            }
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
      ),
    );
  }
}
