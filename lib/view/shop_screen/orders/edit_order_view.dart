import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';

import '../../../Utility/base_utility.dart';

class EditOrderView extends StatefulWidget {
  final String id;
  const EditOrderView({super.key, required this.id});

  @override
  State<EditOrderView> createState() => _EditOrderViewState();
}

class _EditOrderViewState extends State<EditOrderView> {
  String delivery="Pick-up from school";
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();

  @override
  void initState() {
    super.initState();
    controller.getSingleOrderDetail(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar:BaseAppBar(
          title: 'Edit Order'
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(()=>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    addText('Order Id : ', 15.sp,
                        ColorConstants.black, FontWeight.w400),
                    addText('#45689', 15.sp,
                        ColorConstants.primaryColor, FontWeight.w700),
                  ],
                ),
                SizedBox(height: 1.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     addText('Ahmed items', 15.sp,
                //         ColorConstants.black, FontWeight.w400),
                //     BaseButton(title: "Add item", onPressed: (){
                //
                //     }, btnType: "small",removeHorizontalPadding: true,),
                //     // CustomButton(
                //     //   onPressed: () {  }, text: 'Add item',btnHeight: 3.h,btnWidth: 85,textSize: 14.sp,)
                //   ],
                // ),
                // SizedBox(height: 2.h,),
                // ListView.builder(
                //   physics: NeverScrollableScrollPhysics(),
                //   padding: EdgeInsets.zero,
                //   shrinkWrap: true,
                //   itemCount: controller.singleOrderProductList?.length??0,
                //   itemBuilder: (context, index) => buildCartCard(
                //       'assets/images/card4.png', 'School Bag', '50 AED', '2'),
                // ),
                // SizedBox(height: 1.h,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     addText('Mohammed items', 15.sp,
                //         ColorConstants.black, FontWeight.w400),
                //     BaseButton(title: "Add item", onPressed: (){
                //
                //     }, btnType: "small",removeHorizontalPadding: true,),
                //   ],
                // ),
                SizedBox(height: 1.h),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 1.h),
                    shrinkWrap: true,
                    itemCount: controller.singleOrderProductList?.length??0,
                    itemBuilder: (context, index) => buildCartCard(index:index)),
                SizedBox(height: 1.h,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xffFCEFC0),width: 0.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: addText(
                            'Select shipping',
                            15.sp,
                            ColorConstants.black,
                            FontWeight.w400),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 20,
                                child: Radio(
                                  value: "Home delivery",
                                  groupValue: delivery,
                                  activeColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                  fillColor:
                                  MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                  onChanged: (value){
                                    setState(() {
                                      delivery = value.toString();
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 5,),
                              addText("Home delivery", 14, Colors.black, FontWeight.w500)
                            ],
                          ),
                          SizedBox(width: 20,),
                          Row(
                            children: [
                              Container(
                                height: 15,
                                width: 20,
                                child: Radio(
                                  value: "Pick-up from school",
                                  activeColor: MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                  fillColor:
                                  MaterialStateColor.resolveWith((states) => ColorConstants.primaryColor),
                                  groupValue: delivery,
                                  onChanged: (value){
                                    setState(() {
                                      delivery = value.toString();
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 5,),
                              addText("Pick-up from school", 14, Colors.black, FontWeight.w500)
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 1.h,),
                    ],
                  ),
                ),
                SizedBox(height:2.h),
                detailRow('Sub Total', (controller.singleOrderProductData?.value?.totalAmount?.toString()??"")+" AED"),
                SizedBox(height:1.h),
                detailRow('Taxes (5%)', (controller.singleOrderProductData?.value?.taxAmount?.toString()??"")+" AED"),
                SizedBox(height:1.h),
                detailRow('Shipping Charges', (controller.singleOrderProductData?.value?.shippingCharges?.toString()??"")+" AED"),
                SizedBox(height:1.h),
                detailRow('Grand Total', (controller.singleOrderProductData?.value?.grandTotal?.toString()??"")+" AED"),
                SizedBox(height:3.h),
                Align(
                  alignment: Alignment.center,
                  child: BaseButton(title: "UPDATE ORDER", onPressed: (){
                    // controller.updateOrder(id: widget.id,productList: ),
                  }, btnType: "large"),
                ),
                SizedBox(height: 3.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCartCard({required int index}) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h,right: 2,left: 2),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ColorConstants.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.6),spreadRadius: 1.5,blurRadius: 1.1,offset: Offset(0,0))
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              // width: double.infinity,
              height: 10.h,
              width: 10.h,
              child: BaseImageNetwork(
                link: controller.singleOrderProductList?[index]?.productId?.images?[0]??"",
              )),
          SizedBox(width: 2.h,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addText(controller.singleOrderProductList?[index]?.productId?.name??"", 16.sp, ColorConstants.black,
                    FontWeight.w400),
                SizedBox(height: 0.5.h,),
                addText(controller.singleOrderProductList?[index]?.productId?.price?.toString()??"", 14.sp,
                    ColorConstants.primaryColor, FontWeight.w700),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[1],
                          borderRadius: BorderRadius.circular(30),
                          border:
                          Border.all(color: ColorConstants.primaryColor),
                          color: ColorConstants.primaryColorLight),
                      // width: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.remove,size: 18,color: ColorConstants.primaryColor,),
                          SizedBox(width: 1.5.h,),
                          addText(controller.singleOrderProductList?[index]?.totalQty?.toString()??"", 14.sp,
                              ColorConstants.primaryColor, FontWeight.w900),
                          SizedBox(width: 1.5.h,),
                          Icon(Icons.add,size: 18,color: ColorConstants.primaryColor,),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                      child: VerticalDivider(),
                    ),
                    GestureDetector(
                      onTap: (){
                        BaseOverlays().showOkDialog(btnTitle: "Yes",title: "Are you sure you want\nto remove this item?");
                      },
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.delete,color: Color(0xFFE62626),size: 14,),
                          addText("Remove", 14,Color(0xFFE62626), FontWeight.w400),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 2.h,),
        ],
      ),
    );
  }

  Widget detailRow(title, body) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        addText(title, 14.sp, ColorConstants.black,
            FontWeight.w400),
        addText(body, 14.sp, ColorConstants.primaryColor,
            FontWeight.w700),
      ],
    );
  }
}