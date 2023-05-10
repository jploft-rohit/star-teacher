import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/all_complaint_reports_model.dart';
import 'package:staff_app/backend/responses_model/staff_list_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class ComplainReportController extends GetxController{

  Rx<TextEditingController> complaintOrReportController = TextEditingController().obs;
  Rx<TextEditingController> roleController = TextEditingController().obs;
  Rx<TextEditingController> personController = TextEditingController().obs;
  Rx<TextEditingController> typeController = TextEditingController().obs;
  Rx<TextEditingController> messageController = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> selectSchoolController = TextEditingController().obs;
  List<StaffListData> staffData = [];
  RxBool isStaffLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  RxList<Data>? response = <Data>[].obs;
  RxString selectedPersonId = "".obs;

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

  createComplainReportAPI({school,forEnquiry,complaintUser,complaintType,title,description,document}){
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
      BaseAPI().post(url: ApiEndPoints().createComplaintReport, data: formData).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: "Created Successfully",title: "Success");
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }

  setData({required bool isUpdating,Data? data}){
    if(isUpdating){
      complaintOrReportController.value.text = data?.forEnquery??"";
      // complaintForController.text = "Bus Driver";
      roleController.value.text = "Bus Driver";
      personController.value.text = data?.complaintUser?.name??"";
      typeController.value.text = data?.complaintType?.name??"";
      titleController.value.text = data?.title??"";
      messageController.value.text = data?.description??"";
      uploadController.value.text = data?.document??"";
    }else{
      complaintOrReportController.value.text = "";
      // complaintForController.text = "";
      roleController.value.text = "";
      personController.value.text = "";
      typeController.value.text = "";
      titleController.value.text = "";
      messageController.value.text = "";
      uploadController.value.text = "";
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

  getStaffData({required String selectedRoleId, required String selectedSchoolId}){
    isStaffLoading.value = true;
    staffData = [];
    var data = {
        "school" : "6453a39493426d11484fe225"/*selectedSchoolId*/,
        "role" : "64467c68f871809066b4e219"/*selectedRoleId*/
    };
    BaseAPI().post(url: ApiEndPoints().getStaffData, data: data, showLoader: false).then((value){
      if (value?.statusCode ==  200) {
        isStaffLoading.value = false;
        staffData = StaffListResponse.fromJson(value?.data).data??[];
        // selectedPersonId.value = staffData.first.sId??"";
        // selectedPersonName.value = staffData.first.user?.name??"";
      }else{
        isStaffLoading.value = false;
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
    });
  }

  deleteItem({required String id,required int index}){
    BaseOverlays().dismissOverlay();
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

@override
  void dispose() {
  complaintOrReportController.value.text = "";
  roleController.value.text = "";
  personController.value.text = "";
  typeController.value.text = "";
  titleController.value.text = "";
  messageController.value.text = "";
  uploadController.value.text = "";
  selectSchoolController.value.text = "";
  super.dispose();
  }
}