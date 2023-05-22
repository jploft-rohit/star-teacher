import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/task_reminder_list_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/utility/intl/src/intl/date_format.dart';

class TaskReminderCtrl extends GetxController{
  RxList<TaskReminderListData>? list = <TaskReminderListData>[].obs;
  RxString remindType = "daily".obs;
  RxString selectedTime = ((TimeOfDay.now()).toString()).obs;
  RxString selectedDate = getFormattedDate(DateTime.now().toString()).obs;
  RxBool isShowDate = false.obs;
  List<String> updatedTime = [];
  List<String> updatedDate = [];
  RxList<String> selectedSpecificDays = <String>[].obs;
  final formKey = GlobalKey<FormState>();
  Rx<TextEditingController> reminderInput = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    selectedTime.value = "${TimeOfDay.now().format(Get.context!).toString()}";
    getTaskReminders();
  }

  getTaskReminders(){
    list?.value = [];
    BaseAPI().get(url: ApiEndPoints().getAllTaskReminders).then((value){
      if (value?.statusCode ==  200) {
        list?.value = TaskReminderListResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  deleteTaskReminder({required final String id, required final int index}){
    BaseOverlays().dismissOverlay();
    BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
    BaseAPI().delete(url: ApiEndPoints().deleteTaskReminder+id).then((value){
      if (value?.statusCode ==  200) {
        list?.removeAt(index);
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: "Success");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  createTaskReminder({XFile? file}) async {
    if (formKey.currentState?.validate()??false) {
      var data;
      if (file == null) {
        data = dio.FormData.fromMap({
          "type":remindType.value, // daily, specific_days, specific_date
          "time":(selectedTime+":00").toString(),
          "remider":reminderInput.value.text.trim(), // Reminder Input
          "typeValue":selectedSpecificDays.isNotEmpty ? selectedSpecificDays.join(",") : "", // For Specific Days
          "date":remindType.value == "specific_date" ? selectedDate.value : getFormattedDate(DateTime.now().toString()), // For Specific Date
          "forType":"mySelf",
        });
      }else{
        data = dio.FormData.fromMap({
          "type":remindType.value, // daily, specific_days, specific_date
          "time":(selectedTime+":00").toString(),
          "remider":reminderInput.value.text.trim(), // Reminder Input
          "typeValue":selectedSpecificDays.isNotEmpty ? selectedSpecificDays.join(",") : "", // For Specific Days
          "date":remindType.value == "specific_date" ? selectedDate.value : getFormattedDate(DateTime.now().toString()), // For Specific Date
          "forType":"mySelf",
          "document":await dio.MultipartFile.fromFile(file.path,filename: file.name)
        });
      }
      BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
      BaseAPI().post(url: ApiEndPoints().createTaskReminder,data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
          BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: "Success");
          getTaskReminders();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }

  setData({isUpdating, TaskReminderListData? data}){
    String localTime;
    String localDate;
    if (isUpdating) {
      reminderInput.value.text = data?.remider??"";
      localTime = DateFormat.Hm().format(DateTime.parse(data?.time??""));
      updatedTime = localTime.split(":");
      localDate = getFormattedDate(data?.date??"");
      updatedDate = localDate.split("-");
      remindType.value = data?.type??"daily";
      selectedSpecificDays.value = (data?.typeValue??"").toString().split(",");
    }else{
      reminderInput.value.text = "";
      uploadController.value.text = "";
      selectedTime.value = "${TimeOfDay.now().format(Get.context!).toString()}";
      remindType = "daily".obs;
      selectedSpecificDays.value = [];
    }
  }

  List<String> specificDaysList=[
    translate(Get.context!).monday,
    translate(Get.context!).tuesday,
    translate(Get.context!).wednesday,
    translate(Get.context!).thursday,
    translate(Get.context!).friday,
    translate(Get.context!).saturday,
    translate(Get.context!).sunday
  ];

  @override
  void onClose() {
    super.onClose();
  }
}