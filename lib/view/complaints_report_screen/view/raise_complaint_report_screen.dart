import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/all_complaint_reports_model.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/complaints_report_screen/controller/complaint_report_controller.dart';
import 'package:staff_app/view/complaints_report_screen/view/select_person_popup.dart';

class RaiseComplaintReportScreen extends StatefulWidget {
  final bool isUpdating;
  final AllComplainReportData? data;
  const RaiseComplaintReportScreen({Key? key, this.isUpdating = false, this.data}) : super(key: key);

  @override
  State<RaiseComplaintReportScreen> createState() => _RaiseComplaintReportScreenState();
}

class _RaiseComplaintReportScreenState extends State<RaiseComplaintReportScreen> {
  ComplainReportController controller = Get.find<ComplainReportController>();

  @override
  void initState() {
    super.initState();
    controller.setData(isUpdating: widget.isUpdating,data: widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: BaseAppBar(title: "${widget.isUpdating ? "Update" : "Raise"} Complaint & report"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(scaffoldPadding),
            child: Column(
              children: [
                CustomDropDown(
                  initialValue: DummyLists.initialSchool,
                  hintText: "Select School",
                  listData:DummyLists.schoolData,
                  onChange: (value) {
                    setState(() {
                      DummyLists.initialSchool=value.toString();
                    });
                  },
                  topPadding: 5,
                  bottomPadding: 5,
                  icon: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25,),
                  bottomMargin: 2.h,
                ),
                Visibility(
                  visible: !widget.isUpdating,
                  child: BaseTextFormField(
                    controller: controller.complaintOrReportController,
                    hintText: "Select complaint or report",
                    isDropDown: true,
                    errorText: "Please select type",
                    dropDownValue: controller.complaintOrReportController.text,
                    onChanged: (newValue){
                      setState(() {
                        controller.complaintOrReportController.text = newValue.toString();
                      });},
                    items: DummyLists().complaintList.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                    }).toList(),
                  ),
                ),
                BaseTextFormField(
                  controller: controller.personController,
                  hintText: "Select person",
                  suffixIcon: "assets/images/ic_down.svg",
                  // errorText: "Please select person",
                  onTap: (){
                    showGeneralDialog(
                      context: context,
                      pageBuilder:  (context, animation, secondaryAnimation) {
                        return const SelectPersonPopup();
                      },
                    );
                  },
                  bottomMargin: 1.h,
                ),
                BaseTextFormField(
                  controller: controller.typeController,
                  hintText: "Complaint Type",
                  isDropDown: true,
                  dropDownValue: controller.typeController.text,
                  errorText: "Please select complaint type",
                  onChanged: (newValue){
                    setState(() {
                      controller.typeController.text = newValue.toString();
                    });},
                  items: DummyLists().complainttypeList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                  }).toList(),
                ),
                BaseTextFormField(
                  controller: controller.titleController,
                  hintText: "Title",
                  bottomMargin: 1.h,
                  validator: (val){
                    if ((val??"").isEmpty) {
                      return "Please enter the title";
                    }
                    return null;
                  },
                ),
                BaseTextFormField(
                  controller: controller.messageController,
                  maxLine: 4,
                  hintText: "Message",
                  bottomMargin: 1.h,
                  validator: (val){
                    if ((val??"").isEmpty) {
                      return "Please enter the message";
                    }
                    return null;
                  },
                ),
                BaseTextFormField(
                  controller: controller.uploadController,
                  hintText: "Upload file or Photo",
                  suffixIcon: "assets/images/upload_icon.svg",
                  bottomMargin: 4.h,
                ),
                BaseButton(title: "SUBMIT", onPressed: (){
                  if (widget.isUpdating) {
                    controller.updateComplainReportAPI(
                      itemId: widget.data?.sId??"",
                      school: DummyLists.initialSchool,
                      forEnquiry: widget.data?.forEnquery??"",
                      title: controller.titleController.text.trim(),
                      complaintUser: widget.data?.complaintUser,
                      description: controller.messageController,
                      complaintType: widget.data?.forEnquery??""
                    );
                  }else{
                    controller.createComplainReportAPI(
                        itemId: widget.data?.sId??"",
                        school: DummyLists.initialSchool,
                        forEnquiry: "complaint",
                        title: controller.titleController.text.trim(),
                        complaintUser: widget.data?.complaintUser,
                        description: controller.messageController,
                        complaintType: widget.data?.forEnquery??"",
                    );
                  }
                },btnType: largeButton,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.setData(isUpdating: widget.isUpdating);
    super.dispose();
  }
}
