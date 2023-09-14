import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/backend/responses_model/shop_product_response.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/view/shop_screen/controller/shop_screen_ctrl.dart';

class ShopGridItem extends StatefulWidget {
  const ShopGridItem({super.key});

  @override
  State<ShopGridItem> createState() => _ShopGridItemState();
}

class _ShopGridItemState extends State<ShopGridItem> {

  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>(controller.list?.length??0) == 0
          ? const BaseNoData(message: "No Item Found")
          : GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            // controller: controller.scrollController,
            itemCount: controller.list?.length??0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 24.h,
            mainAxisSpacing: 3.h,
            crossAxisSpacing: 3.h,
            ),
          itemBuilder: (context, index) {
            return Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: kElevationToShadow[2],
              color: BaseColors.white,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  height: 15.h,
                  child: BaseImageNetwork(
                    link: controller.list?[index]?.images?[0]??"",
                    borderRadius: 15,
                    concatBaseUrl: true,
                  ),
                ),
                addText(
                    controller.list?[index]?.name??"",
                    15.sp + 2,
                    BaseColors.textBlackColor,
                    FontWeight.w400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: addText(
                          (controller.list?[index]?.price??"")+" AED",
                          15.sp,
                          BaseColors.primaryColor,
                          FontWeight.w600),
                    ),
                    Expanded(
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                            color: const Color(0xffF8F4E9),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xffC19444))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: (addedItems(controller.list?[index])??0) > 0,
                              child: GestureDetector(onTap: (){
                                if ((addedItems(controller.list?[index])??0) > 1) {
                                  controller.addItemToCart(productId: controller.list?[index]?.sId??"", quantity: -1, index: index).then((value){
                                    setState(() {});
                                  });
                                }else{
                                  if ((addedItems(controller.list?[index])??0) > 0) {
                                    controller.removeCartItem(productId: controller.list?[index]?.sId??"").then((value){
                                      setState(() {});
                                    });
                                  }
                                }
                              },child: const Icon(Icons.remove,size: 18,color: BaseColors.primaryColor)),
                            ),
                            GestureDetector(onTap: () async {
                              if(((addedItems(controller.list?[index])??0) == 0)){
                                await controller.addItemToCart(productId: controller.list?[index]?.sId??"", quantity: 1, index: index).then((value){
                                  setState(() {});
                                });
                              }
                            },child: Text(((addedItems(controller.list?[index])??0) == 0) ? "+ Add" : addedItems(controller.list?[index]).toString(),style: const TextStyle(color: BaseColors.primaryColor,fontWeight: FontWeight.bold))),
                            Visibility(
                              visible: (addedItems(controller.list?[index])??0) > 0,
                              child: GestureDetector(onTap: () async {
                                await controller.addItemToCart(productId: controller.list?[index]?.sId??"", quantity: 1, index: index).then((value){
                                  setState(() {});
                                });
                              },
                                child: const Icon(Icons.add, size: 18,color: BaseColors.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  int ? addedItems(ShopProductData? data){
    for (var d in controller.cartProductsList??[]) {
      if (d.product == (data?.sId??"")) {
        return d.quantity;
      }
    }
    return 0;
  }
}
