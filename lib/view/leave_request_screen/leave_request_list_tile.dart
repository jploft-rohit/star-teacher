import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_edit_delete.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/complaints_report_screen/controller/complaint_report_controller.dart';
import 'package:staff_app/view/leave_request_screen/add_leave_request_view.dart';
import 'package:staff_app/view/leave_request_screen/controller/leave_request_ctrl.dart';
import 'package:staff_app/view/leave_request_screen/upload_evidence_popup.dart';
import '../../utility/images_icon_path.dart';

class LeaveRequestListTile extends StatefulWidget {
  const LeaveRequestListTile({Key? key}) : super(key: key);

  @override
  State<LeaveRequestListTile> createState() => _LeaveRequestListTileState();
}

class _LeaveRequestListTileState extends State<LeaveRequestListTile> {

  LeaveRequestCtrl controller = Get.find<LeaveRequestCtrl>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>(controller.list?.length??0) == 0 ? BaseNoData(topMargin: 30.h) :
    Expanded(
      child: ListView.builder(
        itemCount: controller.list?.length??0,
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 10.h),
        itemBuilder: (context, index) {
          int stepperIndex = -5;
          controller.statusTime.value = [];
          controller.statusTitle.value = [];
          controller.list?[index].requestStatus?.toList().asMap().forEach((loopIndex,element) {
            controller.statusTitle.add(toBeginningOfSentenceCase(element.name??"N/A")??"N/A");
            controller.statusTime.add(getFormattedTimeWithMonth(element.time??""));
            if ((element.time??"").toString().isNotEmpty) {
              stepperIndex = loopIndex;
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
                      Expanded(
                        child: BaseEditDelete(
                          heading: controller.list?[index].leaveType?.name??"N/A",
                          editTitle: "Leave Request",
                          deleteTitle: "Leave Request",
                          onEditProceed: (){
                            BaseOverlays().dismissOverlay();
                            Get.to(AddLeaveRequestView(isUpdating: true,data: controller.list?[index]));
                          },
                          onDeleteProceed: (){
                            controller.delete(id: controller.list?[index].sId??"", index: index);
                          },
                        ),
                      ),
                      SizedBox(width: 4.w),
                      GestureDetector(
                        onTap: (){
                          showGeneralDialog(
                            context: context,
                            pageBuilder:  (context, animation, secondaryAnimation) {
                              return UploadEvidencePopup(id: controller.list?[index].sId??"");
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
                    children: [
                      BaseDetailData(
                        prefixIcon: "assets/images/Vector (1).svg",
                        detailsLabel: formatBackendDate(controller.list?[index].startDate??""),
                        showDivider: false,
                        rightMargin: 10.w,
                      ),
                      Text("to"),
                      BaseDetailData(
                        leftMargin: 10.w,
                        prefixIcon: "assets/images/Vector (1).svg",
                        detailsLabel: formatBackendDate(controller.list?[index].endDate??""),
                        showDivider: false,
                      ),
                    ],
                  ),
                  const Divider(),
                  BaseDetailData(
                    prefixIcon: "assets/images/report.svg",
                    detailsLabel: translate(context).reason,
                    detailsValue: controller.list?[index].reason??"N/A",
                  ),
                  // BaseDetailData(
                  //   prefixIcon: "assets/images/user.svg",
                  //   detailsLabel: translate(context).comment,
                  //   detailsValue: toBeginningOfSentenceCase(controller.list?[index].??"N/A")??"N/A",
                  // ),
                  Visibility(
                    visible: (controller.list?[index].document??"").isNotEmpty,
                    child: BaseDetailData(
                      prefixIcon: documentSvg,
                      detailsLabel: translate(context).evidence,
                      detailsValue: (controller.list?[index].document??"").toString().split("/").last,
                      bottomMargin: 1.h,
                      suffixWidgetsList: [
                        BaseIcons().download(onRightButtonPressed: (){
                        BaseOverlays().dismissOverlay();
                        downloadFile(url: controller.list?[index].document??"",concatBaseUrl: false);
                        },leftMargin: 2.w,
                        ),
                        BaseIcons().view(url: controller.list?[index].document??"",leftMargin: 2.w,concatBaseUrl: false),
                      ],
                    ),
                  ),
                  StepProgressView(
                    width: MediaQuery.of(context).size.width,
                    curStep: stepperIndex+1,
                    selectedTitle: "",
                    textSize: 13.sp,
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