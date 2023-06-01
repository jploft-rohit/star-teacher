import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/my_profile_screen/medical_report_view/add_medical_file_popup.dart';
import 'package:staff_app/view/my_profile_screen/medical_report_view/medical_report_view_ctrl.dart';
import 'package:staff_app/view/salary_slip_screen/salary_slip_poup.dart';

class MedicalReportView extends StatefulWidget {
  const MedicalReportView({Key? key}) : super(key: key);

  @override
  State<MedicalReportView> createState() => _MedicalReportViewState();
}

class _MedicalReportViewState extends State<MedicalReportView> {
  int useCanteenServicesPos = 1;
  var yesNoList = [];
  int allergicSelectedPos = 1;
  List<String> allergyFoodList = [];
  final selectedAllergicFoodList = <String>[];

  String bloodTransfusionValue = translate(Get.context!).yes;
  String hospitalizationValue = translate(Get.context!).yes;

  var currentlyUsingList = [];

  final selectedCurrentlyUsingList = <String>[];

  TextEditingController familyHistoryController = TextEditingController();

  var medicalExaminationConsent =
      'According to the Health Authority Regulations, all staff members are required to undergo a medical examination.\n\nThe examination is carried out by the school doctor and includes measurement of height and weight, screening of vision and examination of ears, throat, heart, lungs and abdomen.\n\nIf you prefer to be examined by a doctor of your choice, you may do so at your convenience. The school requires a copy of the medical report to keep on your school health file.\n\nPlease tick below and we will contact you when you’re scheduled for examination.';
  bool isConsentChecked = true;
  bool isMedicationPolicyChecked = true;
  bool isSicknessPolicyChecked = true;
  var medicationPolicy =
      'Medication prescribed by your doctor that needs to be given during the school day should be administered by the school nurse. You are required to hand in the medication with the written prescription from the doctor and sign a specific consent form available at the clinic. If you have asthma, allergies or other conditions requiring the use of inhalers, nebulizers, Epipen or other medication we require such medication to be kept in the clinic in order to be given in an emergency situation.';
  int allergicMedicationSelectedPos = 0;
  var sicknessPolicy =
      'If a staff member has a fever, diarrhea or vomiting, they are not allowed to attend school and may only return after 24 to 48 hours from the last episode of diarrhea, vomiting, fever or fever-reducing medication. If they develop the above symptoms while in school, they are required to leave the school premises immediately. In cases of communicable and infectious diseases or conditions, the school clinic should be notified as per Health Authority Regulation and a medical certificate that the staff member is fit to be in school has to be provided.';

  TextEditingController allergicMedicineController = TextEditingController();
  bool isShowMedicalSurvey = false;
  bool isShowMedicalRecord = false;
  int radioButtonValue = 0;

