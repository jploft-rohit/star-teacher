import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';
import 'package:staff_app/view/shop_screen/controller/stripe_controller.dart';

import '../../../utility/dummy_lists.dart';
import '../../../utility/images_icon_path.dart';

class TrayView extends StatefulWidget {
  const TrayView({super.key});

  @override
  State<TrayView> createState() => _TrayViewState();
}

class _TrayViewState extends State<TrayView> {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();
  StripeController stripeController = Get.put(StripeController());
  final formKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    controller.selectedWeekDays = RxList.filled(controller.weekList.length, false);
    super.initState();
    controller.servingPlace.text = "";
    controller.servingTime.value.text = "";
    controller.servingPlace.text = "";
    controller.fromDateController.text = "";
    controller.toDateController.text = "";
    controller.getUserCart(callGetData: false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(title: "Tray"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(()=>Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addText('First Break Items', 16.sp,
                          BaseColors.textBlackColor, FontWeight.w700),
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
                      ? BaseNoData(message: "No Products Added")
                      : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.cartProductsList?.length??0,
                    itemBuilder: (context, index) {
                      return buildCartCard(controller.cartProductsList?[index]?.images?[0]??"", controller.cartProductsList?[index]?.name??"", ((controller.cartProductsList?[index]?.price?.toString()??"")+" AED"), controller.cartProductsList?[index]?.quantity,index);
                    },
                  ),
                  SizedBox(height: 2.h),
                  detailRow('Sub Total', (controller.userCartData?.value?.totalAmount?.toString()??"")+" AED"),
                  SizedBox(height: 1.h),
                  detailRow('Taxes (${controller.userCartData?.value?.tax?.toString()??""}%)', (controller.userCartData?.value?.taxAmount?.toString()??"")+" AED"),
                  SizedBox(height: 1.h),
                  detailRow('Grand Total', '${(controller.userCartData?.value?.grandTotal?.toString()??"")} AED'),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addText('Order Type', 16.sp, BaseColors.textBlackColor, FontWeight.w700),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          radioButton(() {
                            controller.selectedPreOrderType.value = "NORMAL";
                            controller.normalSelected();
                          }, controller.isNormalSelected.value, 'Normal'),
                          SizedBox(width: 2.h),
                          radioButton(() {
                            controller.selectedPreOrderType.value = "PRE-ORDER";
                            controller.preOrderSelected();
                          }, controller.isPreOrderSelected.value, 'Pre-Order')
                        ],
                      )
                    ],
                  ),
                  Visibility(
                      visible: controller.isPreOrderSelected.value,
                      child: SizedBox(height: 2.h)),
                  Visibility(
                    visible: controller.isPreOrderSelected.value,
                    child: BaseTextFormField(
                      controller: controller.fromDateController,
                      title: "From Date",
                      suffixIcon: calenderDateSvg,
                      hintText: "Select Date",
                      validator: (val){
                        if (controller.fromDateController.text.isEmpty) {
                          return "Please Select From Date";
                        }
                        return null;
                      },
                      onTap: (){
                        showDatePicker(
                            context: context,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: BaseColors.primaryColor,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                            initialDate: controller.fromDateController.text.isEmpty ? DateTime.now() : DateTime.parse(flipDate(date: controller.fromDateController.text.trim())),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year+1)
                        ).then((value){
                          if (value != null) {
                            if (controller.toDateController.text.trim().isNotEmpty) {
                              DateTime endDate = DateTime.parse(flipDate(date: controller.toDateController.text.trim()));
                              if (endDate.isAfter(value)) {
                                controller.fromDateController.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                              }else{
                                baseToast(message: "\"From Date\" can't be more than \"To Date\"");
                              }
                            }else{
                              controller.fromDateController.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                            }
                          }
                        });
                      },
                    ),
                  ),
                  Visibility(
                    visible: controller.isPreOrderSelected.value,
                    child: BaseTextFormField(
                      controller: controller.toDateController,
                      title: "To Date",
                      suffixIcon: calenderDateSvg,
                      hintText: "Select Date",
                      validator: (val){
                        if (controller.toDateController.text.isEmpty) {
                          return "Please Select To Date";
                        }
                        return null;
                      },
                      onTap: (){
                        showDatePicker(
                            context: context,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: BaseColors.primaryColor,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                            initialDate: controller.toDateController.text.isEmpty ? DateTime.now() : DateTime.parse(flipDate(date: controller.toDateController.text.trim())),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year+1)
                        ).then((value){
                          if (value != null) {
                            if (controller.fromDateController.text.trim().isNotEmpty) {
                              DateTime startDate = DateTime.parse(flipDate(date: controller.fromDateController.text.trim()));
                              if (startDate.isBefore(value)) {
                                controller.toDateController.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                              }else{
                                baseToast(message: "\"To Date\" can't be less than \"From Date\"");
                              }
                            }else{
                              controller.toDateController.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                            }
                          }
                        },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addText('Shipping Type', 16.sp, BaseColors.textBlackColor, FontWeight.w700),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          radioButton(() {
                            controller.selectedShipping.value = "HOME_DELIVERY";
                            controller.thisWeekSelected();
                          }, controller.isThisWeek.value, 'Deliver'),
                          SizedBox(width: 2.h),
                          radioButton(() {
                            controller.selectedShipping.value = "SCHOOL_PICKUP";
                            controller.everyWeekSelected();
                          }, controller.isEveryWeek.value, 'Collecting')
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 2.h),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: BaseColors.white,
                  //       boxShadow: kElevationToShadow[2],
                  //       borderRadius: BorderRadius.circular(13),
                  //       border: Border.all(color: BaseColors.borderColor),
                  //     ),
                  //     padding: const EdgeInsets.all(15),
                  //     child: GridView.builder(
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       padding: EdgeInsets.zero,
                  //       shrinkWrap: true,
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 3, mainAxisExtent: 2.8.h),
                  //       itemBuilder: (context, index) => Obx(
                  //         () => Row(
                  //           children: [
                  //             iconButton(() {
                  //               controller.selectedWeekDays[index] =
                  //                   !controller.selectedWeekDays[index];
                  //             },
                  //                 controller.selectedWeekDays[index]
                  //                     ? "assets/images/checkBoxFilled.svg"
                  //                     : "assets/images/checkBoxUnfilled.svg"),
                  //             SizedBox(width: 0.5.h),
                  //             addText(
                  //                 controller.weekList[index],
                  //                 14.sp,
                  //                 BaseColors.textBlackColor,
                  //                 FontWeight.w400)
                  //           ],
                  //         ),
                  //       ),
                  //       itemCount: controller.weekList.length,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 2.h),
                  // addText('Serving', radioButtonTitleTs,
                  //     BaseColors.textBlackColor, FontWeight.w700),
                  // SizedBox(height: 1.5.h),
                  // Obx(() => Row(
                  //   children: [
                  //     radioButton(() {
                  //       controller.collectingSelected();
                  //     }, controller.collecting.value, 'Collecting'),
                  //     SizedBox(width: 2.h),
                  //     radioButton(() {
                  //       controller.deliverSelected();
                  //    }, controller.deliver.value, 'Deliver')
                  //   ],
                  //  ),
                  // ),
                  // SizedBox(height: 2.h),
                  // Obx(()=>Visibility(
                  //     visible: controller.deliver.value,
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         color: BaseColors.white,
                  //         borderRadius: BorderRadius.circular(13),
                  //         border: Border.all(color: BaseColors.borderColor),
                  //       ),
                  //       padding: const EdgeInsets.all(15),
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             flex: 1,
                  //             child: CustomTextField(
                  //               controller: TextEditingController(),
                  //               hintText: "10:30 AM",
                  //               fillColor: BaseColors.txtFieldTextColor,
                  //               borderRadius: 5.0,
                  //               suffixIcon: Padding(
                  //                 padding: const EdgeInsetsDirectional.only(end: 10.0),
                  //                 child: SvgPicture.asset("assets/images/time_icon1.svg"),
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 3.w,
                  //           ),
                  //           Expanded(
                  //             flex: 1,
                  //             child: CustomTextField(
                  //               controller: TextEditingController(),
                  //               hintText: "Location",
                  //               fillColor: BaseColors.txtFieldTextColor,
                  //               borderRadius: 5.0,
                  //               suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 2.h),
                  BaseTextFormField(
                    controller: controller.servingTime.value,
                    title: "Serving Time",
                    isDropDown: true,
                    hintText: "Select Serving Time",
                    errorText: "Please Select Serving Time",
                    items: DummyLists().servingTime.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: addText(value, 16.sp, Colors.black, FontWeight.w400));
                    }).toList(),
                    onChanged: (val){
                      controller.servingTime.value.text = val;
                      controller.selectedServingTime.value = (val == "First Break" ? "FIRST_BREAK" : val == "Second Break" ? "SECOND_BREAK" : "DAY_BREAK");
                      setState(() {});
                    },
                  ),
                  Visibility(
                    visible: (controller.servingTime.value.text == "During The Day"),
                    child: BaseTextFormField(
                      controller: controller.deliveryTime,
                      title: "Delivery Time",
                      hintText: "Select Delivery Time",
                      onTap: (){
                        showTimePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: BaseColors.primaryColor,
                                ),
                              ),
                              child: child!,
                            );
                          },
                          initialTime: TimeOfDay.now(),
                        ).then((picked){
                          if (picked != null) {
                            print(picked.to24hours());
                            controller.deliveryTime.text = (picked.to24hours())+(":00");
                          }
                        });
                      },
                      validator: (val){
                        if ((val??"").isEmpty) {
                          return "Please Select Delivery Time";
                        }
                        return null;
                      },
                    ),
                  ),
                  Visibility(
                    visible: controller.isThisWeek.value,
                    child: BaseTextFormField(
                      controller: controller.servingPlace,
                      title: "Serving Place",
                      hintText: "e.g. Lab,Ground etc.",
                      validator: (val){
                        if ((val??"").isEmpty) {
                          return "Please Select Serving Place";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Center(
                    child: addText(
                        'Select Payment Method',
                        17.sp,
                        BaseColors.black,
                        FontWeight.bold),
                  ),
                  SizedBox(height: 3.h),
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
                                        child: Icon(
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
                  SizedBox(height: 10.h),
                  // Center(
                  //   child: GestureDetector(
                  //     onTap: () async{
                  //       if(controller.selectedPaymentPos.value==0){
                  //         Get.put(StripeController()).makePayment("100");
                  //       }else if(controller.selectedPaymentPos.value==1){
                  //         BaseOverlays().showSnackBar(message:"Not Implemented yet,Only Cash Available",title: translate(Get.context!).error);
                  //       }else{
                  //         String cartId=controller.list.value.sId.toString();
                  //         String customerId=widget.data!=null?widget.data!.sId.toString() : await BaseSharedPreference().getString(SpKeys().userId);
                  //         controller.createOrderCheckout(cartId: cartId,customerId:customerId);
                  //       }
                  //       //Get.dialog(const CanteenOrderSummaryReceiptDialog());
                  //     },
                  //     child: BorderedButton(width: 70.w, text: 'CHECKOUT'),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 3.h,
                  // ),
                  Center(
                    child: BaseButton(title: "CHECKOUT", onPressed: (){
                      if ((controller.cartProductsList?.length??0) != 0) {
                        if (formKey.currentState?.validate()??false) {
                          BaseOverlays().showConfirmationDialog(title: "Are you sure you want to schedule this order?",
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
                                    });
                                  }else{
                                    // BaseOverlays().dismissOverlay();
                                    controller.createOrder(isFromCart: false);
                                  }
                              });
                        }
                      }else{
                        baseToast(message: "No Product Found In Tray");
                      }
                    },btnType: largeButton)
                  ),
                  SizedBox(height: 3.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCartCard(image, name, price, quantity,index) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 1.5.h),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: BaseColors.white,
            boxShadow: kElevationToShadow[2],
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
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
                )),
            SizedBox(width: 2.h),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addText(name, 16.sp, BaseColors.textBlackColor,
                      FontWeight.w400),
                  SizedBox(height: 0.5.h),
                  addText(price, 14.sp,
                      BaseColors.primaryColor, FontWeight.w700),
                  SizedBox(height: 1.h),
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
            ),
            SizedBox(width: 2.h),
          ],
        ),
      ),
    );
  }

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
