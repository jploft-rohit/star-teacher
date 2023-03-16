import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';

import '../../language_classes/language_constants.dart';

class RescheduleVisitRequestPopup extends StatefulWidget {
  const RescheduleVisitRequestPopup({Key? key}) : super(key: key);

  @override
  State<RescheduleVisitRequestPopup> createState() => _RescheduleVisitRequestPopupState();
}

class _RescheduleVisitRequestPopupState extends State<RescheduleVisitRequestPopup> {
  bool isChecked = true;


  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    Text(translate(context).reschedule, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                Text(translate(context).current, style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(onTap: (){
                    selectDate(context);
                  },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(calenderDateSvg,color: CustomColors.primaryColor,height: 20.sp,),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: CustomColors.primaryColor)
                            ),
                            child: Text("16/07/2022", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text("${translate(context).reschedule} ${translate(context).to}", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: (){
                      selectDate(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(calenderDateSvg,color: CustomColors.primaryColor,height: 20.sp,),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: CustomColors.primaryColor)
                            ),
                            child: Text("16/07/2022", style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: CustomColors.primaryColor,
                        activeColor: Colors.transparent,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: isChecked,
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: CustomColors.primaryColor),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                            side: BorderSide(color: CustomColors.primaryColor)
                        ),
                        onChanged: (bool? value) {
                          isChecked = value!;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Flexible(child: Text(translate(context).do_you_want_a_permanent_reschedule, style: Style.montserratMediumStyle().copyWith(color: CustomColors.textBlackColor, fontSize: 15.sp),)),
                    ],
                  ),
                SizedBox(
                  height: 3.h,
                ),

                Center(
                  child: CustomButton(text: "SUBMIT", onPressed: (){
                      Get.back();
                  }, btnWidth: 30.w,borderRadius: 50.0,btnHeight: 40,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
