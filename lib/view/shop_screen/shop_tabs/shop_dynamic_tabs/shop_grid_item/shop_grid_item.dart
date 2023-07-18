import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
          ? BaseNoData(message: "No Item Found")
          : GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: controller.list?.length??0,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 24.h,
          mainAxisSpacing: 3.h,
          crossAxisSpacing: 3.h,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: kElevationToShadow[2],
              color: BaseColors.white,
            ),
            padding: EdgeInsets.all(10),
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
                    FontWeight.w400),
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
                            color: Color(0xffF8F4E9),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffC19444))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(visible: int.parse(controller.list?[index]?.quantity.toString()??"0") > 0,child: GestureDetector(onTap: (){
                              setState(() {
                                controller.list?[index]?.quantity = int.parse(controller.list?[index]?.quantity.toString()??"0") + 1;
                              });
                              controller.addItemToCart(productId: controller.list?[index]?.sId??"", quantity: int.parse(controller.list?[index]?.quantity.toString()??"0"));
                            },
                              child: Icon(Icons.add, size: 18,color: BaseColors.primaryColor),
                            ),
                            ),
                            GestureDetector(
                                onTap: (){
                                  if (int.parse(controller.list?[index]?.quantity.toString()??"0") < 1) {
                                    setState(() {
                                      controller.list?[index]?.quantity = int.parse(controller.list?[index]?.quantity.toString()??"0") + 1;
                                    });
                                  }
                                },
                                child: Text(int.parse(controller.list?[index]?.quantity.toString()??"0") < 1 ? "+ Add" : int.parse(controller.list?[index]?.quantity.toString()??"0").toString(),style: TextStyle(color: BaseColors.primaryColor,fontWeight: FontWeight.bold))),

                            Visibility(visible: int.parse(controller.list?[index]?.quantity.toString()??"0") > 0,child: GestureDetector(onTap: (){
                              setState(() {
                                if (int.parse(controller.list?[index]?.quantity.toString()??"0") > 0) {
                                  controller.list?[index]?.quantity = int.parse(controller.list?[index]?.quantity.toString()??"0") - 1;
                                  controller.addItemToCart(productId: controller.list?[index]?.sId??"", quantity: int.parse(controller.list?[index]?.quantity.toString()??"0"));
                                }
                              });
                            },child: Icon(Icons.remove,size: 18,color: BaseColors.primaryColor,))),
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
}
