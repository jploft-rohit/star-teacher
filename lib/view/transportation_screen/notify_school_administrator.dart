import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_button.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/transportation_screen/deactivation_detail_screen.dart';

class NotifySchoolAdministratorPopup extends StatefulWidget {
  const NotifySchoolAdministratorPopup({Key? key}) : super(key: key);

  @override
  State<NotifySchoolAdministratorPopup> createState() => _NotifySchoolAdministratorPopupState();
}

class _NotifySchoolAdministratorPopupState extends State<NotifySchoolAdministratorPopup> {
  int selectedFMOPos = 0;
  int selectedFMOPos1 = 0;

  TextEditingController startDateCtrl = TextEditingController();
  TextEditingController startDateCtrl1 = TextEditingController();
  TextEditingController endDateCtrl = TextEditingController();
  TextEditingController endDateCtrl1 = TextEditingController();

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
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                  decoration: BoxDecoration(
                    color: BaseColors.backgroundColor,
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Text(translate(context).going_to_school_by_my_own_vehicle, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
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
                    InkWell(
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
                SizedBox(
                  height: 2.h,
                ),
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
                              selectDate(context);
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
                              selectDate(context);
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
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                  decoration: BoxDecoration(
                      color: BaseColors.backgroundColor,
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  child: Text(translate(context).going_back_to_home_by_my_own_vehicle, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
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
                    InkWell(
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
                SizedBox(
                  height: 2.h,
                ),
                if(selectedFMOPos1 == 1)
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
                              controller: startDateCtrl1,
                              hintText: "dd/mm/yyyy",
                              borderRadius: 5.0,
                              hintTxtSize: textFormFieldHintTs,
                              readOnly: true,
                              onTap: (){
                                selectDate(context);
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
                                selectDate(context);
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
                  SizedBox(
                    height: 2.h,
                  ),
                Center(
                  child: BaseButton(btnType: dialogButton,title: translate(context).notify, onPressed: (){
                    Get.back();
                    Get.to(const DeactivationDetailScreen());
                  }, btnWidth: 30.w),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
