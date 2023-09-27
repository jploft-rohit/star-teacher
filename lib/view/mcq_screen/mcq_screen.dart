import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/base_views/base_video_player.dart';
import 'package:staff_app/view/assignments_screen/controller/mcq_controller.dart';
import 'package:video_thumbnail/video_thumbnail.dart';


class MCQScreen extends StatefulWidget {
  final String title,id;
  final bool? isELibrary, isViewing;
  const MCQScreen({super.key, required this.title, required this.id, this.isELibrary, this.isViewing});

  @override
  State<MCQScreen> createState() => _MCQScreenState();
}

class _MCQScreenState extends State<MCQScreen> {

  WorkSheetController controller = Get.put(WorkSheetController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.selectedOptionList.clear();
    });
    if (widget.isELibrary ?? false) {
      controller.getELibraryQuestion(showLoader: true, id: widget.id);
    }else{
      controller.getWorksheetQuestionList(showLoader: true, id: widget.id);
    }

  }

  @override
  Widget build(BuildContext context) {
    Get.put(WorkSheetController());
    return Obx(()=>Scaffold(
        backgroundColor: Colors.white,
        appBar: BaseAppBar(title: widget.title),
        body: (widget.isELibrary??false)
            ? Padding(
          padding: EdgeInsets.all(15.sp),
          child: (controller.eLibraryQuestionResponse.value?.questions?.length ?? 0) == 0
              ? const BaseNoData(message: "No Question Found!")
              : PageView.builder(
                itemCount: controller.eLibraryQuestionResponse.value?.questions?.length ?? 0,
                controller: controller.pageController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, pageIndex) {
                return SingleChildScrollView(
                 child: Column(
                  children: [
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Question: ',
                            style: TextStyle(fontSize: 15.sp, color: BaseColors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "${pageIndex + 1}",
                                  style: TextStyle(fontSize: 15.sp, color: BaseColors.primaryColor, fontWeight: FontWeight.w700)),
                              TextSpan(
                                text: "/${controller.eLibraryQuestionResponse.value?.questions?.length}",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    if (controller.eLibraryQuestionResponse.value?.questions?[pageIndex].type == 'photoWithQuestion')
                      // Container(
                      //   padding: EdgeInsets.all(4),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(13),
                      //     image: DecorationImage(
                      //         image: NetworkImage(ApiEndPoints().imageBaseUrl),
                      //         fit: BoxFit.cover),
                      //   ),
                      //   height: 22.h,
                      //   width: double.infinity,
                      // ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: BaseImageNetwork(
                        fit: BoxFit.fitWidth,
                        borderRadius: 20,
                        width: double.infinity,
                        link: (controller.eLibraryQuestionResponse.value?.questions?[pageIndex].mediaFile),
                        concatBaseUrl: true,
                      ),
                    ),
                    if (controller.eLibraryQuestionResponse.value?.questions?[pageIndex].type == 'videoWithQuestion')
                      InkWell(
                        onTap: () {
                          Get.to(() => BaseVideoPlayer(
                            videoUrl: ("${ApiEndPoints().concatBaseUrl}/star-backend/${controller.eLibraryQuestionResponse.value?.questions?[pageIndex].mediaFile ?? ""}").toString(),
                          ));
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: BaseColors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                //  image: videoThumbnail(controller.getThumbnail((ApiEndPoints().imageBaseUrl + (controller.eLibraryQuestionResponse.value?.questions?[pageIndex].mediaFile ?? "")).toString()))),
                                height: 22.h,
                                width: double.infinity,
                                child: videoThumbnail(controller.getThumbnail(("${ApiEndPoints().concatBaseUrl}/star-backend/${controller.eLibraryQuestionResponse.value?.questions?[pageIndex].mediaFile ?? ""}").toString())),
                              ),
                            ),
                            // Container(
                            //   padding: const EdgeInsets.all(65),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(13),
                            //     color: Colors.transparent,
                            //   ),
                            //   height: 22.h,
                            //   width: double.infinity,
                            //   child: SvgPicture.asset(
                            //     'assets/images/ic_play.svg',
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].title ?? "");
                          },
                          child: SvgPicture.asset(
                            'assets/images/sound 1.svg',
                            // fit: BoxFit.scaleDown,
                            height: 2.5.h,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Flexible(child: addAlignedText("${controller.eLibraryQuestionResponse.value?.questions?[pageIndex].title}", 17.sp, BaseColors.primaryColor, FontWeight.w700)),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),

                    // *****Options Section*****
                    if (controller.eLibraryQuestionResponse.value?.questions?[pageIndex].subtype == 'objective')
                      Column(
                        children: [
                          if ((controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option1?.text??"").isNotEmpty)
                            GestureDetector(
                                onTap: () {
                                  controller.selectedOptionList.clear();
                                  controller.selectedOptionList.add("option1");
                                  setState(() {});
                                  controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option1?.text??"");
                                },
                                child: buildOptionType(
                                    value: controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option1?.text ?? "",
                                    isSelected: controller.selectedOptionList.contains('option1'),
                                    optionCount: 'option1')),
                          if ((controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option2?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                controller.selectedOptionList.clear();
                                controller.selectedOptionList.add("option2");
                                setState(() {});
                                controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option2?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option2?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option2'),
                                  optionCount: 'option2'),
                            ),
                          if ((controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option3?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                controller.selectedOptionList.clear();
                                controller.selectedOptionList.add("option3");
                                setState(() {});
                                controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option3?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option3?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option3'),
                                  optionCount: 'option3'),
                            ),
                          if ((controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option4?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                controller.selectedOptionList.clear();
                                controller.selectedOptionList.add("option4");
                                setState(() {});
                                controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option4?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option4?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option4'),
                                  optionCount: 'option4'),
                            ),
                          if ((controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option5?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                controller.selectedOptionList.clear();
                                controller.selectedOptionList.add("option5");
                                setState(() {});
                                controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option5?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option5?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option5'),
                                  optionCount: 'option5'),
                            ),
                          if ((controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option6?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                controller.selectedOptionList.clear();
                                controller.selectedOptionList.add("option6");
                                setState(() {});
                                controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option6?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option6?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option6'),
                                  optionCount: 'option6'),
                            ),
                        ],
                      ),

                    if (controller.eLibraryQuestionResponse.value?.questions?[pageIndex].subtype == "subjective")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          BaseTextFormField(
                            controller: controller.answerController,
                            hintText: "Answer",
                            validator: (val){
                              if((val??"").isEmpty){
                                return "Please Enter Answer";
                              }
                              return null;
                            },
                          )
                        ],
                      ),

                    if (controller.eLibraryQuestionResponse.value?.questions?[pageIndex].subtype == "multipleSelect")
                      Column(
                        children: [
                          if ((controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option1?.text??"").isNotEmpty)
                            GestureDetector(
                                onTap: () {
                                  if (controller.selectedOptionList.contains('option1')) {
                                    controller.selectedOptionList.remove("option1");
                                  } else {
                                    controller.selectedOptionList.add("option1");
                                  }
                                  controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option1?.text??"");
                                  setState(() {});
                                },
                                child: buildOptionType(
                                    value: controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option1?.text ?? "",
                                    isSelected: controller.selectedOptionList.contains('option1'),
                                    optionCount: 'option1')),
                          if ((controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option2?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                if (controller.selectedOptionList.contains('option2')) {
                                  controller.selectedOptionList.remove("option2");
                                } else {
                                  controller.selectedOptionList.add("option2");
                                }
                                controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option2?.text??"");
                                setState(() {});
                              },
                              child: buildOptionType(
                                  value: controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option2?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option2'),
                                  optionCount: 'option2'),
                            ),
                          if ((controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option3?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                if (controller.selectedOptionList.contains('option3')) {
                                  controller.selectedOptionList.remove("option3");
                                } else {
                                  controller.selectedOptionList.add("option3");
                                }
                                controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option3?.text??"");
                                setState(() {});
                              },
                              child: buildOptionType(
                                  value: controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option3?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option3'),
                                  optionCount: 'option3'),
                            ),
                          if ((controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option4?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                if (controller.selectedOptionList.contains('option4')) {
                                  controller.selectedOptionList.remove("option4");
                                } else {
                                  controller.selectedOptionList.add("option4");
                                }
                                controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option4?.text??"");
                                setState(() {});
                              },
                              child: buildOptionType(
                                  value: controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option4?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option4'),
                                  optionCount: 'option4'),
                            ),
                          if ((controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option5?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                if (controller.selectedOptionList.contains('option5')) {
                                  controller.selectedOptionList.remove("option5");
                                } else {
                                  controller.selectedOptionList.add("option5");
                                }
                                setState(() {});
                                controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option5?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option5?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option5'),
                                  optionCount: 'option5'),
                            ),
                          if ((controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option6?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                if (controller.selectedOptionList.contains('option6')) {
                                  controller.selectedOptionList.remove("option6");
                                } else {
                                  controller.selectedOptionList.add("option6");
                                }
                                setState(() {});
                                controller.tts.speak(controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option6?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.eLibraryQuestionResponse.value?.questions?[pageIndex].option6?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option6'),
                                  optionCount: 'option6'),
                            ),
                        ],
                      ),

                    SizedBox(
                      height: 3.h,
                    ),
                    BaseButton(
                        btnType: 'large',
                        title: (controller.eLibraryQuestionResponse.value?.questions?.length ?? 0) - 1 != pageIndex ? "NEXT" : "Submit",
                        onPressed: () {
                          // if (controller.formKey.currentState?.validate()??false) {
                          // if ((controller.eLibraryQuestionResponse.value?.questions?.length ?? 0) - 1 != pageIndex) {
                          //   controller.evaluateQuestion(controller.eLibraryQuestionResponse.value?.id ?? "", controller.eLibraryQuestionResponse.value?.questions?[pageIndex].id ?? "",
                          //       controller.eLibraryQuestionResponse.value?.questions?[pageIndex].subtype ?? "", "false").then((value) {
                          //     controller.answerController.clear();
                          //     controller.selectedOptionList.clear();
                          //
                          //   });
                          // }
                          if ((controller.eLibraryQuestionResponse.value?.questions?.length ?? 0) - 1 != pageIndex) {
                            controller.pageController.animateToPage(pageIndex + 1, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                          }else{
                            if (widget.isViewing??true) {
                              Get.back();
                            }else{
                              Get.back();
                              Get.back();
                            }
                            // BaseOverlays().showSumitSuccessfulDialogue(context, () {});
                          }
                          // else {
                          //   // showCommentDialog();
                          //   controller.evaluateQuestion(controller.eLibraryQuestionResponse.value?.id ?? "", controller.eLibraryQuestionResponse.value?.questions?[pageIndex].id ?? "",
                          //       controller.eLibraryQuestionResponse.value?.questions?[pageIndex].subtype ?? "", "true").then((value) {
                          //     controller.answerController.clear();
                          //     controller.selectedOptionList.clear();
                          //     BaseOverlays().showSumitSuccessfulDialogue(context, () {
                          //       Get.back();
                          //       Get.back();
                          //     });
                          //   });
                          // }
                          // }
                        }
                    ),
                    SizedBox(height: 1.h),
                  ],
                ),
              );
            },
          ),
        )
            : Padding(
             padding: EdgeInsets.all(15.sp),
             child: (controller.data.value?.questions?.length ?? 0) == 0
              ? const BaseNoData(message: "No Question Found!")
              : PageView.builder(
                 itemCount: controller.data.value?.questions?.length ?? 0,
                 controller: controller.pageController,
                 scrollDirection: Axis.horizontal,
                 physics: const NeverScrollableScrollPhysics(),
                 itemBuilder: (context, pageIndex) {
                 return SingleChildScrollView(
                 child: Column(
                  children: [
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Question: ',
                            style: TextStyle(fontSize: 15.sp, color: BaseColors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "${pageIndex + 1}",
                                  style: TextStyle(fontSize: 15.sp, color: BaseColors.primaryColor, fontWeight: FontWeight.w700)),
                              TextSpan(
                                text: "/${controller.data.value?.questions?.length}",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    if (controller.data.value?.questions?[pageIndex].type == 'photoWithQuestion')
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            image: DecorationImage(
                                image: NetworkImage("${ApiEndPoints().concatBaseUrl}/star-backend/${controller.data.value?.questions?[pageIndex].mediaFile}"),
                                fit: BoxFit.cover),
                        ),
                        height: 22.h,
                        width: double.infinity,
                      ),
                    if (controller.data.value?.questions?[pageIndex].type == 'videoWithQuestion')
                      InkWell(
                        onTap: () {
                          Get.to(() => BaseVideoPlayer(
                            videoUrl: ("${ApiEndPoints().concatBaseUrl}/star-backend/${controller.data.value?.questions?[pageIndex].mediaFile ?? ""}").toString(),
                          ));
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: BaseColors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                //  image: videoThumbnail(controller.getThumbnail((ApiEndPoints().imageBaseUrl + (controller.data.value?.questions?[pageIndex].mediaFile ?? "")).toString()))),
                                height: 22.h,
                                width: double.infinity,
                                child: videoThumbnail(controller.getThumbnail(
                                    ("${ApiEndPoints().concatBaseUrl}/star-backend/${controller.data.value?.questions?[pageIndex].mediaFile ?? ""}").toString())),
                              ),
                            ),
                            // Container(
                            //   padding: const EdgeInsets.all(65),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(13),
                            //     color: Colors.transparent,
                            //   ),
                            //   height: 22.h,
                            //   width: double.infinity,
                            //   child: SvgPicture.asset(
                            //     'assets/images/ic_play.svg',
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.tts.speak(controller.data.value?.questions?[pageIndex].title ?? "");
                          },
                          child: SvgPicture.asset(
                            'assets/images/sound 1.svg',
                            // fit: BoxFit.scaleDown,
                            height: 2.5.h,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Flexible(
                            child: addAlignedText("${controller.data.value?.questions?[pageIndex].title}", 17.sp,
                                BaseColors.primaryColor, FontWeight.w700)),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),

                    // *****Options Section*****
                    if ((controller.data.value?.questions?[pageIndex].subtype??"") == 'objective')
                      Column(
                        children: [
                          if ((controller.data.value?.questions?[pageIndex].option1?.text??"").isNotEmpty)
                            GestureDetector(
                                onTap: () {
                                  controller.selectedOptionList.clear();
                                  controller.selectedOptionList.add("option1");
                                  setState(() {});
                                  controller.tts.speak(controller.data.value?.questions?[pageIndex].option1?.text??"");
                                },
                                child: buildOptionType(
                                    value: controller.data.value?.questions?[pageIndex].option1?.text ?? "",
                                    isSelected: controller.selectedOptionList.contains('option1'),
                                    optionCount: 'option1')),
                          if ((controller.data.value?.questions?[pageIndex].option2?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                controller.selectedOptionList.clear();
                                controller.selectedOptionList.add("option2");
                                setState(() {});
                                controller.tts.speak(controller.data.value?.questions?[pageIndex].option2?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.data.value?.questions?[pageIndex].option2?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option2'),
                                  optionCount: 'option2'),
                            ),
                          if ((controller.data.value?.questions?[pageIndex].option3?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                controller.selectedOptionList.clear();
                                controller.selectedOptionList.add("option3");
                                setState(() {});
                                controller.tts.speak(controller.data.value?.questions?[pageIndex].option3?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.data.value?.questions?[pageIndex].option3?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option3'),
                                  optionCount: 'option3'),
                            ),
                          if ((controller.data.value?.questions?[pageIndex].option4?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                controller.selectedOptionList.clear();
                                controller.selectedOptionList.add("option4");
                                setState(() {});
                                controller.tts.speak(controller.data.value?.questions?[pageIndex].option4?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.data.value?.questions?[pageIndex].option4?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option4'),
                                  optionCount: 'option4'),
                            ),
                          if ((controller.data.value?.questions?[pageIndex].option5?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                controller.selectedOptionList.clear();
                                controller.selectedOptionList.add("option5");
                                setState(() {});
                                controller.tts.speak(controller.data.value?.questions?[pageIndex].option5?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.data.value?.questions?[pageIndex].option5?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option5'),
                                  optionCount: 'option5'),
                            ),
                          if ((controller.data.value?.questions?[pageIndex].option6?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                controller.selectedOptionList.clear();
                                controller.selectedOptionList.add("option6");
                                setState(() {});
                                controller.tts.speak(controller.data.value?.questions?[pageIndex].option6?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.data.value?.questions?[pageIndex].option6?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option6'),
                                  optionCount: 'option6'),
                            ),
                        ],
                      ),

                    if (controller.data.value?.questions?[pageIndex].subtype == "subjective")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          BaseTextFormField(
                            controller: controller.answerController,
                            hintText: "Answer",
                            validator: (val){
                              if((val??"").isEmpty){
                                return "Please Enter Answer";
                              }
                              return null;
                            },
                          )
                        ],
                      ),

                    if (controller.data.value?.questions?[pageIndex].subtype == "multipleSelect")
                      Column(
                        children: [
                          if ((controller.data.value?.questions?[pageIndex].option1?.text??"").isNotEmpty)
                            GestureDetector(
                                onTap: () {
                                  if (controller.selectedOptionList.contains('option1')) {
                                    controller.selectedOptionList.remove("option1");
                                  } else {
                                    controller.selectedOptionList.add("option1");
                                  }
                                  setState(() {});
                                  controller.tts.speak(controller.data.value?.questions?[pageIndex].option1?.text??"");
                                },
                                child: buildOptionType(
                                    value: controller.data.value?.questions?[pageIndex].option1?.text ?? "",
                                    isSelected: controller.selectedOptionList.contains('option1'),
                                    optionCount: 'option1')),
                          if ((controller.data.value?.questions?[pageIndex].option2?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                if (controller.selectedOptionList.contains('option2')) {
                                  controller.selectedOptionList.remove("option2");
                                } else {
                                  controller.selectedOptionList.add("option2");
                                }
                                setState(() {});
                                controller.tts.speak(controller.data.value?.questions?[pageIndex].option2?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.data.value?.questions?[pageIndex].option2?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option2'),
                                  optionCount: 'option2'),
                            ),
                          if ((controller.data.value?.questions?[pageIndex].option3?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                if (controller.selectedOptionList.contains('option3')) {
                                  controller.selectedOptionList.remove("option3");
                                } else {
                                  controller.selectedOptionList.add("option3");
                                }
                                setState(() {});
                                controller.tts.speak(controller.data.value?.questions?[pageIndex].option3?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.data.value?.questions?[pageIndex].option3?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option3'),
                                  optionCount: 'option3'),
                            ),
                          if ((controller.data.value?.questions?[pageIndex].option4?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                if (controller.selectedOptionList.contains('option4')) {
                                  controller.selectedOptionList.remove("option4");
                                } else {
                                  controller.selectedOptionList.add("option4");
                                }
                                setState(() {});
                                controller.tts.speak(controller.data.value?.questions?[pageIndex].option4?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.data.value?.questions?[pageIndex].option4?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option4'),
                                  optionCount: 'option4'),
                            ),
                          if ((controller.data.value?.questions?[pageIndex].option5?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                if (controller.selectedOptionList.contains('option5')) {
                                  controller.selectedOptionList.remove("option5");
                                } else {
                                  controller.selectedOptionList.add("option5");
                                }
                                setState(() {});
                                controller.tts.speak(controller.data.value?.questions?[pageIndex].option5?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.data.value?.questions?[pageIndex].option5?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option5'),
                                  optionCount: 'option5'),
                            ),
                          if ((controller.data.value?.questions?[pageIndex].option6?.text??"").isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                if (controller.selectedOptionList.contains('option6')) {
                                  controller.selectedOptionList.remove("option6");
                                } else {
                                  controller.selectedOptionList.add("option6");
                                }
                                setState(() {});
                                controller.tts.speak(controller.data.value?.questions?[pageIndex].option6?.text??"");
                              },
                              child: buildOptionType(
                                  value: controller.data.value?.questions?[pageIndex].option6?.text ?? "",
                                  isSelected: controller.selectedOptionList.contains('option6'),
                                  optionCount: 'option6'),
                            ),
                        ],
                      ),

                    SizedBox(
                      height: 3.h,
                    ),
                    BaseButton(
                        btnType: 'large',
                        title: (controller.data.value?.questions?.length ?? 0) - 1 != pageIndex ? "NEXT" : "Submit",
                        onPressed: () {
                          // if (controller.formKey.currentState?.validate()??false) {
                            if (widget.isViewing??true) {
                              controller.answerController.clear();
                              controller.selectedOptionList.clear();
                              if ((controller.data.value?.questions?.length ?? 0) - 1 != pageIndex) {
                                controller.pageController.animateToPage(pageIndex + 1, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                              }else{
                                BaseOverlays().showSumitSuccessfulDialogue(context, () {
                                  Get.back();
                                  Get.back();
                                });
                              }
                            }else{
                              if ((controller.data.value?.questions?.length ?? 0) - 1 != pageIndex) {
                                controller.evaluateQuestion(controller.data.value?.id ?? "", controller.data.value?.questions?[pageIndex].id ?? "", controller.data.value?.questions?[pageIndex].subtype ?? "", "false").then((value) {
                                  controller.answerController.clear();
                                  controller.selectedOptionList.clear();
                                  controller.pageController.animateToPage(pageIndex + 1, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                                });
                              } else {
                                // showCommentDialog();
                                controller.evaluateQuestion(controller.data.value?.id ?? "", controller.data.value?.questions?[pageIndex].id ?? "", controller.data.value?.questions?[pageIndex].subtype ?? "", "true").then((value) {
                                  controller.answerController.clear();
                                  controller.selectedOptionList.clear();
                                  BaseOverlays().showSumitSuccessfulDialogue(context, () {
                                    Get.back();
                                    Get.back();
                                  });
                                });
                              }
                            }
                          // }
                        }
                      ),
                    SizedBox(height: 1.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget videoThumbnail(url) {
    return Container(
      padding: const EdgeInsets.all(65),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.transparent,
      ),
      height: 22.h,
      width: double.infinity,
      child: SvgPicture.asset(
        'assets/images/ic_play.svg',
      ),
    );
  }

  getThumbnail(url) async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.WEBP,
      quality: 100,
    );

    return fileName;
  }

  void showCommentDialog() {
    Get.dialog(Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 100.w,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), border: Border.all(color: BaseColors.borderColor), color: BaseColors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.transparent,
                    ),
                  ),
                  addText('Event Rejection Reason', 16.sp, BaseColors.black, FontWeight.bold),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: BaseColors.borderColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   decoration: getEditTextDecoration(),
              //   child: buildLineEditText(
              //       controller.eventRejectController!,
              //       'Why are you rejecting this event?'),
              // ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  // Get.dialog(SuccessDialog2(
                  //   message: 'Rejection Sent Successfully.',
                  // ));
                },
                // child: BorderedButton(width: 30.w, text: 'SUBMIT'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // width: width,
                      padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                          color: BaseColors.primaryColorLight,
                          boxShadow: [getDeepBoxShadow()],
                          border: Border.all(color: BaseColors.primaryColor, width: 1.5),
                          borderRadius: BorderRadius.circular(19)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: addText("SUBMIT", 17.sp,
                              BaseColors.primaryColor, FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildOptionType({required String value, required bool isSelected, required String optionCount}) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      margin: const EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
      decoration: BoxDecoration(
          color: isSelected ? BaseColors.primaryColorLight : BaseColors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: isSelected ? BaseColors.primaryColor : BaseColors.borderColor),
          boxShadow: [getBoxShadow()]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: addText(value, 16.sp, isSelected ? BaseColors.primaryColor : BaseColors.black,
                  isSelected ? FontWeight.w700 : FontWeight.w400)),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/sound 1.svg',
                height: 18.sp,
              ),
              SizedBox(
                width: 2.w,
              ),
              Container(
                height: 20,
                width: 20,
                // padding: const EdgeInsets.symmetric(horizontal: 9),
                decoration: BoxDecoration(
                    color: isSelected ? BaseColors.primaryColor : BaseColors.borderColor,
                    boxShadow: [getLightBoxShadow()],
                    border: Border.all(color: Colors.transparent, width: 1.5),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: BaseColors.white, width: 1.5),
                      shape: BoxShape.circle,
                      boxShadow: [getLightBoxShadow()],
                      color: isSelected ? BaseColors.primaryColor : BaseColors.borderColor),
                  child: Center(
                    child: Icon(Icons.check, color: BaseColors.white, size: 16.sp),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
