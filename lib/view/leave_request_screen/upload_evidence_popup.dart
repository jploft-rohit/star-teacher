import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class UploadEvidencePopup extends StatefulWidget {
  const UploadEvidencePopup({Key? key}) : super(key: key);

  @override
  State<UploadEvidencePopup> createState() => _UploadEvidencePopupState();
}

class _UploadEvidencePopupState extends State<UploadEvidencePopup> {
  TextEditingController titleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
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
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    Text(translate(context).upload_evidence, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextField(controller: titleCtrl,
                    hintTxtSize: 15.sp,
                    hintText: translate(context).reason),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(controller: titleCtrl,
                  hintTxtSize: 15.sp,
                  readOnly: true,
                  onTap: (){
                    selectDate(context);
                  },
                  hintText: translate(context).from_date, suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SvgPicture.asset(calenderDateSvg,),
                ),),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(controller: titleCtrl,
                  hintTxtSize: 15.sp,
                  readOnly: true,
                  onTap: (){
                    selectDate(context);
                  },
                  hintText: translate(context).to_date, suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SvgPicture.asset(calenderDateSvg,),
                ),),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(controller: titleCtrl,
                  hintTxtSize: 15.sp,
                  hintText: translate(context).upload_file, suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SvgPicture.asset("assets/images/upload_icon.svg",),
                ),),
                SizedBox(
                  height: 3.h,
                ),
                CustomButton(text: translate(context).submit_btn_txt, onPressed: (){
                  Get.back();
                }, btnWidth: 40.w,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
