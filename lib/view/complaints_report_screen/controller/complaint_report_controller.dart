import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/all_complaint_reports_model.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/staff_list_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class ComplainReportController extends GetxController{
  late BaseCtrl baseCtrl;
  Rx<TextEditingController> complaintOrReportController = TextEditingController().obs;
  Rx<TextEditingController> personController = TextEditingController().obs;
  Rx<TextEditingController> typeController = TextEditingController().obs;
  Rx<TextEditingController> messageController = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> selectSchoolController = TextEditingController().obs;
  RxList<String> statusTime = [""].obs;
  RxList<String> statusTitle = [""].obs;
  List<StaffListData> staffData = [];
  RxBool isStaffLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  RxList<Data>? response = <Data>[].obs;
  RxString selectedPersonId = "".obs;
  RxString selectedSchoolId = "".obs;
  RxString selectedComplaintTypeId = "".obs;
  BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();

  @override
  void onInit() {
    super.onInit();
    baseCtrl = Get.find<BaseCtrl>();
    getData(type: '');

  }

  updateComplainReportAPI({required String itemId,school,forEnquiry,complaintUser,complaintType,title,description,document}){
    if (formKey.currentState?.validate()??false) {
      var formData = dio.FormData.fromMap({
        'school': selectedSchoolId.value,
        'forEnquery': complaintOrReportController.value.text.toLowerCase(),
        'complaintUser': selectedPersonId.value,
        'complaintType': selectedComplaintTypeId.value,
        'title': titleController.value.text.trim(),
        'description': messageController.value.text.trim()
        // 'document': document
      });
      BaseAPI().post(url: ApiEndPoints().updateComplaintReport+itemId, data: formData).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: "Updated Successfully",title: "Success");
          getData(type: "");
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }

  createComplainReportAPI({school,forEnquiry,complaintUser,complaintType,title,description,document}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    if (formKey.currentState?.validate()??false) {
      var formData = dio.FormData.fromMap({
        'school': school.toString(),
        'forEnquery': forEnquiry,
        'complaintUser': complaintUser.toString(),
        'complaintType': complaintType.toString(),
        'title': title,
        'description': description,
        'star':userId,
        // 'document': document
      });
      BaseAPI().post(url: ApiEndPoints().createComplaintReport,
          data: formData).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: "Created Successfully",title: "Success");
          getData(type: "");
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }

  setData({required bool isUpdating,Data? data}){
    if(isUpdating){
      baseCtrl.schoolListData.data?.data?.forEach((element) {
        if ((element.sId??"") == (data?.school??"")) {
          selectSchoolController.value.text = element.name??"";
          selectedSchoolId.value = data?.school??"";
        }
      });
      baseCtrl.complaintTypeResponse.data?.forEach((element) {
        if ((element.sId??"") == (data?.complaintType?.sId??"")) {
          typeController.value.text = element.name??"";
          selectedComplaintTypeId.value = element.sId??"";
        }
      });
      complaintOrReportController.value.text = data?.forEnquery??"";
      personController.value.text = data?.complaintUser?.name??"";
      titleController.value.text = data?.title??"";
      messageController.value.text = data?.description??"";
      uploadController.value.text = data?.document??"";
      selectedPersonId.value = data?.complaintUser?.sId??"";

    }else{
      complaintOrReportController.value.text = "";
      // complaintForController.text = "";
      personController.value.text = "";
      typeController.value.text = "";
      titleController.value.text = "";
      messageController.value.text = "";
      uploadController.value.text = "";
      selectedPersonId.value = "";
      selectSchoolController.value.text = "";
      selectedSchoolId.value = "";
      personController.value.text = "";
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
        "school" : selectedSchoolId,
        "role" : selectedRoleId
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

  acceptComplaintReport({required String itemId}){
    BaseAPI().get(url: ApiEndPoints().acceptComplaintReport+itemId).then((value){
      if (value?.statusCode ==  200) {
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"", title: "Success");
        getData(type: "");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
    });
  }

  sendCommentComplaintReport({required String itemId,required String comment}){
    var data = {
        "type" : "self",
        "comment" : comment.toString()
      };
    BaseAPI().post(url: ApiEndPoints().addCommentComplaintReport+itemId,data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseOverlays().dismissOverlay();
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"", title: "Success");
        getData(type: "");
      }else{
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
  selectedPersonId.value = "";
  selectSchoolController.value.text = "";
  personController.value.text = "";
  typeController.value.text = "";
  titleController.value.text = "";
  messageController.value.text = "";
  uploadController.value.text = "";
  selectSchoolController.value.text = "";
  super.dispose();
  }
}