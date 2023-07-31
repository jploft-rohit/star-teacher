import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/medical_record_responses/disease_model.dart';
import 'package:staff_app/backend/responses_model/medical_record_responses/drop_down_model.dart';
import 'package:staff_app/backend/responses_model/medical_record_responses/medical_record_model.dart';
import 'package:staff_app/backend/responses_model/my_profile_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_floating_action_button.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_loader.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_qr.dart';
import 'package:staff_app/utility/base_views/textfieldwidget.dart';
import 'package:staff_app/utility/constant_images.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';
import 'package:staff_app/view/my_profile_screen/new_medical_report_screen/controller/medical_record_controller.dart';

import '../../../utility/base_utility.dart';
import '../../../utility/images_icon_path.dart';
import '../../../utility/sizes.dart';

class MedicalRecordView extends StatefulWidget {
  final Data? headerData;
  const MedicalRecordView({super.key, this.headerData});

  @override
  State<MedicalRecordView> createState() => _MedicalRecordViewState();
}

class _MedicalRecordViewState extends State<MedicalRecordView> {
  MedicalRecordController controller = Get.put(MedicalRecordController());
  MyProfileCtrl myProfileCtrl = Get.find<MyProfileCtrl>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: floatingActionButton(() {
      //   showAddMedicalFilesDialogue(context);
      // }, 'Add Health\nRecord'),
      floatingActionButton: Obx(
            () => controller.selectindex.value == 2
            ? BaseFloatingActionButton(
          title: 'Add Medical\nRecord',
          onTap: (() {
            controller.medicalRecordTitle.clear();
            controller.medicalRecordDescription.clear();
            controller.medicalRecordDate.clear();
            controller.medicalRecordFile.clear();
            BaseOverlays().showAddMedicalFilesDialogue(
              context,
              formKey: controller.medicalRecordFormKey,
              titleController: controller.medicalRecordTitle,
              descriptionController: controller.medicalRecordDescription,
              dateController: controller.medicalRecordDate,
              fileController: controller.medicalRecordFile,
              action: controller.addMedicalRecord,
            );
          }),
        )
            : SizedBox.shrink(),
      ),
      backgroundColor: BaseColors.white,
      appBar: BaseAppBar(title: 'Medical Records'),
      body: Obx(
            () => controller.loading.value
            ? BaseLoader()
            : SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: marginSymetric(20, 4),
                    width: 100.w,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: BaseColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: BaseColors.lightGreyColor),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                SizedBox(height:1.h),
                                GestureDetector(
                                  onTap: () {
                                    // Get.toNamed(Routes.starProfileView);
                                    // showStarRatingDialogue(context);
                                  },
                                  child: Container(
                                    height: 8.h,
                                    width: 8.h,
                                    padding: marginSymetric(6, 6),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: BaseColors
                                                .primaryColor)),
                                    child: BaseImageNetwork(
                                      link: myProfileCtrl.response.value.data?.profilePic??"",
                                      errorWidget: SvgPicture.asset(manSvg),
                                    ),
                                  ),
                                ),
                                SizedBox(height:1.h),
                              ],
                            ),
                            SizedBox(width:1.5.h),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height:1.5.h),
                                  addText(
                                      myProfileCtrl.response.value.data?.name ?? 'N/A',
                                      detailValueTs,
                                      BaseColors.primaryColor,
                                      FontWeight.w700),
                                  // SizedBox(height:0.5.h),
                                  buildDivider3(),
                                  addText(
                                      '#${myProfileCtrl.response.value.data?.emirateId?.toString() ?? 'N/A'}',
                                      detailValueTs,
                                      BaseColors.primaryColor,
                                      FontWeight.w700),
                                  // SizedBox(height:0.5.h),
                                  buildDivider3(),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      addText(
                                          'Blood Type : ',
                                          detailLabelTs,
                                          BaseColors.black,
                                          FontWeight.w400),
                                      addText(
                                          myProfileCtrl.response.value.data?.bloodType ?? 'N/A',
                                          detailValueTs,
                                          BaseColors.primaryColor,
                                          FontWeight.w700),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width:2.h),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                // BaseButton(
                                //     btnType: 'small',
                                //     title: 'ACTIVE',
                                //     onPressed: () {}),
                                SizedBox(height:1.h),
                                GestureDetector(
                                  onTap: () {
                                    showScanQrDialogueMedical(context, barcode: controller
                                        .starProfile?.barcode ??
                                        '');
                                  },
                                  child: BaseQr(
                                    data: controller.starProfile?.barcode ?? '',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width:1.h)
                          ],
                        ),
                        // SizedBox(height:1.h),
                      ],
                    ),
                  ),
                  // Positioned(
                  //   right: 0,
                  //   top: 5.0.h,
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       // showStarRatingDialogue(context,
                  //       //     id: controller.starProfile!.sId!);
                  //     },
                  //     child: Container(
                  //         margin: EdgeInsets.only(right: 5),
                  //         padding: EdgeInsets.all(5),
                  //         decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.circular(20),
                  //             boxShadow: kElevationToShadow[4]),
                  //         child: SvgPicture.asset(StarIcons.star2)),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: buildMedicalSurvey(context),
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: buildMedicalRecords(context),
              ),
              SizedBox(
                height: 12.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMedicalSurvey(BuildContext context) {
    var allergyFoodList = <String>[
      translate(context).crustacean_shellfish,
      translate(context).egg,
      translate(context).fish,
      translate(context).milk,
      translate(context).peanut,
      translate(context).soy,
      translate(context).tree_nuts,
      translate(context).wheat,
      "cereals_w_gluten",
      translate(context).sulfites,
      translate(context).buckwheat,
      translate(context).celery,
      translate(context).lupin,
      translate(context).molluscan_shellfish,
      "mustard",
      "sesame",
      translate(context).bee_pollen_propolis,
      translate(context).beef,
      translate(context).chicken,
      "latex_natural_rubber",
      translate(context).mango,
      translate(context).peach,
      translate(context).pork,
      "ryal_jelly",
      translate(context).tomato
    ];
    var allergyFoodSelected = <bool>[].obs;
    allergyFoodSelected = RxList.filled(allergyFoodList.length, false);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: BaseColors.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    if (controller.selectindex.value == 1) {
                      controller.selectindex.value = 0;
                    } else {
                      controller.selectindex.value = 1;
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addText('Medical Survey', get17TextFontSIze(),
                          BaseColors.black, FontWeight.bold),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Obx(() => Visibility(
                              child: saveButton(context, () {}),
                              visible: controller.selectindex.value == 1,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Obx(() => Icon(
                            controller.selectindex.value == 1
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: BaseColors.primaryColor,
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                Obx(
                      () => Visibility(
                    visible: controller.selectindex.value == 1,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height:2.h),
                          Align(
                            alignment: Alignment.topLeft,
                            child: addText(
                                'Student Medical History',
                                getNormalTextFontSIze(),
                                BaseColors.primaryColor,
                                FontWeight.w700),
                          ),
                          buildDivider(),
                          Container(
                            color: Colors.white,
                            child: Table(
                              // border: TableBorder.all(
                              //     color: BaseColors.borderColor2.withOpacity(0.5),
                              //     width: 0),
                              columnWidths: const {
                                0: FlexColumnWidth(3),
                                1: FlexColumnWidth(1),
                                2: FlexColumnWidth(1),
                                3: FlexColumnWidth(2),
                              },
                              children: [
                                TableRow(children: [
                                  addTextCenter(
                                      'INFECTIOUS DISEASES',
                                      getSmallestTextFontSIze() + 1,
                                      BaseColors.black,
                                      FontWeight.w700),
                                  addTextCenter(
                                      'YES',
                                      getSmallestTextFontSIze() + 1,
                                      BaseColors.black,
                                      FontWeight.w700),
                                  addTextCenter(
                                      'NO',
                                      getSmallestTextFontSIze() + 1,
                                      BaseColors.black,
                                      FontWeight.w700),
                                  addTextCenter(
                                      'DETAILS',
                                      getSmallestTextFontSIze() + 1,
                                      BaseColors.black,
                                      FontWeight.w700),
                                ]),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          ListView.builder(
                            itemCount: controller.diseases.value?.infection?.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.white,
                                child: Table(
                                  border: TableBorder.all(
                                      color: BaseColors.borderColor2.withOpacity(0.5),
                                      width: 1),
                                  columnWidths: const {
                                    0: FlexColumnWidth(3),
                                    1: FlexColumnWidth(1),
                                    2: FlexColumnWidth(1),
                                    3: FlexColumnWidth(2),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.h, horizontal: 2.w),
                                        child: addText(
                                            controller.diseases.value?.infection?[index].name ?? 'N/A',
                                            detailValueTs,
                                            BaseColors.black,
                                            FontWeight.normal),
                                      ),
                                      Obx(() => Padding(
                                          padding: EdgeInsets.symmetric(vertical: 2.2.h),
                                          child: InkWell(
                                              onTap: () {
                                                controller.diseases.update((val) {
                                                    val?.infection?[index].active = true;
                                                  },
                                                );
                                              },
                                              child: SvgPicture.asset(
                                                controller.diseases.value?.infection?[index].active ?? false
                                                    ? StarIcons.radioFilled
                                                    : StarIcons.radioUnfilled,
                                                height: 2.h,
                                              )),
                                        ),
                                      ),
                                      Obx(() => Padding(
                                        padding: EdgeInsets.symmetric(vertical: 2.2.h),
                                        child: InkWell(
                                          onTap: () {
                                            print('no');
                                            controller.diseases.update((val) {
                                                val?.infection?[index].active = false;
                                              },
                                            );
                                            controller.addOrUpdateDisease(controller.diseases.value?.infection?[index]);
                                          },
                                          child: SvgPicture.asset(
                                            controller.diseases.value?.infection?[index].active ?? false
                                                ? StarIcons.radioUnfilled
                                                : StarIcons.radioFilled,
                                            height: 2.h,
                                          ),
                                        ),
                                      )),
                                      Obx(
                                            () => Visibility(
                                          visible: controller.diseases.value?.infection?[index].active ?? false,
                                          child: InkWell(
                                            onTap: () {
                                              showMediaPickerDialog(
                                                      (fileName, filePath) {
                                                    controller.diseases.update(
                                                          (val) {
                                                        val?.infection?[index].document = filePath;
                                                      },
                                                    );
                                                    controller.addOrUpdateDisease(
                                                        controller.diseases.value
                                                            ?.infection?[index]);
                                                  });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.h,
                                                  horizontal: 2.w),
                                              child: iconButton(() {
                                                showMediaPickerDialog(
                                                        (fileName, filePath) {
                                                      controller.diseases.update(
                                                            (val) {
                                                          val?.infection?[index].document = filePath;
                                                        },
                                                      );
                                                      controller.addOrUpdateDisease(controller.diseases.value?.infection?[index]);
                                                    });
                                              }, "assets/images/upload_icon.svg"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(height:2.h),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: saveButton(context, () {
                                controller.saveDiseaseDeatils();
                              }),
                            ),
                          ),
                          SizedBox(height:2.0.h),
                          buildDivider(),
                          SizedBox(height:2.0.h),
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
                                  addText(
                                      'DISEASE/CONDITION',
                                      getSmallestTextFontSIze() + 1,
                                      BaseColors.black,
                                      FontWeight.w700),
                                  addTextCenter(
                                      'YES',
                                      getSmallestTextFontSIze() + 1,
                                      BaseColors.black,
                                      FontWeight.w700),
                                  addTextCenter(
                                      'NO',
                                      getSmallestTextFontSIze() + 1,
                                      BaseColors.black,
                                      FontWeight.w700),
                                  addTextCenter(
                                      'DETAILS',
                                      getSmallestTextFontSIze() + 1,
                                      BaseColors.black,
                                      FontWeight.w700),
                                ]),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          ListView.builder(
                            itemCount:
                            controller.diseases.value?.condition?.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.white,
                                child: Table(
                                  border: TableBorder.all(
                                      color: BaseColors.borderColor2
                                          .withOpacity(0.5),
                                      width: 1),
                                  columnWidths: const {
                                    0: FlexColumnWidth(3),
                                    1: FlexColumnWidth(1),
                                    2: FlexColumnWidth(1),
                                    3: FlexColumnWidth(2),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.h, horizontal: 2.w),
                                        child: addText(
                                            controller.diseases.value?.condition?[index].name ?? 'N/A',
                                            detailValueTs,
                                            BaseColors.black,
                                            FontWeight.normal),
                                      ),
                                      Obx(
                                            () => Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.2.h),
                                          child: InkWell(
                                              onTap: () {
                                                controller.diseases.update(
                                                      (val) {
                                                    val?.condition?[index].active = true;
                                                  },
                                                );
                                              },
                                              child: SvgPicture.asset(
                                                controller.diseases.value?.condition?[index].active ?? false
                                                    ? StarIcons.radioFilled
                                                    : StarIcons.radioUnfilled,
                                                height: 2.h,
                                              )),
                                        ),
                                      ),
                                      Obx(() => Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.2.h),
                                        child: InkWell(
                                          onTap: () {
                                            print('no');
                                            controller.diseases.update((val) {
                                                val?.condition?[index].active = false;
                                              },
                                            );
                                            controller.addOrUpdateDisease(controller.diseases.value?.condition?[index]);
                                          },
                                          child: SvgPicture.asset(
                                            controller.diseases.value?.condition?[index].active ?? false
                                                ? StarIcons.radioUnfilled
                                                : StarIcons.radioFilled,
                                            height: 2.h,
                                          ),
                                        ),
                                      )),
                                      Obx(() => Visibility(
                                          visible: controller.diseases.value?.condition?[index].active ?? false,
                                          child: InkWell(
                                            onTap: () {
                                              showMediaPickerDialog(
                                                      (fileName, filePath) {
                                                    controller.diseases.update((val) {val?.condition?[index].document = filePath;},
                                                    );
                                                    controller.addOrUpdateDisease(controller.diseases.value?.condition?[index]);
                                                  });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.h,
                                                  horizontal: 2.w),
                                              child: iconButton(() {
                                                showMediaPickerDialog(
                                                        (fileName, filePath) {
                                                      controller.diseases.update((val) {
                                                          val?.condition?[index].document = filePath;
                                                        },
                                                      );
                                                      controller.addOrUpdateDisease(controller.diseases.value?.condition?[index]);
                                                    });
                                              }, "assets/images/upload_icon.svg"),
                                            ),
                                          ))),
                                    ]),
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(height:2.h),
                          Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: saveButton(context, () {
                                controller.saveDiseaseDeatils();
                              }),
                            ),
                          ),
                          SizedBox(height:2.h),
                          Align(
                            alignment: Alignment.topLeft,
                            child: addText(
                                'History of :',
                                getNormalTextFontSIze(),
                                BaseColors.primaryColor,
                                FontWeight.bold),
                          ),
                          SizedBox(height:1.h),
                          ListView.builder(
                            itemCount:
                            controller.diseases.value?.history?.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return _buildRow2(controller.diseases.value?.history?[index]??DiseaseData());
                            },
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addText('Currently using :', detailValueTs,
                                  BaseColors.black, FontWeight.w400),
                              Expanded(
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: controller.currentlyUsingList.length,
                                  itemBuilder: (context, index) => Column(
                                    children: [
                                      Row(
                                        children: [
                                          Transform.scale(
                                            scale: 0.8,
                                            child: Container(
                                              width: 25,
                                              height: 20,
                                              child: Obx(
                                                    () => Checkbox(
                                                  materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                                  value: controller
                                                      .selectedCurrentlyUsingList
                                                      .contains(controller
                                                      .currentlyUsingList[
                                                  index]),
                                                  activeColor:
                                                  Color(0xFFF7F7F7),
                                                  checkColor: Color(0xFFC19444),
                                                  side: MaterialStateBorderSide.resolveWith((Set<MaterialState>states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .selected)) {
                                                        return const BorderSide(
                                                            color: Color(
                                                                0xFFC19444));
                                                      }
                                                      return const BorderSide(
                                                          color: Color(
                                                              0xFFC19444));
                                                    },
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(
                                                      5,
                                                    ),
                                                  ),
                                                  onChanged: (value) {
                                                    if (value??false) {
                                                      controller.selectedCurrentlyUsingList.add(controller.currentlyUsingList[index]);
                                                    } else {
                                                      controller.selectedCurrentlyUsingList.remove(controller.currentlyUsingList[index]);
                                                    }
                                                    controller.update(['history']);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width:1.0.h),
                                          addText(
                                              controller.currentlyUsingList[index],
                                              detailValueTs,
                                              Colors.black,
                                              FontWeight.w400)
                                        ],
                                      ),
                                      SizedBox(height:0.5.h)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          buildDivider(),
                          Align(
                            alignment: Alignment.center,
                            child: saveButton(context, () async {
                              await controller.saveDiseaseDeatils();
                              Map<String, String> data = {};
                              for (int i = 0;
                              i <
                                  controller.selectedCurrentlyUsingList.length;
                              i++) {
                                data['accessories[$i]'] = controller.selectedCurrentlyUsingList[i];
                              }
                              controller.addMedicalSurvey(data);
                            }),
                          ),
                          SizedBox(height:2.h),
                          Align(
                            alignment: Alignment.topLeft,
                            child: addText(
                                'Family History :',
                                getNormalTextFontSIze() - 1,
                                BaseColors.primaryColor,
                                FontWeight.w700),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          addText(
                              'Heart Disease/Diabetes/Hypertension/Mental Disorder/Stroke/Tuberculosis. Others, specify',
                              getSmallTextFontSIze() + 1,
                              BaseColors.black,
                              FontWeight.normal),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 10.h,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: getEditTextDecoration(),
                            child: addEditText2(
                              controller.familyHistoryController,
                              'Star’s Grand Father has Diabetes',
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: saveButton(context, () {
                              controller.addMedicalSurvey({'familyHistroy': controller.familyHistoryController?.text});
                            }),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: addText(
                                'Medical Examination Consent',
                                getNormalTextFontSIze(),
                                BaseColors.primaryColor,
                                FontWeight.bold),
                          ),
                          buildDivider(),
                          SizedBox(
                            height: 1.h,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          addText(
                              controller.medicalExaminationConsent,
                              getSmallTextFontSIze() + 1,
                              BaseColors.black,
                              FontWeight.normal),
                          buildDivider(),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 25,
                                child: Checkbox(
                                  activeColor: Color(0xFFF7F7F7),
                                  checkColor: Color(0xFFC19444),
                                  side: MaterialStateBorderSide.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return const BorderSide(color: Color(0xFFC19444));
                                      }
                                      return const BorderSide(color: Color(0xFFC19444));
                                    },
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  value: controller.isAgreedToSchoolExamination.value,
                                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                  onChanged: (bool? value) {
                                    controller.isAgreedToSchoolExamination.value = value??false;
                                  },
                                ),
                              ),
                              Expanded(
                                child: addText(
                                    'I agree to attend the school examination.',
                                    getNormalTextFontSIze(),
                                    BaseColors.black,
                                    FontWeight.bold),
                              ),
                            ],
                          ),
                          // SizedBox(height:2.h),
                          // Row(
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Obx(() => InkWell(
                          //           onTap: () {
                          //             controller.isMedicalExmined.value =
                          //             true;
                          //           },
                          //           child: SvgPicture.asset(
                          //             controller.isMedicalExmined.value
                          //                 ? StarIcons.radioFilled
                          //                 : StarIcons.radioUnfilled,
                          //             height: 2.h,
                          //           ),
                          //         )),
                          //         SizedBox(width:0.5.h),
                          //         addText('Yes', radioButtonTitleTs,
                          //             BaseColors.black, FontWeight.w400)
                          //       ],
                          //     ),
                          //     SizedBox(width:3.h),
                          //     Row(
                          //       children: [
                          //         Obx(() => InkWell(
                          //           onTap: () {
                          //             controller.isMedicalExmined.value =
                          //             false;
                          //           },
                          //           child: SvgPicture.asset(
                          //             controller.isMedicalExmined.value
                          //                 ? StarIcons.radioUnfilled
                          //                 : StarIcons.radioFilled,
                          //             height: 2.h,
                          //           ),
                          //         )),
                          //         SizedBox(width:0.5.h),
                          //         addText('No', radioButtonTitleTs,
                          //             BaseColors.black, FontWeight.w400)
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          // buildDivider(),
                          // addText(
                          //     'I would like to be present during the examination',
                          //     getNormalTextFontSIze() - 1,
                          //     BaseColors.black,
                          //     FontWeight.bold),
                          // SizedBox(height:2.h),
                          // Row(
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Obx(() => InkWell(
                          //           onTap: () {
                          //             controller.isPresentinExam.value =
                          //             true;
                          //           },
                          //           child: SvgPicture.asset(
                          //             controller.isPresentinExam.value
                          //                 ? StarIcons.radioFilled
                          //                 : StarIcons.radioUnfilled,
                          //             height: 2.h,
                          //           ),
                          //         )),
                          //         SizedBox(width:0.5.h),
                          //         addText('Yes', radioButtonTitleTs,
                          //             BaseColors.black, FontWeight.w400)
                          //       ],
                          //     ),
                          //     SizedBox(width:3.h),
                          //     Row(
                          //       children: [
                          //         Obx(() => InkWell(
                          //           onTap: () {
                          //             controller.isPresentinExam.value =
                          //             false;
                          //           },
                          //           child: SvgPicture.asset(
                          //             controller.isPresentinExam.value
                          //                 ? StarIcons.radioUnfilled
                          //                 : StarIcons.radioFilled,
                          //             height: 2.h,
                          //           ),
                          //         )),
                          //         SizedBox(width:0.5.h),
                          //         addText('No', radioButtonTitleTs,
                          //             BaseColors.black, FontWeight.w400)
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          // buildDivider(),
                          SizedBox(
                            height: 1.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: saveButton(context, () {
                              controller.addMedicalSurvey({
                                'isConsentMedical': controller.isMedicalExmined.value.toString(),
                                'isPresentMedicalExam': controller.isPresentinExam.value.toString(),
                              });
                            }),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: addText(
                                  'Medication Policy',
                                  getNormalTextFontSIze(),
                                  BaseColors.primaryColor,
                                  FontWeight.bold)),
                          buildDivider(),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 25,
                                child: Checkbox(
                                  activeColor: Color(0xFFF7F7F7),
                                  checkColor: Color(0xFFC19444),
                                  side: MaterialStateBorderSide.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return const BorderSide(
                                            color: Color(0xFFC19444));
                                      }
                                      return const BorderSide(
                                          color: Color(0xFFC19444));
                                    },
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  value: controller.isMedicationPolicyChecked.value,
                                  visualDensity: const VisualDensity(
                                      horizontal: -4, vertical: -4),
                                  onChanged: (bool? value) {
                                    controller.isMedicationPolicyChecked.value = value??false;
                                  },
                                ),
                              ),
                              addText(
                                  'I Agree with',
                                  getSmallTextFontSIze() + 1,
                                  BaseColors.black,
                                  FontWeight.normal),
                            ],
                          ),
                          addText(
                              controller.medicationPolicy,
                              getSmallTextFontSIze() + 1,
                              BaseColors.black,
                              FontWeight.normal),
                          // SizedBox(height: 2.h),
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Container(
                          //       width: 25,
                          //       child: Checkbox(
                          //         activeColor: Color(0xFFF7F7F7),
                          //         checkColor: Color(0xFFC19444),
                          //         side: MaterialStateBorderSide.resolveWith(
                          //               (Set<MaterialState> states) {
                          //             if (states
                          //                 .contains(MaterialState.selected)) {
                          //               return const BorderSide(
                          //                   color: Color(0xFFC19444));
                          //             }
                          //             return const BorderSide(
                          //                 color: Color(0xFFC19444));
                          //           },
                          //         ),
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(5),
                          //         ),
                          //         value: controller
                          //             .isMedicationPolicyChecked2.value,
                          //         visualDensity: const VisualDensity(
                          //             horizontal: -4, vertical: -4),
                          //         onChanged: (bool? value) {
                          //           controller.isMedicationPolicyChecked2
                          //               .value = value!;
                          //         },
                          //       ),
                          //     ),
                          //     addText(
                          //         'I Agree with',
                          //         getSmallTextFontSIze() + 1,
                          //         BaseColors.black,
                          //         FontWeight.normal),
                          //   ],
                          // ),
                          // addText(
                          //     controller.medicationPolicy2,
                          //     getSmallTextFontSIze() + 1,
                          //     BaseColors.black,
                          //     FontWeight.normal),
                          Container(
                            width: 100.w,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: BaseColors.primaryColor),
                                color: BaseColors.white,
                                boxShadow: [getBoxShadow()],
                                borderRadius: getCurvedBorderRadius()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                addText(
                                    'Are you allergic to any medication?',
                                    getNormalTextFontSIze() - 1,
                                    BaseColors.black,
                                    FontWeight.bold),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Obx(() => yesNoButtons(
                                    context, controller.isAllergic1.value,
                                        () {
                                      controller.isAllergic1.value = !controller.isAllergic1.value;
                                    })),
                                SizedBox(height:1.h),
                                Visibility(
                                  visible: controller.isAllergic1.value == true,
                                  child: Form(
                                    key: controller.medicalSurveyAllergicFormKey,
                                    child: addEditText2(
                                      controller.allergicMedicineController,
                                      'Type here...',
                                      validator: (value) {
                                        if ((value??"").isEmpty) {
                                          return 'Please enter your answer';
                                        }
                                        return null;
                                      },
                                      border: outlineBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: saveButton(context, () {
                              controller.addMedicalSurvey({
                                'allergiName': controller.allergicMedicineController?.text.trim(),
                                'isAllergic': controller.isAllergic1.value.toString(),
                              });
                            }),
                          ),
                          SizedBox(height:2.h),
                          Align(
                              alignment: Alignment.topLeft,
                              child: addText(
                                  'Sickness Exclusion Policy',
                                  getNormalTextFontSIze() - 1,
                                  BaseColors.primaryColor,
                                  FontWeight.bold)),
                          buildDivider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 25,
                                child: Checkbox(
                                  activeColor: Color(0xFFF7F7F7),
                                  checkColor: Color(0xFFC19444),
                                  side: MaterialStateBorderSide.resolveWith(
                                        (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return const BorderSide(color: Color(0xFFC19444));
                                      }
                                      return const BorderSide(color: Color(0xFFC19444));
                                    },
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  value:
                                  controller.isSicknessPolicyChecked.value,
                                  visualDensity: const VisualDensity(
                                      horizontal: -4, vertical: -4),
                                  onChanged: (bool? value) {
                                    controller.isSicknessPolicyChecked.value = value??false;
                                  },
                                ),
                              ),
                              addText(
                                  'I Agree with',
                                  getSmallTextFontSIze() + 1,
                                  BaseColors.black,
                                  FontWeight.normal),
                            ],
                          ),
                          addText(
                              controller.sicknessPolicy,
                              getSmallTextFontSIze() + 1,
                              BaseColors.black,
                              FontWeight.normal),
                          SizedBox(
                            height: 2.h,
                          ),
                          buildDivider(),
                          Align(
                            alignment: Alignment.center,
                            child: saveButton(context, () {
                              // therms accepted validation
                              if (controller.isMedicationPolicyChecked.value == false) {
                                showSnackBar(
                                    success: false,
                                    message:
                                    'Please accept the medication policy');
                                return;
                              } else if (controller.isMedicationPolicyChecked2.value == false) {
                                showSnackBar(
                                    success: false,
                                    message:
                                    'Please accept the medication policy');
                                return;
                              } else if (controller
                                  .isSicknessPolicyChecked.value ==
                                  false) {
                                showSnackBar(
                                    success: false,
                                    message:
                                    'Please accept the sickness policy');
                                return;
                              } else if (!(controller.medicalSurveyAllergicFormKey.currentState?.validate() ?? false)) {
                                return;
                              }
                              Map<String, dynamic> data = {
                                'isAllergic':
                                controller.isAllergic1.value.toString(),
                              };
                              if (controller.isAllergic1.value) {
                                data['allergiName'] = controller.allergicMedicineController?.text;
                              }
                              controller.addMedicalSurvey(data);
                            }),
                          ),
                          // SizedBox(height:2.h),
                          // Align(
                          //     alignment: Alignment.topLeft,
                          //     child: addText(
                          //         'Certificate of Immunization',
                          //         getNormalTextFontSIze() - 1,
                          //         BaseColors.primaryColor,
                          //         FontWeight.bold)),
                          // buildDivider(),
                          // addText(
                          //     controller.certificate,
                          //     getSmallTextFontSIze() + 1,
                          //     BaseColors.black,
                          //     FontWeight.normal),
                          // SizedBox(height:2.h),
                          // Row(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   // mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Container(
                          //       // margin: EdgeInsets.only(bottom: 20),
                          //       width: 25,
                          //       child: Checkbox(
                          //         activeColor: Color(0xFFF7F7F7),
                          //         checkColor: Color(0xFFC19444),
                          //         side: MaterialStateBorderSide.resolveWith(
                          //               (Set<MaterialState> states) {
                          //             if (states
                          //                 .contains(MaterialState.selected)) {
                          //               return const BorderSide(
                          //                   color: Color(0xFFC19444));
                          //             }
                          //             return const BorderSide(
                          //                 color: Color(0xFFC19444));
                          //           },
                          //         ),
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(5),
                          //         ),
                          //         value: controller.isCertificateChecked.value,
                          //         visualDensity: const VisualDensity(
                          //             horizontal: -4, vertical: -4),
                          //         onChanged: (bool? value) {
                          //           controller.isCertificateChecked.value =
                          //           value!;
                          //         },
                          //       ),
                          //     ),
                          //     Flexible(
                          //       child: addText(
                          //           'I confirm that the attached is a true copy of my child’s immunization record. I will inform the school of any further',
                          //           getSmallTextFontSIze() + 1,
                          //           BaseColors.black,
                          //           FontWeight.w600),
                          //     ),
                          //   ],
                          // ),
                          // buildDivider(),
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: saveButton(context, () {}),
                          // ),
                          // SizedBox(height:2.h),
                          // Align(
                          //     alignment: Alignment.topLeft,
                          //     child: addText(
                          //         'Vaccination Doses',
                          //         getNormalTextFontSIze() - 1,
                          //         BaseColors.primaryColor,
                          //         FontWeight.bold)),
                          // buildDivider(),
                          // Container(
                          //   color: Colors.white,
                          //   child: Table(
                          //     columnWidths: const {
                          //       0: FlexColumnWidth(2),
                          //       1: FlexColumnWidth(2),
                          //     },
                          //     children: [
                          //       TableRow(children: [
                          //         addText(
                          //             'RECOMMENDED SCHEDULE OF IMMUNIZATION',
                          //             getSmallestTextFontSIze() + 1,
                          //             BaseColors.black,
                          //             FontWeight.w700),
                          //         addTextCenter(
                          //             'DATE OF VACCINATION',
                          //             getSmallestTextFontSIze() + 1,
                          //             BaseColors.black,
                          //             FontWeight.w700),
                          //       ]),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height:2.h),
                          // ListView.builder(
                          //   padding: EdgeInsets.zero,
                          //   itemCount: controller.vaccinationDetailList.length,
                          //   scrollDirection: Axis.vertical,
                          //   shrinkWrap: true,
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   itemBuilder: (context, index) {
                          //     return Container(
                          //       color: Colors.white,
                          //       child: Table(
                          //         border: TableBorder.all(
                          //             color: BaseColors.borderColor2
                          //                 .withOpacity(0.5),
                          //             width: 1),
                          //         columnWidths: const {
                          //           0: FlexColumnWidth(2),
                          //           1: FlexColumnWidth(2),
                          //         },
                          //         children: [
                          //           TableRow(children: [
                          //             Padding(
                          //               padding: const EdgeInsets.all(12.0),
                          //               child: addText(
                          //                   controller
                          //                       .vaccinationDetailList[
                          //                   index]
                          //                       .title ??
                          //                       'N/A',
                          //                   getSmallTextFontSIze() + 1,
                          //                   BaseColors.black,
                          //                   FontWeight.w400),
                          //             ),
                          //             InkWell(
                          //               onTap: () async {
                          //                 DateTime? date = await selectDateMedical();
                          //                 if (date != null) {
                          //                   String formattedDate =
                          //                   await formatDate(date, seperator: '/');
                          //                   VaccinationDose vaccinationDose = controller.vaccinationDetailList[index];
                          //                   vaccinationDose.body = formattedDate;
                          //                   controller.vaccinationDetailList[
                          //                   index] = vaccinationDose;
                          //                 }
                          //               },
                          //               child: controller
                          //                   .vaccinationDetailList[
                          //               index]
                          //                   .body
                          //                   ?.isNotEmpty ??
                          //                   false
                          //                   ? Padding(
                          //                     padding:
                          //                     const EdgeInsets.all(12.0),
                          //                     child: Obx(
                          //                       () => addText(
                          //                       controller
                          //                           .vaccinationDetailList[
                          //                       index]
                          //                           .body ??
                          //                           'N/A',
                          //                       getSmallTextFontSIze() +
                          //                           1,
                          //                       BaseColors.black,
                          //                       FontWeight.w400),
                          //                 ),
                          //               )
                          //                   : Padding(
                          //                 padding:
                          //                 const EdgeInsets.symmetric(
                          //                     vertical: 12.0),
                          //                 child: SvgPicture.asset(
                          //                     StarIcons.idIcon),
                          //               ),
                          //             ),
                          //           ]),
                          //         ],
                          //       ),
                          //     );
                          //   },
                          // ),
                          // SizedBox(height:2.h),
                          // InkWell(
                          //   onTap: () async {
                          //     await showMediaPickerDialog(
                          //           (fileName, filePath) {
                          //         controller.vaccinationCard.text = filePath;
                          //       },
                          //     );
                          //   },
                          //   child: AbsorbPointer(
                          //     child: Form(
                          //       key: controller.vaccinationCardFormKey,
                          //       child: _buildRow(
                          //         'Vaccination Card',
                          //         controller.vaccinationCard.text.isEmpty
                          //             ? 'Upload file'
                          //             : 'File Selected',
                          //         iconButton(() {}, "assets/images/upload_icon.svg"),
                          //         false,
                          //         false,
                          //         controller: controller.vaccinationCard,
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return 'Please select file';
                          //           }
                          //           return null;
                          //         },
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height:2.h),
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: saveButton(context, () async {
                          //     if (controller
                          //         .vaccinationCardFormKey.currentState!
                          //         .validate()) {
                          //       Map<String, dynamic> data = {
                          //         // 'vaccinationDose[]': controller
                          //         //     .vaccinationDetailList
                          //         //     .map((e) => e.toJson())
                          //         //     .toList()
                          //         //     .toString(),
                          //       };
                          //       for (var i = 0;
                          //       i < controller.vaccinationDetailList.length;
                          //       i++) {
                          //         data.addAll({
                          //           'vaccinationDose[$i]': controller
                          //               .vaccinationDetailList[i]
                          //               .toJson()
                          //               .toString()
                          //         });
                          //       }
                          //       // print(data);
                          //       // return;
                          //       if (controller.vaccinationCard.text.isNotEmpty) {
                          //         File file = File(controller.vaccinationCard.text);
                          //         data['vaccinationCard'] = await dio.MultipartFile.fromFile(file.path);
                          //       }
                          //       controller.addMedicalSurvey(data);
                          //     }
                          //   }),
                          // ),
                          // buildDivider(),
                          // addLeftText(
                          //     "Do you confirm to have your child's photo taken and to be used for social media and marketing purpose?"),
                          // SizedBox(height:0.8.h),
                          // Obx(() => yesNoButtons(context,
                          //     controller.childPhotoSocialMedia.value, () {
                          //       controller.childPhotoSocialMedia.value =
                          //       !controller.childPhotoSocialMedia.value;
                          //     })),
                          // SizedBox(height: 15),
                          // addLeftText(
                          //     "Do you confirm to have your child's photo taken and to be used for Star Gallery. But, not to be used for any social media and marketing purpose"),
                          // SizedBox(height:0.8.h),
                          // Obx(() => yesNoButtons(context,
                          //     controller.childPhotoStarGallery.value, () {
                          //       controller.childPhotoStarGallery.value =
                          //       !controller.childPhotoStarGallery.value;
                          //     })),
                          // SizedBox(height: 15),
                          // addLeftText(
                          //     "Do you confirm NOT to take your child's photo"),
                          // SizedBox(height:0.8.h),
                          // Obx(() => yesNoButtons(
                          //     context, controller.notChildPhoto.value, () {
                          //   controller.notChildPhoto.value =
                          //   !controller.notChildPhoto.value;
                          // })),
                          // SizedBox(height: 15),
                          // addLeftText("is_the_star_allowed_to_use_the_school_canteen"),
                          // SizedBox(height:0.8.h),
                          // Obx(() => yesNoButtons(context,
                          //     controller.isSchoolCanteenAllowed.value, () {
                          //       controller.isSchoolCanteenAllowed.value =
                          //       !controller.isSchoolCanteenAllowed.value;
                          //     })),
                          SizedBox(height:2.0.h),
                          Visibility(
                            visible:
                            controller.isSchoolCanteenAllowed.value == true,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: getCurvedBorderRadius(),
                                  side: const BorderSide(
                                      color: BaseColors.primaryColor)),
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                child: Column(
                                  children: [
                                    addLeftText("Are you allergic to any food?"),
                                    SizedBox(height:1.0.h),
                                    Obx(() => yesNoButtons(context,
                                        controller.isAllergic.value, () {controller.isAllergic.value = !controller.isAllergic.value;
                                        })),
                                    SizedBox(height:1.5.h),
                                    Obx(
                                          () => Visibility(
                                        visible:
                                        controller.isAllergic.value == true,
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          physics:
                                          NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: controller.foodList.length,
                                          itemBuilder: (context, index) =>
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Transform.scale(
                                                        scale: 0.8,
                                                        child: Container(
                                                            width: 25,
                                                            height: 20,
                                                            child: Obx(
                                                                  () => Checkbox(
                                                                materialTapTargetSize:
                                                                MaterialTapTargetSize.shrinkWrap,
                                                                value: controller.selectedFoodList.contains(controller.foodList[index]),
                                                                activeColor: Color(0xFFF7F7F7),
                                                                checkColor: Color(0xFFC19444),
                                                                side: MaterialStateBorderSide.resolveWith((Set<MaterialState>states) {
                                                                    if (states.contains(
                                                                        MaterialState.selected)) {
                                                                      return const BorderSide(
                                                                          color: Color(
                                                                              0xFFC19444));
                                                                    }
                                                                    return const BorderSide(
                                                                        color: Color(
                                                                            0xFFC19444));
                                                                  },
                                                                ),
                                                                shape:
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      5),
                                                                ),
                                                                onChanged: (value) {
                                                                  if (value??false) {
                                                                    controller.selectedFoodList.add(controller.foodList[index]);
                                                                  } else {
                                                                    controller.selectedFoodList.remove(controller.foodList[index]);
                                                                  }
                                                                },
                                                              ),
                                                            )),
                                                      ),
                                                      SizedBox(width:1.0.h),
                                                      addText(
                                                          controller.foodList[index].name ?? 'N/A',
                                                          detailValueTs,
                                                          Colors.black,
                                                          FontWeight.w400)
                                                    ],
                                                  ),
                                                  SizedBox(height:0.5.h),
                                                ],
                                              ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height:2.h),
                                    saveButton(context, () {
                                      print(controller.selectedFoodList);
                                      Map<String, dynamic> data = {
                                        'isChildPhotoSocialMedia': controller.childPhotoSocialMedia.value.toString(),
                                        'isChildPhotoStarGallery': controller.childPhotoStarGallery.value.toString(),
                                        'isNotChildPhoto': controller.notChildPhoto.value.toString(),
                                        'isAllowCanteen': controller.isSchoolCanteenAllowed.value.toString(),
                                        'isAllergicFood': controller.isAllergic.value.toString(),
                                      };
                                      if (controller.isAllergic.value) {
                                        for (int i = 0;
                                        i < controller
                                            .selectedFoodList.length;
                                        i++) {
                                          data['foods[$i]'] = controller
                                              .selectedFoodList[i].sId;
                                        }
                                      }
                                      controller.addMedicalSurvey(data);
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:2.h),
                        ]),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget buildMedicalRecords(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: BaseColors.primaryColor)),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    if (controller.selectindex.value == 2) {
                      controller.selectindex.value = 0;
                    } else {
                      controller.selectindex.value = 2;
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addText('Medical Records', get17TextFontSIze(),
                          BaseColors.black, FontWeight.bold),
                      Obx(() => Icon(
                        controller.selectindex.value == 2
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: BaseColors.primaryColor,
                      )),
                    ],
                  ),
                ),
                Obx(
                      () => Visibility(
                    visible: controller.selectindex.value == 2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height:2.h),
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              MedicalRecord medicalRecord = controller.medicalRecordList[index];
                              return Container(
                                margin: EdgeInsets.only(bottom: 1.5.h),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: BaseColors.white,
                                    boxShadow: kElevationToShadow[1]),
                                child: Column(
                                  children: [
                                    detail('Title :  ',
                                        medicalRecord.title ?? 'N/A'),
                                    buildTextSpan(
                                      'Description : ',
                                      medicalRecord.description ?? 'N/A',
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              SvgPicture.asset("assets/images/Vector (1).svg"),
                                              SizedBox(width:1.h),
                                              addText(
                                                  getFormattedDate(medicalRecord.date ?? ''),
                                                  getNormalTextFontSIze() - 1,
                                                  BaseColors.primaryColor,
                                                  FontWeight.w700),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              SvgPicture.asset("assets/images/time_icon.svg"),
                                              SizedBox(width:1.h),
                                              addText(
                                                  getFormattedTime(medicalRecord.createdAt ?? ''),
                                                  getNormalTextFontSIze() - 1,
                                                  BaseColors.primaryColor,
                                                  FontWeight.w700),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    buildDivider(),
                                    Visibility(
                                      visible: (medicalRecord.document??"").isNotEmpty,
                                      child: Row(
                                        children: [
                                          Expanded(child: Text(medicalRecord.document?.split('/').last??"",style: TextStyle(fontSize: 11))),
                                          BaseIcons().view(
                                            url: "http://3.28.14.143:4000/star-backend/${medicalRecord.document}",
                                            leftMargin: 3.w,
                                            concatBaseUrl: false,
                                          ),
                                          BaseIcons().download(onRightButtonPressed: (){
                                            BaseOverlays().dismissOverlay();
                                            downloadFile(url: "http://3.28.14.143:4000/star-backend/${medicalRecord.document}", concatBaseUrl: false);
                                          },
                                            leftMargin: 3.w,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height:1.h)
                                  ],
                                ),
                              );
                            },
                            itemCount: controller.medicalRecordList.length,
                          ),
                          SizedBox(height:2.0.h),
                        ]),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget detail(title, body) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            addText(
                title, detailLabelTs, BaseColors.black, FontWeight.w400),
            addText(body, detailValueTs, BaseColors.primaryColor,
                FontWeight.w700),
          ],
        ),
        buildDivider()
      ],
    );
  }

  Widget buildTextSpan(title, label) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: SvgPicture.asset(StarIcons.reasonIcon),
            ),
            SizedBox(width:1.h),
            Flexible(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: title,
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: detailLabelTs,
                          color: BaseColors.black,
                          fontWeight: FontWeight.w400,
                        )),
                    TextSpan(
                      text: label,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: detailValueTs,
                        color: BaseColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        buildDivider()
      ],
    );
  }

  Widget _buildRow(label, labelText, suffixIcon, isNumber, isDropDown, {List<DropDown>? items,
    DropDown? selectedValue,
    Function(DropDown?)? onChanged,
    controller,
    validator,
    onTap,
    bool readonly = false}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 11.h,
                child: addText(label, textFormFieldLabelTs, Colors.black,
                    FontWeight.w700)),
            /*isDropDown
                ? Expanded(
                    child: CustomDropDown(
                      fieldColor: BaseColors.white3,
                      hintText: labelText,
                      listData: items,
                      selectedValue: selectedValue,
                      onChanged: onChanged,
                    ),
                  )
                : */Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: AbsorbPointer(
                  absorbing: onTap == null ? false : true,
                  child: TextFieldWidget(
                    readOnly: readonly,
                    controller: controller,
                    validator: validator,
                    fillColor: BaseColors.white3,
                    hintColor: Color(0xffBECADA),
                    borderRadius: BorderRadius.circular(4),
                    height: 45,
                    fontsize: textFormFieldHintTs,
                    isNumber: isNumber,
                    hintText: labelText,
                    labelText: labelText,
                    sufficIcon: suffixIcon,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height:1.4.h),
      ],
    );
  }

  Widget _buildRow2(DiseaseData? diseaseData) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
                flex: 3,
                child: addText('${diseaseData?.name ?? 'N/A'}', detailValueTs,
                    BaseColors.black, FontWeight.w400)),
            SizedBox(width:1.h),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.diseases.update((val) {
                        int? index = val?.history?.indexWhere((element) => element.sId == diseaseData?.sId);
                        if (index != null && index >= 0) {
                          val?.history?[index].active = true;
                        }
                      });
                    },
                    child: SvgPicture.asset(
                      (diseaseData?.active??false)
                          ? StarIcons.radioFilled
                          : StarIcons.radioUnfilled,
                      height: 2.h,
                    ),
                  ),
                  SizedBox(width:0.5.h),
                  addText(
                    'Yes',
                    radioButtonTitleTs,
                    BaseColors.black,
                    FontWeight.w400,
                  ),
                ],
              ),
            ),
            SizedBox(width:1.h),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.diseases.update((val) {
                        int? index = val?.history?.indexWhere(
                                (element) => element.sId == diseaseData?.sId);
                        if (index != null && index >= 0) {
                          val?.history?[index].active = false;
                        }
                      });
                      controller.addOrUpdateDisease(diseaseData);
                    },
                    child: SvgPicture.asset(
                      (diseaseData?.active??false)
                          ? StarIcons.radioUnfilled
                          : StarIcons.radioFilled,
                      height: 2.h,
                    ),
                  ),
                  SizedBox(width:0.5.h),
                  addText('No', radioButtonTitleTs, BaseColors.black,
                      FontWeight.w400)
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: diseaseData?.active ?? false
                    ? InkWell(
                  onTap: () async {
                    showMediaPickerDialog(
                          (fileName, filePath) {
                        controller.diseases.update(
                              (val) {
                            int? index = val?.history?.indexWhere(
                                    (element) => element.sId == diseaseData?.sId);
                            if (index != null && index >= 0) {
                              val?.history?[index].document = filePath;
                            }
                          },
                        );
                        controller.addOrUpdateDisease(diseaseData);
                      },
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/images/upload_icon.svg",
                    color: BaseColors.primaryColor,
                  ),
                )
                    : SizedBox.shrink()),
          ],
        ),
        buildDivider(),
      ],
    );
  }

  Widget addLeftText(label) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child:
      addText(label, getSmallTextFontSIze(), Colors.black, FontWeight.w700),
    );
  }
}
