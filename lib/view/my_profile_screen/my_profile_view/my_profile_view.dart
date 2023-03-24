import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_dialogs.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/map_screen.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController countryCtrl = TextEditingController();
  TextEditingController nationalityCtrl = TextEditingController();
  TextEditingController maritalStatusCtrl = TextEditingController();
  TextEditingController emiratesCtrl = TextEditingController();
  TextEditingController expiryDateCtrl = TextEditingController();
  TextEditingController dobCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController alternativeMobileCtrl = TextEditingController();

  @override
  void initState() {
    nameCtrl.text = "Rafiq Khan";
    mobileCtrl.text = "45545343433";
    dobCtrl.text = "17 March, 1985";
    emailCtrl.text = "rafiq_khan007@gmail.com";
    addressCtrl.text = "PO Box: 9440 Dubai United Arab Emirates";
    countryCtrl.text = "UAE";
    stateCtrl.text = "Dubai";
    nationalityCtrl.text = "Pakistani";
    emiratesCtrl.text = "GTS3434534";
    expiryDateCtrl.text = "15 Sep, 2024";
    alternativeMobileCtrl.text = "7894561230";
    maritalStatusCtrl.text = "Married";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: const BaseAppBar(),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Flexible(
                  flex: 2,
                  child: Center(
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                    color: CustomColors.primaryColor)),
                            child: SvgPicture.asset(
                              manSvg,
                              height: 10.h,
                            ),
                          ),
                          iconButton(() {}, "assets/images/upload_img.svg")
                        ],
                      ),
                    ),
                  )),
              Flexible(
                  flex: 10,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 3.h),
                    // EdgeInsets.symmetric(vertical: 3.h, horizontal: 7.w),
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: CustomColors.white,
                        // color: Colors.red,
                        boxShadow: [getBoxShadow()]),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildProfileFields(
                              translate(context).name, nameCtrl, const SizedBox.shrink()),
                          // SizedBox(height: 0.5.h),
                          Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [
                              _buildProfileFields(
                                  translate(context).mobile_no,
                                  mobileCtrl,
                                  const SizedBox()
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25.0),
                                child: BaseButton(btnType: smallButton,borderRadius: 100,title: translate(context).change,textSize: 11, onPressed: () {
                                  CustomDialogs().showOtpDialog();
                                }),
                              )
                            ],
                          ),
                          _buildProfileFields(
                            translate(context).alternative_mobile,
                            alternativeMobileCtrl,
                            const SizedBox(),
                          ),
                          _buildProfileFields(
                            translate(context).dob,
                            dobCtrl,
                            const SizedBox(),
                          ),
                          _buildProfileFields(
                              translate(context).email, emailCtrl, const SizedBox.shrink()),
                          _buildProfileFields(translate(context).address,addressCtrl,
                              InkWell(
                                  onTap: (){
                                    Get.to(const MapScreen());
                                  },
                                  child: Image.asset("assets/images/Vector (4).png"))),
                          _buildProfileFields(
                              translate(context).country, countryCtrl, const SizedBox.shrink()),
                          _buildProfileFields(
                              translate(context).state, stateCtrl, const SizedBox.shrink()),
                          _buildProfileFields(
                              translate(context).nationality, nationalityCtrl, const SizedBox.shrink()),
                          _buildProfileFields(
                              translate(context).marital_status, maritalStatusCtrl, const SizedBox.shrink()),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(

                                      width: 30.w,
                                      child: addPrimaryColorEditText(
                                          emiratesCtrl,
                                          translate(context).emirates_ID,
                                          const SizedBox.shrink())),
                                ],
                              ),
                              Container(
                                height: 20.0,
                                width: 1,
                                color: CustomColors.borderColor,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(

                                          width: 38.w,
                                          child: addPrimaryColorEditText(
                                              expiryDateCtrl,
                                              translate(context).expiry_date,
                                              const SizedBox.shrink())),
                                      iconButton(
                                            () {selectDate(context);},
                                        calenderSvg,
                                      ),
                                      const SizedBox(width: 5)
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        const Divider(
                          color: CustomColors.borderColor,
                          thickness: 1.0,
                        ),
                          SizedBox(
                            height: 2.h,
                          ),
                          _buildProfileFields(
                              translate(context).upload_document,
                              TextEditingController(),
                              iconButton(() {}, uploadDocSvg)),
                          Text("${translate(context).upload_your_doc_till} 25 July, 2022", style: Style.montserratBoldStyle().copyWith(color: CustomColors.textRedColor, fontSize: 14.sp),),
                          SizedBox(height: 3.0.h),
                          BaseButton(title: translate(context).save, onPressed: (){}),
                          SizedBox(height: 3.0.h),
                        ],
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
  Widget addPrimaryColorEditText(
      TextEditingController controller, String hintText, Widget suffixIcon) {
    return TextFormField(
      cursorColor: CustomColors.primaryColor,
      keyboardType: TextInputType.multiline,
      controller: controller,
      textInputAction: TextInputAction.next,
      style: TextStyle(
          fontSize: 15.sp,
          color: CustomColors.primaryColor,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        isDense: true,
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(minHeight: 10),
          contentPadding: EdgeInsets.zero,
          labelText: hintText,
          labelStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
          border: InputBorder.none),
    );
  }
  Widget _buildProfileFields(title, controller, suffixIcon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addPrimaryColorEditText(controller, title, suffixIcon),
        const Divider(
          color: CustomColors.borderColor,
          thickness: 1.0,
        ),
        if(title != translate(context).upload_document)
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
  Widget iconButton(ontap, icon) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
      height: 20.sp,
      width: 20.sp,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(10.sp),
            onTap: ontap,
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.scaleDown,
            )),
      ),
    );
  }
}
