import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/map_screen.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';
import 'package:staff_app/view/my_profile_screen/my_profile_view/controller/update_my_profile_ctrl.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  UpdateMyProfileCtrl controller = Get.put(UpdateMyProfileCtrl());
  MyProfileCtrl myProfileController = Get.find<MyProfileCtrl>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Obx(()=>Scaffold(
          backgroundColor: BaseColors.backgroundColor,
          appBar: const BaseAppBar(),
          body: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: (){
                          controller.xFile = BaseOverlays().showMediaPickerDialog();
                          controller.imageData.value = controller.xFile?.path??"";
                        },
                        child: Center(
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10.0, bottom: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(color: BaseColors.primaryColor)),
                                  child: BaseImageNetwork(
                                    link: controller.imageData.value,
                                    concatBaseUrl: true,
                                    errorWidget: SvgPicture.asset(
                                      manSvg,
                                      height: 80,
                                      width: 80,
                                    ),
                                  )
                                ),
                                iconButton(() {}, "assets/images/upload_img.svg")
                              ],
                            ),
                          ),
                        ),
                      ),
                  ),
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
                                topRight: Radius.circular(30),
                            ),
                            color: BaseColors.white,
                            boxShadow: [getBoxShadow()]),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              addPrimaryColorEditText(
                                  translate(context).name,
                                  controller.nameCtrl, const SizedBox.shrink(),
                                  textInputType: TextInputType.name,
                                  validator: (val){
                                    if ((val??"").isEmpty) {
                                      return "Please enter name.";
                                    }
                                    return null;
                                  },
                              ),
                              Stack(
                                alignment: AlignmentDirectional.centerEnd,
                                children: [
                                  addPrimaryColorEditText(
                                      translate(context).mobile_no,
                                      controller.mobileCtrl,
                                      textInputType: TextInputType.phone,
                                      const SizedBox(),
                                      validator: (val){
                                        if ((val??"").isEmpty) {
                                          return "Please enter a valid phone no. between 7 to 15 digits.";
                                        }
                                        return null;
                                      },
                                    maxLength: 15
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 25),
                                    child: BaseButton(removeHorizontalPadding: true,btnType: smallButton,borderRadius: 100,title: translate(context).change,textSize: 11, onPressed: () {
                                      BaseOverlays().showOtpDialog();
                                    }),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Stack(
                                alignment: AlignmentDirectional.centerEnd,
                                children: [
                                  addPrimaryColorEditText(
                                      translate(context).alternative_mobile,
                                      controller.alternativeMobileCtrl,
                                      textInputType: TextInputType.phone,
                                      const SizedBox(),
                                    maxLength: 15
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 25),
                                    child: BaseButton(removeHorizontalPadding: true,btnType: smallButton,borderRadius: 100,title: translate(context).change,textSize: 11, onPressed: () {
                                      BaseOverlays().showOtpDialog();
                                    }),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h),
                              GestureDetector(
                                onTap: (){
                                  showDatePicker(
                                      context: context,
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.light(
                                              primary: BaseColors.primaryColor,
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1600, 8),
                                      lastDate: DateTime.now()
                                  ).then((picked){
                                    if (picked != null) {
                                      controller.dobCtrl.text = formatFlutterDateTime(flutterDateTime: picked, getDayFirst: false);
                                    }
                                  });
                                },
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: addPrimaryColorEditText(
                                    translate(context).dob,
                                    controller.dobCtrl,
                                    const SizedBox(),
                                  ),
                                ),
                              ),
                              addPrimaryColorEditText(
                                  translate(context).email, controller.emailCtrl, const SizedBox.shrink(),
                                  textInputType: TextInputType.emailAddress,
                                  validator: (val){
                                    if ((val??"").isEmpty) {
                                      return "Please enter valid email.";
                                    }
                                    return null;
                                  }),
                              addPrimaryColorEditText(
                                  translate(context).address,
                                  controller.addressCtrl,
                                  textInputType: TextInputType.streetAddress,
                                  GestureDetector(
                                      onTap: (){
                                        Get.to(const MapScreen());
                                      },
                                      child: Image.asset("assets/images/Vector (4).png"))),
                              addPrimaryColorEditText(
                                  translate(context).country,
                                  controller.countryCtrl,
                                  const SizedBox.shrink(),
                                  textInputType: TextInputType.streetAddress,
                              ),
                              addPrimaryColorEditText(
                                  translate(context).state, controller.stateCtrl, const SizedBox.shrink(),
                                textInputType: TextInputType.streetAddress,),
                              addPrimaryColorEditText(
                                  translate(context).nationality, controller.nationalityCtrl, const SizedBox.shrink(),),
                              addPrimaryColorEditText(
                                  translate(context).marital_status, controller.maritalStatusCtrl, const SizedBox.shrink()),
                              addPrimaryColorEditText(
                                  translate(context).emirates_ID,
                                  controller.emiratesCtrl,
                                  const SizedBox.shrink()),
                              GestureDetector(
                                onTap: (){
                                  showDatePicker(
                                      context: context,
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.light(
                                              primary: BaseColors.primaryColor,
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1600, 8),
                                      lastDate: DateTime.now()
                                  ).then((picked){
                                    if (picked != null) {
                                      controller.expiryDateCtrl.text = formatFlutterDateTime(flutterDateTime: picked, getDayFirst: false);
                                    }
                                  });
                                },
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: addPrimaryColorEditText(
                                      translate(context).expiry_date,
                                      controller.expiryDateCtrl,
                                    iconButton(() {selectDate(context);},
                                      calenderSvg,
                                    ),
                                  ),
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     addPrimaryColorEditText(
                              //       translate(context).expiry_date,
                              //       controller.expiryDateCtrl,
                              //       const SizedBox.shrink(),
                              //     ),
                              //     iconButton(() {selectDate(context);},
                              //       calenderSvg,
                              //     ),
                              //     const SizedBox(width: 5)
                              //   ],
                              // ),
                              SizedBox(
                                height: 2.h,
                              ),
                              GestureDetector(
                                onTap: (){
                                  BaseOverlays().showMediaPickerDialog(onCameraClick: () async {
                                    BaseOverlays().dismissOverlay();
                                    ImagePicker picker = ImagePicker();
                                    await picker.pickImage(source: ImageSource.camera, imageQuality: 30).then((value){
                                      if (value != null) {
                                        controller.selectedFile?.value = File(value.path);
                                        controller.uploadController.text = value.path.split("/").last;
                                      }
                                    },
                                    );
                                  },
                                      onGalleryClick: () async {
                                        BaseOverlays().dismissOverlay();
                                        ImagePicker picker = ImagePicker();
                                        await picker.pickImage(source: ImageSource.gallery, imageQuality: 30).then((value){
                                          if (value != null) {
                                            controller.selectedFile?.value = File(value.path);
                                            controller.uploadController.text = value.path.split("/").last;
                                          }
                                        });
                                      }
                                  );
                                },
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: addPrimaryColorEditText(
                                      translate(context).upload_document,
                                      controller.uploadController,
                                      iconButton(() {},
                                        uploadDocSvg,
                                      ),
                                  ),
                                ),
                              ),
                              Text("${translate(context).upload_your_doc_till} ${myProfileController.response.value.data?.profileCompleteDate}", style: Style.montserratBoldStyle().copyWith(color: BaseColors.textRedColor, fontSize: 14.sp),),
                              SizedBox(height: 3.0.h),
                              BaseButton(title: translate(context).save, onPressed: (){
                                if (controller.formKey.currentState?.validate()??false) {
                                  controller.updateProfileApi();
                                }
                              },btnType: largeButton),
                              SizedBox(height: 3.0.h),
                            ],
                          ),
                        ),
                      ),
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }

  Widget addPrimaryColorEditText( String hintText, TextEditingController controller, Widget suffixIcon,{final String? Function(String?)? validator,double? bottomMargin,int? maxLength,TextInputType? textInputType}) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomMargin??1.h),
      child: TextFormField(
        cursorColor: BaseColors.primaryColor,
        keyboardType: textInputType ?? TextInputType.name,
        controller: controller,
        maxLength: maxLength??200,
        textInputAction: TextInputAction.next,
        validator: validator,
        style: TextStyle(
            fontSize: 16.sp,
            color: BaseColors.primaryColor,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            // isDense: true,
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints(minHeight: 5),
            contentPadding: EdgeInsets.zero,
            labelText: hintText,
            counterText: "",
            counterStyle: TextStyle(fontSize: 0,color: Colors.transparent),
            counter: SizedBox.shrink(),
            labelStyle: TextStyle(fontSize: 15.sp, color: Colors.black),
            border: UnderlineInputBorder(borderSide: BorderSide(color: BaseColors.borderColor)),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BaseColors.borderColor)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: BaseColors.borderColor)),
            focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: BaseColors.borderColor)),
            disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: BaseColors.borderColor)),
            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
  Widget iconButton(ontap, icon) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp)),
      height: 20.sp,
      width: 20.sp,
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
            onTap: ontap,
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.scaleDown,
            )),
      ),
    );
  }
}
