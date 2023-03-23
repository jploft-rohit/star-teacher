import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
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
  TextEditingController complaintForController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController personController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController uploadController = TextEditingController();

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
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: CustomColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: CustomColors.borderColor
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                    const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: complaintOrReportController,
                fillColor: CustomColors.txtFieldTextColor,
                hintText: "Select complaint or report",
                borderRadius: 5.0,
                readOnly: true,
                suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: complaintForController,
                fillColor: CustomColors.txtFieldTextColor,
                hintText: "Complaint for",
                borderRadius: 5.0,
                readOnly: true,
                suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: roleController,
                fillColor: CustomColors.txtFieldTextColor,
                hintText: "Select Role",
                borderRadius: 5.0,
                readOnly: true,
                suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: personController,
                fillColor: CustomColors.txtFieldTextColor,
                readOnly: true,
                onTap: (){
                  showGeneralDialog(
                    context: context,
                    pageBuilder:  (context, animation, secondaryAnimation) {
                      return const SelectPersonPopup();
                    },
                  );
                },
                hintText: "Select person",
                borderRadius: 5.0,
                suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: typeController,
                hintText: "Complaint type",
                fillColor: CustomColors.txtFieldTextColor,
                borderRadius: 5.0,
                readOnly: true,
                suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
              ),
              SizedBox(
                height: 2.h,
              ),
              // CustomTextField(
              //   controller: TextEditingController(),
              //   hintText: "Title of complain or report",
              //   fillColor: CustomColors.txtFieldTextColor,
              //   borderRadius: 5.0,
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),
              CustomTextField(
                controller: messageController,
                maxLine: 4,
                hintText: "Message",
                borderRadius: 8.0,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                readOnly: true,
                controller: uploadController,
                hintText: "Upload file or Photo",
                fillColor: CustomColors.txtFieldTextColor,
                borderRadius: 5.0,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SvgPicture.asset("assets/images/upload_icon.svg",),
                ),
              ),
              SizedBox(
                height: 2.h,
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
      complaintForController.text = "Bus Driver";
      roleController.text = "Bus Driver";
      personController.text = "Ibrahim Khan";
      typeController.text = "Bullying";
      messageController.text = "Behavior of the driver are not good with me please take some action or ask him to understand the concern.";
      uploadController.text = "doc.pdf";
    }
  }
}
