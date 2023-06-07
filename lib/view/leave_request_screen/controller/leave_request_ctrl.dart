import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import 'package:image_picker/image_picker.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/leave_request_response.dart';
import 'package:staff_app/backend/responses_model/leave_type_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/intl/src/intl/date_format.dart';

class LeaveRequestCtrl extends GetxController{

  RxList<LeaveRequestData>? list = <LeaveRequestData>[].obs;
  RxList<LeaveTypeData>? leaveTypeList = <LeaveTypeData>[].obs;
  RxList<String> statusTime = [""].obs;
  RxList<String> statusTitle = [""].obs;
  RxString selectedSchoolId = "".obs;
  RxString selectedLeaveTypeId = "".obs;
  final formKey = GlobalKey<FormState>();
  Rx<XFile> xFile = XFile("").obs;
  Rx<TextEditingController> selectSchoolController = TextEditingController().obs;
  Rx<TextEditingController> leaveTypeController = TextEditingController().obs;
  Rx<TextEditingController> startDateController = TextEditingController().obs;
  Rx<TextEditingController> endDateController = TextEditingController().obs;
  Rx<TextEditingController> reasonController = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    get();
  }

  get(){
    list?.value = [];
    BaseAPI().get(url: ApiEndPoints().getLeaveRequests,queryParameters: {"typeOfRequest":"leave"}).then((value){
      if (value?.statusCode ==  200) {
        list?.value = LeaveRequestResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  getLeaveTypes(){
    BaseAPI().get(url: ApiEndPoints().getLeaveTypes).then((value){
      if (value?.statusCode ==  200) {
        leaveTypeList?.value = LeaveTypeResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }

  create() async {
    if (formKey.currentState?.validate()??false) {
      BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
      dio.FormData data;
      if (xFile.value.path.isNotEmpty) {
        data = dio.FormData.fromMap({
          "school":selectedSchoolId.value,
          "leaveType":leaveTypeController.value.text.trim(),
          "startDate":getFormattedDate2(startDateController.value.text.trim()),
          "endDate":getFormattedDate2(endDateController.value.text.trim()),
          "reason":reasonController.value.text.trim(),
          "document": await dio.MultipartFile.fromFile(xFile.value.path,filename: xFile.value.name)
        });
      }else{
        data = dio.FormData.fromMap({
          "school":selectedSchoolId.value,
          "leaveType":leaveTypeController.value.text.trim(),
          "startDate":getFormattedDate2(startDateController.value.text.trim()),
          "endDate":getFormattedDate2(endDateController.value.text.trim()),
          "reason":reasonController.value.text.trim(),
        });
      }
      BaseAPI().post(url: ApiEndPoints().createLeaveRequest, data: data).then((value){
        if (value?.statusCode ==  200) {
          baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
          BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: "Success");
        }else{
          BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
        }
      });
    }
  }
}