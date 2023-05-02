import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';


class ReasonPopup extends StatefulWidget {
  const ReasonPopup({Key? key}) : super(key: key);

  @override
  State<ReasonPopup> createState() => _ReasonPopupState();
}

class _ReasonPopupState extends State<ReasonPopup> {
  TextEditingController reasonCtrl = TextEditingController();

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
                    Text("March 01, 2022", style: Style.montserratMediumStyle().copyWith(fontSize: 15.sp),),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 8.h,
                        child: Text("${translate(context).reason}: ", style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),)),
                    Expanded(child: CustomTextField(controller: reasonCtrl, hintText: translate(context).type_here, maxLine: 1,)),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 8.h,
                        child: Text("Upload\nEvidence : ", style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),)),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: Get.width,
                            height: 5.5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: BaseColors.txtFiledBorderColor
                              )
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(translate(context).upload_document, style: TextStyle(color: Colors.black,fontSize: 14.sp),),
                                SvgPicture.asset("assets/images/upload_icon.svg")
                              ],
                            ),
                          ),
                          SizedBox(
                            height: .5.h,
                          ),
                          Text("${translate(context).photo_uploaded} 132KB", style: TextStyle(color: Color(0xff1C6BA4),fontSize: 12.sp),),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Divider(),
                Center(
                  child: BaseButton(btnType: mediumButton,title: translate(context).submit_btn_txt, onPressed: (){
                    Get.back();
                  },borderRadius: 20,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
