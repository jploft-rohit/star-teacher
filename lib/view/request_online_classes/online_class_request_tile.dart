import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
import 'package:staff_app/view/request_online_classes/controller/online_class_request_controller.dart';
import 'package:staff_app/view/request_online_classes/create_online_class_request.dart';
import 'package:staff_app/view/request_online_classes/upload_evidence_popup.dart';

import '../../utility/images_icon_path.dart';

class OnlineClassRequestTile extends StatefulWidget {

  OnlineClassRequestTile({Key? key}) : super(key: key);

  @override
  State<OnlineClassRequestTile> createState() => _OnlineClassRequestTileState();
}

class _OnlineClassRequestTileState extends State<OnlineClassRequestTile> {
  OnlineClassRequestController controller = Get.find<OnlineClassRequestController>();

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
        ? BaseNoData(message: "No Online Class Requests Found")
        : ListView.builder(
          itemCount: controller.list?.length??0,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            ///
          List<String> stepperDates = [];
          List<String> stepperTitles = [];
          int stepperIndex = 1;
          // controller.list?[index]?.requestStatus?.forEach((element) {
          //   stepperDates.add(getFormattedTimeWithMonth(element.time??""));
          //   stepperTitles.add(toBeginningOfSentenceCase(element.name??"")??"");
          //   if ((element.time??"").toString().isNotEmpty) {
          //     stepperIndex+1;
          //   }
          // },
        // );
          ///
          controller.list?[index]?.requestStatus?.toList().asMap().forEach((loopIndex,element) {
            if (element.name.toString().toLowerCase() != "rejected") {
              stepperTitles.add(toBeginningOfSentenceCase(element.name??"")??"");
              stepperDates.add(getFormattedTimeWithMonth(element.time??""));
              if (element.time.toString().isNotEmpty) {
                stepperIndex = (loopIndex+1);
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
              }
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
                        heading: "Online Class Request"/*controller.list?[index]?.leaveType?.name??"N/A"*/,
                        editTitle: "Online Class Request",
                        deleteTitle: "Online Class Request",
                        onEditProceed: (){
                          BaseOverlays().dismissOverlay();
                          Get.to(CreateOnlineClassRequest(isUpdating: true, data: controller.list?[index]));
                        },
                        onDeleteProceed: (){
                          controller.deleteData(id: controller.list?[index]?.sId??"", index: index);
                        },
                      ),
                    ),
                    SizedBox(width: 4.w),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BaseDetailData(showDivider: false,prefixIcon: "assets/images/Vector (1).svg",detailsLabel:formatBackendDate(controller.list?[index]?.startDate??"")),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text("To",style: TextStyle(fontSize: 14.sp)),
                    ),
                    BaseDetailData(showDivider: false, prefixIcon: "assets/images/Vector (1).svg",detailsLabel:formatBackendDate(controller.list?[index]?.endDate??"")),
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
                      },leftMargin: 2.w,
                      ),
                      BaseIcons().view(url: controller.list?[index]?.document??"",leftMargin: 2.w,concatBaseUrl: false),
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
    );
  }
}
