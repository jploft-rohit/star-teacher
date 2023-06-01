import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/custom_models/notes_model.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/notebook_list_response.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class NotebookCtrl extends GetxController{

  final formKey = GlobalKey<FormState>();
  RxList<NotebookList>? notebookList = <NotebookList>[].obs;
  Rx<StarData>? starData = StarData().obs;

  /// Add Notebook Field Controller
  TextEditingController titleController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController recommendationController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController reasonController = TextEditingController();


  /// Set Data for Add Notebook Field Controller
  setData({bool? isUpdating, required NotebookList? data}){
    if (isUpdating??false) {
      titleController.text = data?.title??"";
      gradeController.text = "5th";
      dateController.text = getFormattedDate2(data?.date??"");
      descriptionController.text = data?.description??"";
      recommendationController.text = data?.recommandation??"";
      subjectController.text = data?.subject?.name??"";
      commentController.text = data?.comment??"";
    }else{
      titleController.text = "";
      gradeController.text = "";
      dateController.text = "";
      descriptionController.text = "";
      recommendationController.text = "";
      subjectController.text = "";
      commentController.text = "";
    }
  }

  /// Add Notebook
  addNotebook(){
    if (formKey.currentState?.validate()??false) {
      var data = dio.FormData.fromMap({
        "school": "643e7e76786e2a1898ace622",
        "type": selectedIndex3.value == 0 ? "talent" : "improvement",
        "title": titleController.text.trim(),
        "date": dateController.text.trim(),
        "description": descriptionController.text.trim(),
        "recommandation": recommendationController.text.trim(),
        "subject": "644fbba746bcbe93b0074a91",
        "class": "644bb468017ff679ae0d6f0c",
        "starId": "6443a18eed5d074580c2b2a0",
        "teacher": "645255336784ea41b08b3ea8",
      });
      BaseAPI().post(url: ApiEndPoints().createNotebook,data: data).then((value){
        if (value?.statusCode == 200) {
          Get.back();
          BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
          if ((response.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: response.message??"",title: "Success");
          }
          getNotebookNotes(type: selectedIndex3.value == 0 ? "talent" : "improvement", pageIndex: 1);
        }
      });
    }
  }

  /// Update Notebook
  updateNotebook({required id}){
    if (formKey.currentState?.validate()??false) {
      var data = dio.FormData.fromMap({
        "school": "643e7e76786e2a1898ace622",
        "type": selectedIndex3.value == 0 ? "talent" : "improvement",
        "title": titleController.text.trim(),
        "date": dateController.text.trim(),
        "description": descriptionController.text.trim(),
        "recommandation": recommendationController.text.trim(),
        "subject": "644fbba746bcbe93b0074a91",
        "class": "644bb468017ff679ae0d6f0c",
        "starId": "6443a18eed5d074580c2b2a0",
        "teacher": "645255336784ea41b08b3ea8",
      });
      BaseAPI().patch(url: ApiEndPoints().updateNotebook+id,data: data).then((value){
        if (value?.statusCode == 200) {
          Get.back();
          BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
          if ((response.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: response.message??"",title: "Success");
          }
          getNotebookNotes(type: selectedIndex3.value == 0 ? "talent" : "improvement", pageIndex: 1);
        }
      });
    }
  }

  /// Delete Notebook
  deleteNotebook({required String notebookId, String? reason,required int index}){
    BaseOverlays().dismissOverlay();
      final data = {
        "deletedReason": reason??""
      };
      BaseAPI().delete(url: ApiEndPoints().deleteNotebook+notebookId,data: data).then((value){
        if (value?.statusCode == 200) {
          notebookList?.removeAt(index);
          BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
          if ((response.message??"").isNotEmpty) {
            BaseOverlays().showSnackBar(message: response.message??"",title: "Success");
          }
        }
      });
  }

  /// Get Notebook Notes
  getNotebookNotes({required String type, required int pageIndex}){
    starData?.value = StarData();
    notebookList?.clear();
    final data = {
      "page":pageIndex,
      "limit":10,
      "type":type,
      "starId":"6443a18eed5d074580c2b2a0"
    };
    BaseAPI().post(url: ApiEndPoints().getNotebookList,data: data).then((value){
      if (value?.statusCode == 200) {
        NoteBookListResponse response = NoteBookListResponse.fromJson(value?.data);
        notebookList?.addAll(response.data?.notebookList??[]);
        starData?.value = response.data?.starData??StarData();
      }
     },
   );
  }

  List<NotesModel> unDoneNotesList = <NotesModel>[
    NotesModel("To Do List", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", false),
    NotesModel("Things to Purchase", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", false),
    NotesModel("Home Work", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", false),
    NotesModel("To be learn", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", false),
  ].obs;
  List<NotesModel> doneNotesList = <NotesModel>[].obs;

  final selectedIndex = 0.obs;
  final selectedIndex1 = 0.obs;
  final selectedIndex3 = 0.obs;
  final selectedColor = 0.obs;
  final isChecked = false.obs;

  List<String> colorList = [
    "FFE7E9",
    "FFF7AA",
    "037D00",
    "EDB494",
    "FFD081",
    "E1C4EB",
    "B5E3B9",
    "CECECE",
  ];
}