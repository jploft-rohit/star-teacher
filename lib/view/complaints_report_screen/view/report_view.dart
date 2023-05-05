import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_detail_data.dart';
import 'package:staff_app/utility/base_views/base_edit_delete.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/step_progress.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/complaints_report_screen/controller/complaint_report_controller.dart';
import 'package:staff_app/view/complaints_report_screen/view/raise_complaint_report_screen.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  ComplainReportController controller = Get.find<ComplainReportController>();
  final List<String> pendingMeetingdates = ['July 2,\n8:30PM', 'July 3,\n10:30AM', ''];

  final List<String> heading = [
    'Concern\nRaised',
    'InProgress',
    'Concern\nSolved',
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(()=>ListView.builder(
      itemCount: controller.response?.length??0,
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseEditDelete(
                  heading: controller.response?[index].title??"",
                  editTitle: controller.response?[index].forEnquery??"",
                  deleteTitle: controller.response?[index].forEnquery??"",
                  onEditProceed: (){
                    BaseOverlays().closeOverlay();
                    Get.to(RaiseComplaintReportScreen(isUpdating: true,data: controller.response?[index]));
                  },
                  onDeleteProceed: (){
                    controller.deleteItem(id: controller.response?[index].sId??"", index: index);
                  },
                ),
                const Divider(),
                BaseDetailData(
                  prefixIcon: "assets/images/user 1.svg",
                  detailsLabel: "Star",
                  detailsValue: controller.response?[index].student??"",
                ),
                Row(
                  children: [
                    BaseDetailData(
                      prefixIcon: "assets/images/Vector (1).svg",
                      detailsLabel: "01/03/2022",
                      showDivider: false,
                    ),
                    BaseDetailData(
                      leftMargin: 10.w,
                      prefixIcon: "assets/images/time_icon.svg",
                      detailsLabel: "09:13pm",
                      showDivider: false,
                    ),
                  ],
                ),
                const Divider(),
                BaseDetailData(
                  prefixIcon: "assets/images/report.svg",
                  detailsLabel: "Type",
                  detailsValue: controller.response?[index].forEnquery??"",
                ),
                BaseDetailData(
                  prefixIcon: "assets/images/user.svg",
                  detailsLabel: "Person",
                  detailsValue: controller.response?[index].complaintUser??"",
                ),
                BaseDetailData(
                  prefixIcon: "assets/images/report.svg",
                  detailsLabel: "Complain Type",
                  detailsValue: controller.response?[index].complaintType??"",
                ),
                BaseDetailData(
                  prefixIcon: "assets/images/report.svg",
                  detailsLabel: "Comment",
                  detailsValue: controller.response?[index].description??"",
                ),
                Visibility(
                  visible: false,
                  child: BaseDetailData(
                    prefixIcon: "assets/images/report.svg",
                    detailsLabel: "Feedback",
                    detailsValue: "Please upload the feedback of all the stars in suggested class into the excel worksheet.",
                  ),
                ),
                Visibility(
                  visible: index != 0,
                  child: Row(
                    children: [
                      Expanded(child: BaseButton(title: translate(context).accept.toUpperCase(), onPressed: (){},rightMargin: 1.5.w,isActive: false,removeHorizontalPadding: true,btnType: mediumLargeButton,)),
                      Expanded(child: BaseButton(title: translate(context).comment.toUpperCase(), onPressed: (){showCommentDialog(context);
                      },leftMargin: 1.5.w,removeHorizontalPadding: true,btnType: mediumLargeButton,)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                StepProgressView(
                  width: MediaQuery.of(context).size.width,
                  curStep: index+1,
                  color: BaseColors.primaryColor,
                  titles: pendingMeetingdates,
                  statuses: heading,
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
showCommentDialog(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
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
            ),),

          Align(
              alignment: AlignmentDirectional.topEnd,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.close,color: Color(0xFF929292),),
              ))
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
              CustomTextField(controller: TextEditingController(), hintText: "Comment",maxLine: 4,),
              SizedBox(height: 2.h ,),
              Align(
                  alignment: Alignment.topCenter,
                  child: BaseButton(title: 'SUBMIT', onPressed: () {
                    Navigator.pop(context);
                  }, btnType: 'mediumlarge',borderRadius: 20,)
              ),
              SizedBox(height: 1.h ,),

            ],
          ),
        ),
      ),
    ),
  );
}
