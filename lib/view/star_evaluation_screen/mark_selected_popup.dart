import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class MarkSelectedPopup extends StatefulWidget {
  bool isShowCount;
  MarkSelectedPopup({Key? key, required this.isShowCount}) : super(key: key);

  @override
  State<MarkSelectedPopup> createState() => _MarkSelectedPopupState();
}

class _MarkSelectedPopupState extends State<MarkSelectedPopup> {
  var count = 1;

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
                    Text(translate(context).mark_selected, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                if(widget.isShowCount) ...[
                  addText("21 of 60 selected", 15.sp, Colors.black54, FontWeight.w400),
                  SizedBox(
                    height: .5.h,
                  ),
                  addText(translate(context).how_many_star_points_do_you_want_to_allocate, 16.sp, Colors.black, FontWeight.w400),
                ]else ...[
                  addText(translate(context).allocate_teacher_score_to_selected_stars, 16.sp, Colors.black, FontWeight.w400),
                ],
                SizedBox(
                  height: 2.h,
                ),
                if(widget.isShowCount)...[
                  Center(
                    child: Container(
                      height: 30.0,
                      width: 80.0,
                      // padding: EdgeInsets.only(left: 25.sp, right: 25.sp,),
                      decoration: BoxDecoration(
                          border: Border.all(color: CustomColors.primaryColor),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              if(count > 1) count = count - 1;
                              setState(() {});
                            },
                            child: Icon(Icons.remove, color: CustomColors.primaryColor,),),
                          VerticalDivider(color: CustomColors.primaryColor,width: 0.0, thickness: 1.5,),
                          SizedBox(
                            width: 1.w,
                          ),
                          addText("$count", 18.sp, CustomColors.primaryColor, FontWeight.w700),
                          SizedBox(
                            width: 1.w,
                          ),
                          VerticalDivider(color: CustomColors.primaryColor,width: 0.0, thickness: 1.5),
                          InkWell(
                            onTap: (){
                              count = count + 1;
                              setState(() {});
                            },
                            child: Icon(Icons.add, color: CustomColors.primaryColor,),),
                        ],
                      ),
                    ),
                  )
                ] else ...[
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 25.sp, right: 25.sp,top: 2, bottom: 2),
                          decoration: BoxDecoration(
                              border: Border.all(color: CustomColors.primaryColor),
                              borderRadius: BorderRadius.circular(6.0)
                          ),
                          child: addText("90", 20.sp, CustomColors.primaryColor, FontWeight.w700),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        addText("(max) 100", 13.sp, CustomColors.textLightGreyColor, FontWeight.w400),
                      ],
                    ),
                  )
                ],
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: BaseButton(title: translate(context).save, onPressed: (){
                    Get.back();
                  }, btnWidth: 30.w,isActive: false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
