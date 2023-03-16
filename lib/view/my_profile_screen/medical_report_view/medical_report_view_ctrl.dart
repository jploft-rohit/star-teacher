import 'package:get/get.dart';

import '../../../language_classes/language_constants.dart';

class MedicalReportViewCtrl extends GetxController{
  RxList<Map<String, dynamic>> diseaseConditionList = <Map<String, dynamic>>[
    {
      'title' : 'Accidents',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Allergies',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Bronchial Asthma',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Congenital heart Disease',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Diabetes mellitus',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Epilepsy',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'G6PD',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Rheumatic Fever',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Surgical Operation',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Thalassemia',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : 'Others',
      'isSelected' : -1,
      'isSelected1' : -1,
    },
  ].obs;
  RxList<Map<String, dynamic>> infectiousDiseaseList = <Map<String, dynamic>>[
    {
      'title' : translate(Get.context!).diphtheria,
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : translate(Get.context!).dysentery,
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : translate(Get.context!).infective_hepatitis,
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : translate(Get.context!).measles,
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : translate(Get.context!).mumps,
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : translate(Get.context!).poliomyelitis,
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : translate(Get.context!).rubella,
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : translate(Get.context!).scarlet_fever,
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : translate(Get.context!).tuberculosis,
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : translate(Get.context!).whooping_cough,
      'isSelected' : -1,
      'isSelected1' : -1,
    },
    {
      'title' : translate(Get.context!).chicken_pox,
      'isSelected' : -1,
      'isSelected1' : -1,
    },
  ].obs;
}