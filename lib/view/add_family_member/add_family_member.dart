import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class AddFamilyMemberScreen extends StatefulWidget {
  final bool isUpdating;
  const AddFamilyMemberScreen({Key? key, required this.isUpdating}) : super(key: key);

  @override
  State<AddFamilyMemberScreen> createState() => _AddFamilyMemberScreenState();
}

class _AddFamilyMemberScreenState extends State<AddFamilyMemberScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController idExpiryController = TextEditingController();

  @override
  void initState() {
    if(widget.isUpdating){
      setData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: widget.isUpdating ? translate(context).update_family_member : translate(context).add_family_member),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(translate(context).name, style: Style.montserratBoldStyle().copyWith(fontSize: textFormFieldLabelTs, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      SvgPicture.asset(calenderDateSvg, color: Colors.white,),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                        child: CustomTextField(
                          controller: nameController,
                          fillColor: CustomColors.txtFieldTextColor,
                          hintText: translate(context).type_here,
                          borderRadius: 5.0,
                          hintTxtSize: textFormFieldHintTs,
                        ),
                      )
                    ],
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
                  child: Text(translate(context).relation, style: Style.montserratBoldStyle().copyWith(fontSize: textFormFieldLabelTs, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg, color: Colors.white,),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: relationController,
                            readOnly: true,
                            hintText: translate(context).choose,
                            fillColor: CustomColors.txtFieldTextColor,
                            borderRadius: 5.0,
                            hintTxtSize: textFormFieldHintTs,
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
                  child: Text("DOB", style: Style.montserratBoldStyle().copyWith(fontSize: textFormFieldLabelTs, color: CustomColors.textBlackColor),),
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
                            controller: dobController,
                            readOnly: true,
                            hintTxtSize: textFormFieldHintTs,
                            onTap: (){
                              selectDate(context);
                            },
                            fillColor: CustomColors.txtFieldTextColor,
                            hintText: "dd/mm/yyyy",
                            borderRadius: 5.0,
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
                  child: Text(translate(context).mobile_no, style: Style.montserratBoldStyle().copyWith(fontSize: textFormFieldLabelTs, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg, color: Colors.white,),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: mobileController,
                            fillColor: CustomColors.txtFieldTextColor,
                            hintText: "9867145250",
                            borderRadius: 5.0,
                            hintTxtSize: textFormFieldHintTs,
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
                  child: Text(translate(context).upload_id, style: Style.montserratBoldStyle().copyWith(fontSize: textFormFieldLabelTs, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg, color: Colors.white,),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: idController,
                            hintText: translate(context).upload_id,
                            fillColor: CustomColors.txtFieldTextColor,
                            borderRadius: 5.0,
                            hintTxtSize: textFormFieldHintTs,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: SvgPicture.asset("assets/images/upload_icon.svg",),
                            ),
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
                  child: Text(translate(context).id_expiry_date, style: Style.montserratBoldStyle().copyWith(fontSize: textFormFieldLabelTs, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg,),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: idExpiryController,
                            onTap: (){
                              selectDate(context);
                            },
                            readOnly: true,
                            hintTxtSize: textFormFieldHintTs,
                            hintText: "dd/mm/yyyy",
                            fillColor: CustomColors.txtFieldTextColor,
                            borderRadius: 5.0,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            BaseButton(title: translate(context).submit_btn_txt, onPressed: (){
              Get.back();
            })
          ],
        ),
      ),
    );
  }

  setData(){
    nameController.text = "Rohit Sharma";
    relationController.text = "Father";
    dobController.text = "15/10/1999";
    mobileController.text = "9897686878";
    idController.text = "rohit.doc";
    idExpiryController.text = "15/10/2023";
  }
}
