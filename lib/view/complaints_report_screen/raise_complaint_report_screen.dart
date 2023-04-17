import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_dropdown.dart';
import 'package:staff_app/Utility/base_textformfield.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
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
              BaseDropDown(),
              BaseTextFormField(
                controller: complaintOrReportController,
                hintText: "Select complaint or report",
                isDropDown: true,
                dropDownValue: complaintOrReportController.text,
                onChanged: (newValue){
                  setState(() {
                    complaintOrReportController.text = newValue.toString();
                  });},
                items: DummyLists().list1.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                }).toList(),
              ),
              // BaseTextFormField(
              //   controller: complaintForController,
              //   hintText: "Complaint for",
              //   isDropDown: true,
              //   dropDownValue: complaintForController.text,
              //   onChanged: (newValue){
              //     setState(() {
              //       complaintForController.text = newValue.toString();
              //     });},
              //   items: DummyLists().list1.map((value) {
              //     return DropdownMenuItem(
              //       value: value,
              //       child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
              //   }).toList(),
              // ),
              BaseTextFormField(
                controller: roleController,
                hintText: "Select Role",
                isDropDown: true,
                dropDownValue: roleController.text,
                onChanged: (newValue){
                  setState(() {
                    roleController.text = newValue.toString();
                  });},
                items: DummyLists().list1.map((value) {
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
              ),
              BaseTextFormField(
                controller: typeController,
                hintText: "Complaint type",
                isDropDown: true,
                dropDownValue: typeController.text,
                onChanged: (newValue){
                  setState(() {
                    typeController.text = newValue.toString();
                  });},
                items: DummyLists().list1.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                }).toList(),
              ),
              BaseTextFormField(
                controller: titleController,
                hintText: "Title",
              ),
              BaseTextFormField(
                controller: messageController,
                maxLine: 4,
                hintText: "Message",
              ),
              BaseTextFormField(
                controller: uploadController,
                hintText: "Upload file or Photo",
                suffixIcon: "assets/images/upload_icon.svg",
                bottomMargin: 4.h,
              ),
              BaseButton(title: "SUBMIT", onPressed: (){})
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
