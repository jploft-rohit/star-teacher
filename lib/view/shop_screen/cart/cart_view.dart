import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/shop_screen/cart/cart_card_detail.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';
import 'package:staff_app/view/shop_screen/controller/stripe_controller.dart';

class CartView extends StatefulWidget {
  final bool? isStationery, isStarsStore, isUpdating, isFromCardsTags;
  final String? id;
  const CartView({super.key, this.isStationery, this.isStarsStore, this.isUpdating, this.id, this.isFromCardsTags});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();
  StripeController stripeController = Get.put(StripeController());
  @override
  void initState() {
    super.initState();
    controller.getUserCart(callGetData: false, isFromCart: true);
    controller.selectedPaymentPos.value = 0;
    controller.servingPlace.text = "";
    controller.servingTime.value.text = "";
    controller.servingPlace.text = "";
    controller.fromDateController.text = "";
    controller.toDateController.text = "";
    controller.isHomeDelivery.value = true;
    controller.isSchoolDelivery.value = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.white,
      appBar: const BaseAppBar(title: "Cart"),
      body: Obx(()=>Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addText('Items', 15.sp, BaseColors.textBlackColor, FontWeight.w400),
                    BaseButton(
                        btnType: smallButton,
                        title: "Add item",
                        onPressed: () {
                          Get.back();
                        })
                  ],
                ),
                SizedBox(height: 2.h),
                (controller.cartProductsList?.length??0) == 0
                    ? const BaseNoData(message: "No Products Added")
                    : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: controller.cartProductsList?.length??0,
                  itemBuilder: (context, index) {
                    return buildCartCard(controller.cartProductsList?[index]?.images?[0]??"", controller.cartProductsList?[index]?.name??"", ("${controller.cartProductsList?[index]?.price?.toString()??""} AED"), controller.cartProductsList?[index]?.quantity,index);
                  },
                ),
                Visibility(
                    visible: widget.isFromCardsTags??false,
                    child: SizedBox(height:2.h)),
                Visibility(
                  visible: widget.isFromCardsTags??false,
                  child: BaseTextFormField(
                    bottomMargin: 0,
                    topMargin: 0,
                    controller: controller.reasonController,
                    hintText: "Reason",
                  ),
                ),
                SizedBox(height:2.h),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: BaseColors.borderColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: addText(
                            'Select shipping',
                            radioButtonTitleTs,
                            BaseColors.textBlackColor,
                            FontWeight.w400),
                      ),
                      SizedBox(height:1.h),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          radioButton(() {
                            controller.selectedShipping.value = "HOME_DELIVERY";
                            controller.homeDelivertSelected();

                          }, controller.isHomeDelivery.value, 'Home delivery'),
                          SizedBox(width: 2.h),
                          radioButton(() {
                            controller.selectedShipping.value = "SCHOOL_PICKUP";
                            controller.schoolDelivertSelected();
                          }, controller.isSchoolDelivery.value,
                              'Pick-up from school'),
                        ],
                      ),
                      SizedBox(height:1.h),
                    ],
                  ),
                ),
                SizedBox(height:2.h),
                detailRow('Sub Total', "${controller.userCartData?.value?.totalAmount?.toString()??""} AED"),
                SizedBox(height:1.h),
                detailRow('Taxes (${controller.userCartData?.value?.tax?.toString()??""}%)', "${controller.userCartData?.value?.taxAmount?.toString()??""} AED"),
                Visibility(
                    visible: controller.isHomeDelivery.value,
                    child: SizedBox(height:1.h)),
                Visibility(
                    visible: controller.isHomeDelivery.value,
                    child: detailRow('Shipping Charges', "${controller.userCartData?.value?.shippingCharges?.toString()??""} AED")),
                SizedBox(height:1.h),
                detailRow('Grand Total', '${(controller.userCartData?.value?.grandTotal?.toString()??"")} AED'),
                SizedBox(height:3.h),
                Center(
                  child: SizedBox(
                    height: 13.h,
                    child: ListView.builder(
                      itemCount: controller.paymentImageList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            controller.selectedPaymentPos.value = index;
                          },
                          child: Obx(
                                () => Container(
                              width: Get.width/3.64,
                              margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2),
                              decoration: BoxDecoration(
                                  color: controller.selectedPaymentPos.value == index
                                      ? BaseColors.primaryColorLight
                                      : BaseColors.white,
                                  boxShadow: [getBoxShadow()],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [getDeepBoxShadow()],
                                          color: controller.selectedPaymentPos.value == index
                                              ? BaseColors.primaryColor
                                              : BaseColors.greyColor),
                                      child: const Icon(
                                        Icons.check,
                                        color: BaseColors.white,
                                        size: 14,
                                      ),
                                    ),
                                  ),

                                  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          child: SvgPicture.asset(
                                            controller.paymentImageList[index],
                                            // color: controller.selectedPaymentPos.value == index ? BaseColors.primaryColor : BaseColors.black,
                                            color: BaseColors.primaryColor,
                                            height: 24,
                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        addText(controller.paymentTitleList[index], 12, BaseColors.black, FontWeight.normal)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height:3.h),
                // Center(
                //   child: BaseButton(title: (widget.isUpdating??false) ? "Update Order" : "Proceed To Pay", onPressed: (){
                //     if ((controller.cartProductsList?.length??0) != 0) {
                //       // showGeneralDialog(
                //       //   context: context,
                //       //   pageBuilder:  (context, animation, secondaryAnimation) {
                //       //     return CartCardDetail(isUpdating: widget.isUpdating??false, isFromCart: true);
                //       //   },
                //       // );
                //       stripeController.makePayment((controller.userCartData?.value?.grandTotal?.toString()??""));
                //     }else{
                //       baseToast(message: "No Product Found In Cart");
                //     }
                //   },btnType: largeButton),
                // ),


                Center(
                    child: BaseButton(title: "CHECKOUT", onPressed: (){
                      if ((controller.cartProductsList?.length??0) != 0) {
                          BaseOverlays().showConfirmationDialog(title: "Are you sure you want to purchase this order?",
                              onRightButtonPressed: (){
                                BaseOverlays().dismissOverlay();
                                if (controller.selectedPaymentPos.value == 1) {
                                  // showGeneralDialog(
                                  //   context: context,
                                  //   pageBuilder:  (context, animation, secondaryAnimation) {
                                  //     return const CartCardDetail(isFromCart: false,);
                                  //   },
                                  // );
                                  stripeController.makePayment((controller.userCartData?.value?.grandTotal?.toString()??"")).then((value) {
                                    if (value) {
                                      controller.createOrder(isFromCart: false);
                                    }else{

                                    }
                                  },
                                  );
                                }else{
                                  // BaseOverlays().dismissOverlay();
                                  controller.createOrder(isFromCart: false);
                                }
                              },
                          );
                      }else{
                        baseToast(message: "No Product Found In Cart");
                      }
                    },btnType: largeButton)
                ),
                SizedBox(height:3.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCartCard(image, name, price, quantity,index) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: BaseColors.white,
          boxShadow: kElevationToShadow[2],
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: BaseColors.txtFiledBorderColor)
              ),
              // width: double.infinity,
              height: 10.h,
              width: 10.h,
              child: BaseImageNetwork(
                link: image,
                concatBaseUrl: true,
                borderRadius: 20,
              )),
          SizedBox(width: 2.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText(name, 16.sp, BaseColors.textBlackColor,
                    FontWeight.w400),
                SizedBox(height:0.5.h),
                addText(price, 14.sp,
                    BaseColors.primaryColor, FontWeight.w700),
                SizedBox(height:1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      width: 70,
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F4E9),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xffC19444))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: int.parse((controller.cartProductsList?[index]?.quantity??0).toString()) > 0,
                            child: GestureDetector(onTap: (){
                              if (int.parse((controller.cartProductsList?[index]?.quantity??0).toString()) > 1) {
                                controller.addItemToCart(productId: controller.cartProductsList?[index]?.product??"", quantity: -1, index: index).then((value){
                                  setState(() {});
                                });
                              }else{
                                if ((int.parse((controller.cartProductsList?[index]?.quantity??0).toString())) > 0) {
                                  controller.removeCartItem(productId: controller.cartProductsList?[index]?.product??"").then((value){
                                    setState(() {});
                                  });
                                }
                              }
                            },child: const Icon(Icons.remove,size: 18,color: BaseColors.primaryColor)),
                          ),
                          GestureDetector(onTap: () async {
                            if((int.parse((controller.cartProductsList?[index]?.quantity??0).toString())) == 0){
                              await controller.addItemToCart(productId: controller.cartProductsList?[index]?.product??"", quantity: 1, index: index).then((value){
                                setState(() {});
                              });
                            }
                          },child: Text(int.parse((controller.cartProductsList?[index]?.quantity??0).toString()) == 0 ? "+ Add" : (controller.cartProductsList?[index]?.quantity??0).toString(),style: const TextStyle(color: BaseColors.primaryColor,fontWeight: FontWeight.bold))),
                          Visibility(
                            visible: int.parse((controller.cartProductsList?[index]?.quantity??0).toString()) > 0,
                            child: GestureDetector(onTap: () async {
                              await controller.addItemToCart(productId: controller.cartProductsList?[index]?.product??"", quantity: 1, index: index).then((value){
                                setState(() {});
                              });
                            },
                              child: const Icon(Icons.add, size: 18,color: BaseColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                      child: const VerticalDivider(
                        color: BaseColors.borderColor,
                        thickness: 1.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        BaseOverlays().showConfirmationDialog(
                          title: "Are you sure, you want to remove this item?",
                          onRightButtonPressed: (){
                            BaseOverlays().dismissOverlay();
                            controller.removeCartItem(productId: controller.userCartData?.value?.items?[index].product??"").then((value){
                              setState(() {});
                            });
                          }
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/delete 4.svg",
                            color: BaseColors.textRedColor,
                            height: 2.h,
                          ),
                          SizedBox(width: 1.h),
                          addText('Remove', 14.sp,
                              BaseColors.textRedColor, FontWeight.w400)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 2.h),
        ],
      ),
    );
  }

  // int ? addedItems(ShopProductData? data){
  //   for (var d in controller.cartProductsList??[]) {
  //     if (d.product == (data?.sId??"")) {
  //       return d.quantity;
  //     }
  //   }
  //   return 0;
  // }

  Widget detailRow(title, body) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        addText(title, 15.sp, BaseColors.textBlackColor,
            FontWeight.w400),
        addText(body, 15.sp, BaseColors.primaryColor,
            FontWeight.w700),
      ],
    );
  }
}
