import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/complaints_report_screen/controller/complaint_report_controller.dart';
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
    return Obx(()=>(controller.list?.length??0) == 0 ? BaseNoData() :
    ListView.builder(
      itemCount: controller.list?.length??0,
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 8.h),
      itemBuilder: (context, index) {
        int stepperIndex = -5;
        controller.statusTime.value = [];
        controller.statusTitle.value = [];
        controller.list?[index].requestStatus?.toList().asMap().forEach((loopIndex,element) {
          controller.statusTitle.add(toBeginningOfSentenceCase(element.name??"N/A")??"N/A");
          controller.statusTime.add(convertDateFormat3(element.time??""));
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
                          // todo - Navigation
                        },
                        onDeleteProceed: (){
                          // Get.back();
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        showGeneralDialog(
                          context: context,
                          pageBuilder:  (context, animation, secondaryAnimation) {
                            return const UploadEvidencePopup();
                          },
                        );
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(uploadDocSvg),
                          const SizedBox(
                            height: 2.0,
                          ),
                          Text(translate(context).upload_evidence1, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 13.sp),textAlign: TextAlign.center,)
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
                      detailsLabel: getFormattedDate(controller.list?[index].createdAt??""),
                      showDivider: false,
                      rightMargin: 10.w,
                    ),
                    Text("to"),
                    BaseDetailData(
                      leftMargin: 10.w,
                      prefixIcon: "assets/images/time_icon.svg",
                      detailsLabel: getFormattedTime(controller.list?[index].createdAt??""),
                      showDivider: false,
                    ),
                  ],
                ),
                const Divider(),
                BaseDetailData(
                  prefixIcon: "assets/images/report.svg",
                  detailsLabel: translate(context).reason,
                  detailsValue: toBeginningOfSentenceCase(controller.list?[index].reason??"N/A")??"N/A",
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
                        Color(0xFF000000),
                        FontWeight.w600),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: GestureDetector(
                    onTap: (){
                      BaseOverlays().dismissOverlay();
                    },
                    child: Icon(Icons.close,color: Color(0xFF929292),),
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
                      hintText: "Comment",maxLine: 4,
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
                        child: BaseButton(title: 'SUBMIT', onPressed: () {
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