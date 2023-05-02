import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/star_attendance_screen/classroom_view/confirmation_popup.dart';
import 'package:staff_app/view/transportation_screen/activation_request_detail_screen.dart';

class DeactivationDetailScreen extends StatefulWidget {
  const DeactivationDetailScreen({Key? key}) : super(key: key);

  @override
  State<DeactivationDetailScreen> createState() => _DeactivationDetailScreenState();
}

class _DeactivationDetailScreenState extends State<DeactivationDetailScreen> {
  TextEditingController dateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).deactivation_details),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: BaseColors.borderColor)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: BaseColors.primaryColor),
                        ),
                        child: SvgPicture.asset(manSvg,),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text('Nawaz Alam', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                            const Divider(
                              color: BaseColors.borderColor,
                              height: 8.0,
                              thickness: 1.0,
                            ),
                            Text('#632541', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                            const Divider(
                              color: BaseColors.borderColor,
                              height: 8.0,
                              thickness: 1.0,
                            ),
                            buildInfoItems(translate(context).blood_type, 'A+'),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: BaseColors.backgroundColor,
                                // boxShadow: [getDeepBoxShadow()],
                                border: Border.all(
                                    color: BaseColors.primaryColor,
                                    width: 1.5),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1, vertical: 4),
                              child: Center(
                                child: Text(
                                  translate(context).deactivated.toUpperCase(),
                                  style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 12.sp),),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          GestureDetector(
                              onTap: (){
                                showScanQrDialogue(context, false);
                              },child: SvgPicture.asset(qrCodeSvg, height: 5.h,))
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: buildInfoItems(translate(context).deactivation_date, "12-07-2022"),),
                      ),
                      Container(
                        height: 20,
                        width: 1,
                        color: BaseColors.borderColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: buildInfoItems(translate(context).time, "9:30 am"),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(translate(context).deactivation_reason, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
            SizedBox(
              height: .5.h,
            ),
            Text("Suspected to have Covid-19 symptoms and is deactivated for the awareness of the students.", style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, height: 1.5),),
            SizedBox(
              height: 2.h,
            ),
            Text(translate(context).required_evidence, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
            SizedBox(
              height: .5.h,
            ),
            Text("1. RT- PCR Report", style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, height: 1.5),),
            SizedBox(
              height: 2.h,
            ),
            const Divider(),
            SizedBox(
              height: 1.h,
            ),
            Text(translate(context).note_for_activation_please_upload_the_required_evidence, style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, height: 1.5, color: BaseColors.textLightGreyColor),),
            SizedBox(
              height: 1.h,
            ),
            Text(translate(context).medical_certificate, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      CustomTextField(controller: dateCtrl, hintText: "dd/mm/yyyy   -  hh:mm", borderRadius: 3.0,
                      readOnly: true,
                        onTap: (){
                          selectDate(context);
                        },
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: SvgPicture.asset(calenderDateSvg,),
                      ),),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(controller: dateCtrl,
                        contentPadding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
                        hintText: "Health Certificate for 23/04/2022 Reason: Absent", borderRadius: 3.0, suffixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: SvgPicture.asset("assets/images/tick_img.svg"),
                      ),),
                      SizedBox(
                        height: 1.h,
                      ),
                      CustomTextField(controller: dateCtrl, hintText: translate(context).upload_file, borderRadius: 3.0,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: SvgPicture.asset("assets/images/upload_icon.svg",),
                      ),),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Text("Medical_Sania.jpeg", style: Style.montserratMediumStyle().copyWith(fontSize: 14.sp),),
                      Text("${translate(context).photo_uploaded}\n132KB", style: Style.montserratMediumStyle().copyWith(fontSize: 14.sp, color: const Color(0xff1C6BA4)),textAlign: TextAlign.center,),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Center(child: BaseButton(removeHorizontalPadding: true, title: translate(context).request_for_activation, onPressed: (){
              showGeneralDialog(
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return ConfirmationDialog(msg: translate(context).your_request_for_account_activation_sent_to_School_admin_will_be_notified_soon,isShowBtn: false,);
                },
              ).then((value){
                Get.to(const ActivationRequestDetailScreen());
              });
            }))
          ],
        ),
      ),
    );
  }
}
