import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/time_picker.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/task_or_reminder_screen/task_or_reminder_screen.dart';

class AddTaskOrReminderScreen extends StatefulWidget {
  final bool isUpdating;
  const AddTaskOrReminderScreen({Key? key, this.isUpdating = false}) : super(key: key);

  @override
  State<AddTaskOrReminderScreen> createState() => _AddTaskOrReminderScreenState();
}

class _AddTaskOrReminderScreenState extends State<AddTaskOrReminderScreen> {
  String remainder="daily";
  bool isShowDate=false;
  List<String> specficdaylist=[
    translate(Get.context!).monday,
    translate(Get.context!).tuesday,
    translate(Get.context!).wednesday,
    translate(Get.context!).thursday,
    translate(Get.context!).friday,
    translate(Get.context!).saturday,
    translate(Get.context!).sunday
  ];
  var _selectedValue;
  var specficdaylistoption=[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: widget.isUpdating ? "Edit Task or Reminder" : translate(context).add_task_or_remainders),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
          children: [
            addText(translate(context).when_to_remind, 16, Colors.black, FontWeight.normal),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: Radio(
                        value: "daily",
                        groupValue: remainder,
                        activeColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                        fillColor:
                        MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                        onChanged: (value){
                          setState(() {
                            remainder = value.toString();
                            isShowDate=false;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 5),
                    addText(translate(context).daily, radioButtonTitleTs, Colors.black, FontWeight.w400)
                  ],
                ),
                SizedBox(width: 20,),
                Row(
                  children: [
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: Radio(
                        value: "specificdays",
                        activeColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                        fillColor:
                        MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                        groupValue: remainder,
                        onChanged: (value){
                          setState(() {
                            remainder = value.toString();
                            isShowDate=false;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 5,),
                    addText(translate(context).specific_days, radioButtonTitleTs, Colors.black, FontWeight.w400)
                  ],
                ),
                SizedBox(width: 20,),
                Row(
                  children: [
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: Radio(
                        value: "specificdate",
                        activeColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                        fillColor:
                        MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                        groupValue: remainder,
                        onChanged: (value){
                          setState(() {
                            remainder = value.toString();
                            isShowDate=true;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 5,),
                    addText(translate(context).specific_date, radioButtonTitleTs, Colors.black, FontWeight.w400)
                  ],
                ),
              ],
            ),
            remainder=="specificdays"? Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
              margin: EdgeInsets.only(top: 15),
              child:  GridView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  mainAxisExtent: MediaQuery.of(context).size.height*0.03,
                ),
                itemCount: specficdaylist.length,
                itemBuilder: (context, index) =>
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Transform.scale(
                            scale: 0.8,
                            child: SizedBox(
                              width: 20,
                              child: Checkbox(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                value: specficdaylistoption.contains(specficdaylist[index]),
                                activeColor: Color(0xFFF7F7F7),
                                checkColor: Color(0xFFC19444),
                                side: MaterialStateBorderSide.resolveWith(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.selected)) {
                                      return const BorderSide(color: Color(0xFFC19444));
                                    }
                                    return const BorderSide(color: Color(0xFFC19444));
                                  },
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    if (specficdaylistoption.contains(specficdaylist[index])) {
                                      specficdaylistoption.remove(specficdaylist[index]);  // unselect
                                    } else {
                                      specficdaylistoption.add(specficdaylist[index]); // select
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        addText(specficdaylist[index], 13, Colors.black, FontWeight.normal)
                        ////SizedBox/Text
                      ], //<Widget>[]
                    ), //R
              ),
            ):SizedBox.shrink(),
            TimePickerDialogs(initialTime: TimeOfDay.now(),isShowdate: isShowDate,),
            Visibility(
              visible: remainder == "specificdate",
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.white,
                selectedTextColor: Colors.black,
                monthTextStyle: TextStyle(color: Color(0xFF7E7E7E),fontSize: 10),
                dateTextStyle: TextStyle(color: Color(0xFF7E7E7E),fontSize: 20),
                dayTextStyle: TextStyle(color: Color(0xFF7E7E7E),fontSize: 10),
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedValue = date;
                  });
                },
              ),
            ),
            SizedBox(height: 15,),
            CustomTextField(controller: TextEditingController(), hintText: translate(context).reminder_text,maxLine: 4,),
            SizedBox(height: 2.h,),
            CustomTextField(controller: TextEditingController(), hintText: translate(context).upload_file_or_photo,
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 10),
                child: SvgPicture.asset("assets/images/upload_icon.svg"),
              ),
              fillColor: BaseColors.txtFieldTextColor,
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.topCenter,
              child: BaseButton(title: translate(context).set_reminder.toUpperCase(), onPressed: (){
                Get.back();
              },btnType: largeButton,),
            ),
          ],
        ),
      ),
    );
  }
}
