import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/today_schedule_module/controller/today_schedule_controller.dart';

import '../../utility/sizes.dart';

class TopicOfDiscussionPopup extends StatefulWidget {
  final List<String>? topics;
  final String? id;
  const TopicOfDiscussionPopup({super.key, this.topics, this.id});

  @override
  State<TopicOfDiscussionPopup> createState() => _TopicOfDiscussionPopupState();
}

class _TopicOfDiscussionPopupState extends State<TopicOfDiscussionPopup> {
  TodayScheduleController controller = Get.find<TodayScheduleController>();
  List<TextEditingController> textEditingControllers = <TextEditingController>[
    TextEditingController(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      widget.topics?.asMap().forEach((index, element) {
        if (element.isNotEmpty) {
          if ((widget.topics?.length??0) < 5) {
            textEditingControllers.add(TextEditingController());
          }
          textEditingControllers[index].text = element;
          setState(() {});
          // controller.weekList?[widget.myIndex].topics?[index] = element;
        }else{
          // controller.weekList?[widget.myIndex].topics?.remove(element);
        }
      });
      // controller.weekList?[widget.myIndex].topics?.removeWhere((element) => element.isEmpty);
    });
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 8,bottom: 10,right: 12,left: 12),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Topic of Discussion",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                GestureDetector(onTap: (){
                  BaseOverlays().dismissOverlay();
                },child: const Icon(Icons.close_rounded,color: Colors.black,size: 30,
                ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ListView.builder(
              itemCount: textEditingControllers.length < 5 ? textEditingControllers.length : 4,
              shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 10),
              itemBuilder: (context,index){
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: BaseTextFormField(
                        controller: textEditingControllers[index],
                        hintText: "Enter Topic",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Visibility(
                        visible: index == (textEditingControllers.length)-1 && textEditingControllers.length != 4,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              boxShadow: kElevationToShadow[3],
                              color: BaseColors.backgroundColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: BaseColors.primaryColor)),
                          child: Material(
                            color: Colors.transparent,
                            child: GestureDetector(
                              onTap: () {
                                if (textEditingControllers.length < 4) {
                                  setState(() {
                                    textEditingControllers.add(TextEditingController());
                                  });
                                }
                              },
                              child: Icon(
                                Icons.add,
                                color: BaseColors.primaryColor,
                                size: 5.0.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // Visibility(
            //   visible: (controller.weekList?[widget.myIndex].topics?.length??0) < 4,
            //   child: ConstrainedBox(
            //     constraints: BoxConstraints(
            //         minHeight: 10.h,
            //         maxHeight: 35.h
            //     ),
            //     child: ListView.builder(
            //         itemCount: count,
            //         shrinkWrap: true,
            //         physics: const NeverScrollableScrollPhysics(),
            //         itemBuilder: (context,index){
            //           return Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Expanded(
            //                 flex: 4,
            //                 child: BaseTextFormField(
            //                   controller: textEditingControllers[index],
            //                   hintText: "Topic",
            //                   onFieldValueChanged: (val){
            //                     setState(() {});
            //                   },
            //                 ),
            //               ),
            //               const SizedBox(width: 10),
            //               Expanded(
            //                 child: Visibility(
            //                   // visible: textEditingControllers[index].text.isNotEmpty,
            //                   child: Container(
            //                     height: 40,
            //                     width: 40,
            //                     decoration: BoxDecoration(
            //                         boxShadow: kElevationToShadow[3],
            //                         color: BaseColors.backgroundColor,
            //                         shape: BoxShape.circle,
            //                         border: Border.all(color: BaseColors.primaryColor)),
            //                     child: Material(
            //                       color: Colors.transparent,
            //                       child: GestureDetector(
            //                         onTap: () {
            //                           if (count < (4 - (controller.weekList?[widget.myIndex].topics?.length??0))) {
            //                             setState(() {
            //                               count = count+1;
            //                             });
            //                           }
            //                         },
            //                         child: Icon(
            //                           Icons.add,
            //                           color: BaseColors.primaryColor,
            //                           size: 5.0.h,
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           );
            //         },
            //     ),
            //   ),
            // ),
            Align(child: BaseButton(title: "ADD",
                onPressed: () {
                  widget.topics?.clear();
                  for (var element in textEditingControllers) {
                    if (element.text.trim().isNotEmpty) {
                      widget.topics?.add(element.text.trim());
                    }
                  }
                  widget.topics?.removeWhere((element) => element.isEmpty);
                  controller.addTopics(subjectId: widget.id??"", topics: widget.topics?.join(",")??"");
                },btnType: mediumButton),
            )
          ],
        ),
      ),
    );
  }
}
