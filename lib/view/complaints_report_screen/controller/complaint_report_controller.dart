import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/Utility/sizes.dart';
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
  Rx<TextEditingController> deleteReasonController = TextEditingController().obs;
  RxList<String> statusTime = [""].obs;
  RxList<String> statusTitle = [""].obs;
  List<StaffListData>? staffData = [];
  Rx<File>? selectedFile = File("").obs;
  RxBool isStaffLoading = false.obs;
  RxInt selectedTabIndex = 0.obs;
  final formKey = GlobalKey<FormState>();
  RxList<Data>? response = <Data>[].obs;
  RxString selectedPersonId = "".obs;
  RxString selectedSchoolId = "".obs;
  RxString selectedComplaintTypeId = "".obs;
  BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);


  @override
  void onInit() {
    super.onInit();
    baseCtrl = Get.find<BaseCtrl>();
    selectedSchoolId.value = baseCtrl.schoolListData.data?.data?.first.sId??"";
    selectSchoolController.value.text = baseCtrl.schoolListData.data?.data?.first.name??"";
    getData();
  }

  updateComplainReportAPI({required String itemId,school,forEnquiry,complaintUser,complaintType,title,description,document}) async {
    if (formKey.currentState?.validate()??false) {
      dio.FormData data;
      if ((selectedFile?.value.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          'school': selectedSchoolId.value,
          'forEnquery': complaintOrReportController.value.text.toLowerCase(),
          'complaintUser': selectedPersonId.value,
          'complaintType': selectedComplaintTypeId.value,
          'title': titleController.value.text.trim(),
          'description': messageController.value.text.trim(),
          "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"", filename: selectedFile?.value.path.split("/").last??"")
        });
      }else{
        data = dio.FormData.fromMap({
          'school': selectedSchoolId.value,
          'forEnquery': complaintOrReportController.value.text.toLowerCase(),
          'complaintUser': selectedPersonId.value,
          'complaintType': selectedComplaintTypeId.value,
          'title': titleController.value.text.trim(),
          'description': messageController.value.text.trim()
        });
      }

      BaseAPI().post(url: ApiEndPoints().updateComplaintReport+itemId, data: data).then((value){
        if (value?.statusCode ==  200) {

          Get.back();
          BaseOverlays().showSnackBar(message: "Updated Successfully",title: translate(Get.context!).success);
          selectedSchoolId.value = "";
          selectSchoolController.value.text = "";
          getData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
        }
      });
    }
  }

  createComplainReportAPI({school,forEnquiry,complaintUser,complaintType,title,description,document}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";

    if (formKey.currentState?.validate()??false) {
      dio.FormData data;
      if ((selectedFile?.value.path??"").isNotEmpty) {
        data = dio.FormData.fromMap({
          'school': selectedSchoolId.value,
          'forEnquery': complaintOrReportController.value.text.toLowerCase(),
          'complaintUser': selectedPersonId.value,
          'complaintType': selectedComplaintTypeId.value,
          'title': titleController.value.text.trim(),
          'description': messageController.value.text.trim(),
          'star':userId,
          "document": await dio.MultipartFile.fromFile(selectedFile?.value.path??"", filename: selectedFile?.value.path.split("/").last??"")
        });
      }else{
        data = dio.FormData.fromMap({
          'school': selectedSchoolId.value,
          'forEnquery': complaintOrReportController.value.text.toLowerCase(),
          'complaintUser': selectedPersonId.value,
          'complaintType': selectedComplaintTypeId.value,
          'title': titleController.value.text.trim(),
          'star':userId,
          'description': messageController.value.text.trim()
        });
      }

      BaseAPI().post(url: ApiEndPoints().createComplaintReport, data: data).then((value){
        if (value?.statusCode ==  200) {
          Get.back();
          BaseOverlays().showSnackBar(message: "Created Successfully",title: translate(Get.context!).success);
          selectedSchoolId.value = "";
          selectSchoolController.value.text = "";
          getData();
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
        }
      });
    }
  }

  setData({required bool isUpdating,Data? data}){
    if(isUpdating){
      selectedFile?.value = File("");
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
      personController.value.text = "";
      typeController.value.text = "";
      titleController.value.text = "";
      messageController.value.text = "";
      uploadController.value.text = "";
      selectedPersonId.value = "";
      selectSchoolController.value.text = "";
      selectedSchoolId.value = "";
      personController.value.text = "";
      selectedFile?.value = File("");
    }
  }

  getData({String? refreshType}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    if (refreshType == 'refresh' || refreshType == null) {
      response?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    BaseAPI().get(url: ApiEndPoints().getAllComplaintReport,queryParameters: {
      "type": selectedTabIndex.value == 0
          ? ""
          : selectedTabIndex.value == 1
          ? "complaint"
          : "report",
      "school":selectedSchoolId.value,
      "user":userId,
      "limit":apiItemLimit,
      "page":(page.value).toString(),
    }, showLoader: page.value == 1).then((value){
      if (value?.statusCode ==  200) {
        // response?.addAll(AllComplainReportResponse.fromJson(value?.data).data??[]);
        if(refreshType == 'refresh'){
          response?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((AllComplainReportResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        response?.addAll(AllComplainReportResponse.fromJson(value?.data).data??[]);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  getStaffData({required String selectedRoleId, required String selectedSchoolId}){
    isStaffLoading.value = true;
    staffData = [];
    var data = {
        "school" : selectedSchoolId,
        "roleName" : selectedRoleId
    };
    BaseAPI().get(url: ApiEndPoints().getStaffData, queryParameters: data, showLoader: false).then((value){
      if (value?.statusCode ==  200) {
        isStaffLoading.value = false;
        staffData = StaffListResponse.fromJson(value?.data).data??[];
        // selectedPersonId.value = staffData.first.sId??"";
        // selectedPersonName.value = staffData.first.user?.name??"";
      }else{
        isStaffLoading.value = false;
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
      }
    });
  }

  acceptComplaintReport({required String itemId}){
    BaseAPI().get(url: ApiEndPoints().acceptComplaintReport+itemId).then((value){
      if (value?.statusCode ==  200) {
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"", title: translate(Get.context!).success);
        getData();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
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
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"", title: translate(Get.context!).success);
        getData();
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: translate(Get.context!).error);
      }
    });
  }

  deleteItem({required String id,required int index}){
    BaseOverlays().dismissOverlay();
    BaseAPI().delete(url: ApiEndPoints().deleteComplaintReport+id).then((value){
      if (value?.statusCode ==  200) {
        response?.removeAt(index);
        BaseOverlays().showSnackBar(message: "Deleted Successfully",title: translate(Get.context!).success);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  // getAllData(){
  //   response?.value = [];
  //   BaseAPI().get(url: ApiEndPoints().getAllComplaintReport,queryParameters: type.isNotEmpty ? {"type":type} : null).then((value){
  //     if (value?.statusCode ==  200) {
  //       response?.value = AllComplainReportResponse.fromJson(value?.data).data??[];
  //     }else{
  //       BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
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