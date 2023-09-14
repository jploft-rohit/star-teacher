import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/assigned_assignment_list_response.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/staff_list_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_debouncer.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

import '../../utility/sizes.dart';

class NewAssignmentCtrl extends GetxController{
  Rx<TextEditingController> schoolCtrl = TextEditingController().obs;
  Rx<TextEditingController> searchCtrl = TextEditingController().obs;
  Rx<TextEditingController> assignmentNumberCtrl = TextEditingController().obs;
  Rx<TextEditingController> assignmentTypeCtrl = TextEditingController().obs;
  Rx<TextEditingController> assignmentToCtrl = TextEditingController().obs;
  Rx<TextEditingController> postDateCtrl = TextEditingController().obs;
  Rx<TextEditingController> postTimeCtrl = TextEditingController().obs;
  Rx<TextEditingController> submitDateCtrl = TextEditingController().obs;
  Rx<TextEditingController> submitTimeCtrl = TextEditingController().obs;
  Rx<TextEditingController> dueDateCtrl = TextEditingController().obs;
  Rx<TextEditingController> supportDocCtrl = TextEditingController().obs;
  Rx<TextEditingController> linkCtrl = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> roleController = TextEditingController().obs;
  Rx<TextEditingController> classController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  RxBool isStaffLoading = false.obs;
  Rx<File?>? selectedFile = File("").obs;
  List<StaffListData> staffData = [];
  final formKey = GlobalKey<FormState>();
  RxString selectedPersonId = "".obs;
  RxInt primaryTabIndex = 0.obs;
  RxInt secondaryTabIndex = 0.obs;
  RxString assessmentType = "".obs;
  RxString selectedSchoolId = "".obs;
  RxString selectedRollId = "".obs;
  RxString selectedClassId = "".obs;
  final baseDebouncer = BaseDebouncer();
  RxList<AssignedAssignmentData?>? list = <AssignedAssignmentData>[].obs;
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);


  getData({String? keyword, String? refreshType}) async {
    // list?.clear();
    if (refreshType == 'refresh' || refreshType == null) {
      list?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    BaseAPI().get(url: ApiEndPoints().getAssignedAssignmentList,queryParameters: {
      "assign":assessmentType.value == "awarenessCourses" || assessmentType.value == "worksheet"? primaryTabIndex.value == 0 ? "byme" : "tome" : "",
      "type":secondaryTabIndex.value == 0 ? "ongoing" : secondaryTabIndex.value == 1 ? "submitted" : "overdue",
      "assessmentType":assessmentType.value,
      "school":selectedSchoolId.value,
      "role":selectedRollId.value,
      "classId":selectedClassId.value,
      "keyword":searchCtrl.value.text.trim(),
      "limit":apiItemLimit,
      "page":page.value.toString()
    }, showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        // list?.value = AssignedAssignmentListResponse.fromJson(value?.data).data ?? [];
        if(refreshType == 'refresh'){
          list?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((AssignedAssignmentListResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        list?.addAll(AssignedAssignmentListResponse.fromJson(value?.data).data??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  setData({bool? isUpdating, AssignedAssignmentData? data}){
    if(isUpdating??false){
      schoolCtrl.value.text = data?.school?.name??"";
      selectedSchoolId.value = data?.school?.sId??"";
      assignmentNumberCtrl.value.text = data?.assignmentNo??"";
      assignmentTypeCtrl.value.text = data?.assignment??"";
      assignmentToCtrl.value.text = data?.assignTo?.name??"";
      selectedPersonId.value = data?.assignTo?.sId??"";
      postDateCtrl.value.text = formatBackendDate(data?.postDate??"",getDayFirst: false);
      postTimeCtrl.value.text = getFormattedTime(data?.postTime);
      submitDateCtrl.value.text = formatBackendDate(data?.submitDate??"",getDayFirst: false);
      submitTimeCtrl.value.text = getFormattedTime(data?.submitTime);
      dueDateCtrl.value.text = formatBackendDate(data?.dueDate??"",getDayFirst: false);
      supportDocCtrl.value.text = data?.supportDoc??"";
      linkCtrl.value.text = data?.link??"";
      uploadController.value.text = data?.supportDoc??"";
    } else {
      assignmentNumberCtrl.value.text = "";
      assignmentTypeCtrl.value.text = "";
      assignmentToCtrl.value.text = "";
      selectedPersonId.value = "";
      postDateCtrl.value.text = "";
      postTimeCtrl.value.text = "";
      submitDateCtrl.value.text = "";
      submitTimeCtrl.value.text = "";
      dueDateCtrl.value.text = "";
      supportDocCtrl.value.text = "";
      linkCtrl.value.text = "";
      uploadController.value.text = "";
    }
  }

  deleteData({required int index}) async {
    BaseOverlays().dismissOverlay();
    BaseAPI().delete(url: ApiEndPoints().deleteAssignedAssignment+list?[index]?.sId??"").then((value){
      if (value?.statusCode ==  200) {
        list?.removeAt(index);
        list?.refresh();
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  getStaffData({required String selectedRoleId}){
    isStaffLoading.value = true;
    staffData = [];
    var data = {
      "school" : selectedSchoolId.value,
      "roleName" : selectedRoleId
    };
    BaseAPI().get(url: ApiEndPoints().getStaffData, queryParameters: data, showLoader: false).then((value){
      if (value?.statusCode ==  200) {
        isStaffLoading.value = false;
        staffData = StaffListResponse.fromJson(value?.data).data??[];
      }else{
        isStaffLoading.value = false;
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
     },
    );
  }

  createData() async {
    if (formKey.currentState?.validate()??false) {
      var data;
      if ((selectedFile?.value?.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          "school":selectedSchoolId.value,
          "title":titleController.value.text.trim(),
          "assignmentNo":assignmentNumberCtrl.value.text.trim(),
          "type":assessmentType.value == "worksheet" ? assessmentType.value.toLowerCase : (assignmentTypeCtrl.value.text.trim()) == "Awareness & courses" ? "awarenessCourses" : (assignmentTypeCtrl.value.text.trim()).toLowerCase(),
          "assignTo[]":selectedPersonId.value,
          "postDate":postDateCtrl.value.text.trim(),
          "postTime":postTimeCtrl.value.text.trim(),
          "submitDate":submitDateCtrl.value.text.trim(),
          "submitTime":submitTimeCtrl.value.text.trim(),
          "dueDate":dueDateCtrl.value.text.trim(),
          "link":linkCtrl.value.text.trim(),
          "description":descriptionController.value.text.trim(),
          "document":await dio.MultipartFile.fromFile(selectedFile?.value?.path??"", filename: selectedFile?.value?.path.split("/").last??""),
        });
      }else{
        data = dio.FormData.fromMap({
          "school":selectedSchoolId.value,
          "title":titleController.value.text.trim(),
          "assignmentNo":assignmentNumberCtrl.value.text.trim(),
          "type":assessmentType.value == "worksheet"
              ? (assessmentType.value).toLowerCase()
              : (assignmentTypeCtrl.value.text.trim()) == "Awareness & courses"
              ? "awarenessCourses"
              : (assignmentTypeCtrl.value.text.trim()).toLowerCase(),
          "assignTo[]":selectedPersonId.value,
          "postDate":postDateCtrl.value.text.trim(),
          "postTime":postTimeCtrl.value.text.trim(),
          "submitDate":submitDateCtrl.value.text.trim(),
          "submitTime":submitTimeCtrl.value.text.trim(),
          "dueDate":dueDateCtrl.value.text.trim(),
          "link":linkCtrl.value.text.isEmpty ? "  " : linkCtrl.value.text.trim(),
          "description":descriptionController.value.text.trim(),
        });
      }
      BaseAPI().post(url: ApiEndPoints().assignAssignment, data: data).then((value){
        if (value?.statusCode ==  200) {
          selectedRollId.value = "";
          selectedSchoolId.value = "";
          selectedClassId.value = "";
          Get.back();
          BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"", title: translate(Get.context!).success);
          getData();
        } else {
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
        }
      },
      );
    }
  }
}