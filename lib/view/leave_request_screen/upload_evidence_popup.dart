import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
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
                    const Text(""),
                    Text(translate(context).upload_evidence, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    GestureDetector(
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
                BaseTextFormField(
                    controller: titleCtrl,
                    hintText: translate(context).reason,
                    bottomMargin: 1.h,
                ),
                BaseTextFormField(
                  controller: titleCtrl,
                  suffixIcon: calenderDateSvg,
                  hintText: translate(context).from_date,
                  onTap: (){
                    selectDate(context);
                  },
                  bottomMargin: 1.h,
                ),
                BaseTextFormField(
                  controller: titleCtrl,
                  hintText: translate(context).to_date,
                  suffixIcon: calenderDateSvg,
                  bottomMargin: 1.h,
                  onTap: (){
                    selectDate(context);
                  },
                ),
                BaseTextFormField(controller: titleCtrl,
                  hintText: translate(context).upload_file,
                  bottomMargin: 3.h,
                  suffixIcon: "assets/images/upload_icon.svg"),
                BaseButton(btnType: dialogButton,title: translate(context).submit_btn_txt, onPressed: (){
                  Get.back();
                },removeHorizontalPadding: true,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
