import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/sticky_notes_list_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:dio/dio.dart' as Dio;

class StickyNoteCtrl extends GetxController{
  RxList<StickyNotesData>? checkedNotes = <StickyNotesData>[].obs;
  RxList<StickyNotesData>? unCheckedNotes = <StickyNotesData>[].obs;
  RxInt selectedColorIndex = 0.obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    getStickyNotesData();
  }

  setData({isUpdating,StickyNotesData? data}){
    if(isUpdating){
      titleController.value.text = data?.title??"";
      descriptionController.value.text = data?.description??"";
      colorList.asMap().forEach((index, value) {
        if (value == (data?.color??"")) {
          selectedColorIndex.value = index;
        }
      });
    }
  }

  /// Get All Note
  getStickyNotesData({String? refreshType}){
    if (refreshType == 'refresh' || refreshType == null) {
      checkedNotes?.value = [];
      unCheckedNotes?.value = [];
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    var data = {
      "page":page.value.toString(),
      "limit":apiItemLimit
    };
    StickyNotesListResponse response = StickyNotesListResponse();
    BaseAPI().post(url: ApiEndPoints().getStickyNotesList, data: data,showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        if(refreshType == 'refresh'){
          checkedNotes?.value = [];
          unCheckedNotes?.value = [];
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((StickyNotesListResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        response = StickyNotesListResponse.fromJson(value?.data);
        response.data?.forEach((element) {
          if ((element.noteStatus?.name??"") == "completed") {
            checkedNotes?.add(element);
          }else{
            unCheckedNotes?.add(element);
          }
        });
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  /// Create Note
  createStickyNote({required color}){
    if (formKey.currentState?.validate()??false) {
      BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
      Dio.FormData data = Dio.FormData.fromMap({
        "color":color.toString(),
        "title":titleController.value.text.trim(),
        "description":descriptionController.value.text.trim(),
        "isSetReminder":"0",
      });
      BaseAPI().post(url: ApiEndPoints().createStickyNote,data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
          BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: translate(Get.context!).success);
          getStickyNotesData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
        }
      });
    }
  }

  /// Delete Note
  deleteStickyNote({required id,required index,required bool isChecked}){
    BaseOverlays().dismissOverlay();
    BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
    BaseAPI().delete(url: ApiEndPoints().deleteStickyNote+id).then((value){
      if (value?.statusCode ==  200) {
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: translate(Get.context!).success);
        if (isChecked) {
          checkedNotes?.removeAt(index);
        }else{
          unCheckedNotes?.removeAt(index);
        }
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  /// Update Note
  updateStickyNoteStatus({required id,required index, String? status}){
    Dio.FormData data = Dio.FormData.fromMap({
      "status":status??"completed",
    });
    BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
    BaseAPI().patch(url: ApiEndPoints().updateStickyNote+id,data: data).then((value){
      if (value?.statusCode ==  200) {
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: translate(Get.context!).success);
        unCheckedNotes?[index].noteStatus?.name = "completed";
        checkedNotes?.add(unCheckedNotes![index]);
        unCheckedNotes?.removeAt(index);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  /// Update Note
  updateStickyNote({required color,required id}){
    if (formKey.currentState?.validate()??false) {
      BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
      Dio.FormData data = Dio.FormData.fromMap({
        "color":color.toString(),
        "title":titleController.value.text.trim(),
        "description":descriptionController.value.text.trim(),
        "isSetReminder":"0",
        "status":"pending",
      });
      BaseAPI().patch(url: ApiEndPoints().updateStickyNote+id,data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
          BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: translate(Get.context!).success);
          getStickyNotesData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
        }
      });
    }
  }

  /// Static Colors List
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

  @override
  void onClose() {
    descriptionController.value.text = "";
    titleController.value.text = "";
    selectedColorIndex.value = 0;
    super.onClose();
  }
}