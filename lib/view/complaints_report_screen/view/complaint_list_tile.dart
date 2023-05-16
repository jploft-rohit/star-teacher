import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_edit_delete.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_no_data.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/complaints_report_screen/controller/complaint_report_controller.dart';
import 'package:staff_app/view/complaints_report_screen/view/raise_complaint_report_screen.dart';

class ComplaintsListTile extends StatefulWidget {
  const ComplaintsListTile({Key? key}) : super(key: key);

  @override
  State<ComplaintsListTile> createState() => _ComplaintsListTileState();
}

class _ComplaintsListTileState extends State<ComplaintsListTile> {

  ComplainReportController controller = Get.find<ComplainReportController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>(controller.response?.length??0) == 0 ? BaseNoData() : ListView.builder(
      itemCount: controller.response?.length??0,
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 8.h),
      itemBuilder: (context, index) {
        int stepperIndex = -5;
        controller.statusTime.value = [];
        controller.statusTitle.value = [];
        controller.response?[index].complaintStatus?.reversed.toList().asMap().forEach((loopIndex,element) {
          controller.statusTitle.add(element.name??"");
          controller.statusTime.add(convertDateFormat3(element.createdAt??""));
          if ((element.name??"") == (controller.response?[index].status?.name??"")) {
            stepperIndex = loopIndex;
          }
        });
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseEditDelete(
                  heading: controller.response?[index].title??"Unacceptable Behavior",
                  editTitle: controller.response?[index].forEnquery??"",
                  deleteTitle: controller.response?[index].forEnquery??"",
                  onEditProceed: (){
                    BaseOverlays().dismissOverlay();
                    Get.to(RaiseComplaintReportScreen(isUpdating: true,data: controller.response?[index]));
                  },
                  onDeleteProceed: (){
                    // Get.back();
                    controller.deleteItem(id: controller.response?[index].sId??"", index: index);
                  },
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
                      detailsLabel: getFormattedDate(controller.response?[index].createdAt??""),
                      showDivider: false,
                    ),
                    BaseDetailData(
                      leftMargin: 10.w,
                      prefixIcon: "assets/images/time_icon.svg",
                      detailsLabel: getFormattedTime(controller.response?[index].createdAt??""),
                      showDivider: false,
                    ),
                  ],
                ),
                const Divider(),
                BaseDetailData(
                  prefixIcon: "assets/images/report.svg",
                  detailsLabel: "Type",
                  detailsValue: toBeginningOfSentenceCase(controller.response?[index].forEnquery??"")??"",
                ),
                BaseDetailData(
                  prefixIcon: "assets/images/user.svg",
                  detailsLabel: "Person",
                  detailsValue: controller.response?[index].complaintUser?.name??"",
                ),
                BaseDetailData(
                  prefixIcon: "assets/images/report.svg",
                  detailsLabel: "${toBeginningOfSentenceCase(controller.response?[index].forEnquery??"")} Type",
                  detailsValue: controller.response?[index].complaintType?.name??"",
                ),
                BaseDetailData(
                  prefixIcon: "assets/images/report.svg",
                  detailsLabel: "Description",
                  detailsValue: controller.response?[index].description??"",
                ),
                Visibility(
                  visible: (controller.response?[index].resolverComment??"").isNotEmpty,
                  child: BaseDetailData(
                    prefixIcon: "assets/images/report.svg",
                    detailsLabel: "Feedback",
                    detailsValue: controller.response?[index].resolverComment??"",
                  ),
                ),
                Visibility(
                  visible: (controller.response?[index].selfComment??"").isNotEmpty,
                  child: BaseDetailData(
                    prefixIcon: "assets/images/report.svg",
                    detailsLabel: "Comment",
                    detailsValue: controller.response?[index].selfComment??"",
                  ),
                ),
                Visibility(
                  visible: stepperIndex == 1 && (controller.response?[index].resolverComment??"").isNotEmpty,
                  child: Row(
                    children: [
                      Expanded(child: BaseButton(title: translate(context).accept.toUpperCase(), onPressed: (){
                        controller.acceptComplaintReport(itemId: controller.response?[index].sId??"");
                      },rightMargin: 1.5.w,isActive: false,removeHorizontalPadding: true,btnType: mediumLargeButton,)),
                      Expanded(child: BaseButton(title: translate(context).comment.toUpperCase(), onPressed: (){
                        showCommentDialog(itemId: controller.response?[index].sId??"");
                      },leftMargin: 1.5.w,removeHorizontalPadding: true,btnType: mediumLargeButton,)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
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