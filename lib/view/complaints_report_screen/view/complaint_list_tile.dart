import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/view/complaints_report_screen/controller/complaint_report_controller.dart';
import 'package:staff_app/view/complaints_report_screen/view/raise_complaint_report_screen.dart';

class ComplaintsListTile extends StatefulWidget {
  const ComplaintsListTile({Key? key}) : super(key: key);

  @override
  State<ComplaintsListTile> createState() => _ComplaintsListTileState();
}

class _ComplaintsListTileState extends State<ComplaintsListTile> {
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  ComplainReportController controller = Get.find<ComplainReportController>();
  String userId = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userId = await BaseSharedPreference().getString(SpKeys().userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SmartRefresher(
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
      child: (controller.response?.length??0) == 0
          ? const BaseNoData()
          : ListView.builder(
            itemCount: controller.response?.length??0,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 8.h),
            itemBuilder: (context, index) {
            int stepperIndex = -5;
            controller.statusTime.value = [];
            controller.statusTitle.value = [];
            controller.response?[index].complaintStatus?.toList().asMap().forEach((loopIndex,element) {
            if (element.name.toString().toLowerCase() != "rejected") {
              controller.statusTitle.add(toBeginningOfSentenceCase(element.name??"")??"");
              controller.statusTime.add(getFormattedTimeWithMonth(element.time??""));
              if (element.time.toString().isNotEmpty) {
                stepperIndex = (loopIndex+1);
              }
            }else{
              if ((element.time??"").toString().isNotEmpty) {
                controller.statusTime.value = [];
                controller.statusTitle.value = [];
                controller.statusTitle.add(toBeginningOfSentenceCase(controller.response?[index].complaintStatus?[0].name??"")??"");
                controller.statusTitle.add(toBeginningOfSentenceCase(element.name??"")??"");
                controller.statusTime.add(getFormattedTimeWithMonth(controller.response?[index].complaintStatus?[0].time??""));
                controller.statusTime.add(getFormattedTimeWithMonth(element.time??""));
                if (element.time.toString().isNotEmpty) {
                  stepperIndex = (loopIndex+1);
                }
              }
            }
          },
          );
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(controller.response?[index].title??"", style: TextStyle(fontSize: 16.sp, color: BaseColors.textBlackColor, fontWeight: FontWeight.w700))),
                      Visibility(
                        visible: (controller.response?[index].document??"").isNotEmpty,
                        child: BaseIcons().view(
                        url: controller.response?[index].document??"",
                        concatBaseUrl: true,
                       ),
                      ),
                      Visibility(
                          visible: (controller.response?[index].document??"").isNotEmpty,
                          child: SizedBox(width: 3.w),
                      ),
                      Visibility(
                        visible: (controller.response?[index].document??"").isNotEmpty,
                        child: BaseIcons().download(onRightButtonPressed: (){
                        BaseOverlays().dismissOverlay();
                        BaseAPI().download(controller.response?[index].document??"");
                      }),
                      ),
                      Visibility(
                       visible: (controller.response?[index].document??"").isNotEmpty,
                       child: SizedBox(width: 3.w),
                      ),
                      Visibility(
                        visible: userId == (controller.response?[index].createdBy??"") && (controller.response?[index].status?.name??"").toLowerCase() != "concern solved",
                        child: BaseIcons().edit(
                        title: "${translate(context).are_you_sure_you_want_to_edit_this} ${controller.response?[index].forEnquery??""}",
                        onRightButtonPressed: (){
                          BaseOverlays().dismissOverlay();
                          Get.to(RaiseComplaintReportScreen(isUpdating: true, data: controller.response?[index]));
                        },
                      )),
                      Visibility(
                          visible: userId == (controller.response?[index].createdBy??"") && (controller.response?[index].status?.name??"").toLowerCase() != "concern solved",
                          child: SizedBox(width: 3.w),
                      ),
                      Visibility(
                          visible: userId == (controller.response?[index].createdBy??"") && (controller.response?[index].status?.name??"").toLowerCase() != "concern solved",
                          child: BaseIcons().delete(
                            title: "${translate(context).are_you_sure_you_want_to_delete_this} ${controller.response?[index].forEnquery??""}",
                            onRightButtonPressed: (){
                              controller.deleteItem(id: controller.response?[index].sId??"", index: index);
                            },
                            showDeleteReason: true,
                            deleteReasonController: controller.deleteReasonController.value,
                            formKey: controller.formKey,
                          ),
                      ),
                      Visibility(
                          visible: userId == (controller.response?[index].createdBy??"") && (controller.response?[index].status?.name??"").toLowerCase() != "concern solved",
                          child: SizedBox(width: isRTL ? 0 : 3.w),
                      ),
                    ],
                  ),
                  const Divider(),
                  BaseDetailData(
                    prefixIcon: "assets/images/user 1.svg",
                    detailsLabel: toBeginningOfSentenceCase(controller.response?[index].user?.role?.name)??"N/A",
                    detailsValue: controller.response?[index].user?.name??"N/A",
                  ),
                  Row(
                    children: [
                      BaseDetailData(
                        prefixIcon: "assets/images/Vector (1).svg",
                        detailsLabel: formatBackendDate(controller.response?[index].createdAt??""),
                        showDivider: false,
                      ),
                      SizedBox(width: 10.w),
                      BaseDetailData(
                        prefixIcon: "assets/images/time_icon.svg",
                        detailsLabel: getFormattedTime(controller.response?[index].createdAt??""),
                        showDivider: false,
                      ),
                    ],
                  ),
                  const Divider(),
                  BaseDetailData(
                    prefixIcon: "assets/images/report.svg",
                    detailsLabel: translate(context).type,
                    detailsValue: toBeginningOfSentenceCase(controller.response?[index].forEnquery??"")??"",
                  ),
                  BaseDetailData(
                    prefixIcon: "assets/images/user.svg",
                    detailsLabel: translate(context).complaint_on,
                    detailsValue: toBeginningOfSentenceCase(controller.response?[index].complaintUser?.role?.displayName??"")??"",
                  ),
                  BaseDetailData(
                    prefixIcon: "assets/images/user.svg",
                    detailsLabel: translate(context).person,
                    detailsValue: controller.response?[index].complaintUser?.name??"",
                  ),
                  BaseDetailData(
                    prefixIcon: "assets/images/report.svg",
                    detailsLabel: "${toBeginningOfSentenceCase(controller.response?[index].forEnquery??"")} ${translate(context).type}",
                    detailsValue: controller.response?[index].complaintType?.name??"",
                  ),
                  BaseDetailData(
                    prefixIcon: "assets/images/report.svg",
                    detailsLabel: translate(context).description,
                    detailsValue: controller.response?[index].description??"",
                  ),
                  Visibility(
                    visible: (controller.response?[index].resolverComment??"").isNotEmpty,
                    child: BaseDetailData(
                      prefixIcon: "assets/images/report.svg",
                      detailsLabel: translate(context).feedback,
                      detailsValue: controller.response?[index].resolverComment??"",
                    ),
                  ),
                  Visibility(
                    visible: (controller.response?[index].selfComment??"").isNotEmpty,
                    child: BaseDetailData(
                      prefixIcon: "assets/images/report.svg",
                      detailsLabel: translate(context).comment,
                      detailsValue: controller.response?[index].selfComment??"",
                    ),
                  ),
                  Visibility(
                    visible: ((controller.response?[index].selfComment??"").isNotEmpty) && (stepperIndex != 3), // Resolver Commented Back
                    child: Row(
                      children: [
                        Expanded(
                            child: BaseButton(
                              title: translate(context).accept.toUpperCase(),
                              onPressed: (){
                                controller.acceptComplaintReport(itemId: controller.response?[index].sId??"");
                              },
                              rightMargin: 1.5.w,
                              isActive: true,
                              removeHorizontalPadding: true,
                              btnType: mediumLargeButton,
                            ),
                        ),
                        Expanded(
                            child: BaseButton(
                              title: translate(context).comment.toUpperCase(),
                              onPressed: (){},
                              leftMargin: 1.5.w,
                              removeHorizontalPadding: true,
                              btnType: mediumLargeButton,
                              isActive: false,
                            ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: ((controller.response?[index].resolverComment??"").isNotEmpty) && ((controller.response?[index].selfComment??"").isEmpty) && (stepperIndex != 3),// Resolver Commented Back
                    child: Row(
                      children: [
                        Expanded(
                            child: BaseButton(
                              title: translate(context).accept.toUpperCase(),
                              onPressed: (){
                                controller.acceptComplaintReport(itemId: controller.response?[index].sId??"");
                                },
                              rightMargin: 1.5.w,
                              isActive: true,
                              removeHorizontalPadding: true,
                              btnType: mediumLargeButton,
                            ),
                        ),
                        Expanded(
                            child: BaseButton(
                              title: translate(context).comment.toUpperCase(),
                              onPressed: (){
                                showCommentDialog(itemId: controller.response?[index].sId??"");
                                },
                              leftMargin: 1.5.w,
                              removeHorizontalPadding: true,
                              btnType: mediumLargeButton,
                              isActive: true,
                            ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                  StepProgressView(
                    width: MediaQuery.of(context).size.width,
                    curStep: stepperIndex+1,
                    selectedTitle: controller.response?[index].status?.name??"",
                    color: BaseColors.primaryColor,
                    titles: controller.statusTime,
                    statuses: controller.statusTitle,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
    );
  }
}
showCommentDialog({itemId}){
  ComplainReportController controller = Get.find<ComplainReportController>();
  TextEditingController commentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (_) => StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Form(
          key: formKey,
          child: AlertDialog(
            backgroundColor: ColorConstants.white,
            elevation: 10,
            scrollable: true,
            title: Stack(
              children: [
                Align(alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(top: 15),
                    child: addAlignedText(
                        "Add Comment",
                        16.sp,
                        const Color(0xFF000000),
                        FontWeight.w600),
                  ),
                ),
                Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: GestureDetector(
                      onTap: (){
                        BaseOverlays().dismissOverlay();
                      },
                      child: const Icon(Icons.close,color: Color(0xFF929292),),
                    ),
                )
              ],
            ),
            contentPadding: const EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            content: SizedBox(
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: commentController,
                      hintText: translate(context).comment,maxLine: 4,
                      validator: (val){
                        if ((val??"").isEmpty) {
                          return "Please enter comment";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 2.h ,),
                    Align(
                        alignment: Alignment.topCenter,
                        child: BaseButton(title: translate(context).submit_btn_txt, onPressed: () {
                          if (formKey.currentState?.validate()??false) {
                            controller.sendCommentComplaintReport(itemId: itemId, comment: commentController.text.trim());
                          }
                        }, btnType: 'mediumlarge',borderRadius: 20,)
                    ),
                    SizedBox(height: 1.h),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}