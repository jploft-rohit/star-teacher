import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/assigned_assignment_list_response.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/staff_list_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class NewAssignmentCtrl extends GetxController{
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
  RxBool isStaffLoading = false.obs;
  List<StaffListData> staffData = [];
  final formKey = GlobalKey<FormState>();
  RxString selectedPersonId = "".obs;
  RxInt primaryTabIndex = 0.obs;
  RxInt secondaryTabIndex = 0.obs;
}