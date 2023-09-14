import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_edit_delete.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_pagination_footer.dart';
import 'package:staff_app/utility/step_progress.dart';
import 'package:staff_app/view/request_online_classes/controller/online_class_request_controller.dart';
import 'package:staff_app/view/request_online_classes/create_online_class_request.dart';
import 'package:staff_app/view/request_online_classes/upload_evidence_popup.dart';

import '../../utility/images_icon_path.dart';
import '../../utility/sizes.dart';

class OnlineClassRequestTile extends StatefulWidget {

  const OnlineClassRequestTile({Key? key}) : super(key: key);

  @override
  State<OnlineClassRequestTile> createState() => _OnlineClassRequestTileState();
}

class _OnlineClassRequestTileState extends State<OnlineClassRequestTile> {
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  OnlineClassRequestController controller = Get.find<OnlineClassRequestController>();

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
      child: (controller.list?.length??0) == 0
          ? BaseNoData(message: translate(context).no_online_class_request_found)
          : ListView.builder(
            itemCount: controller.list?.length??0,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 12.h),
            itemBuilder: (context, index) {
              bool isConcernSolved = false;
            List<String> stepperDates = [];
            List<String> stepperTitles = [];
            int stepperIndex = 1;
            controller.list?[index]?.requestStatus?.toList().asMap().forEach((loopIndex,element) {
              if (element.name.toString().toLowerCase() != "rejected") {
                stepperTitles.add(toBeginningOfSentenceCase(element.name??"")??"");
                stepperDates.add(getFormattedTimeWithMonth(element.time??""));
                if (element.time.toString().isNotEmpty) {
                  stepperIndex = (loopIndex+1);
                }
                if(element.name.toString().toLowerCase() == "evidence approved" && element.time.toString().isNotEmpty){
                  isConcernSolved = true;
                }
              }else{
                if ((element.time??"").toString().isNotEmpty) {
                  stepperDates = [];
                  stepperTitles = [];
                  stepperTitles.add(toBeginningOfSentenceCase(controller.list?[index]?.requestStatus?[0].name??"")??"");
                  stepperTitles.add(toBeginningOfSentenceCase(element.name??"")??"");
                  stepperDates.add(getFormattedTimeWithMonth(controller.list?[index]?.requestStatus?[0].time??""));
                  stepperDates.add(getFormattedTimeWithMonth(element.time??""));
                  if (element.time.toString().isNotEmpty) {
                    stepperIndex = (loopIndex+1);
                  }
                  isConcernSolved = false;
                  if(element.name.toString().toLowerCase() == "evidence approved" && element.time.toString().isNotEmpty){
                    isConcernSolved = true;
                  }
                }
              }
            },
          );
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: BaseEditDelete(
                          heading: translate(context).online_class_request/*controller.list?[index]?.leaveType?.name??"N/A"*/,
                          editTitle: isConcernSolved ? "" : translate(context).online_class_request,
                          deleteTitle: isConcernSolved ? "" : translate(context).online_class_request,
                          onEditProceed: (){
                            BaseOverlays().dismissOverlay();
                            Get.to(CreateOnlineClassRequest(isUpdating: true, data: controller.list?[index]));
                          },
                          onDeleteProceed: (){
                            controller.deleteData(id: controller.list?[index]?.sId??"", index: index);
                          },
                        ),
                      ),
                      SizedBox(width: isRTL ? 2.w : 4.w),
                      Visibility(
                        visible: (controller.list?[index]?.document??"").isEmpty,
                        child: GestureDetector(
                          onTap: (){
                            showGeneralDialog(
                              context: context,
                              pageBuilder:  (context, animation, secondaryAnimation) {
                                return UploadEvidencePopup(id: controller.list?[index]?.sId??"");
                              },
                            );
                          },
                          child: Column(
                            children: [
                              SvgPicture.asset(uploadDocSvg,height: 15),
                              const SizedBox(height: 2),
                              Text(translate(context).upload_slash_evidence, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 11.5.sp),textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BaseDetailData(showDivider: false,prefixIcon: "assets/images/Vector (1).svg",detailsLabel:formatBackendDate(controller.list?[index]?.startDate??"")),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(translate(context).to,style: TextStyle(fontSize: 14.sp)),
                      ),
                      BaseDetailData(showDivider: false, prefixIcon: "assets/images/Vector (1).svg",detailsLabel:formatBackendDate(controller.list?[index]?.endDate??"")),
                    ],
                  ),
                  const Divider(),
                  BaseDetailData(
                    prefixIcon: "assets/images/Group (1).svg",
                    detailsLabel:translate(context).reason,
                    detailsValue: controller.list?[index]?.reason??"N/A",
                    rightMargin: isRTL ? 0 : 2.w,
                  ),
                  BaseDetailData(
                    prefixIcon: "assets/images/Group (1).svg",
                    detailsLabel:translate(context).comment,
                    detailsValue: controller.list?[index]?.comment??"N/A",
                    rightMargin: isRTL ? 0 : 2.w,
                    showDivider: true,
                  ),
                  Visibility(
                    visible: (controller.list?[index]?.document??"").isNotEmpty,
                    child: BaseDetailData(
                      prefixIcon: documentSvg,
                      detailsLabel: translate(context).evidence,
                      detailsValue: (controller.list?[index]?.document??"").toString().split("/").last,
                      bottomMargin: 1.h,
                      suffixWidgetsList: [
                        BaseIcons().download(onRightButtonPressed: (){
                          BaseOverlays().dismissOverlay();
                          downloadFile(url: controller.list?[index]?.document??"",concatBaseUrl: false);
                        },leftMargin: 2.w,rightMargin: isRTL ? 3.w : 0,
                        ),
                        BaseIcons().view(url: controller.list?[index]?.document??"",leftMargin: 2.w,rightMargin: isRTL ? 2.w : 0, concatBaseUrl: false),
                      ],
                    ),
                  ),
                  StepProgressView(
                    width: MediaQuery.of(context).size.width,
                    curStep: stepperIndex,
                    color: BaseColors.primaryColor,
                    titles: stepperDates,
                    statuses: stepperTitles,
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