  int radioButtonValue1 = 0;
  MedicalReportViewCtrl controller = Get.put(MedicalReportViewCtrl());
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    yesNoList = [translate(context).yes, translate(context).no];
    currentlyUsingList = [
      translate(context).braces,
      translate(context).crutches,
      translate(context).eyeglass_contact_lenses,
    ];
    allergyFoodList = [
      translate(context).crustacean_shellfish,
      translate(context).egg,
      translate(context).fish,
      translate(context).milk,
      translate(context).peanut,
      translate(context).soy,
      translate(context).tree_nuts,
      translate(context).wheat,
      translate(context).cereals_gluten,
      translate(context).sulfites,
      translate(context).buckwheat,
      translate(context).celery,
      translate(context).lupin,
      translate(context).molluscan_shellfish,
      translate(context).mustard_sesame,
      translate(context).bee_pollen_propolis,
      translate(context).beef,
      translate(context).chicken,
      translate(context).latex_Natural_rubber,
      translate(context).mango,
      translate(context).peach,
      translate(context).pork,
      translate(context).royal_jelly,
      translate(context).tomato,
    ];
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).medical_records),
      floatingActionButton: Visibility(
        visible: isShowMedicalRecord,
        child: BaseFloatingActionButton(
          onTap: () {
            showGeneralDialog(
              context: context,
              pageBuilder:  (context, animation, secondaryAnimation) {
                return const AddMedicalFilePopup();
              },
            );
          },
          title: translate(context).add_medical_record,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: BaseColors.borderColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: BaseColors.primaryColor),
                            ),
                            child: SvgPicture.asset(
                              manSvg,
                            ),
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
                                  color: Color(0xffEBEBEB),
                                  height: 5.0,
                                  thickness: 1.0,
                                  endIndent: 40,
                                ),
                                Text('#632541', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                                const Divider(
                                  color: Color(0xffEBEBEB),
                                  height: 5.0,
                                  thickness: 1.0,
                                  endIndent: 40,
                                ),
                                buildInfoItems(translate(context).blood_type, 'A+'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 6),
                    Column(
                      children: [
                        // buildDeactivated(),
                        const SizedBox(height: 5,),
                        GestureDetector(onTap: (){
                          showScanQrDialogue(context, false);
                        },child: SvgPicture.asset(qrCodeSvg, height: 5.h,))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              buildMedicalSurvey(context),
              SizedBox(height: 2.h,),
              buildMedicalRecords(context),
              SizedBox(height: 2.h,),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildMedicalSurvey(BuildContext context){
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: BaseColors.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Padding(
        padding:
        const EdgeInsetsDirectional.only(start: 20, end: 10),
        child: Theme(
          data: Theme.of(context)
              .copyWith(dividerColor: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    isShowMedicalSurvey = !isShowMedicalSurvey;
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translate(context).medical_survey, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),),
                        Row(
                          children: [
                            if(isShowMedicalSurvey)
                            GestureDetector(
                              onTap: () {
                                isShowMedicalSurvey = false;
                                setState(() {});
                              },
                              child: buildSaveButton(),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Icon(isShowMedicalSurvey ? Icons.keyboard_arrow_down :CupertinoIcons.forward, size:isShowMedicalSurvey? 25 : 20,color: BaseColors.primaryColor,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if(isShowMedicalSurvey)
                SizedBox(
                  height: 1.5.h,
                ),
                if(isShowMedicalSurvey)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 1.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //medical History
                        Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(translate(context).medical_history,style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),)),

                        const Divider(
                          color: BaseColors.borderColor,
                          thickness: 1.0,
                        ),


                        Container(
                          color: Colors.white,
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(3),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                  children: [
                                    Center(child: Text(translate(context).infectious_diseases,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),)),
                                    Center(child: Text(translate(context).yes.toUpperCase(),style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),)),
                                    Center(child: Text(translate(context).no.toUpperCase(),style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),)),
                                    Center(child: Text(translate(context).details.toUpperCase(),style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),)),
                                  ]),
                            ],
                          ),
                        ),


                        SizedBox(height: 2.h),

                        GetBuilder<MedicalReportViewCtrl>(
                          builder: (controller) {
                            return ListView.builder(
                              itemCount: controller.infectiousDiseaseList.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  color: Colors.white,
                                  child: Table(
                                    border: TableBorder(
                                      top: BorderSide(width: 1, color: BaseColors.borderColor),
                                      verticalInside: BorderSide(width: 1, color: BaseColors.borderColor),
                                      // bottom: BorderSide(width: 1, color: Colors.black),
                                    ),
                                    columnWidths: const {
                                      0: FlexColumnWidth(3),
                                      1: FlexColumnWidth(1),
                                      2: FlexColumnWidth(1),
                                      3: FlexColumnWidth(2),
                                    },
                                    children: [
                                      TableRow(
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
                                              child: Text(controller.infectiousDiseaseList[index]['title'], style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: radioButtonTitleTs),),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(vertical: 0.h),
                                              child: Radio(
                                                  toggleable: true,
                                                  activeColor: BaseColors.primaryColor, fillColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                                                  focusColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                                                  overlayColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                                                  value: index,
                                                  groupValue: controller.infectiousDiseaseList[index]['isSelected'],
                                                  onChanged: (index1) {
                                                    controller.infectiousDiseaseList[index]['isSelected1'] = -1;
                                                    controller.infectiousDiseaseList[index]['isSelected'] = int.tryParse(index1.toString()) ?? 0;
                                                    controller.update();
                                                  }),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(vertical: 0.h),
                                              child: SizedBox(
                                                width : 10.w,
                                                child: Radio(
                                                  activeColor: BaseColors.primaryColor,
                                                  fillColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                                                  focusColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                                                  overlayColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                                                  toggleable: true,
                                                  value: index, groupValue: controller.infectiousDiseaseList[index]['isSelected1'],
                                                  onChanged: (index1) {
                                                    print("adfasf1: $index1");
                                                    controller.infectiousDiseaseList[index]['isSelected'] = -1;
                                                    controller.infectiousDiseaseList[index]['isSelected1'] = int.tryParse(index1.toString()) ?? 0;
                                                    controller.update();
                                                  },
                                                ),
                                              ),
                                            ),
                                            controller.infectiousDiseaseList[index]['isSelected'] >= 0 ?
                                            Padding(
                                              padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
                                              child: SvgPicture.asset(uploadDocSvg,),
                                            ) : const SizedBox(),
                                          ]),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),

                        SizedBox(height: 2.h,),

                        Center(
                          child: GestureDetector(
                            onTap: (){},
                            child: buildSaveButton(),
                          ),
                        ),

                        const Divider(
                          color: BaseColors.borderColor,
                          thickness: 1.0,
                        ),
                        SizedBox(height: 2.h,),
                        Container(
                          color: Colors.white,
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(3),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(children: [
                                Center(child: Text(translate(context).disease_condition,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),)),
                                Center(child: Text(translate(context).yes.toUpperCase(),style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),)),
                                Center(child: Text(translate(context).no.toUpperCase(),style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),)),
                                Center(child: Text(translate(context).details.toUpperCase(),style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),)),
                              ]),
                            ],
                          ),
                        ),

                        SizedBox(height: 2.h,),

                        GetBuilder<MedicalReportViewCtrl>(
                          builder: (controller) {
                            return ListView.builder(
                              itemCount: controller.diseaseConditionList.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  color: Colors.white,
                                  child: Table(
                                    border: TableBorder(
                                      top: BorderSide(width: 1, color: BaseColors.borderColor),
                                      verticalInside: BorderSide(width: 1, color: BaseColors.borderColor),
                                      // bottom: BorderSide(width: 1, color: Colors.black),
                                    ),

                                    columnWidths: const {
                                      0: FlexColumnWidth(3),
                                      1: FlexColumnWidth(1),
                                      2: FlexColumnWidth(1),
                                      3: FlexColumnWidth(2),
                                    },
                                    children: [
                                      TableRow(
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
                                              child: Text(controller.diseaseConditionList[index]['title'],style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: radioButtonTitleTs),),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(vertical: 0.h),
                                              child: Radio(
                                                  toggleable: true,
                                                  activeColor: BaseColors.primaryColor, fillColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                                                  focusColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                                                  overlayColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                                                  value: index, groupValue: controller.diseaseConditionList[index]['isSelected'],
                                                  onChanged: (index1) {
                                                    controller.diseaseConditionList[index]['isSelected1'] = -1;
                                                    controller.diseaseConditionList[index]['isSelected'] = int.tryParse(index1.toString()) ?? 0;
                                                    controller.update();
                                                  }),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(vertical: 0.h),
                                              child: SizedBox(
                                                width : 10.w,
                                                child: Radio(
                                                    activeColor: BaseColors.primaryColor, fillColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                                                    focusColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                                                    overlayColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                                                    toggleable: true,
                                                    value: index, groupValue: controller.diseaseConditionList[index]['isSelected1'], onChanged: (index1) {
                                                  controller.diseaseConditionList[index]['isSelected'] = -1;
                                                  controller.diseaseConditionList[index]['isSelected1'] = int.tryParse(index1.toString()) ?? 0;
                                                  controller.update();
                                                }),
                                              ),
                                            ),
                                            controller.diseaseConditionList[index]['isSelected'] >= 0 ?
                                            Padding(
                                              padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
                                              child: SvgPicture.asset(uploadDocSvg,),
                                            ) : const SizedBox(),
                                          ]),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(height: 2.h,),

                        Center(
                          child: GestureDetector(
                            onTap: (){},
                            child: buildSaveButton(),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text('${translate(context).history_of} :',style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                        ),
                        Row(
                          children: [

                            Expanded(
                                flex: 3,
                                child: Text('${translate(context).blood_transfusion} :',style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: radioButtonTitleTs),)),

                            Flexible(
                              flex: 2,
                              child: RadioButton(
                                  description: translate(Get.context!).yes,
                                  value: translate(Get.context!).yes,
                                  groupValue: bloodTransfusionValue,
                                  fillColor: BaseColors.primaryColor,
                                  activeColor: BaseColors.primaryColor,
                                  onChanged: (value) {
                                    bloodTransfusionValue = value.toString();
                                    setState(() {});
                                  }
                              ),
                            ),

                            Flexible(
                              flex: 2,
                              child: RadioButton(
                                  description: translate(Get.context!).no,
                                  value: translate(Get.context!).no,
                                  groupValue: bloodTransfusionValue,
                                  fillColor: BaseColors.primaryColor,
                                  activeColor: BaseColors.primaryColor,
                                  onChanged: (value) {
                                    bloodTransfusionValue = value.toString();
                                    setState(() {});
                                  }
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            SvgPicture.asset(uploadDocSvg,color: bloodTransfusionValue == translate(Get.context!).no ? BaseColors.white : null,),
                          ],
                        ),
                        Divider(
                          color: BaseColors.borderColor.withOpacity(0.5),
                          thickness: 2,
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text('${translate(context).hospitalization} :',style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: radioButtonTitleTs),)),
                            Flexible(
                              flex: 2,
                              child: RadioButton(
                                  description: translate(Get.context!).yes,
                                  value: translate(Get.context!).yes,
                                  groupValue: hospitalizationValue,
                                  fillColor: BaseColors.primaryColor,
                                  activeColor: BaseColors.primaryColor,
                                  onChanged: (value) {
                                    hospitalizationValue = value.toString();
                                    setState(() {});
                                  }
                              ),
                            ),

                            Flexible(
                              flex: 2,
                              child:RadioButton(
                                  description: translate(Get.context!).no,
                                  value: translate(Get.context!).no,
                                  groupValue: hospitalizationValue,
                                  fillColor: BaseColors.primaryColor,
                                  activeColor: BaseColors.primaryColor,
                                  onChanged: (value) {
                                    hospitalizationValue = value.toString();
                                    setState(() {});
                                  }
                              ),
                            ),
                            // Spacer(),
                            SizedBox(
                              width: 2.w,
                            ),
                            SvgPicture.asset(uploadDocSvg,color: hospitalizationValue == translate(Get.context!).no ? BaseColors.white : null,),


                          ],
                        ),
                        Divider(
                          color: BaseColors.borderColor.withOpacity(0.5),
                          thickness: 2,
                          height: 1.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                flex: 1,
                                child: Container(
                                    margin: EdgeInsets.only(top: 1.5.h),
                                    child: Text('${translate(context).currently_using} :',style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),))),
                            Flexible(
                              flex: 1,
                              child: ListView.builder(
                                itemCount: currentlyUsingList.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (_, int index) {
                                  return CheckboxListTile(
                                    contentPadding: EdgeInsets.zero,
                                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                    activeColor: BaseColors.backgroundColor,
                                    checkColor: BaseColors.primaryColor,
                                    dense: true,
                                    checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                    side: MaterialStateBorderSide.resolveWith(
                                          (states) => const BorderSide(width: 1.0, color: BaseColors.primaryColor,),
                                    ),
                                    title: Text(currentlyUsingList[index],style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                                    value: selectedCurrentlyUsingList.contains(currentlyUsingList[index]),
                                    onChanged: (_) {
                                      if (selectedCurrentlyUsingList.contains(currentlyUsingList[index])) {
                                        selectedCurrentlyUsingList.remove(currentlyUsingList[index]);  // unselect
                                      } else {
                                        selectedCurrentlyUsingList.add(currentlyUsingList[index]); // select
                                      }
                                      setState(() {});
                                    },
                                    controlAffinity: ListTileControlAffinity.leading,
                                  );
                                },
                              ),)
                          ],
                        ),

                        const Divider(
                          color: BaseColors.borderColor,
                          thickness: 1.0,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: (){},
                            child: buildSaveButton(),
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text('${translate(context).family_history} :', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                        ),
                        SizedBox(height: 1.h,),
                        Text('Heart Disease/Diabetes/Hypertension/Mental Disorder/Stroke/Tuberculosis. Others, specify', style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp, fontWeight: FontWeight.w500),),
                        SizedBox(height: 1.h,),

                        Container(
                          height: 10.h,
                          decoration: getEditTextDecoration(),
                          child: CustomTextField(controller: familyHistoryController, hintText: "My grandfather has diabetes", borderColor: Colors.transparent,hintTxtSize: 15.sp,),
                        ),
                        SizedBox(height: 1.h,),
                        Center(
                          child: GestureDetector(
                            onTap: (){},
                            child: buildSaveButton(),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        // // Align(alignment: Alignment.topLeft,
                        // //   child: Text('Medical Examination Consent', style: Style.montserratBoldStyle().copyWith(color: CustomColors.primaryColor, fontSize: 15.sp),),),
                        // // Divider(
                        // //   color: CustomColors.borderColor,
                        // //   thickness: 1.0,
                        // // ),
                        // SizedBox(height: 2.h,),
                        // Align(
                        //   alignment: Alignment.topRight,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //
                        //     },
                        //     child: buildSaveButton(),
                        //   ),
                        // ),

                        Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(translate(context).medical_examination_consent, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),)),
                        SizedBox(height: 1.h,),
                        Text(medicalExaminationConsent, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                        const Divider(
                          color: BaseColors.borderColor,
                          thickness: 1.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: BaseColors.primaryColor,
                              value: isConsentChecked,

                              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                              side: const BorderSide(color: BaseColors.primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              onChanged: (bool? value) {
                                isConsentChecked = value!;
                              },
                            ),

                            Text(translate(context).i_agree_to_attend_the_school_examination, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),)
                          ],
                        ),
                        SizedBox(height: 1.h,),
                        Center(
                          child: GestureDetector(
                            onTap: (){},
                            child: buildSaveButton(),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(translate(context).medication_policy, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),)),
                        const Divider(
                          color: BaseColors.borderColor,
                          thickness: 1.0,
                        ),
                        SizedBox(height: 1.h,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: BaseColors.primaryColor,
                              value: isMedicationPolicyChecked,

                              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                              side: const BorderSide(color: BaseColors.primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              onChanged: (bool? value) {
                                isMedicationPolicyChecked = value!;
                                setState(() {});
                              },
                            ),

                            Text(translate(context).i_agree_with, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),

                          ],
                        ),

                        SizedBox(height: 1.h,),
                        Text(medicationPolicy, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                        SizedBox(height: 1.h,),
                        Container(
                          width: 100.w,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(color: BaseColors.primaryColor),
                              color: BaseColors.white,
                              boxShadow: [getBoxShadow()],
                              borderRadius: BorderRadius.circular(15.0)
                          ), child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(translate(context).are_you_allergic_to_any_medication, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                            SizedBox(height: 1.h,),
                            SizedBox(
                              height: 4.h,
                              child: ListView.builder(
                                itemCount: yesNoList.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      allergicMedicationSelectedPos = index;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 4.h,
                                      width: 20.w,
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: allergicMedicationSelectedPos == index ? getPrimaryDecoration() : getEditTextDecoration(),
                                      child: Center(child: Text(yesNoList[index], style: Style.montserratBoldStyle().copyWith(color: allergicMedicationSelectedPos == index ? BaseColors.primaryColor : BaseColors.borderColor, fontSize: 15.sp),)),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            Visibility(visible: allergicMedicationSelectedPos == 0,child: CustomTextField(controller: allergicMedicineController, hintText: translate(context).type_here)),
                          ],
                        ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {

                            },
                            child: buildSaveButton(),
                          ),
                        ),




                        SizedBox(height: 2.h,),

                        Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(translate(context).sickness_exclusion_policy, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),)),
                        const Divider(
                          color: BaseColors.borderColor,
                          thickness: 1.0,
                        ),
                        SizedBox(height: 1.h,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: BaseColors.primaryColor,
                              value: isSicknessPolicyChecked,

                              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                              side: const BorderSide(color: BaseColors.primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              onChanged: (bool? value) {
                                isSicknessPolicyChecked = value!;
                              },
                            ),

                            Text(translate(context).i_agree_to, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                          ],
                        ),
                        SizedBox(height: 1.h,),
                        Text(sicknessPolicy, style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                        Divider(color: Colors.grey.shade300,height: 3.h),
                        Center(
                          child: GestureDetector(
                            onTap: (){},
                            child: buildSaveButton(),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(translate(context).do_you_want_to_use_school_canteen_services, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                            SizedBox(height: 2.h,),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 4.h,
                                    child: ListView.builder(
                                      itemCount: yesNoList.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return GestureDetector (
                                          onTap: (){
                                            useCanteenServicesPos = 1;
                                            allergicSelectedPos = index;
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 4.h,
                                            width: 20.w,
                                            alignment: Alignment.centerLeft,
                                            margin: const EdgeInsets.only(right: 10),
                                            decoration: allergicSelectedPos == index ? getPrimaryDecoration() : getEditTextDecoration(),
                                            child: Center(child: Text(yesNoList[index], style: Style.montserratRegularStyle().copyWith(color: allergicSelectedPos == index ? BaseColors.primaryColor : BaseColors.borderColor, fontSize: 15.sp),)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Visibility(
                                    visible: allergicSelectedPos == 0,
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 20,bottom: 20,right: 10),
                                      padding: const EdgeInsets.all(20),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: BaseColors.primaryColor),
                                        color: BaseColors.white,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ), child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(translate(context).are_you_allergic_to_any_food,style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                                        SizedBox(height: 1.h,),
                                        SizedBox(
                                          height: 4.h,
                                          child: ListView.builder(
                                            itemCount: yesNoList.length,
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return GestureDetector (
                                                onTap: (){
                                                  useCanteenServicesPos = index;
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: 4.h,
                                                  width: 20.w,
                                                  margin: const EdgeInsets.only(right: 10),
                                                  decoration: useCanteenServicesPos == index ? getPrimaryDecoration() : getEditTextDecoration(),
                                                  child: Center(child: Text(yesNoList[index], style: Style.montserratRegularStyle().copyWith(color: useCanteenServicesPos == index ? BaseColors.primaryColor : BaseColors.borderColor, fontSize: 15.sp),)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 1.h,),
                                        Visibility(
                                          visible: useCanteenServicesPos == 0,
                                          child: ListView.builder(
                                            itemCount: allergyFoodList.length,
                                            physics: const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (_, int index) {
                                              return CheckboxListTile(
                                                contentPadding: EdgeInsets.zero,
                                                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                                                activeColor: BaseColors.backgroundColor,
                                                checkColor: BaseColors.primaryColor,
                                                dense: true,
                                                checkboxShape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(2.0),
                                                ),
                                                side: MaterialStateBorderSide.resolveWith(
                                                      (states) => const BorderSide(width: 1.0, color: BaseColors.primaryColor,),
                                                ),
                                                title: Text(allergyFoodList[index],style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 15.sp),),
                                                value: selectedAllergicFoodList.contains(allergyFoodList[index]),
                                                onChanged: (_) {
                                                  if (selectedAllergicFoodList.contains(allergyFoodList[index])) {
                                                    selectedAllergicFoodList.remove(allergyFoodList[index]);  // unselect
                                                  } else {
                                                    selectedAllergicFoodList.add(allergyFoodList[index]); // select
                                                  }
                                                  setState(() {});
                                                },
                                                controlAffinity: ListTileControlAffinity.leading,
                                              );
                                            },
                                          ),
                                        ),

                                        Visibility(
                                          visible: useCanteenServicesPos == 0,
                                          child: Center(child: GestureDetector(
                                            onTap: () {
                                            },
                                            child: buildSaveButton(),
                                          )),
                                        )
                                      ],
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMedicalRecords(BuildContext context){
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: BaseColors.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Padding(
        padding:
        const EdgeInsetsDirectional.only(start: 20, end: 10),
        child: Theme(
          data: Theme.of(context)
              .copyWith(dividerColor: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    isShowMedicalRecord = !isShowMedicalRecord;
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          translate(context).medical_records, style: Style.montserratBoldStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 16.sp),),

                        Icon(isShowMedicalRecord ? Icons.keyboard_arrow_down :CupertinoIcons.forward, size:isShowMedicalRecord? 25 : 20,color: BaseColors.primaryColor,),

                      ],
                    ),
                  ),
                ),
                if(isShowMedicalRecord)
                Column(
                  children: List.generate(2, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, left: 0, right: 0, top: 5),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 1.h,),
                              buildInfoItems(translate(context).time, "Food Allergy"),
                              Container(
                                width: Get.width,
                                height: 1,
                                margin: const EdgeInsets.only(top: 8, bottom: 8),
                                color: BaseColors.borderColor,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset("assets/images/report.svg"),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Flexible(child: buildInfoItems(translate(context).deactivation_reason, "Suspected to have Covid-19 symptoms and is deactivated for the awareness of the students."))
                                ],
                              ),
                              Container(
                                width: Get.width,
                                height: 1,
                                margin: const EdgeInsets.only(top: 8, bottom: 8),
                                color: BaseColors.borderColor,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset("assets/images/Vector (1).svg"),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Flexible(child: buildInfoItems(translate(context).due_date, "12/07/2022"))
                                ],
                              ),
                              Container(
                                width: Get.width,
                                height: 1,
                                margin: const EdgeInsets.only(top: 8, bottom: 8),
                                color: BaseColors.borderColor,
                              ),
                              GestureDetector(
                                onTap: (){
                                  showGeneralDialog(
                                    context: context,
                                    pageBuilder:  (context, animation, secondaryAnimation) {
                                      return OpenPdfPopup(title: translate(context).document_support);
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('medication.doc', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp)),
                                    Row(
                                      children: [
                                        GestureDetector(
                                            onTap: (){
                                              showGeneralDialog(
                                                context: context,
                                                pageBuilder:  (context, animation, secondaryAnimation) {
                                                  return OpenPdfPopup(title: translate(context).document_support);
                                                },
                                              );
                                            },child: Icon(Icons.remove_red_eye_outlined,color: BaseColors.primaryColor,size: 20.sp,)),
                                        const SizedBox(width: 10,),
                                        Icon(Icons.download_for_offline,color: BaseColors.primaryColor,size: 20.sp,)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.h,),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildSaveButton(){
    return Container(
      width: 20.w,
      decoration: BoxDecoration(
          color: BaseColors.backgroundColor,
          // boxShadow: [getDeepBoxShadow()],
          border: Border.all(
              color: BaseColors.primaryColor,
              width: 1.5),
          borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 4),
        child: Center(
          child: Text(
            translate(context).save_small, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
        ),
      ),
    );
  }

  Widget buildDeactivated(){
    return Container(
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
            translate(context).deactivated,
            style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 13.sp)),
        ),
      ),
    );
  }

  Decoration getEditTextDecoration(){
    return BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: BaseColors.borderColor),
        color: BaseColors.white);
  }

  Decoration getPrimaryDecoration(){
    return BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: BaseColors.primaryColor),
        color: BaseColors.backgroundColor);
  }
}
