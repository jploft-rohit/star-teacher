import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/notebook_list_response.dart';
import 'package:staff_app/backend/responses_model/subjects_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_debouncer.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

import '../../../utility/sizes.dart';

class NotebookCtrl extends GetxController{

  final formKey = GlobalKey<FormState>();
  /// School
  RxString selectedSchoolId = "".obs;
  RxString selectedSchoolName = "".obs;
  /// Class
  RxString selectedClassId = "".obs;
  RxString selectedClassName = "".obs;
  /// Section
  RxString selectedSectionId = "".obs;
  RxString selectedSectionName = "".obs;

  RxString selectedSubjectId = "".obs;
  RxString selectedStarId = "".obs;
  RxList<NotebookList>? notebookList = <NotebookList>[].obs;
  Rx<StarData>? starData = StarData().obs;
  final baseDebouncer = BaseDebouncer();
  final selectedIndex1 = 0.obs;
  final selectedIndex3 = 0.obs;
  final isChecked = false.obs;
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  /// Add Notebook Field Controller
  Rx<TextEditingController> schoolController = TextEditingController().obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController recommendationController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  /// Set Data for Add Notebook Field Controller
  setData({bool? isUpdating, required NotebookList? data}){
    if (isUpdating??false) {
      titleController.text = data?.title??"";
      gradeController.text = "5th";
      dateController.text = formatBackendDate(data?.date??"",getDayFirst: true);
      descriptionController.text = data?.description??"";
      recommendationController.text = data?.recommandation??"";
      commentController.text = data?.comment??"";
      schoolController.value.text = data?.school?.name??"";
      selectedSchoolId.value = data?.school?.sId??"";
      selectedSubjectId.value = data?.subject?.sId??"";
      subjectController.text = data?.subject?.name??"";
      selectedIndex3.value = (data?.type??"") == "talent" ? 0 : 1;
    }else{
      selectedIndex3.value = 0;
      titleController.text = "";
      gradeController.text = "";
      dateController.text = "";
      descriptionController.text = "";
      recommendationController.text = "";
      subjectController.text = "";
      commentController.text = "";
      selectedSchoolId.value = "";
      schoolController.value.text = "";
      selectedSubjectId.value = "";
    }
  }

  /// Add Notebook
  addNotebook(){
    if (formKey.currentState?.validate()??false) {
      var data = dio.FormData.fromMap({
        "school": selectedSchoolId.value,
        "type": selectedIndex3.value == 0 ? "talent" : "improvement",
        "title": titleController.text.trim(),
        "date": flipDate(date: dateController.text.trim()),
        "description": descriptionController.text.trim(),
        "recommandation": recommendationController.text.trim(),
        "subject": selectedSubjectId.value,
        "class": "644bb468017ff679ae0d6f0c",
        "starId": "6443a18eed5d074580c2b2a0",
        "teacher": "645255336784ea41b08b3ea8",
      });
      BaseAPI().post(url: ApiEndPoints().createNotebook, data: data).then((value){
        if (value?.statusCode == 200) {
          Get.back();
          BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
          if ((response.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: response.message??"",title: translate(Get.context!).success);
          }
          getNotebookNotes();
        }
      });
    }
  }

  /// Update Notebook
  updateNotebook({required id}){
    if (formKey.currentState?.validate()??false) {
      var data = dio.FormData.fromMap({
        "school": selectedSchoolId.value,
        "type": selectedIndex3.value == 0 ? "talent" : "improvement",
        "title": titleController.text.trim(),
        "date": dateController.text.trim(),
        "description": descriptionController.text.trim(),
        "recommandation": recommendationController.text.trim(),
        "subject": selectedSubjectId.value,
        "class": "644bb468017ff679ae0d6f0c",
        "starId": "6443a18eed5d074580c2b2a0",
        "teacher": "645255336784ea41b08b3ea8",
      });
      BaseAPI().patch(url: ApiEndPoints().updateNotebook+id,data: data).then((value){
        if (value?.statusCode == 200) {
          Get.back();
          BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
          if ((response.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: response.message??"",title: translate(Get.context!).success);
          }
          getNotebookNotes();
        }
      });
    }
  }

  /// Delete Notebook
  deleteNotebook({required String notebookId, String? reason,required int index}){
    if (formKey.currentState?.validate()??false) {
      BaseOverlays().dismissOverlay();
        final data = {
          "deletedReason": reason??""
        };
        BaseAPI().delete(url: ApiEndPoints().deleteNotebook+notebookId,data: data).then((value){
          if (value?.statusCode == 200) {
            notebookList?.removeAt(index);
            BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
            if ((response.message??"").isNotEmpty) {
              BaseOverlays().showSnackBar(message: response.message??"",title: translate(Get.context!).success);
            }
          }
        },
      );
    }
  }

  /// Get Notebook Notes
  getNotebookNotes({String? refreshType}){
    if (refreshType == 'refresh' || refreshType == null) {
      starData?.value = StarData();
      notebookList?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    final data = {
      "type":selectedIndex1.value == 0 ? "talent" : "improvement",
      "starId":selectedStarId.value,
      "limit":apiItemLimit,
      "page":page.value.toString()
    };
    BaseAPI().post(url: ApiEndPoints().getNotebookList,data: data, showLoader: page.value == 1).then((value){
      if (value?.statusCode == 200) {
        NoteBookListResponse response = NoteBookListResponse.fromJson(value?.data);
        if (page.value == 1) {
          starData?.value = response.data?.starData??StarData();
        }

        if(refreshType == 'refresh'){
          notebookList?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((response.data?.notebookList??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        notebookList?.addAll(response.data?.notebookList??[]);
      }
     },
   );
  }
}