import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_dropdown.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class ReportLostFoundScreen extends StatefulWidget {
  final String type;
  final bool isUpdating;
  const ReportLostFoundScreen({Key? key,this.isUpdating = false, required this.type}) : super(key: key);

  @override
  State<ReportLostFoundScreen> createState() => _ReportLostFoundScreenState();
}

class _ReportLostFoundScreenState extends State<ReportLostFoundScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController whereController = TextEditingController();
  TextEditingController uploadController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: widget.isUpdating ? widget.type == "Lost" ? "Update Lost Report" : "Update Found Report" : widget.type == "Lost" ? "Report Lost" : "Report Found"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
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
            BaseTextFormField(controller: titleController,hintText: translate(context).title,),
            BaseTextFormField(controller: dateController,hintText: "${widget.type} Date",onTap: (){selectDate(context);},suffixIcon: "assets/images/ic_calendar_black.svg",),
            BaseTextFormField(controller: whereController,hintText: translate(context).where,),
            BaseTextFormField(bottomMargin: 3.h,controller: uploadController,hintText: translate(context).upload_photo,suffixIcon: "assets/images/upload_icon.svg",onTap: (){}),
            BaseButton(title: widget.isUpdating ? translate(context).update : translate(context).submit_btn_txt, onPressed: (){
              Get.back();
            },btnType: largeButton,)
          ],
        ),
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
                primary: BaseColors.primaryColor,
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
  setData(){
    if(widget.isUpdating){
      titleController.text = "${widget.type} a book in the computer lab.";
      dateController.text = "28-11-2022";
      whereController.text = "In Computer Lab";
      uploadController.text = "doc.pdf";
    }
  }
}
