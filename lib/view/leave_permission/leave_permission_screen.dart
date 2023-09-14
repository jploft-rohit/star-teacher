
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_dropdown.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

import '../../Utility/images_icon_path.dart';

class LeavePermissionScreen extends StatefulWidget {
  const LeavePermissionScreen({Key? key}) : super(key: key);

  @override
  State<LeavePermissionScreen> createState() => _LeavePermissionScreenState();
}

class _LeavePermissionScreenState extends State<LeavePermissionScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController outTimeController = TextEditingController();
  TextEditingController inTimeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController uploadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: translate(context).leave_permission),
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
                controller: dateController,
                hintText: translate(context).dd_mm_yyyy,
                title: translate(context).date,
                prefixIcon: calenderDateSvg,
                onTap: (){
                  selectDate(context);
                },
              ),
              BaseTextFormField(
                controller: outTimeController,
                hintText: "10:30 AM",
                title: translate(context).out_time,
                prefixIcon: "assets/images/time_icon1.svg",
                onTap: (){
                  selectTime(context);
                },
              ),
              BaseTextFormField(
                controller: inTimeController,
                hintText: "11:30 AM",
                title: translate(context).in_time,
                prefixIcon: "assets/images/time_icon1.svg",
                onTap: (){
                  selectTime(context);
                },
              ),
              BaseTextFormField(
                controller: inTimeController,
                hintText: translate(context).type_here,
                title: translate(context).reason,
              ),
              BaseTextFormField(
                controller: reasonController,
                hintText: translate(context).upload_file_or_photo,
                suffixIcon: "assets/images/upload_icon.svg",
                bottomMargin: 10.h,
                onTap: (){},
              ),
              BaseButton(title: translate(context).submit_btn_txt, onPressed: (){
                Get.back();
              },btnType: largeButton,)
            ],
          ),
        ),
      ),
    );
  }
}

