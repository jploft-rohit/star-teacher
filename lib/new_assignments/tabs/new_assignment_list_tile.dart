import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/new_assignments/controller/new_assignment_ctrl.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'dart:ui' as ui;
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/view/mcq_screen/mcq_screen.dart';

import '../../utility/sizes.dart';

class NewAssignmentListTile extends StatefulWidget {
  final String title;
  const NewAssignmentListTile({Key? key, required this.title}) : super(key: key);

  @override
  State<NewAssignmentListTile> createState() => _NewAssignmentListTileState();
}

class _NewAssignmentListTileState extends State<NewAssignmentListTile> {
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  TextEditingController searchCtrl = TextEditingController();
  NewAssignmentCtrl controller = Get.find<NewAssignmentCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> SmartRefresher(
      footer: const BasePaginationFooter(),
      controller: controller.refreshController,
      enablePullDown: enablePullToRefresh,
      enablePullUp: true,
      onLoading: (){
        controller.getData(refreshType: "load");
      },
      onRefresh: (){
        controller.getData(refreshType: "refresh");
      },
      child: (controller.list?.length??0) == 0
          ? const BaseNoData(message: "No Assigned Assignment Found")
          : ListView.builder(
          padding: EdgeInsets.only(bottom: 16.h,right: 1.w,left: 1.w),
          shrinkWrap: true,
          itemCount: controller.list?.length??0,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Get.to(MCQScreen(
                    title: widget.title,
                    id: controller.list?[index]?.sId??"",
                    isViewing: controller.primaryTabIndex.value == 0 ? true : false,
                 ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.list?[index]?.title??"",style: const TextStyle(fontWeight: FontWeight.bold)),
                      // BaseEditDelete(heading: "Assignment ${index+1}", editTitle: controller.primaryTabIndex.value == 0 ? "assignment" : "", deleteTitle: controller.primaryTabIndex.value == 0 ? "assigned assignment" : "",showSaveIcon: false,showDeleteReason: false,
                      //     onDeleteProceed: (){
                      //   controller.deleteData(index: index);
                      // },onEditProceed: (){
                      //     },showDeleteViewIcons: false,),
                      const Divider(),
                      Visibility(
                          visible: (widget.title.toLowerCase()) != "worksheet",
                          child: BaseDetailData(detailsLabel: "Assignment Number",detailsValue: controller.list?[index]?.assignmentNo??"",prefixIcon: "assets/images/report.svg")),
                      Visibility(
                          visible: (widget.title.toLowerCase()) != "worksheet",
                          child: BaseDetailData(detailsLabel: "Assignment Type",detailsValue: toBeginningOfSentenceCase(controller.list?[index]?.type??"")??"",prefixIcon: "assets/images/report.svg")),
                      BaseDetailData(detailsLabel: "Assignment ${controller.primaryTabIndex.value == 1 ? "By" : "To"}",detailsValue: toBeginningOfSentenceCase(controller.primaryTabIndex.value == 1 ? (controller.list?[index]?.user?.name??"") : (controller.list?[index]?.assignTo?.name??""))??"",prefixIcon: "assets/images/family_img.svg"),
                      Visibility(
                          visible: (widget.title.toLowerCase()) == "assessment" || (widget.title.toLowerCase()) == "lab",
                          child: BaseDetailData(detailsLabel: "Total Questions",detailsValue: toBeginningOfSentenceCase(controller.list?[index]?.totalQuestions.toString()??"")??"",prefixIcon: "assets/images/report.svg")),
                      Visibility(
                          visible: (widget.title.toLowerCase()) == "assessment" || (widget.title.toLowerCase()) == "lab",
                          child: BaseDetailData(detailsLabel: "Total Marks",detailsValue: toBeginningOfSentenceCase(controller.list?[index]?.totalMarks.toString()??"")??"",prefixIcon: "assets/images/report.svg")),
                      Visibility(
                        visible: false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BaseDetailData(showDivider: false,detailsLabel: translate(context).post_date, detailsValue: formatBackendDate(controller.list?[index]?.postDate??""),prefixIcon: "assets/images/Vector (1).svg"),
                            Container(height: 20.0,width: 1, color: BaseColors.borderColor),
                            BaseDetailData(showDivider: false,detailsLabel: translate(context).post_time,detailsValue: getFormattedTime(controller.list?[index]?.postTime??""),prefixIcon: "assets/images/time_icon.svg"),
                          ],
                        ),
                      ),
                      const Visibility(
                          visible: false,
                          child: Divider()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BaseDetailData(showDivider: false,detailsLabel: "Submit Date",detailsValue: formatBackendDate(controller.list?[index]?.submitDate??""),prefixIcon: "assets/images/Vector (1).svg"),
                          Container(height: 20.0,width: 1, color: BaseColors.borderColor),
                          BaseDetailData(showDivider: false,detailsLabel: "Submit Time",detailsValue: getFormattedTime(controller.list?[index]?.submitTime??""),prefixIcon: "assets/images/time_icon.svg"),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BaseDetailData(showDivider: false,detailsLabel: "Assigned Date",detailsValue: formatBackendDate(controller.list?[index]?.createdAt??""),prefixIcon: "assets/images/time_icon.svg"),
                          Container(height: 20.0,width: 1, color: BaseColors.borderColor),
                          BaseDetailData(showDivider: false,detailsLabel: "Assigned Time",detailsValue: getFormattedTime(controller.list?[index]?.createdAt??""),prefixIcon: "assets/images/time_icon.svg"),
                        ],
                      ),
                      const Divider(),
                      Visibility(visible: (controller.list?[index]?.dueDate??"").toString().isNotEmpty, child: BaseDetailData(detailsLabel: "Due Date",detailsValue: formatBackendDate(controller.list?[index]?.dueDate??""),prefixIcon: "assets/images/Vector (1).svg")),
                      ((controller.list?[index]?.assignTo?.idDocument)?.length??0) != 0 ?
                      Visibility(
                        visible: (widget.title.toLowerCase()) != "worksheet",
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(controller.list?[index]?.supportDoc.split("/").last??""??"",style: TextStyle(fontWeight: FontWeight.w700,color: BaseColors.primaryColor,fontSize: 15.sp)),
                          Visibility(
                            visible: (controller.list?[index]?.supportDoc??"").isNotEmpty,
                            child: Row(mainAxisSize: MainAxisSize.min,children: [
                              BaseIcons().view(url: controller.list?[index]?.supportDoc??"",concatBaseUrl: true),
                              SizedBox(width: 2.5.w),
                              BaseIcons().download(onRightButtonPressed: (){
                                BaseOverlays().dismissOverlay();
                                downloadFile(url: (controller.list?[index]?.supportDoc??""),concatBaseUrl: true);
                              }),
                            ]),
                          )
                        ]),
                      ) : const SizedBox.shrink(),
                      Visibility(
                        visible: (widget.title.toLowerCase()) != "worksheet",
                        child: Visibility(
                          visible: ((controller.list?[index]?.assignTo?.idDocument)?.length??0) != 0,
                            child: const Divider()),
                      ),
                      Visibility(
                        visible: (widget.title.toLowerCase()) != "worksheet",
                        child: Visibility(
                            visible: (controller.list?[index]?.link??"").toString().isNotEmpty,
                            child: Text(controller.list?[index]?.link??"",style: TextStyle(fontWeight: FontWeight.w700,color: BaseColors.primaryColor,fontSize: 15.sp))),
                      ),
                      Visibility(
                        visible: (widget.title.toLowerCase()) == "worksheet",
                          child: BaseDetailData(detailsLabel: "Description",
                              detailsValue: controller.list?[index]?.description??"N/A",
                              prefixIcon: "assets/images/Vector (1).svg",
                          ),
                      ),
                          // const Divider(),
                          // SizedBox(height: 1.h),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: BaseButton(removeHorizontalPadding: true,rightMargin: 2.w,title: "stop post".toUpperCase(), onPressed: (){
                          //         Get.to(const SubmittedAssignmentView());
                          //       },btnType: mediumButton,isActive: false),
                          //     ),
                          //     Expanded(
                          //       child: BaseButton(removeHorizontalPadding: true,leftMargin: 2.w,title: "Post".toUpperCase(), onPressed: (){
                          //         Get.to(const SubmittedAssignmentView());
                          //       },btnType: mediumButton,),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 2.h,
                          // ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
    ),
    );
  }
}