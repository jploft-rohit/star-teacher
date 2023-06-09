import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';

class BaseFloatingActionButton extends StatelessWidget {
  Function() onTap;
  String title;
  final bool isCart;
  final bool isCalendar;
  final String cartItemCount;
  BaseFloatingActionButton({Key? key,required this.onTap,required this.title,this.isCart=false,this.cartItemCount="",this.isCalendar=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isCart?
      SizedBox(
        height: 7.h,
        width: 8.h,
        child: Stack(
          children: [
            Card(
              elevation: 3,
              color: BaseColors.primaryColorLight,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(width: 1,color: BaseColors.primaryColor)
              ),
              child: Padding(
                padding: EdgeInsets.all(1.5.h),
                child: SvgPicture.asset("assets/images/shopping-cart 1.svg",height: 3.h,width: 3.h,),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 2.h,
                width: 2.h,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: BaseColors.primaryColor,
                ),
                alignment: Alignment.center,
                child: addText(cartItemCount, 14, Colors.white, FontWeight.w700),
              ),
            )
          ],
        ),
      )
          :
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(color: BaseColors.primaryColor,width: 1)
            ),
            color: BaseColors.primaryColorLight,
            child: Padding(
              padding: EdgeInsets.all(1.5.h),
              child: SvgPicture.asset(isCalendar?"assets/images/calender_date.svg":"assets/images/ic_add.svg",height: 3.h,width: 3.h,color: ColorConstants.primaryColor,),
            ),
          ),
          Text(title,style: TextStyle(color: BaseColors.primaryColor,fontSize: floatingActionButtonTs,fontWeight: FontWeight.normal,fontFamily: 'Arial'),textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
