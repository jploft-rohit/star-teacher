import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';


class ShopReturnView extends StatefulWidget {


  @override
  State<ShopReturnView> createState() => _ShopReturnViewState();
}

class _ShopReturnViewState extends State<ShopReturnView> {
  var selectedIndex = 0;
  String delivery="Pickup From Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar:BaseAppBar(
        title: 'Return Items',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Row(
              children: [
                addText('Order Id : ', 15.sp,
                    ColorConstants.black, FontWeight.w400),
                addText('#45689', 15.sp,
                    ColorConstants.primaryColor, FontWeight.w700),
              ],
            ),
            SizedBox(height: 4.h,),
            addText(
                'Select Items you want to Return',
                16.sp,
                ColorConstants.black,
                FontWeight.w700),
            SizedBox(height: 2.h,),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) => Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsetsDirectional.only(
                                  top: 5, bottom: 5, end: 5, start: 13),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: kElevationToShadow[2],
                                  color: ColorConstants.white),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  SizedBox(width: 1.h,),
                                  Image.asset(
                                    'assets/images/book.png',
                                    scale: 1.5,
                                  ),
                                  SizedBox(width: 1.h,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        addText(
                                            'Notebook',
                                            14.sp,
                                            ColorConstants.black,
                                            FontWeight.w600),
                                        SizedBox(height: 0.5.h,),
                                        addText(
                                            '15 AED',
                                            14.sp,
                                            ColorConstants.primaryColor,
                                            FontWeight.w600),
                                        SizedBox(height: 1.h,),
                                        Row(
                                          children: [
                                            addText(
                                                'Quantity : ',
                                                14.sp,
                                                ColorConstants.black,
                                                FontWeight.w400),
                                            addText(
                                                '1',
                                                14.sp,
                                                ColorConstants.primaryColor,
                                                FontWeight.w400),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                selectedIndex == index
                                    ? ColorConstants.primaryColor
                                    : BaseColors.greyColor,
                                boxShadow: [getDeepBoxShadow()],
                                border: Border.all(
                                    color: ColorConstants.white, width: 2)),
                            child: const Icon(
                              Icons.check,
                              color: ColorConstants.white,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h,),
                    Row(
                      children: [
                        addText('Total Amount to Claim : ', 15.sp,
                            ColorConstants.black, FontWeight.w700),
                        addText('65 AED', 15.sp,
                            ColorConstants.primaryColor, FontWeight.w700),
                      ],
                    ),
                    SizedBox(height: 2.h,),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                          Border.all(color: ColorConstants.borderColor,width: 0.5)),
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
                          SizedBox(height: 1.h,),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 20,
                                    child: Radio(
                                      value: "Collect from Home",
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
                                  addText("Collect from Home", 14.sp, Colors.black, FontWeight.w700)
                                ],
                              ),
                              SizedBox(width: 20,),
                              Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 20,
                                    child: Radio(
                                      value: "Deliver to School",
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
                                  addText("Deliver to School", 14.sp, Colors.black, FontWeight.w700)
                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: 1.h,),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h,),
                    BaseButton(title: "Return Request", onPressed: (){
                      showOrderReturnDialogue(context);
                    }, btnType: largeButton,borderRadius: 19,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void showOrderReturnDialogue(BuildContext context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
              insetPadding: EdgeInsets.all(10),
              child: StatefulBuilder(builder: (context, setSta) {
                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(top: 7.h),
                            child: Center(
                              child: addAlignedText(
                                  'Are you sure you want\nto return this order?',
                                  18,
                                  Colors.black,
                                  FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      CustomTextField(controller: TextEditingController(),hintText: "Reason",maxLine: 4,),
                      SizedBox(height: 2.h,),
                      addAlignedText(
                          'Return Policy :\nIf order is returned by the user the refund amount will be not include the Delivery changes applied to Deliver and Recollect the Order',
                          14,
                          BaseColors.greyColor,
                          FontWeight.w400),
                      SizedBox(height: 2.h,),
                      BaseButton(title: "Confirm", onPressed: (){
                        showOrderReturnConfirmationDialogue(context);
                      }, btnType: mediumButton,borderRadius: 20,),
                      SizedBox(height: 2.h,),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}
void showOrderReturnConfirmationDialogue(BuildContext context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
              insetPadding: EdgeInsets.all(10),
              child: StatefulBuilder(builder: (context, setSta) {
                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),),
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(top: 7.h,start: 2.h,end: 2.h),
                            child: Center(
                              child: addAlignedText(
                                  'Return request submitted successfully!',
                                  17,
                                  Colors.black,
                                  FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      BaseButton(title: "Ok".toUpperCase(), onPressed: (){
                        Navigator.pop(context);
                      }, btnType: mediumButton,borderRadius: 20,),
                      SizedBox(height: 2.h,)
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}
BoxShadow getDeepBoxShadow() {
  return const BoxShadow(
    color: Colors.black12,
    offset: Offset(
      0.0,
      3.0,
    ),
    blurRadius: 10.0,
    spreadRadius: 0.0,
  );
}