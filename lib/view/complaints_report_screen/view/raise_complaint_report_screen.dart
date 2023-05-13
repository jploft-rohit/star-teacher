import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/all_complaint_reports_model.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart' as SchoolData;
import 'package:staff_app/backend/responses_model/comlaint_type_reponse.dart' as ComplaintTypeData;
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_dropdown_2.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/view/complaints_report_screen/controller/complaint_report_controller.dart';
import 'package:staff_app/view/complaints_report_screen/view/select_person_popup.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class RaiseComplaintReportScreen extends StatefulWidget {
  final bool isUpdating;
  final Data? data;
  const RaiseComplaintReportScreen({Key? key, this.isUpdating = false, this.data}) : super(key: key);

  @override
  State<RaiseComplaintReportScreen> createState() => _RaiseComplaintReportScreenState();
}

class _RaiseComplaintReportScreenState extends State<RaiseComplaintReportScreen> {
  ComplainReportController controller = Get.find<ComplainReportController>();
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();

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
                Obx(()=>BaseDropDown2(
                    controller: controller.selectSchoolController.value,
                    errorText: "Please select school",
                    hintText: controller.selectSchoolController.value.text.isEmpty ? "Select School" : controller.selectSchoolController.value.text,
                    listData: baseCtrl.schoolListData.data?.data?.map((SchoolData.SchoolData data){
                      return DropdownMenuItem(
                        value: data,
                        child: addText(data.name??"", 15.sp, Colors.black, FontWeight.w400),
                      );
                    }).toList(),
                    onChange: (value) async {
                      controller.selectSchoolController.value.text = value?.name??"";
                      controller.selectedSchoolId.value = value?.sId??"";
                      setState(() {
                        controller.selectSchoolController.value.text = value?.name??"";
                      });
                      await baseCtrl.getComplaintTypeData(initialSchoolId: value?.sId??"");
                    },
                  )),
                Obx(()=>BaseTextFormField(
                  controller: controller.complaintOrReportController.value,
                  hintText: "Select complaint or report",
                  isDropDown: true,
                  errorText: "Please select type",
                  dropDownValue: controller.complaintOrReportController.value.text,
                  onChanged: (newValue){
                    setState(() {
                      controller.complaintOrReportController.value.text = newValue.toString();
                    });},
                  items: DummyLists().complaintList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                  }).toList(),
                ),
                ),
                Obx(()=>BaseTextFormField(
                    controller: controller.personController.value,
                    hintText: "Select person",
                    suffixIcon: "assets/images/ic_down.svg",
                    // errorText: "Please select person",
                    onTap: (){
                      if ((controller.selectedSchoolId.value).isNotEmpty) {
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return SelectPersonPopup(selectedSchoolId: controller.selectedSchoolId.value,);
                          },
                        );
                      }else{
                        Fluttertoast.cancel();
                        Fluttertoast.showToast(msg: "Please first select school",gravity: ToastGravity.CENTER);
                      }
                    },
                    validator: (val){
                      if ((controller.selectedPersonId.value).isEmpty) {
                        return "Please select person";
                      }
                      return null;
                    },
                    bottomMargin: 1.h,
                  ),
                ),
                Obx(()=>BaseTextFormField(
                    controller: controller.typeController.value,
                    hintText: controller.typeController.value.text.isEmpty ? "Complaint Type" : controller.typeController.value.text.trim(),
                    isDropDown: true,
                    dropDownValue: controller.typeController.value.text,
                    errorText: "Please select complaint type",
                    items: baseCtrl.complaintTypeResponse.data?.map((ComplaintTypeData.Data value) {
                      return DropdownMenuItem<ComplaintTypeData.Data>(
                        value: value,
                        child: addText(value.name??"", 16.sp, Colors.black, FontWeight.w400),);
                    }).toList(),
                    onChanged: (value){
                      controller.selectedComplaintTypeId.value = value.sId??"";
                      controller.typeController.value.text = value.name??"";
                    },
                  ),
                ),
                Obx(()=>BaseTextFormField(
                    controller: controller.titleController.value,
                    hintText: "Title",
                    bottomMargin: 1.h,
                    validator: (val){
                      if (controller.titleController.value.text.isEmpty) {
                        return "Please enter the title";
                      }
                      return null;
                    },
                  ),
                ),
                Obx(()=>BaseTextFormField(
                    controller: controller.messageController.value,
                    maxLine: 4,
                    hintText: "Message",
                    bottomMargin: 1.h,
                    validator: (val){
                      if (controller.messageController.value.text.isEmpty) {
                        return "Please enter the message";
                      }
                      return null;
                    },
                  ),
                ),
                Obx(()=>BaseTextFormField(
                    controller: controller.uploadController.value,
                    hintText: "Upload file or Photo",
                    suffixIcon: "assets/images/upload_icon.svg",
                    bottomMargin: 4.h,
                    onTap: (){
                      BaseOverlays().showMediaPickerDialog();
                    },
                  ),
                ),
                BaseButton(title: "SUBMIT", onPressed: (){
                  if (widget.isUpdating) {
                    controller.updateComplainReportAPI(
                      itemId: widget.data?.sId??"",
                      school: controller.selectedSchoolId.value,
                      forEnquiry: (widget.data?.forEnquery??"").toLowerCase(),
                      title: controller.titleController.value.text.trim(),
                      complaintUser: widget.data?.complaintUser,
                      description: controller.messageController,
                      complaintType: widget.data?.forEnquery??""
                    );
                  }else{
                    controller.createComplainReportAPI(
                        school: controller.selectedSchoolId.value,
                        forEnquiry: controller.complaintOrReportController.value.text.trim().toLowerCase(),
                        complaintUser: controller.selectedPersonId.value,
                        complaintType: controller.selectedComplaintTypeId.value,
                        title: controller.titleController.value.text.trim(),
                        description: controller.messageController.value.text.trim(),
                        document: "doc.pdf"
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
