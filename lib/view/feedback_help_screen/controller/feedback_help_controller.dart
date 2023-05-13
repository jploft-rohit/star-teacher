import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/all_feedback_help_response.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/staff_list_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';

class FeedbackHelpController extends GetxController{
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  /// Variables
  RxList<Data>? response = <Data>[].obs;
  RxList<String> statusTime = <String>[].obs;
  RxList<String> statusTitle = <String>[].obs;
  List<StaffListData> staffData = [];
  RxBool isStaffLoading = false.obs;
  RxString selectedPersonId = "".obs;
  RxString selectedSchoolId = "".obs;
  final formKey = GlobalKey<FormState>();
  /// Model Class Objects
  BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
  /// Text Controllers
  Rx<TextEditingController> schoolController = TextEditingController().obs;
  Rx<TextEditingController> typeController = TextEditingController().obs;
  Rx<TextEditingController> personController = TextEditingController().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> messageController = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;


  @override
  void onInit() {
    super.onInit();
    getData(type: '');
  }

  setData({required bool isUpdating,Data? data}){
    if(isUpdating){
      baseCtrl.schoolListData.data?.data?.forEach((element) {
        if ((element.sId??"") == (data?.school??"")) {
          schoolController.value.text = element.name??"";
          selectedSchoolId.value = data?.school??"";
        }
      });
      typeController.value.text = data?.forEnquery??"";
      personController.value.text = data?.person?.name??"";
      titleController.value.text = data?.title??"";
      messageController.value.text = data?.description??"";
      uploadController.value.text = data?.document??"";
      selectedPersonId.value = data?.person?.sId??"";

    }else{
      typeController.value.text = "";
      // complaintForController.text = "";
      personController.value.text = "";
      typeController.value.text = "";
      titleController.value.text = "";
      messageController.value.text = "";
      uploadController.value.text = "";
      selectedPersonId.value = "";
      schoolController.value.text = "";
    }
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

  updateApi({required String itemId,school,forEnquiry,title,description,document,user}){
    if (formKey.currentState?.validate()??false) {
      var formData = dio.FormData.fromMap({
        'school': selectedSchoolId.value,
        'forEnquery': typeController.value.text.trim().toLowerCase(),
        'person': selectedPersonId.value,
        'title': titleController.value.text.trim(),
        'description': messageController.value.text.trim()
        // 'document': document
      });
      BaseAPI().post(url: ApiEndPoints().updateFeedbackHelp+itemId, data: formData).then((value){
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

  create({school,forEnquiry,complaintUser,title,description,document,user}) async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    if (formKey.currentState?.validate()??false) {
      var formData = dio.FormData.fromMap({
        'school': school.toString(),
        'forEnquery': forEnquiry,
        'person': complaintUser.toString(),
        'title': title,
        'description': description,
        'user': userId.toString(),
        // 'document': document
      });
      BaseAPI().post(url: ApiEndPoints().createFeedbackHelp,
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

  getData({required String type}){
    response?.value = [];
    BaseAPI().get(url: ApiEndPoints().getAllFeedbackHelp,queryParameters: type.isNotEmpty ? {"type":type} : null).then((value){
      if (value?.statusCode ==  200) {
        response?.value = AllFeedbackHelpResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  deleteItem({required String id,required int index}){
    BaseOverlays().dismissOverlay();
    BaseAPI().delete(url: ApiEndPoints().deleteFeedbackHelp+id).then((value){
      if (value?.statusCode ==  200) {
        response?.removeAt(index);
        BaseOverlays().showSnackBar(message: "Deleted Successfully",title: "Success");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  acceptItem({required String itemId}){
    BaseAPI().get(url: ApiEndPoints().acceptFeedbackHelp+itemId).then((value){
      if (value?.statusCode ==  200) {
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"", title: "Success");
        getData(type: "");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
    });
  }

  sendComment({required String itemId,required String comment}){
    var data = {
      "type" : "self",
      "reply" : comment.toString()
    };
    BaseAPI().post(url: ApiEndPoints().sendCommentFeedbackHelp+itemId,data: data).then((value){
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

}