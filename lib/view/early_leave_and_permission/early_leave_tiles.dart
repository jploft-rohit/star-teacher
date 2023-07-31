import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_edit_delete.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/step_progress.dart';
import 'package:staff_app/view/early_leave_and_permission/controller/early_leave_controller.dart';
import 'package:staff_app/view/early_leave_and_permission/create_early_leave.dart';
import 'package:staff_app/view/early_leave_and_permission/upload_evidence_popup.dart';

import '../../utility/images_icon_path.dart';

class EarlyLeaveTile extends StatefulWidget {

  EarlyLeaveTile({Key? key}) : super(key: key);

  @override
  State<EarlyLeaveTile> createState() => _EarlyLeaveTileState();
}

class _EarlyLeaveTileState extends State<EarlyLeaveTile> {
  final bool isRTL = ((Directionality.of(Get.context!)) == (ui.TextDirection.rtl));
  final EarlyLeaveController controller = Get.find<EarlyLeaveController>();

  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', '', '', ""];

  final List<String> heading = [
    'Request\nRaised',
    'Accepted',
    'Planned On',
    'Completed',
  ];

  final List<String> cancelledStepperTitles = [
    'Request\nRaised',
    'Request\nCancelled',
  ];

  List<String> cancelledStepperDates = [];

  @override
  Widget build(BuildContext context) {
    return Obx(()=>(controller.list?.length??0) == 0
        ? BaseNoData(message: "No Early Leave Request Found")
        : ListView.builder(
          itemCount: controller.list?.length??0,
          shrinkWrap: true,
          itemBuilder: (context, index) {
          List<String> stepperDates = [];
          List<String> stepperTitles = [];
          int stepperIndex = 1;
          controller.list?[index]?.requestStatus?.forEach((element) {
            stepperDates.add(getFormattedTimeWithMonth(element.time??""));
            stepperTitles.add(toBeginningOfSentenceCase(element.name??"\n\n")??"\n\n");
            if ((element.time??"").isNotEmpty) {
              stepperIndex+1;
            }
          });
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
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
                        heading: "Early Leave"/*controller.list?[index]?.leaveType?.name??"N/A"*/,
                        editTitle: "Leave Request",
                        deleteTitle: "Leave Request",
                        onEditProceed: (){
                          BaseOverlays().dismissOverlay();
                          Get.to(CreateEarlyLeave(isUpdating: true, data: controller.list?[index]));
                        },
                        onDeleteProceed: (){
                          controller.deleteData(id: controller.list?[index]?.sId??"", index: index);
                        },
                      ),
                    ),
                    SizedBox(width: isRTL ? 0 : 4.w),
                    GestureDetector(
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
                          const SizedBox(
                            height: 2.0,
                          ),
                          Text("Upload\nEvidence", style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 11.5.sp),textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                BaseDetailData(prefixIcon: "assets/images/Vector (1).svg",detailsLabel:formatBackendDate(controller.list?[index]?.date??"")),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BaseDetailData(showDivider: false,prefixIcon: "assets/images/time_icon.svg",detailsLabel:getFormattedTime3(controller.list?[index]?.outTime??"")),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text("To",style: TextStyle(fontSize: 14.sp)),
                    ),
                    BaseDetailData(showDivider: false, prefixIcon: "assets/images/time_icon.svg",detailsLabel:getFormattedTime3(controller.list?[index]?.inTime??"")),
                  ],
                ),
                const Divider(),
                BaseDetailData(
                  prefixIcon: "assets/images/Group (1).svg",
                  detailsLabel:"Reason",
                  detailsValue: controller.list?[index]?.reason??"N/A",
                  rightMargin: 2.w,
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
                      },leftMargin: 2.w,rightMargin: isRTL ? 2.w : 0
                      ),
                      BaseIcons().view(url: controller.list?[index]?.document??"", leftMargin: 2.w, concatBaseUrl: false),
                    ],
                  ),
                ),
                StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: stepperIndex+3,
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
    );
  }
}
