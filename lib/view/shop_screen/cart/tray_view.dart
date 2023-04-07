import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/shop_screen/shop_screen_ctrl.dart';

class TrayView extends StatefulWidget {
  const TrayView({super.key});

  @override
  State<TrayView> createState() => _TrayViewState();
}

class _TrayViewState extends State<TrayView> {
  ShopScreenCtrl controller = Get.find<ShopScreenCtrl>();
  
  @override
  void initState() {
    controller.selectedWeekDays = RxList.filled(controller.weekList.length, false);
    super.initState();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addText('First Break Items', 16.sp,
                      BaseColors.textBlackColor, FontWeight.w700),
                  BaseButton(
                      btnWidth: 85,
                      title: "Add item",
                      onPressed: () {})
                ],
              ),
              SizedBox(height: 2.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) => buildCartCard(
                    'assets/images/image 19.png', 'Mango Juice', '4 AED', '2'),
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addText('Second Break Items', 16.sp,
                      BaseColors.textBlackColor, FontWeight.w700),
                  BaseButton(
                      btnWidth: 85,
                      title: "Add item",
                      textSize: 16.sp,
                      onPressed: () {})
                ],
              ),
              SizedBox(height: 2.h),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) => buildCartCard(
                      'assets/images/image 21.png', 'Lunch', '13 AED', '2')),
              SizedBox(height: 1.h),
              const Divider(),
              SizedBox(height: 2.h),
              addText('Order Type', radioButtonTitleTs,
                  BaseColors.textBlackColor, FontWeight.w700),
              SizedBox(height: 1.5.h),
              Obx(() => Row(
                    children: [
                      radioButton(() {
                        controller.thisWeekSelected();
                      }, controller.isThisWeek.value, 'This Week'),
                      SizedBox(width: 2.h),
                      radioButton(() {
                        controller.everyWeekSelected();
                      }, controller.isEveryWeek.value, 'Every Week')
                    ],
                  )),
              SizedBox(height: 2.h),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: BaseColors.white,
                    boxShadow: kElevationToShadow[2],
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: BaseColors.borderColor),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisExtent: 2.8.h),
                    itemBuilder: (context, index) => Obx(
                      () => Row(
                        children: [
                          iconButton(() {
                            controller.selectedWeekDays[index] =
                                !controller.selectedWeekDays[index];
                          },
                              controller.selectedWeekDays[index]
                                  ? "assets/images/checkBoxFilled.svg"
                                  : "assets/images/checkBoxUnfilled.svg"),
                          SizedBox(width: 0.5.h),
                          addText(
                              controller.weekList[index],
                              14.sp,
                              BaseColors.textBlackColor,
                              FontWeight.w400)
                        ],
                      ),
                    ),
                    itemCount: controller.weekList.length,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              addText('Serving', radioButtonTitleTs,
                  BaseColors.textBlackColor, FontWeight.w700),
              SizedBox(height: 1.5.h),
              Obx(() => Row(
                children: [
                  radioButton(() {
                    controller.collectingSelected();
                  }, controller.collecting.value, 'Collecting'),
                  SizedBox(width: 2.h),
                  radioButton(() {
                    controller.deliverSelected();
                 }, controller.deliver.value, 'Deliver')
                ],
               ),
              ),
              SizedBox(height: 2.h),
              Obx(()=>Visibility(
                  visible: controller.deliver.value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: BaseColors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: BaseColors.borderColor),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomTextField(
                            controller: TextEditingController(),
                            hintText: "10:30 AM",
                            fillColor: BaseColors.txtFieldTextColor,
                            borderRadius: 5.0,
                            suffixIcon: Padding(
                              padding: const EdgeInsetsDirectional.only(end: 10.0),
                              child: SvgPicture.asset("assets/images/time_icon1.svg"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomTextField(
                            controller: TextEditingController(),
                            hintText: "Location",
                            fillColor: BaseColors.txtFieldTextColor,
                            borderRadius: 5.0,
                            suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              detailRow('Sub Total', '17 AED'),
              SizedBox(height: 1.h),
              detailRow('Taxes (5%)', '2 AED'),
              SizedBox(height: 1.h),
              detailRow('Grand Total', '19 AED'),
              const Divider(),
              addText(
                  'Note: \n1-Order can be cancelled before 24 hours of serving.\n2-Amount will be deduct from the wallet when order is served',
                  13.sp,
                  BaseColors.textLightGreyColor,
                  FontWeight.w400),
              SizedBox(height: 3.h),
              Center(
                child: BaseButton(title: "Schedule Order", onPressed: (){
                  showGeneralDialog(context: context, pageBuilder: (context,a1,a2){
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 120),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Colors.white
                        ),
                        padding: const EdgeInsets.all(25),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                              Text("Are you sure you want to schedule this order?",style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 17.sp, height: 1.5,fontWeight: FontWeight.w600),),
                              SizedBox(height: 7.h,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: BaseButton(title: translate(context).cancel, onPressed: (){
                                        Navigator.pop(context);
                                      }),
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Expanded(
                                    child: Center(
                                      child: BaseButton(btnType: dialogButton,title: translate(context).proceed, onPressed: (){
                                        Navigator.pop(context);
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                })
              ),
              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCartCard(image, name, price, quantity) {
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
                ),
                // width: double.infinity,
                height: 10.h,
                width: 10.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
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
                  Row(
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
