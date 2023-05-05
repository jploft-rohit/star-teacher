import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/all_complaint_reports_model.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class ComplainReportController extends GetxController{

  TextEditingController complaintOrReportController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController personController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController uploadController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxList<AllComplainReportData>? response = <AllComplainReportData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData(type: '');
  }

  updateComplainReportAPI({required String itemId,school,forEnquiry,complaintUser,complaintType,title,description,document}){
    if (formKey.currentState?.validate()??false) {
      var formData = dio.FormData.fromMap({
        'school': "313435366466346473366634",
        'forEnquery': forEnquiry,
        'complaintUser': "643ce9f5eb36b9363c2128ce",
        'complaintType': "643ce9f5eb36b9363c2128ce",
        'title': title,
        'description': description,
        'document': document
      });
      BaseAPI().post(url: ApiEndPoints().updateComplaintReport+itemId, data: formData).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: "Updated Successfully",title: "Success");
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }

  createComplainReportAPI({required String itemId,school,forEnquiry,complaintUser,complaintType,title,description,document}){
    if (formKey.currentState?.validate()??false) {
      var formData = dio.FormData.fromMap({
        'school': "313435366466346473366634",
        'forEnquery': forEnquiry,
        'complaintUser': "643ce9f5eb36b9363c2128ce",
        'complaintType': "643ce9f5eb36b9363c2128ce",
        'title': title,
        'description': description,
        'document': document
      });
      BaseAPI().post(url: ApiEndPoints().createComplaintReport+itemId, data: formData).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: "Created Successfully",title: "Success");
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }


  setData({required bool isUpdating,AllComplainReportData? data}){
    if(isUpdating){
      complaintOrReportController.text = data?.forEnquery??"";
      // complaintForController.text = "Bus Driver";
      roleController.text = "Bus Driver";
      personController.text = data?.complaintUser??"";
      typeController.text = data?.complaintType??"";
      titleController.text = data?.title??"";
      messageController.text = data?.description??"";
      uploadController.text = data?.document??"";
    }else{
      complaintOrReportController.text = "";
      // complaintForController.text = "";
      roleController.text = "";
      personController.text = "";
      typeController.text = "";
      titleController.text = "";
      messageController.text = "";
      uploadController.text = "";
    }
  }

  getData({required String type}){
    response?.value = [];
    BaseAPI().get(url: ApiEndPoints().getAllComplaintReport,queryParameters: type.isNotEmpty ? {"type":type} : null).then((value){
      if (value?.statusCode ==  200) {
        response?.value = AllComplainReportResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  deleteItem({required String id,required int index}){
    BaseOverlays().closeOverlay();
    BaseAPI().delete(url: ApiEndPoints().deleteComplaintReport+id).then((value){
      if (value?.statusCode ==  200) {
        response?.removeAt(index);
        BaseOverlays().showSnackBar(message: "Deleted Successfully",title: "Success");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  // getAllData(){
  //   response?.value = [];
  //   BaseAPI().get(url: ApiEndPoints().getAllComplaintReport,queryParameters: type.isNotEmpty ? {"type":type} : null).then((value){
  //     if (value?.statusCode ==  200) {
  //       response?.value = AllComplainReportResponse.fromJson(value?.data).data??[];
  //     }else{
  //       BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
  //     }
  //   });
  // }
}