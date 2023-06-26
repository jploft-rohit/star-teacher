// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:staff_app/backend/api_end_points.dart';
// import 'package:staff_app/backend/base_api.dart';
// import 'package:staff_app/backend/responses_model/disease_model.dart';
// import 'package:staff_app/backend/responses_model/food_model.dart';
// import 'package:staff_app/backend/responses_model/medical_record_model.dart';
// import 'package:staff_app/backend/responses_model/medical_survey_model.dart';
// import 'package:staff_app/storage/base_shared_preference.dart';
// import 'package:staff_app/storage/sp_keys.dart';
// import 'package:staff_app/utility/intl/src/intl/date_format.dart';
//
// class MedicalRecordController extends GetxController {
//   RxInt updateValue = 0.obs;
//   final useCanteenServicesPos = 1.obs;
//   var yesNoList = ['Yes', 'No'];
//   final allergicSelectedPos = 1.obs;
//   final allergyFoodList = [];
//   final selectedAllergicFoodList = <String>[].obs;
//   var infectiousDiseaseList = [
//     'Diphtheria',
//     'Dysentery',
//     'Infective Hepatitis',
//     'Measles',
//     'Mumps',
//     'Poliomyelitis',
//     'Rubella',
//     'Scarlet Fever',
//     'Tuberculosis',
//     'Whooping Cough',
//     'Chicken Pox',
//   ];
//   var infectiousDiseaseList2 = [
//     // {
//     //   'title' : 'Diphtheria',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Dysentery',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Infective Hepatitis',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Measles',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Mumps',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Poliomyelitis',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Rubella',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Scarlet Fever',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Tuberculosis',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Whooping Cough',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Chicken Pox',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//   ].obs;
//   final diseaseConditionList2 = [
//     // {
//     //   'title' : 'Accidents',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Allergies',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Bronchial Asthma',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Congenital heart Disease',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Diabetes mellitus',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Epilepsy',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'G6PD',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Rheumatic Fever',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Surgical Operation',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Thalassemia',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//     // {
//     //   'title' : 'Others',
//     //   'isSelected' : -1,
//     //   'isSelected1' : -1,
//     // },
//   ].obs;
//   var diseaseHistoryList = [].obs;
//   final bloodTransfusionValue = 'Yes'.obs;
//   final hospitalizationValue = 'Yes'.obs;
//   var currentlyUsingList = [
//     'Braces',
//     'Crutches',
//     'Eyeglass/Contact lenses',
//   ];
//   final selectedCurrentlyUsingList = <String>[].obs;
//   TextEditingController? familyHistoryController;
//   var medicalExaminationConsent =
//       'According to the Health Authority Regulations, all staff members are required to undergo a medical examination.\n\nThe examination is carried out by the school doctor and includes measurement of height and weight, screening of vision and examination of ears, throat, heart, lungs and abdomen.\n\nIf you prefer to be examined by a doctor of your choice, you may do so at your convenience. The school requires a copy of the medical report to keep on your school health file.\n\nPlease tick below and we will contact you when you’re scheduled for examination.';
//   final isConsentChecked = true.obs;
//   final isMedicationPolicyChecked = true.obs;
//   final isSicknessPolicyChecked = true.obs;
//   var medicationPolicy =
//       'Medication prescribed by your doctor that needs to be given during the school day should be administered by the school nurse. You are required to hand in the medication with the written prescription from the doctor and sign a specific consent form available at the clinic. If you have asthma, allergies or other conditions requiring the use of inhalers, nebulizers, Epipen or other medication we require such medication to be kept in the clinic in order to be given in an emergency situation.';
//   final allergicMedicationSelectedPos = 0.obs;
//   var sicknessPolicy =
//       'If a staff member has a fever, diarrhea or vomiting, they are not allowed to attend school and may only return after 24 to 48 hours from the last episode of diarrhea, vomiting, fever or fever-reducing medication. If they develop the above symptoms while in school, they are required to leave the school premises immediately. In cases of communicable and infectious diseases or conditions, the school clinic should be notified as per Health Authority Regulation and a medical certificate that the staff member is fit to be in school has to be provided.';
//   TextEditingController? allergicMedicineController;
//   TextEditingController? commentController;
//   final List<String> dates = [
//     'July 2 9:30am',
//     'July 3 9:30am',
//     'July 4 9:30am'
//   ];
//   final List<String> heading = ['Submit', 'Review', 'Approved'];
//   int curStep = 4; // 2 is kept minimum
//   final showFab = false.obs;
//   final selectedRadio = 0.obs;
//   setSelectedRadio(int val) {
//     selectedRadio.value = val;
//   }
//
//   TextEditingController? medicalFileTitleController;
//   TextEditingController? medicalFileDescriptionController;
//   MedicalRecordController() {
//     familyHistoryController = TextEditingController(text: '');
//     allergicMedicineController = TextEditingController();
//
//     medicalFileTitleController = TextEditingController();
//     medicalFileDescriptionController = TextEditingController();
//   }
//
//   var foodDataList = <food.Datum>[].obs;
//   var medicalRecordList = <mr.Datum>[].obs;
//   Rx<File> addMedicalRecordUploadFile = File("").obs;
//   Rx<String> addMedicalRecordDate = "".obs;
//   Set<String> accessoriesList = {};
//   Set<String> selectedAllergyFoodList = {};
//   @override
//   void onInit() {
//     super.onInit();
//     getDiseases();
//     getAllFood();
//     getAllMedicalRecord();
//     getAllMedicalSurvey();
//   }
//
//   getDiseases() async {
//     var response = await BaseAPI().get(url: ApiEndPoints().getAllDisease);
//     DiseaseModel diseaseModel = DiseaseModel.fromJson(response!.data);
//     if (diseaseModel.statusCode == 200) {
//       infectiousDiseaseList2.value = diseaseModel.data.data
//           .where((element) => element.diseaseType.name == "Infection")
//           .toList()
//           .map((e) => {
//                 'id': e.id,
//                 'title': e.name,
//                 'isSelected': -1,
//                 'isSelected1': -1,
//               })
//           .toList();
//
//       diseaseConditionList2.value = diseaseModel.data.data
//           .where((element) => element.diseaseType.name == "Condition")
//           .toList()
//           .map(
//             (e) => {
//               'id': e.id,
//               'title': e.name,
//               'isSelected': -1,
//               'isSelected1': -1,
//             },
//           )
//           .toList();
//       diseaseHistoryList.value = diseaseModel.data.data
//           .where((element) => element.diseaseType.name == "History")
//           .toList()
//           .map(
//             (e) => {
//               'id': e.id,
//               'title': e.name,
//               'isSelected': -1,
//               'isSelected1': -1,
//             },
//           ).toList();
//     }
//
//     getAllMedicalSurvey().then((value) {
//       updateValue.value = updateValue.value==0?1:0;
//     });
//   }
//
//   getAllFood() async {
//     var response = await BaseAPI().get(url: ApiEndPoints().getAllFood);
//     FoodModel foodModel = FoodModel.fromJson(response!.data);
//     if (foodModel.statusCode == 200) {
//       foodDataList.value = foodModel.data;
//      print("------food list new-------"+foodDataList.value[0].id.toString());
//     }
//   }
//   saveDisease() async {
//     final String userId =
//         await BaseSharedPreference().getString(SpKeys().userId) ?? "";
//     var response =
//         await BaseAPI().get(url: ApiEndPoints().saveDisease + "/${userId}");
//     print("-----save saveDisease-----" + response.toString());
//   }
//
//   UpdateDiseases(String diseaseId, String value, {File? docFile}) async {
//     final String userId = await BaseSharedPreference().getString(SpKeys().userId) ?? "";
//     Map<String, dynamic> data = {
//       "user": userId,
//       "disease": diseaseId,
//       "isDisease": value
//     };
//     if (docFile != null) {
//       File file = docFile;
//       data["diseaseDocument"] = await dio.MultipartFile.fromFile(
//         file.path,
//         filename: file.path.split('/').last,
//       );
//     }
//     var response = await BaseAPI().postFormData(ApiEndPoints().updateDisease, data, "post");
//     print("-----UpdateDiseases Api-----: $response");
//   }
//
//   addMedicalRecord() async {
//     final String userId =
//         await BaseSharedPreference().getString(SpKeys().userId) ?? "";
//     Map<String, dynamic> data = {
//       "title": medicalFileTitleController!.text,
//       "description": medicalFileDescriptionController!.text,
//       "date": addMedicalRecordDate.value.split(".")[0],
//       "user": userId,
//     };
//     if (addMedicalRecordUploadFile.value.path != "") {
//       File file = addMedicalRecordUploadFile.value;
//       data["document"] = await dio.MultipartFile.fromFile(
//         file.path,
//         filename: file.path.split('/').last,
//       );
//     }
//     var response = await BaseAPI().postFormData(ApiEndPoints().addMedicalRecord, data, "post")
//         .then((value) {
//       if (value.statusCode == 200) {
//         Get.back();
//         getAllMedicalRecord();
//       }
//     });
//   }
//
//   getAllMedicalRecord() async {
//     var response = await BaseAPI().get(url: ApiEndPoints().getAllMedicalRecord);
//     MedicalRecordModel medicalRecordModel =
//         MedicalRecordModel.fromJson(response!.data);
//     if (medicalRecordModel.statusCode == 200) {
//       medicalRecordList.value = medicalRecordModel.data;
//     }
//   }
//
//   addMedicalSurvey(String key, dynamic value) async {
//     final String userId =
//         await BaseSharedPreference().getString(SpKeys().userId) ?? "";
//     Map<String, dynamic> data = {
//       "user": userId,
//       key: value,
//       "id":"64774d97cb6af35a3769995c"
//     };
//     var response =
//         await BaseAPI().post(url: ApiEndPoints().addMedicalSurvey, data: data);
//   }
//
//   Future getAllMedicalSurvey() async {
//     final String userId =
//         await BaseSharedPreference().getString(SpKeys().userId) ?? "";
//     var response = await BaseAPI().get(url: ApiEndPoints().getAllMedicalSurvey+userId);
//     print("----getAllMedicalsSurvey Api:------$response");
//     MedicalSurveyModel medicalSurveyModel =
//     MedicalSurveyModel.fromJson(response!.data);
//     if (medicalSurveyModel.statusCode == 200) {
//       medicalSurveyModel.data.dieases.infection.forEach((element) {
//         for(int i=0;i<infectiousDiseaseList2.value.length;i++){
//           if(element.diseaseId.toString() == infectiousDiseaseList2[i]["id"].toString()){
//             if(element.isDisease == true){
//               infectiousDiseaseList2[i]["isSelected"] = 0;
//               infectiousDiseaseList2[i]["isSelected1"] = -1;
//             }else{
//               infectiousDiseaseList2[i]["isSelected"] = -1;
//               infectiousDiseaseList2[i]["isSelected1"] = 0;
//             }
//           }
//         }
//       }
//       );
//
//       medicalSurveyModel.data.dieases.condition.forEach((element) {
//         for(int i=0;i<diseaseConditionList2.value.length;i++){
//           if(element.diseaseId.toString() == diseaseConditionList2[i]["id"].toString()){
//             if(element.isDisease == true){
//               diseaseConditionList2[i]["isSelected"] = 0;
//               diseaseConditionList2[i]["isSelected1"] = -1;
//             }else{
//               diseaseConditionList2[i]["isSelected"] = -1;
//               diseaseConditionList2[i]["isSelected1"] = 0;
//             }
//           }
//         }
//       }
//       );
//
//       medicalSurveyModel.data.dieases.history.forEach((element) {
//         for(int i=0;i<diseaseHistoryList.value.length;i++){
//           if(element.diseaseId.toString() == diseaseHistoryList[i]["id"].toString()){
//             if(element.isDisease == true){
//               diseaseHistoryList[i]["isSelected"] = 0;
//               diseaseHistoryList[i]["isSelected1"] = -1;
//             }else{
//               diseaseHistoryList[i]["isSelected"] = -1;
//               diseaseHistoryList[i]["isSelected1"] = 0;
//             }
//           }
//         }
//       }
//       );
//
//       selectedCurrentlyUsingList.value =  medicalSurveyModel.data.accessories;
//       selectedAllergicFoodList.value = medicalSurveyModel.data.foods.map((e) => e.food).toList() ;
//       familyHistoryController!.text = medicalSurveyModel.data.familyHistroy;
//       isConsentChecked.value = medicalSurveyModel.data.isConsentMedical;
//       isConsentChecked.value = medicalSurveyModel.data.isConsentMedical;
//       allergicMedicineController!.text = medicalSurveyModel.data.allergiName;
//       allergicMedicationSelectedPos.value = medicalSurveyModel.data.isAllergic==true?0:1;
//       allergicSelectedPos.value = medicalSurveyModel.data.isAllergicFood==true?0:1;
//       useCanteenServicesPos.value = medicalSurveyModel.data.isAllowCanteen==true?0:1;
//     }
//     print("--List-----"+infectiousDiseaseList2.toString());
//   }
//
//   String convertUTCToFormattedTime(String utcTimestamp) {
//     DateTime dateTime = DateTime.parse(utcTimestamp);
//     DateFormat format = DateFormat('hh:mma');
//     String formattedTime = format.format(dateTime);
//
//     return formattedTime;
//   }
// }
