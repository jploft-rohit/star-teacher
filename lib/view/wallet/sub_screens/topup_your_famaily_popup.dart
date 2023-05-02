import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/wallet/sub_screens/cartd_detail_popup.dart';
import 'package:staff_app/view/wallet/wallet_controller.dart';

class TopupYourFamilyPopup extends StatefulWidget {
  const TopupYourFamilyPopup({Key? key}) : super(key: key);

  @override
  State<TopupYourFamilyPopup> createState() => _TopupYourFamilyPopupState();
}

class _TopupYourFamilyPopupState extends State<TopupYourFamilyPopup> {
  TextEditingController amtCtrl = TextEditingController();
  WalletController controller = Get.put(WalletController());
  @override
  Widget build(BuildContext context) {
    amtCtrl.text = 'AED 1000';
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
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextField(
                        controller: amtCtrl,
                        hintText: "AED 20",
                        borderColor: BaseColors.textBlackColor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 3.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              amtCtrl.text = "AED "+controller.amount[index].toString();
                              amtCtrl.selection = TextSelection.fromPosition(TextPosition(offset: (controller.amount[index].toString() +" AED").length));
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
                            Get.back();
                            showGeneralDialog(
                              context: context,
                              pageBuilder:  (context, animation, secondaryAnimation) {
                                return CardDetailPopup();
                              },
                            );
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
