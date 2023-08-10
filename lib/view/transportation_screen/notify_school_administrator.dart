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
import 'package:staff_app/view/transportation_screen/controller/transportation_screen_ctrl.dart';
import 'package:staff_app/view/account_deactivation_screen/deactivation_detail_screen.dart';

class NotifySchoolAdministratorPopup extends StatefulWidget {
  const NotifySchoolAdministratorPopup({Key? key}) : super(key: key);

  @override
  State<NotifySchoolAdministratorPopup> createState() => _NotifySchoolAdministratorPopupState();
}

class _NotifySchoolAdministratorPopupState extends State<NotifySchoolAdministratorPopup> {
  TransportationScreenCtrl controller = Get.find<TransportationScreenCtrl>();
  int selectedFMOPos = 0;
  int selectedFMOPos1 = 0;
  int selectedFMOPos2 = 0;

  TextEditingController startDateCtrl = TextEditingController();
  TextEditingController endDateCtrl = TextEditingController();
  TextEditingController startDateCtrl1 = TextEditingController();
  TextEditingController endDateCtrl1 = TextEditingController();
  TextEditingController startDateCtrl2 = TextEditingController();
  TextEditingController endDateCtrl2 = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 10.sp, right: 10.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white
          ),
          child: Form(

            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(""),
                      Flexible(child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(translate(context).are_you_sure_you_want_to_notify_the_school_administration, style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: Colors.black),textAlign: TextAlign.center,),
                      )),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: const Icon(Icons.close, color: Colors.black,),)
                    ],
                  ),
                  SizedBox(height: 2.h),
                  /// Option 1
                  Visibility(
                    visible: controller.isFirstOptionSelected.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                          decoration: BoxDecoration(
                            color: BaseColors.backgroundColor,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Text("I will be absent today.", style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                selectedFMOPos = 0;
                                setState(() {});
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    // padding: const EdgeInsets.symmetric(horizontal: 9),
                                    decoration: BoxDecoration(
                                        color: selectedFMOPos == 0
                                            ? BaseColors.backgroundColor
                                            : BaseColors.borderColor,
                                        boxShadow: [getLightBoxShadow()],
                                        border: Border.all(
                                            color: Colors.transparent, width: 1.5),
                                        borderRadius: BorderRadius.circular(30.0)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: BaseColors.white, width: 1.5),
                                          shape: BoxShape.circle,
                                          boxShadow: [getBoxShadow()],
                                          color: selectedFMOPos == 0
                                              ? BaseColors.primaryColor
                                              : BaseColors.borderColor
                                      ),
                                      child: Center(
                                        child: Icon(Icons.check, color: BaseColors.white,
                                            size: 16.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(translate(context).for_today, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            GestureDetector(
                              onTap: (){
                                selectedFMOPos = 1;
                                setState(() {});
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    // padding: const EdgeInsets.symmetric(horizontal: 9),
                                    decoration: BoxDecoration(
                                        color: selectedFMOPos == 1
                                            ? BaseColors.backgroundColor
                                            : BaseColors.borderColor,
                                        boxShadow: [getLightBoxShadow()],
                                        border: Border.all(
                                            color: Colors.transparent, width: 1.5),
                                        borderRadius: BorderRadius.circular(30.0)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: BaseColors.white, width: 1.5),
                                          shape: BoxShape.circle,
                                          boxShadow: [getBoxShadow()],
                                          color: selectedFMOPos == 1
                                              ? BaseColors.primaryColor
                                              : BaseColors.borderColor
                                      ),
                                      child: Center(
                                        child: Icon(Icons.check, color: BaseColors.white,
                                            size: 16.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(translate(context).for_multiple_days, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        if(selectedFMOPos == 1)
                          Row(
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(translate(context).from, style: Style.montserratMediumStyle().copyWith(fontSize: textFormFieldLabelTs),),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    CustomTextField(
                                      controller: startDateCtrl,
                                      hintText: "dd/mm/yyyy",
                                      readOnly: true,
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
                                            initialDate: startDateCtrl.text.isEmpty ? DateTime.now() : DateTime.parse(flipDate(date: startDateCtrl.text.trim())),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(DateTime.now().year+1)
                                        ).then((value){
                                          if (value != null) {
                                            if (endDateCtrl.text.trim().isNotEmpty) {
                                              DateTime endDate = DateTime.parse(flipDate(date: endDateCtrl.text.trim()));
                                              if (endDate.isAfter(value)) {
                                                startDateCtrl.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                                              }else{
                                                baseToast(message: "\"From Date\" can't be more than \"To Date\"");
                                              }
                                            }else{
                                              startDateCtrl.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                                            }
                                          }
                                        });
                                      },
                                      hintTxtSize: textFormFieldHintTs,
                                      borderRadius: 5.0,
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        child: SvgPicture.asset(calenderDateSvg,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(translate(context).to, style: Style.montserratMediumStyle().copyWith(fontSize: textFormFieldLabelTs),),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    CustomTextField(
                                      controller: endDateCtrl,
                                      hintText: "dd/mm/yyyy",
                                      borderRadius: 5.0,
                                      readOnly: true,
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
                                            initialDate: endDateCtrl.text.isEmpty ? DateTime.now() : DateTime.parse(flipDate(date: endDateCtrl.text.trim())),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(DateTime.now().year+1)
                                        ).then((value){
                                          if (value != null) {
                                            if (startDateCtrl.text.trim().isNotEmpty) {
                                              DateTime startDate = DateTime.parse(flipDate(date: startDateCtrl.text.trim()));
                                              if (startDate.isBefore(value)) {
                                                endDateCtrl.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                                              }else{
                                                baseToast(message: "\"To Date\" can't be less than \"From Date\"");
                                              }
                                            }else{
                                              endDateCtrl.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                                            }
                                          }
                                        },
                                        );
                                      },
                                      hintTxtSize: textFormFieldHintTs,
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        child: SvgPicture.asset(calenderDateSvg,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                            ],
                          ),
                        if(selectedFMOPos == 1)
                          SizedBox(
                            height: 2.h,
                          ),
                        const Divider(),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                  /// Option 2
                  Visibility(
                    visible: controller.isSecondOptionSelected.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                          decoration: BoxDecoration(
                              color: BaseColors.backgroundColor,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text("Going to school by my own vehicle.", style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                selectedFMOPos1 = 0;
                                setState(() {});
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    // padding: const EdgeInsets.symmetric(horizontal: 9),
                                    decoration: BoxDecoration(
                                        color: selectedFMOPos1 == 0
                                            ? BaseColors.backgroundColor
                                            : BaseColors.borderColor,
                                        boxShadow: [getLightBoxShadow()],
                                        border: Border.all(
                                            color: Colors.transparent, width: 1.5),
                                        borderRadius: BorderRadius.circular(30.0)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: BaseColors.white, width: 1.5),
                                          shape: BoxShape.circle,
                                          boxShadow: [getBoxShadow()],
                                          color: selectedFMOPos1 == 0
                                              ? BaseColors.primaryColor
                                              : BaseColors.borderColor
                                      ),
                                      child: Center(
                                        child: Icon(Icons.check, color: BaseColors.white,
                                            size: 16.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(translate(context).for_today, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            GestureDetector(
                              onTap: (){
                                selectedFMOPos1 = 1;
                                setState(() {});
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    // padding: const EdgeInsets.symmetric(horizontal: 9),
                                    decoration: BoxDecoration(
                                        color: selectedFMOPos1 == 1
                                            ? BaseColors.backgroundColor
                                            : BaseColors.borderColor,
                                        boxShadow: [getLightBoxShadow()],
                                        border: Border.all(
                                            color: Colors.transparent, width: 1.5),
                                        borderRadius: BorderRadius.circular(30.0)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: BaseColors.white, width: 1.5),
                                          shape: BoxShape.circle,
                                          boxShadow: [getBoxShadow()],
                                          color: selectedFMOPos1 == 1
                                              ? BaseColors.primaryColor
                                              : BaseColors.borderColor
                                      ),
                                      child: Center(
                                        child: Icon(Icons.check, color: BaseColors.white,
                                            size: 16.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(translate(context).for_multiple_days, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        if(selectedFMOPos1 == 1)
                          Row(
                            children: [
                              SizedBox(width: 5.w),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(translate(context).from, style: Style.montserratMediumStyle().copyWith(fontSize: textFormFieldLabelTs),),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    CustomTextField(
                                      controller: startDateCtrl1,
                                      hintText: "dd/mm/yyyy",
                                      borderRadius: 5.0,
                                      hintTxtSize: textFormFieldHintTs,
                                      readOnly: true,
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
                                            initialDate: startDateCtrl1.text.isEmpty ? DateTime.now() : DateTime.parse(flipDate(date: startDateCtrl1.text.trim())),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(DateTime.now().year+1)
                                        ).then((value){
                                          if (value != null) {
                                            if (endDateCtrl1.text.trim().isNotEmpty) {
                                              DateTime endDate = DateTime.parse(flipDate(date: endDateCtrl1.text.trim()));
                                              if (endDate.isAfter(value)) {
                                                startDateCtrl1.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                                              }else{
                                                baseToast(message: "\"From Date\" can't be more than \"To Date\"");
                                              }
                                            }else{
                                              startDateCtrl1.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                                            }
                                          }
                                        });
                                      },
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        child: SvgPicture.asset(calenderDateSvg,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(translate(context).to, style: Style.montserratMediumStyle().copyWith(fontSize: textFormFieldLabelTs),),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    CustomTextField(
                                      controller: endDateCtrl1,
                                      hintText: "dd/mm/yyyy",
                                      borderRadius: 5.0,
                                      hintTxtSize: textFormFieldHintTs,
                                      readOnly: true,
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
                                            initialDate: endDateCtrl1.text.isEmpty ? DateTime.now() : DateTime.parse(flipDate(date: endDateCtrl1.text.trim())),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(DateTime.now().year+1)
                                        ).then((value){
                                          if (value != null) {
                                            if (startDateCtrl1.text.trim().isNotEmpty) {
                                              DateTime startDate = DateTime.parse(flipDate(date: startDateCtrl1.text.trim()));
                                              if (startDate.isBefore(value)) {
                                                endDateCtrl1.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                                              }else{
                                                baseToast(message: "\"To Date\" can't be less than \"From Date\"");
                                              }
                                            }else{
                                              endDateCtrl1.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                                            }
                                          }
                                        },
                                        );
                                      },
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        child: SvgPicture.asset(calenderDateSvg,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                            ],
                          ),
                        if(selectedFMOPos1 == 1)
                          SizedBox(height: 2.h),
                        Divider(),
                      ],
                    ),
                  ),
                  /// Option 3
                  Visibility(
                    visible: controller.isThirdOptionSelected.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                          decoration: BoxDecoration(
                              color: BaseColors.backgroundColor,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Text("Returning home by my own vehicle.", style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                selectedFMOPos2 = 0;
                                setState(() {});
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    // padding: const EdgeInsets.symmetric(horizontal: 9),
                                    decoration: BoxDecoration(
                                        color: selectedFMOPos2 == 0
                                            ? BaseColors.backgroundColor
                                            : BaseColors.borderColor,
                                        boxShadow: [getLightBoxShadow()],
                                        border: Border.all(
                                            color: Colors.transparent, width: 1.5),
                                        borderRadius: BorderRadius.circular(30.0)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: BaseColors.white, width: 1.5),
                                          shape: BoxShape.circle,
                                          boxShadow: [getBoxShadow()],
                                          color: selectedFMOPos2 == 0
                                              ? BaseColors.primaryColor
                                              : BaseColors.borderColor
                                      ),
                                      child: Center(
                                        child: Icon(Icons.check, color: BaseColors.white,
                                            size: 16.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(translate(context).for_today, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            GestureDetector(
                              onTap: (){
                                selectedFMOPos2 = 1;
                                setState(() {});
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    // padding: const EdgeInsets.symmetric(horizontal: 9),
                                    decoration: BoxDecoration(
                                        color: selectedFMOPos2 == 1
                                            ? BaseColors.backgroundColor
                                            : BaseColors.borderColor,
                                        boxShadow: [getLightBoxShadow()],
                                        border: Border.all(
                                            color: Colors.transparent, width: 1.5),
                                        borderRadius: BorderRadius.circular(30.0)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: BaseColors.white, width: 1.5),
                                          shape: BoxShape.circle,
                                          boxShadow: [getBoxShadow()],
                                          color: selectedFMOPos2 == 1
                                              ? BaseColors.primaryColor
                                              : BaseColors.borderColor
                                      ),
                                      child: Center(
                                        child: Icon(Icons.check, color: BaseColors.white,
                                            size: 16.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(translate(context).for_multiple_days, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        if(selectedFMOPos2 == 1)
                          Row(
                            children: [
                              SizedBox(width: 5.w),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(translate(context).from, style: Style.montserratMediumStyle().copyWith(fontSize: textFormFieldLabelTs),),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    CustomTextField(
                                      controller: startDateCtrl2,
                                      hintText: "dd/mm/yyyy",
                                      borderRadius: 5.0,
                                      hintTxtSize: textFormFieldHintTs,
                                      readOnly: true,
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
                                            initialDate: startDateCtrl2.text.isEmpty ? DateTime.now() : DateTime.parse(flipDate(date: startDateCtrl2.text.trim())),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(DateTime.now().year+1)
                                        ).then((value){
                                          if (value != null) {
                                            if (endDateCtrl2.text.trim().isNotEmpty) {
                                              DateTime endDate = DateTime.parse(flipDate(date: endDateCtrl2.text.trim()));
                                              if (endDate.isAfter(value)) {
                                                startDateCtrl2.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                                              }else{
                                                baseToast(message: "\"From Date\" can't be more than \"To Date\"");
                                              }
                                            }else{
                                              startDateCtrl2.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                                            }
                                          }
                                        });
                                      },
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        child: SvgPicture.asset(calenderDateSvg,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(translate(context).to, style: Style.montserratMediumStyle().copyWith(fontSize: textFormFieldLabelTs),),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    CustomTextField(
                                      controller: endDateCtrl2,
                                      hintText: "dd/mm/yyyy",
                                      borderRadius: 5.0,
                                      hintTxtSize: textFormFieldHintTs,
                                      readOnly: true,
                                      validator: (val){
                                        if(endDateCtrl2.text.trim().isEmpty){
                                          return "Please Select Date";
                                        }
                                        return null;
                                      },
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
                                            initialDate: endDateCtrl2.text.isEmpty ? DateTime.now() : DateTime.parse(flipDate(date: endDateCtrl2.text.trim())),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(DateTime.now().year+1)
                                        ).then((value){
                                          if (value != null) {
                                            if (startDateCtrl1.text.trim().isNotEmpty) {
                                              DateTime startDate = DateTime.parse(flipDate(date: startDateCtrl1.text.trim()));
                                              if (startDate.isBefore(value)) {
                                                endDateCtrl2.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                                              }else{
                                                baseToast(message: "\"To Date\" can't be less than \"From Date\"");
                                              }
                                            }else{
                                              endDateCtrl2.text = formatFlutterDateTime(flutterDateTime: value, getDayFirst: true);
                                            }
                                          }
                                        },
                                        );
                                      },
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                        child: SvgPicture.asset(calenderDateSvg,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                            ],
                          ),
                        if(selectedFMOPos2 == 1)
                          SizedBox(height: 2.h),
                      ],
                    ),
                  ),
                  Center(
                    child: BaseButton(btnType: mediumLargeButton,title: translate(context).notify, onPressed: (){
                      if (formKey.currentState?.validate()??false) {
                        Get.back();
                      }
                      // Get.to(const DeactivationDetailScreen());
                    },borderRadius: 20,),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
