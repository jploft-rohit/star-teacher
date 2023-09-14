import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/area_list_response.dart';
import 'package:staff_app/backend/responses_model/class_response.dart';
import 'package:staff_app/backend/responses_model/class_section_response.dart';
import 'package:staff_app/backend/responses_model/comlaint_type_reponse.dart';
import 'package:staff_app/backend/responses_model/roles_list_response.dart';
import 'package:staff_app/backend/responses_model/school_list_response.dart';
import 'package:staff_app/backend/responses_model/stars_list_response.dart';
import 'package:staff_app/backend/responses_model/subjects_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_debouncer.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

import '../../../utility/sizes.dart';

class BaseCtrl extends GetxController{

  SchoolListResponse schoolListData = SchoolListResponse();
  ComplaintTypeResponse complaintTypeResponse = ComplaintTypeResponse();
  RolesListResponse rolesListResponse = RolesListResponse();
  RxList<StarsListData>? starsList = <StarsListData>[].obs;
  RxList<ClassData>? classList = <ClassData>[].obs;
  RxList<SubjectsData>? subjectsList = <SubjectsData>[].obs;
  RxList<ClassSectionData>? classSectionList = <ClassSectionData>[].obs;
  RxList<AreaListData>? areaList = <AreaListData>[].obs;

  TextEditingController searchController = TextEditingController();
  final baseDebouncer = BaseDebouncer();
  /// Pagination
  RxInt page = 1.obs;
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final String token = await BaseSharedPreference().getString(SpKeys().apiToken)??"";
      final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
      print("User Id -----> $userId");
      if ((token).isNotEmpty) {
        getRolesList(showLoader: false);
        await getSchoolData(showLoader: false);
        getStarsList(showLoader: false);
        await getClassList(showLoader: false);
        getSubjects();
        await getAreaList(showLoader: false);
      }
     },
   );
  }

  getSchoolData({bool? showLoader}) async {
    schoolListData = SchoolListResponse();
    final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
    BaseAPI().get(url: ApiEndPoints().getSchoolList, showLoader: showLoader??true, queryParameters: {"user": userId}).then((value){
      if (value?.statusCode ==  200) {
        schoolListData = SchoolListResponse.fromJson(value?.data);
        BaseSharedPreference().setString(SpKeys().firstSchool, schoolListData.data?.data?.first.sId??"");
        getComplaintTypeData(showLoader: false, initialSchoolId: schoolListData.data?.data?.first.sId??"");
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
     },
   );
  }

  getClassSections({bool? showLoader,required String classId}){
    classSectionList?.value = [];
    BaseAPI().get(url: ApiEndPoints().getClassSection, showLoader: showLoader??true,queryParameters: {"classId":classId}).then((value){
      if (value?.statusCode ==  200) {
        classSectionList?.value = ClassSectionResponse.fromJson(value?.data).data?.data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    },
    );
  }

  getComplaintTypeData({bool? showLoader, required String initialSchoolId}) async {
    complaintTypeResponse = ComplaintTypeResponse();
    await BaseAPI().get(url: ApiEndPoints().getComplaintType+initialSchoolId,showLoader: showLoader).then((value){
      if (value?.statusCode ==  200) {
        complaintTypeResponse = ComplaintTypeResponse.fromJson(value?.data);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  getRolesList({bool? showLoader}) async {
    rolesListResponse = RolesListResponse();
    BaseAPI().get(url: ApiEndPoints().getAllRoles,showLoader: showLoader,queryParameters: {"pages":"all","type":"main"}).then((value){
      if (value?.statusCode ==  200) {
        rolesListResponse = RolesListResponse.fromJson(value?.data);
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  getStarsList({bool? showLoader,String? schoolId, String? classId, String? sectionId, String? refreshType}) async {
    // starsList?.value = [];
    if (refreshType == 'refresh' || refreshType == null) {
      starsList?.clear();
      refreshController.loadComplete();
      page.value = 1;
    } else if (refreshType == 'load') {
      page.value++;
    }
    BaseAPI().get(url: ApiEndPoints().getStarsList, showLoader: showLoader??(page.value == 1), queryParameters: {
      "school":schoolId??"",
      "classId":classId??"",
      "section":sectionId??"",
      "limit":apiItemLimit,
      "page":page.value.toString(),
      "keyword": searchController.text.trimLeft(),
    }).then((value){
      if (value?.statusCode ==  200) {
        // starsList?.value = StarsListResponse.fromJson(value?.data).data??[];
        if(refreshType == 'refresh'){
          starsList?.clear();
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }else if((StarsListResponse.fromJson(value?.data).data??[]).isEmpty && refreshType == 'load'){
          refreshController.loadNoData();
        }
        else if(refreshType == 'load'){
          refreshController.loadComplete();
        }
        starsList?.addAll(StarsListResponse.fromJson(value?.data).data??[]);
      } else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  getClassList({bool? showLoader,String? schoolId}) async {
    classList?.clear();
    BaseAPI().get(url: ApiEndPoints().getClassList, showLoader: showLoader,queryParameters: {"schoolid":schoolId??""}).then((value){
      if (value?.statusCode ==  200) {
        classList?.value = ClassResponse.fromJson(value?.data).data?.data??[];
      } else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: translate(Get.context!).error);
      }
    });
  }

  /// Get Subjects
  getSubjects(){
    BaseAPI().get(url: ApiEndPoints().getSubjects,showLoader: false).then((value){
      if (value?.statusCode == 200) {
        subjectsList?.value = SubjectResponse.fromJson(value?.data).data?.data??[];
      }
    },
    );
  }

  /// Get Area List
  getAreaList({bool? showLoader}) async {
    await BaseAPI().get(url: ApiEndPoints().getAreaList, showLoader: showLoader??true, queryParameters: {
      "limit":"1000",
      "page":"1"
    }).then((value){
      if (value?.statusCode == 200) {
        areaList?.value = AreaListResponse.fromJson(value?.data).data??[];
      }
    },
    );
  }


}