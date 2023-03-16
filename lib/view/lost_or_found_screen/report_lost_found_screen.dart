import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';

class ReportLostFoundScreen extends StatefulWidget {
  const ReportLostFoundScreen({Key? key}) : super(key: key);

  @override
  State<ReportLostFoundScreen> createState() => _ReportLostFoundScreenState();
}

class _ReportLostFoundScreenState extends State<ReportLostFoundScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController foundDate = TextEditingController();
  TextEditingController where = TextEditingController();
  TextEditingController uploadPhoto = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(context, "Report Lost & Found", [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: SvgPicture.asset("assets/images/notification.svg"),
        )
      ]),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CustomTextField(controller: titleController, hintText: "Title",),
          SizedBox(height: 2.h),
          CustomTextField(controller: foundDate, hintText: "Found Date",readOnly: true,onTap: (){
            selectDate(context);
          },),
          SizedBox(height: 2.h),
          CustomTextField(controller: where, hintText: "Where"),
          SizedBox(height: 2.h),
          CustomTextField(controller: uploadPhoto,readOnly: true, hintText: "Upload Photo",suffixIcon: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: SvgPicture.asset("assets/images/upload_icon.svg"),
          )),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomButton(text: "SUBMIT", onPressed: (){
          Navigator.pop(context);
        }),
      ),
    );
  }
  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: CustomColors.primaryColor,
              ),
            ),
            child: child!,
          );
        },
        initialDate: DateTime.now(),
        firstDate: DateTime(1600, 8),
        lastDate: DateTime.now()
    ).then((picked){

    });
  }
}
