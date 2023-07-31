import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/manual_attendance_stars_list_response.dart';
import 'package:staff_app/backend/responses_model/star_attendance_list_response.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class StarAttendanceScreenCtrl extends GetxController{
  final RxInt selectedClassType = 0.obs;
  final RxInt selectedAttendanceTabIndex = 0.obs;
  final RxString selectedSchoolName = "".obs;
  final RxString selectedSchoolId = "".obs;
  final RxString selectedClassName = "".obs;
  final RxString selectedClassId = "".obs;
  final RxString selectedSectionName = "".obs;
  final RxString selectedSectionId = "".obs;
  final RxBool isManualListChecked = false.obs;
  RxList<String> selectedManualStudentsId = <String>[].obs;
  RxList<StarAttendanceData>? list = <StarAttendanceData>[].obs;
  RxList<ManualAttendanceStarsListData>? manualList = <ManualAttendanceStarsListData>[].obs;

  List<Map<String, dynamic>> reasonList = [
    {
      "title":translate(Get.context!).out_before_class_ends,
      "isSelected":true,
    },
    {
      "title":translate(Get.context!).reporting_to_admin,
      "isSelected":false,
    },
    {
      "title":translate(Get.context!).late,
      "isSelected":false,
    },
    {
      "title":translate(Get.context!).absent,
      "isSelected":false,
    },
    {
      "title":translate(Get.context!).present,
      "isSelected":false,
    },
    {
      "title":translate(Get.context!).other,
      "isSelected":false,
    },
  ];

  List<Map<String, dynamic>> statusList = [
    {
      "title" : translate(Get.context!).present,
      "color" : BaseColors.green,
      "isSelected" : true
    },
    {
      "title" : translate(Get.context!).late,
      "color" : const Color(0xffEC9C00),
      "isSelected" : true
    },
    {
      "title" : translate(Get.context!).absent,
      "color" : BaseColors.textRedColor,
      "isSelected" : true
    },
  ];

  TextEditingController searchCtrl = TextEditingController();

  var fmoImageList = [
    nfcSvg,
    barcodeSvg,
    handSvg,
  ];

  final selectedFMOPos = 0.obs;
  final selectedFMOPos1 = 0.obs;

  TabController? tabCtrl;

  RxBool isSelectAll = false.obs;

  @override
  void onInit() {
    super.onInit();
    getStarsAttendanceList(selectedClassIndex: selectedClassType.value, selectedAttendanceIndex: selectedAttendanceTabIndex.value);
  }

  /// Get Stars Attendance List
  getStarsAttendanceList({required int selectedClassIndex,required int selectedAttendanceIndex}) async {
    list?.value = [];
    var data = {
      "type": selectedClassIndex == 0 ? "classroom" : selectedClassIndex == 1 ? "online" : "hybrid",
      "attendanceType": selectedAttendanceIndex == 0 ? "present" : selectedAttendanceIndex == 1 ? "absent" : "late",
      "school":selectedSchoolId.value,
      "class":selectedClassId.value,
      "section":selectedSectionId.value,
    };
    await BaseAPI().get(url: ApiEndPoints().getStarAttendanceList,queryParameters: data).then((value){
      if (value?.statusCode ==  200) {
        list?.value = StarAttendanceListResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  /// Get Stars Attendance List
  getManualStarAttendanceList() async {
    manualList?.value = [];
    var data = {
      "keyword":"",
      "classId":"645f2caf3433614b6d0fbcd6",
      "school":"6453a39493426d11484fe225",
      "section":selectedSectionId.value,
      "type": "classroom",
    };
    await BaseAPI().post(url: ApiEndPoints().getAttendanceStarsList,data: data).then((value){
      if (value?.statusCode ==  200) {
        manualList?.value = ManualAttendanceStarsListResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  /// Get Stars Attendance List
  Future<bool> updateManualAttendance({required String presentStatus, required String attendanceType, String? singleStudentId}) async {
    bool returnValue = false;
    dio.FormData data;
    if ((singleStudentId??"").isNotEmpty) {
      data = dio.FormData.fromMap({
        "present": presentStatus,
        "type": "classroom",
        "attendanceType": attendanceType,
        "students[0]": singleStudentId??"",
      });
    }else{
      data = dio.FormData.fromMap({
        "present": presentStatus,
        "type": "classroom",
        "attendanceType": attendanceType,
      });
    }
    if ((singleStudentId??"").isEmpty) {
      selectedManualStudentsId.asMap().forEach((index, value) {
        data.fields.add(MapEntry("students[${(index).toString()}]", value));
      });
    }
    await BaseAPI().post(url: ApiEndPoints().updateManualAttendanceStatus,data: data).then((value){
      if (value?.statusCode ==  200) {
        returnValue = true;
        BaseOverlays().showSnackBar(message: BaseSuccessResponse.fromJson(value?.data).message??"",title: translate(Get.context!).success);
        if ((singleStudentId??"").isEmpty) {
          isSelectAll.value = false;
          getManualStarAttendanceList();
        }
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
    return returnValue;
  }

  /// Change Attendance Status
  changeStarsAttendanceStatus({required int index, required String attendanceType, required String reason}) async {
    BaseOverlays().dismissOverlay();
    String localAttendanceType;
    if (attendanceType.toLowerCase() == "late" || attendanceType.toLowerCase() == "absent" || attendanceType.toLowerCase() == "present") {
      localAttendanceType = attendanceType.toLowerCase();
    }else{
      localAttendanceType = "Present";
    };
    var data = {
      "present": (reason.toLowerCase()) == "absent" ? "0" : "1",
      "reason": reason.toLowerCase(),
      "attendanceType": localAttendanceType.toLowerCase(),
    };
    BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
    await BaseAPI().patch(url: (ApiEndPoints().changeStarAttendanceStatus)+(list?[index].sId??""),data: data).then((value){
      if (value?.statusCode ==  200) {
        baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
        BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: translate(Get.context!).success);
        getStarsAttendanceList(selectedClassIndex: selectedClassType.value, selectedAttendanceIndex: selectedAttendanceTabIndex.value);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }
}