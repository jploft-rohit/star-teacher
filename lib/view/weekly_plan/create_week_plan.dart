import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class CreateWeekPlan extends StatefulWidget {
  final bool isUpdating;
  const CreateWeekPlan({Key? key, this.isUpdating = false}) : super(key: key);

  @override
  State<CreateWeekPlan> createState() => _CreateWeekPlanState();
}

class _CreateWeekPlanState extends State<CreateWeekPlan> {
  TextEditingController dateCtrl = TextEditingController();
  TextEditingController startTimeCtrl = TextEditingController();
  TextEditingController endTimeCtrl = TextEditingController();
  TextEditingController classCtrl = TextEditingController();
  TextEditingController sectionCtrl = TextEditingController();
  TextEditingController topicCtrl = TextEditingController();
  String? initialLeaveType = "Annual leave";

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: "${widget.isUpdating ? "Edit" : "Create"} Weekly Plan"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              CustomDropDown(
                initialValue: DummyLists.initialSchool,
                hintText: DummyLists.initialSchool??"Select School",
                listData:DummyLists.schoolData,
                onChange: (value) {
                  setState(() {
                    DummyLists.initialSchool=value;
                  });
                },
                topPadding: 5,
                bottomPadding: 5,
                icon: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4), size: 25,),
              ),
              SizedBox(height: 1.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 3.w),
                margin: EdgeInsets.only(bottom: 2.h,right: 3.w,left: 3.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: Offset(
                        0.0,
                        1.0,
                      ),
                      blurRadius: 3.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: weekNameList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisExtent: 32
                ), itemBuilder: (context,index){
                  return WeekCheckbox(title: weekNameList[index]);
                  },
                ),
              ),
              BaseTextFormField(
                topMargin: 1.h,
                controller: dateCtrl,
                title: "${translate(context).date}:",
                prefixIcon: calenderDateSvg,
                hintText: "dd/mm/yyyy",
                suffixIcon: "assets/images/ic_down.svg",
                onTap: (){
                  print("hello");
                  selectDate(context);
                },
              ),
              BaseTextFormField(
                controller: startTimeCtrl,
                title: "${translate(context).start_time}:",
                prefixIcon: "assets/images/time_icon1.svg",
                hintText: "Time",
                onTap: (){
                  selectTime(context);
                },
              ),
              BaseTextFormField(
                controller: endTimeCtrl,
                title: "${translate(context).end_time}:",
                prefixIcon: "assets/images/time_icon1.svg",
                hintText: "Time",
                onTap: (){
                  selectTime(context);
                },
              ),
              BaseTextFormField(
                controller: classCtrl,
                title: "Class",
                hintText: classCtrl.text.isEmpty ? "Class" : classCtrl.text.trim(),
                isDropDown: true,
                onChanged: (newValue){
                  setState(() {
                    classCtrl.text = newValue.toString();
                  });},
                items: classData.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                }).toList(),
              ),
              BaseTextFormField(
                controller: sectionCtrl,
                title: sectionCtrl.text.isEmpty ? "Section" : sectionCtrl.text,
                hintText: "Section",
                isDropDown: true,
                onChanged: (newValue){
                  setState(() {
                    sectionCtrl.text = newValue.toString();
                  });},
                items: sectionData.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: addText(value, 16.sp, Colors.black, FontWeight.w400));
                }).toList(),
              ),
              BaseTextFormField(
                controller: topicCtrl,
                title: "Topic Discussion",
                hintText: "Type here...",
                maxLine: 4,
              ),
              BaseButton(topMargin: 2.h, title: translate(context).submit_btn_txt, onPressed: (){
                Get.back();
              },btnType: largeButton,)
            ],
          ),
        ),
      ),
    );
  }
  List<String> weekNameList = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  List<String> classData = [
    'H1',
    'H2',
    'H3'
  ];

  List<String> sectionData = [
    'A',
    'B',
    'C'
  ];

  setData(){
    if (widget.isUpdating) {
      dateCtrl.text = "02/06/2022";
      startTimeCtrl.text = "10:30 AM";
      endTimeCtrl.text = "10:30 AM";
      classCtrl.text = "5th";
      sectionCtrl.text = "Grade 5";
      topicCtrl.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
    }
  }
}

class WeekCheckbox extends StatefulWidget {
  final String title;
  const WeekCheckbox({Key? key, required this.title}) : super(key: key);

  @override
  State<WeekCheckbox> createState() => _WeekCheckboxState();
}

class _WeekCheckboxState extends State<WeekCheckbox> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 22,
          width: 22,
          child: Checkbox(
            checkColor: Colors.white,
            activeColor: BaseColors.primaryColor,
            value: isSelected,
            side: const BorderSide(color: BaseColors.primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: (bool? value) {
              isSelected = value??false;
              setState(() {});
            },
          ),
        ),
        SizedBox(width: 4),
        Text(widget.title, style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
      ],
    );
  }
}

