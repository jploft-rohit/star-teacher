import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class TopUpRecordPopUp extends StatefulWidget {
  TopUpRecordPopUp({Key? key}) : super(key: key);

  @override
  State<TopUpRecordPopUp> createState() => _TopUpRecordPopUpState();
}

class _TopUpRecordPopUpState extends State<TopUpRecordPopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: SizedBox(
          width: 100.w,
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(
                            Icons.close
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Center(
                        child: addText(translate(context).top_up_record, 18,
                            Colors.black, FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Stack(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                         // margin: EdgeInsets.only(right: 3.w),
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: BaseColors.greyColor)),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: 12.h,
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                                  decoration: BoxDecoration(
                                      color: BaseColors.backgroundColor,
                                      border: Border.all(color: BaseColors.primaryColor),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("100", style: Style.montserratBoldStyle().copyWith(fontSize: 20.sp, color: BaseColors.primaryColor),),
                                      Text("AED", style: Style.montserratRegularStyle().copyWith(fontSize: 16.sp, color: BaseColors.primaryColor),),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 2.w),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Amount Added', style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 8),
                                      Text('TR No : 2587961', style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 35),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('20/10/2022', style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                    const SizedBox(height: 8),
                                    Text('09:00:30pm', style: Style.montserratBoldStyle().copyWith(fontSize: 13.sp, color: BaseColors.textBlackColor,fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 3.0),
                      //   child: GestureDetector(
                      //     onTap: (){
                      //     },
                      //     child: Container(
                      //       padding: const EdgeInsets.all(3),
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           shape: BoxShape.circle,
                      //           boxShadow: [
                      //             getBoxShadow()
                      //           ]
                      //       ),
                      //       child: SvgPicture.asset(starSvg, height: 18.sp,),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Expanded(
                      child: BaseButton(
                        title: translate(context).print_receipt.toUpperCase(),
                        btnType: mediumLargeButton,
                        borderRadius: 20,
                        onPressed: (){
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: BaseButton(
                        title: "SAVE RECEIPT",
                        btnType: mediumLargeButton,
                        borderRadius: 20,
                        onPressed: (){
                          Get.back();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
