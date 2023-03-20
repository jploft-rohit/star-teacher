import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class RequestOnlineClasses extends StatefulWidget {
  final bool isUpdating;
  const RequestOnlineClasses({Key? key,this.isUpdating = false}) : super(key: key);

  @override
  State<RequestOnlineClasses> createState() => _RequestOnlineClassesState();
}

class _RequestOnlineClassesState extends State<RequestOnlineClasses> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isUpdating) {
      setData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.screenBackgroundColor,
      appBar: appBarWithAction(context, widget.isUpdating ? "Online Class Edit" : translate(context).online_class_request, [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                color: CustomColors.backgroundColor,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: CustomColors.borderColor
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                  const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text("${translate(context).from_date}:", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: fromDateController,
                            readOnly: true,
                            onTap: (){
                              selectDate(context);
                            },
                            hintText: "dd/mm/yyyy",
                            hintTxtSize: 15.sp,
                            borderRadius: 5.0,
                            suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text("${translate(context).to_date}:", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: toDateController,
                            readOnly: true,
                            onTap: (){
                              selectDate(context);
                            },
                            hintText: "dd/mm/yyyy",
                            borderRadius: 5.0,
                            hintTxtSize: 15.sp,
                            suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text("${translate(context).reason}:", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg, color: CustomColors.screenBackgroundColor,),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: reasonController,
                            hintText: translate(context).type_here,
                            borderRadius: 5.0,
                            hintTxtSize: 15.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomButton(text: translate(context).submit_btn_txt, onPressed: (){
              Get.back();
            },),
          ],
        ),
      ),
    );
  }

  setData(){
    fromDateController.text = "12/05/23";
    toDateController.text = "19/05/23";
    reasonController.text = "Fever";
  }
}
