import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/complaints_report_screen/select_person_popup.dart';

class RaiseComplaintReportScreen extends StatefulWidget {
  final bool isUpdating;
  const RaiseComplaintReportScreen({Key? key, this.isUpdating = false}) : super(key: key);

  @override
  State<RaiseComplaintReportScreen> createState() => _RaiseComplaintReportScreenState();
}

class _RaiseComplaintReportScreenState extends State<RaiseComplaintReportScreen> {
  TextEditingController complaintOrReportController = TextEditingController();
  // TextEditingController complaintForController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController personController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController uploadController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(title: "Raise Complaint & report"),
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
                    DummyLists.initialSchool=value;
                  });
                },
                topPadding: 5,
                bottomPadding: 5,
                icon: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25,),
              ),
              SizedBox(height: 1.h,),
              BaseTextFormField(
                controller: complaintOrReportController,
                hintText: "Select complaint or report",
                isDropDown: true,
                dropDownValue: complaintOrReportController.text,
                onChanged: (newValue){
                  setState(() {
                    complaintOrReportController.text = newValue.toString();
                  });},
                items: DummyLists().complaintList.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                }).toList(),
              ),
              BaseTextFormField(
                controller: personController,
                hintText: "Select person",
                suffixIcon: "assets/images/ic_down.svg",
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
                controller: complaintOrReportController,
                hintText: "Complaint Type",
                isDropDown: true,
                dropDownValue: complaintOrReportController.text,
                onChanged: (newValue){
                  setState(() {
                    complaintOrReportController.text = newValue.toString();
                  });},
                items: DummyLists().complainttypeList.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                }).toList(),
              ),
              BaseTextFormField(
                controller: titleController,
                hintText: "Title",
                bottomMargin: 1.h,
              ),
              BaseTextFormField(
                controller: messageController,
                maxLine: 4,
                hintText: "Message",
                bottomMargin: 1.h,
              ),
              BaseTextFormField(
                controller: uploadController,
                hintText: "Upload file or Photo",
                suffixIcon: "assets/images/upload_icon.svg",
                bottomMargin: 4.h,
              ),
              BaseButton(title: "SUBMIT", onPressed: (){
                Get.back();
              },btnType: largeButton)
            ],
          ),
        ),
      ),
    );
  }

  setData(){
    if(widget.isUpdating){
      complaintOrReportController.text = "Complaint";
      // complaintForController.text = "Bus Driver";
      roleController.text = "Bus Driver";
      personController.text = "Ibrahim Khan";
      typeController.text = "Bullying";
      titleController.text = "Unacceptable Behavior";
      messageController.text = "Behavior of the driver are not good with me please take some action or ask him to understand the concern.";
      uploadController.text = "doc.pdf";
    }
  }
}
