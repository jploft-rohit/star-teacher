import 'dart:io';

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
  RxString selectedTime = TimeOfDay.now().to24hours().obs;
  RxString selectedDate = formatBackendDate(DateTime.now().toString()).obs;
  RxBool isShowDate = false.obs;
  Rx<File?>? selectedFile = File("").obs;
  List<String> updatedTime = [];
  List<String> updatedDate = [];
  RxList<String> selectedSpecificDays = <String>[].obs;
  final formKey = GlobalKey<FormState>();
  Rx<TextEditingController> reminderInput = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    // getTaskReminders();
  }

  getTaskReminders(){
    list?.value = [];
    BaseAPI().get(url: ApiEndPoints().getAllTaskReminders).then((value){
      if (value?.statusCode ==  200) {
        list?.value = TaskReminderListResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
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
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: translate(Get.context!).success);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  createTaskReminder({String? meetingId}) async {
    if (formKey.currentState?.validate()??false) {
      var data;
      if ((selectedFile?.value?.path??"").isEmpty) {
        data = dio.FormData.fromMap({
          "type":remindType.value, // daily, specific_days, specific_date
          "time":(selectedTime+":00").toString(),
          "remider":reminderInput.value.text.trim(), // Reminder Input
          "typeValue":selectedSpecificDays.isNotEmpty ? selectedSpecificDays.join(",") : "", // For Specific Days
          "date":remindType.value == "specific_date" ? selectedDate.value : formatBackendDate(DateTime.now().toString()), // For Specific Date
          "forType":"mySelf",
          "scheduleId": meetingId??"",
          "reminderType": (meetingId??"").isEmpty ? "" : "scheduleMeet",
        });
      }else{
        data = dio.FormData.fromMap({
          "type":remindType.value, // daily, specific_days, specific_date
          "time":(selectedTime+":00").toString(),
          "remider":reminderInput.value.text.trim(), // Reminder Input
          "typeValue":selectedSpecificDays.isNotEmpty ? selectedSpecificDays.join(",") : "", // For Specific Days
          "date":remindType.value == "specific_date" ? selectedDate.value : formatBackendDate(DateTime.now().toString()), // For Specific Date
          "forType":"mySelf",
          "scheduleId": meetingId??"",
          "reminderType": (meetingId??"").isEmpty ? "" : "scheduleMeet",
          "document":await dio.MultipartFile.fromFile(selectedFile?.value?.path??"", filename: (selectedFile?.value?.path??"").split("/").last)
        });
      }
      BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
      BaseAPI().post(url: ApiEndPoints().createTaskReminder,data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
          BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: translate(Get.context!).success);
          getTaskReminders();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
        }
      });
    }
  }

  updateTaskReminder({required id, String? meetingId}) async {
    if (formKey.currentState?.validate()??false) {
      var data;
      if ((selectedFile?.value?.path??"").isEmpty) {
        data = dio.FormData.fromMap({
          "type":remindType.value, // daily, specific_days, specific_date
          "time":(selectedTime+":00"),
          "remider":reminderInput.value.text.trim(), // Reminder Input
          "typeValue":selectedSpecificDays.isNotEmpty ? selectedSpecificDays.join(",") : "", // For Specific Days
          "date":remindType.value == "specific_date" ? selectedDate.value : formatBackendDate(DateTime.now().toString(),getDayFirst: false), // For Specific Date
          "forType":"mySelf",
          "scheduleId": meetingId??"",
          "reminderType": (meetingId??"").isEmpty ? "" : "scheduleMeet",
        });
      }else{
        data = dio.FormData.fromMap({
          "type":remindType.value, // daily, specific_days, specific_date
          "time":(selectedTime+":00"),
          "remider":reminderInput.value.text.trim(), // Reminder Input
          "typeValue":selectedSpecificDays.isNotEmpty ? selectedSpecificDays.join(",") : "", // For Specific Days
          "date":remindType.value == "specific_date" ? selectedDate.value : formatBackendDate(DateTime.now().toString(),getDayFirst: false), // For Specific Date
          "forType":"mySelf",
          "scheduleId": meetingId??"",
          "reminderType": (meetingId??"").isEmpty ? "" : "scheduleMeet",
          "document":await dio.MultipartFile.fromFile(selectedFile?.value?.path??"", filename: (selectedFile?.value?.path??"").split("/").last)
        });
      }
      BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
      BaseAPI().post(url: ApiEndPoints().updateTaskReminder+id,data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
          BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: translate(Get.context!).success);
          getTaskReminders();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
        }
      });
    }
  }

  setData({isUpdating, TaskReminderListData? data}){
    String localDate;
    if (isUpdating) {
      reminderInput.value.text = data?.remider??"";
      updatedTime = DateFormat.Hm().format(DateTime.parse(data?.time??"")).split(":");
      localDate = formatBackendDate(data?.date??"");
      updatedDate = localDate.split("-");
      remindType.value = data?.type??"daily";
      selectedTime.value = formatTime(DateTime.parse(data?.time??""));
      selectedSpecificDays.value = (data?.typeValue??"").toString().split(",");
      selectedFile?.value = File("");
      uploadController.value.text = (data?.document??"").split("/").last??"";
    }else{
      reminderInput.value.text = "";
      uploadController.value.text = "";
      selectedTime.value = "${TimeOfDay.now().format(Get.context!).toString()}";
      remindType = "daily".obs;
      selectedSpecificDays.value = [];
      selectedFile?.value = File("");
      updatedTime = [];
      updatedDate = [];
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