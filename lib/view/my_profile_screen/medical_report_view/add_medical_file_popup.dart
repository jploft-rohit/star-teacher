import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class AddMedicalFilePopup extends StatefulWidget {
  const AddMedicalFilePopup({Key? key}) : super(key: key);

  @override
  State<AddMedicalFilePopup> createState() => _AddMedicalFilePopupState();
}

class _AddMedicalFilePopupState extends State<AddMedicalFilePopup> {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();
  TextEditingController uploadDocCtrl = TextEditingController();

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
                    Text(translate(context).add_medical_record, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
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
                CustomTextField(controller: titleCtrl,
                    borderRadius: 5.0,
                    fillColor: BaseColors.txtFieldTextColor,
                    hintText: translate(context).title),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(controller: titleCtrl,
                  borderRadius: 5.0,
                  fillColor: BaseColors.txtFieldTextColor,
                  hintText: translate(context).description, maxLine: 3,),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(controller: titleCtrl,
                  fillColor: BaseColors.txtFieldTextColor,
                  borderRadius: 5.0,
                  readOnly: true,
                  onTap: (){
                    selectDate(context);
                  },
                  hintText: "dd/mm/yyyy", suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SvgPicture.asset(calenderDateSvg),
                ),),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextField(controller: titleCtrl,
                  fillColor: BaseColors.txtFieldTextColor,
                  borderRadius: 5.0,
                  hintText: translate(context).upload_file, suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SvgPicture.asset("assets/images/upload_icon.svg",),
                ),),
                SizedBox(
                  height: 3.h,
                ),
                BaseButton(btnType: dialogButton,title: translate(context).submit_btn_txt, onPressed: (){
                  Get.back();
                }, )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
