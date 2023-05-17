import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_dropdown.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class AddLeaveRequestView extends StatefulWidget {
  const AddLeaveRequestView({Key? key}) : super(key: key);

  @override
  State<AddLeaveRequestView> createState() => _AddLeaveRequestViewState();
}

class _AddLeaveRequestViewState extends State<AddLeaveRequestView> {
  TextEditingController startDateCtrl = TextEditingController();
  TextEditingController endDateCtrl = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController leaveTypeController = TextEditingController();
  TextEditingController uploadController = TextEditingController();
  var leaveTypeDropdownData = [
    // 'Leave Type'
    'Annual leave',
    'Compassionate leave',
    'Sick leave',
    'Local escort leave',
    'Abroad escort leave',
    'National service leave',
    'Event leave',
    'Hajj leave',
    'Paternity Leave',
    'Maternity Leave',
    'Leave without pay',
  ];
  String? initialLeaveType = "Annual leave";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: translate(context).leave_request),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
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
                controller: leaveTypeController,
                title: "${translate(context).leave_type}:",
                hintText: "${translate(context).leave_type}:",
                isDropDown: true,
                dropDownValue: leaveTypeController.text,
                onChanged: (newValue){
                setState(() {
                  leaveTypeController.text = newValue.toString();
                });},
                items: leaveTypeDropdownData.map((String leave) {
                return DropdownMenuItem(
                  value: leave,
                  child: addText(leave, 16.sp, Colors.black, FontWeight.w400),);
                }).toList()),
              BaseTextFormField(
                controller: startDateCtrl,
                title: "${translate(context).leave_start}:",
                prefixIcon: calenderDateSvg,
                hintText: "dd/mm/yyyy",
                onTap: (){
                  selectDate(context);
                },
              ),
              BaseTextFormField(
                controller: endDateCtrl,
                title: "${translate(context).leave_end}:",
                prefixIcon: calenderDateSvg,
                hintText: "dd/mm/yyyy",
                onTap: (){
                  selectDate(context);
                },

              ),
              BaseTextFormField(
                controller: reasonController,
                title: "${translate(context).reason}:",
                hintText: "Type here...",
              ),
              BaseTextFormField(
                controller: uploadController,
                hintText: translate(context).upload_file_or_photo,
                suffixIcon: "assets/images/upload_icon.svg",
                onTap: (){},
                bottomMargin: 10.h,
              ),
              BaseButton(title: translate(context).submit_btn_txt, onPressed: (){},btnType: largeButton,)
            ],
          ),
        ),
      ),
    );
  }
}
