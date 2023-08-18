import 'dart:io';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/task_reminder_list_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/time_picker.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/task_or_reminder_screen/controller/task_reminder_ctrl.dart';

class AddTaskOrReminderScreen extends StatefulWidget {
  final bool isUpdating;
  final String? meetingId;
  final TaskReminderListData? data;
  const AddTaskOrReminderScreen({Key? key, this.isUpdating = false, this.data, this.meetingId}) : super(key: key);

  @override
  State<AddTaskOrReminderScreen> createState() => _AddTaskOrReminderScreenState();
}

class _AddTaskOrReminderScreenState extends State<AddTaskOrReminderScreen> {

  late TaskReminderCtrl controller;

  @override
  void initState() {
    super.initState();
    if(Get.isRegistered<TaskReminderCtrl>()){
      controller = Get.find<TaskReminderCtrl>();
    }else{
      controller = Get.put(TaskReminderCtrl());
    }
    controller.setData(isUpdating: widget.isUpdating, data: widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: widget.isUpdating ? "Edit Task or Reminder" : translate(context).add_task_or_remainders),
      body: Obx(()=>Form(
        key: controller.formKey,
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
                          groupValue: controller.remindType.value,
                          activeColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                          fillColor:
                          MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                          onChanged: (value){
                            controller.remindType.value = value.toString();
                            controller.isShowDate.value = false;
                          },
                        ),
                      ),
                      SizedBox(width: 5),
                      addText(translate(context).daily, radioButtonTitleTs, Colors.black, FontWeight.w400)
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      SizedBox(
                        height: 15,
                        width: 15,
                        child: Radio(
                          value: "specific_days",
                          activeColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                          fillColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                          groupValue: controller.remindType.value,
                          onChanged: (value){
                            controller.remindType.value = value.toString();
                            setState(() {
                              controller.isShowDate.value = false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 5),
                      addText(translate(context).specific_days, radioButtonTitleTs, Colors.black, FontWeight.w400)
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      SizedBox(
                        height: 15,
                        width: 15,
                        child: Radio(
                          value: "specific_date",
                          activeColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                          fillColor: MaterialStateColor.resolveWith((states) => BaseColors.primaryColor),
                          groupValue: controller.remindType.value,
                          onChanged: (value){
                            controller.remindType.value = value.toString();
                            setState(() {
                              controller.isShowDate.value = true;
                             },
                           );
                          },
                        ),
                      ),
                      SizedBox(width: 5,),
                      addText(translate(context).specific_date, radioButtonTitleTs, Colors.black, FontWeight.w400)
                    ],
                  ),
                ],
              ),
              controller.remindType.value=="specific_days" ? Card(
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
                  itemCount: controller.specificDaysList.length,
                  itemBuilder: (context, index) =>
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Transform.scale(
                              scale: 0.8,
                              child: SizedBox(
                                width: 20,
                                child: Checkbox(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  value: controller.selectedSpecificDays.contains((controller.specificDaysList[index])),
                                  activeColor: Color(0xFFF7F7F7),
                                  checkColor: Color(0xFFC19444),
                                  side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
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
                                      if (controller.selectedSpecificDays.contains(controller.specificDaysList[index])) {
                                        controller.selectedSpecificDays.remove(controller.specificDaysList[index]);  // unselect
                                      } else {
                                        controller.selectedSpecificDays.add(controller.specificDaysList[index]); // select
                                      }
                                    });
                                    print(controller.selectedSpecificDays);
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          addText(controller.specificDaysList[index], 13, Colors.black, FontWeight.normal)
                          ////SizedBox/Text
                        ], //<Widget>[]
                      ), //R
                ),
              ):SizedBox.shrink(),
              MediaQuery(
                data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                child: TimePickerDialogs(
                    initialTime: widget.isUpdating ? TimeOfDay(
                        hour: int.parse(controller.updatedTime[0]),
                        minute: int.parse(controller.updatedTime[1])) : TimeOfDay.now(),
                    isShowdate: controller.isShowDate.value,
                    onChange: (v){
                      String localTime = "${(v?.hour??0) <= 9 ? "0" + (v?.hour??0).toString() : (v?.hour??0)}:"+"${(v?.minute??0) <= 9 ? "0"+(v?.minute??0).toString():(v?.minute??0)}";
                      controller.selectedTime.value = localTime;
                    },
                ),
              ),
              Visibility(
                visible: controller.remindType.value == "specific_date",
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: widget.isUpdating
                      ? DateTime(
                          int.parse(controller.updatedDate[2]),
                          int.parse(controller.updatedDate[1]),
                          int.parse(controller.updatedDate[0]),
                        )
                      : DateTime.now(),
                  selectionColor: Colors.white,
                  selectedTextColor: Colors.black,
                  monthTextStyle: TextStyle(color: Color(0xFF7E7E7E),fontSize: 10),
                  dateTextStyle: TextStyle(color: Color(0xFF7E7E7E),fontSize: 20),
                  dayTextStyle: TextStyle(color: Color(0xFF7E7E7E),fontSize: 10),
                  onDateChange: (date) {
                    controller.selectedDate.value = formatBackendDate(date.toString());
                  },
                ),
              ),
              SizedBox(height: 15),
              CustomTextField(
                controller: controller.reminderInput.value,
                hintText: translate(context).reminder_text,
                maxLine: 4,
                validator: (val){
                  if(controller.reminderInput.value.text.isEmpty){
                    return "Reminder can't be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 2.h),
              BaseTextFormField(
                controller: controller.uploadController.value,
                hintText: translate(context).upload_file_or_photo,
                suffixIcon: "assets/images/upload_icon.svg",
                onTap: (){
                  BaseOverlays().showMediaPickerDialog(onCameraClick: () async {
                    BaseOverlays().dismissOverlay();
                    ImagePicker picker = ImagePicker();
                    await picker.pickImage(source: ImageSource.camera,imageQuality: 50).then((value){
                      if (value != null) {
                        controller.selectedFile?.value = File(value.path);
                        controller.uploadController.value.text = value.path.split("/").last;
                      }
                    },
                    );
                  },
                      onGalleryClick: () async {
                        BaseOverlays().dismissOverlay();
                        ImagePicker picker = ImagePicker();
                        await picker.pickImage(source: ImageSource.gallery,imageQuality: 50).then((value){
                          if (value != null) {
                            controller.selectedFile?.value = File(value.path);
                            controller.uploadController.value.text = value.path.split("/").last;
                          }
                        });
                      },
                      onFilePick: (){
                        BaseOverlays().dismissOverlay();
                        pickFile().then((value) {
                          controller.selectedFile?.value = File(value);
                          controller.uploadController.value.text = (value.split("/").last);
                        });
                      }
                  );
                },
              ),
              Align(
                alignment: Alignment.topCenter,
                child: BaseButton(title: translate(context).set_reminder.toUpperCase(), onPressed: (){
                  if (widget.isUpdating) {
                    controller.updateTaskReminder(id: widget.data?.sId??"", meetingId: widget.meetingId??"");
                  }else{
                    controller.createTaskReminder(meetingId: widget.meetingId??"");
                  }
                },btnType: largeButton),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
