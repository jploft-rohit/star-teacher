import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/medical_record_responses/disease_model.dart';
import 'package:staff_app/backend/responses_model/medical_record_responses/food_model.dart';
import 'package:staff_app/backend/responses_model/medical_record_responses/medical_record_model.dart';
import 'package:staff_app/backend/responses_model/medical_record_responses/medical_survey_model.dart';
import 'package:staff_app/backend/responses_model/medical_record_responses/star_profile_model.dart';
import 'package:staff_app/backend/responses_model/medical_record_responses/vaccination_dose_model.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';

import 'package:staff_app/utility/base_views/base_overlays.dart';

class MedicalRecordController extends GetxController {
  final useCanteenServicesPos = 1.obs;
  var selectindex = 0.obs;
  var yesNoList = ['Yes', 'No'];
  var infectiousDisease = <bool>[].obs;
  var diseaseCondition = <bool>[].obs;
  final allergicSelectedPos = 1.obs;
  final bloodTransfusionValue = true.obs;
  final hospitalizationValue = true.obs;
  final isSchoolCanteenAllowed = false.obs;
  final isAllergic = true.obs;
  final List<String> currentlyUsingList = [
    'Braces',
    'Crutches',
    'Eyeglass/Contact lenses',
    'Hearing aid',
  ];
  final allergyFoodList = [
    'Crustacean Shellfish',
    'Egg',
    'Fish',
    'Milk',
    'Peanut',
    'Soy',
    'Tree Nuts',
    'Wheat',
    'Cereals w/ Gluten',
    'Sulfites',
    'Buckwheat',
    'Celery',
    'Lupin',
    'Molluscan Shellfish',
    'Mustard',
    'Sesame',
    'Bee Pollen/ Propolis',
    'Beef',
    'Chicken',
    'Latex (Natural Rubber)',
    'Mango',
    'Peach',
    'Pork',
    'Royal Jelly',
    'Tomato'
  ];
  final selectedAllergicFoodList = <String>[].obs;

  var infectiousDiseaseList = [
    'Diphtheria',
    'Dysentery',
    'Infective Hepatitis',
    'Measles',
    'Mumps',
    'Poliomyelitis',
    'Rubella',
    'Scarlet Fever',
    'Tuberculosis',
    'Whooping Cough',
    'Chicken Pox',
  ];

  var diseaseConditionList = [
    'Accidents',
    'Allergies',
    'Bronchial Asthma',
    'Congenital heart Disease',
    'Diabetes mellitus',
    'Epilepsy',
    'G6PD',
    'Rheumatic Fever',
    'Surgical Operation',
    'Thalassemia',
    'Others',
  ];
  var vaccinationDetailList = <VaccinationDose>[
    VaccinationDose(title: 'At Birth', key: 'atBirth', body: '07/27/2022'),
    VaccinationDose(title: '2 Months', key: 'twoMonths', body: ''),
    VaccinationDose(title: '4 Months ', key: 'fourMonths', body: ''),
    VaccinationDose(title: '6 Months', key: 'sixMonths', body: ''),
    VaccinationDose(title: '12 Months', key: 'twelveMonths', body: ''),
    VaccinationDose(title: '18 Months', key: 'eighteenMonths', body: ''),
    VaccinationDose(title: '5 - 6 Years', key: 'fiveSixYears', body: ''),
  ].obs;
  var isCertificateChecked = true.obs;
  var currentlyUsing = <bool>[].obs;
  final selectedCurrentlyUsingList = <String>[].obs;
  var isAllergic1 = true.obs;
  TextEditingController? familyHistoryController;
  var certificate =
      'The Health Authority requires Renaissance School maintains current information of each student’s\nimmunization history, therefore, it is important that this form is completed in full ';

  var medicalExaminationConsent = 'According to the Health Authority Regulations, all staff members are required to undergo a medical examination.\n\nThe examination is carried out by the school doctor and includes measurement of height and weight, screening of vision and examination of ears, throat, heart, lungs and abdomen.\n\nIf you prefer to be examined by a doctor of your choice, you may do so at your convenience. The school requires a copy of the medical report to keep on your school health file.\n\nPlease tick below and we will contact you when you’re scheduled for examination.';
  final isConsentChecked = true.obs;
  var medicationPolicy2 =
      'The school is permitted to take curative or preventive measures that may include; first aid, vaccination, referral to healthcare centers or emergency rooms if necessary and to provide the following emergency medications when it’s needed:\n-Paracetamol or Ibuprofen for mild to moderate pain and fever.\n-Topical Antihistamine ointment for mild skin allergies.\n-Epinephrine for strong allergic reactions.\n-Salbutamol to control asthmatic symptoms.\n-Oral glucose or glucagon for hypoglycemia.\n-Hyoscine-N-Butylbromide for colic, abdominal pain or spasms.\n\n\nIn case of refusal, the above measures will not be performed with the exception of extreme emergencies that require immediate intervention.';

  final isSicknessPolicyChecked = true.obs;
  var medicationPolicy =
      'Medication prescribed by your doctor that needs to be given during the school day should be administered by the school nurse. You are required to hand in the medication with the written prescription from the doctor and sign a specific consent form available at the clinic. If you have asthma, allergies or other conditions requiring the use of inhalers, nebulizers, Epipen or other medication we require such medication to be kept in the clinic in order to be given in an emergency situation.';
  final allergicMedicationSelectedPos = 0.obs;
  var sicknessPolicy =
      'If a staff member has a fever, diarrhea or vomiting, they are not allowed to attend school and may only return after 24 to 48 hours from the last episode of diarrhea, vomiting, fever or fever-reducing medication. If they develop the above symptoms while in school, they are required to leave the school premises immediately. In cases of communicable and infectious diseases or conditions, the school clinic should be notified as per Health Authority Regulation and a medical certificate that the staff member is fit to be in school has to be provided.';

  TextEditingController? allergicMedicineController;

  var isMedicalExmined = true.obs;
  var isPresentinExam = true.obs;
  var isMedicationPolicyChecked = true.obs;
  RxBool isAgreedToSchoolExamination = false.obs;
  var isMedicationPolicyChecked2 = true.obs;
  MedicalRecordController() {
    familyHistoryController =
        TextEditingController(text: 'My grandfather has diabetes');
    allergicMedicineController = TextEditingController();
    infectiousDisease = RxList.filled(infectiousDiseaseList.length, false);
    currentlyUsing = RxList.filled(currentlyUsingList.length, false);

    diseaseCondition = RxList.filled(diseaseConditionList.length, false);
  }

  final loading = false.obs;
  final medicalSurveyId = ''.obs;
  TextEditingController vaccinationCard = TextEditingController();
  final GlobalKey<FormState> vaccinationCardFormKey = GlobalKey<FormState>();
  final medicalRecordFormKey = GlobalKey<FormState>();
  final medicalRecordTitle = TextEditingController();
  final medicalRecordDescription = TextEditingController();
  final medicalRecordDate = TextEditingController();
  final medicalRecordFile = TextEditingController();
  StarProfile? starProfile;
  final selectedFoodList = <Food>[].obs;
  final childPhotoSocialMedia = false.obs;
  final childPhotoStarGallery = false.obs;
  final notChildPhoto = false.obs;
  final medicalSurveyAllergicFormKey = GlobalKey<FormState>();

  // mdeical survey data
  final diseases = Rx<Disease?>(null);
  final foodList = <Food>[].obs;

  // medical record data
  final medicalRecordList = <MedicalRecord>[].obs;

  getDiseases() async {
    try {
      loading.value = true;
      var response = await BaseAPI().get(url: 'disease/get-all');
      diseases.value = Disease.fromJson(response?.data["data"]);
    } catch (e) {
      log(e.toString() + 'getDiseases');
      BaseOverlays().showSnackBar(message: e.toString(), title: "Error");
    } finally {
      loading.value = false;
      getFoodList();
    }
  }

  getFoodList() async {
    try {
      loading.value = true;
      var response = await BaseAPI().get(url: 'food/get-all');
      foodList.clear();
      print(response);
      for (var item in response?.data["data"]) {
        foodList.add(Food.fromJson(item));
      }
    } catch (e) {
      print(e.toString() + 'food');
      BaseOverlays().showSnackBar(message: e.toString(), title: "Error");
      FocusScope.of(Get.context!).unfocus();
    } finally {
      loading.value = false;
      getMedicalSurvey();
    }
  }

  addOrUpdateDisease(DiseaseData? diseaseData) async {
    try {
      // check if disease list having any disease active status but document is not selected
      // if (diseaseList.any((element) =>
      //     element.active == true && element.document == null && element.sId != diseaseData?.sId)) {
      //   showSnackBar(
      //       message: 'Please select document for active disease', success: false);
      //   return;
      // }
      // check if diseaseData is active and document is not selected
      // if (diseaseData?.active == true && diseaseData?.document == null) {
      //   showSnackBar(
      //       message: 'Please select document for active disease',
      //       success: false);
      //   return;
      // }
      final String userId = await BaseSharedPreference().getString(SpKeys().userId);
      BaseOverlays().showLoader();
      Map<String, dynamic> data = {
        'user': userId,
        'disease': diseaseData?.sId,
        'isDisease': diseaseData?.active.toString(),
      };
      if (diseaseData?.document != null && diseaseData!.active!) {
        File file = File(diseaseData.document!);
        data['diseaseDocument'] = await dio.MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        );
      }
      await BaseAPI().postFormDataMedical('registerStar/add-update-diease', data);
      Get.back();
      // showSnackBar(message: 'Disease saved successfully');
      FocusScope.of(Get.context!).unfocus();
    } catch (e) {
      Get.back();
      print(e.toString() + 'addOrUpdateDisease');
      BaseOverlays().showSnackBar(message: e.toString(), title: "Error");
    }
  }

  saveDiseaseDeatils() async {
    try {
      BaseOverlays().showLoader();
      await BaseAPI().get(url: 'registerStar/save_disease/6443a18eed5d074580c2b2a0');
      Get.back();
      BaseOverlays().showSnackBar(message: 'Disease details saved successfully',title: translate(Get.context!).success);
      FocusScope.of(Get.context!).unfocus();
    } catch (e) {
      Get.back();
      print(e.toString() + 'saveDiseaseDeatils');
      BaseOverlays().showSnackBar(message: e.toString(), title: "Error");
    }
  }

  addMedicalSurvey(Map<String, dynamic> data) async {
    try {
      final String userId = await BaseSharedPreference().getString(SpKeys().userId);
      // print(medicalSurveyId.value);
      // print(data);
      // return;
      data['user'] = userId;
      if (medicalSurveyId.value.isNotEmpty && medicalSurveyId.value != '123') {
        data['id'] = medicalSurveyId.value;
      }
      // print(data);
      // return;
      BaseOverlays().showLoader();
      var response = await BaseAPI().postFormDataMedical('registerStar/add-medical-survey', data);
      medicalSurveyId.value = response.data["data"]['_id'];
      Get.back();
      BaseOverlays().showSnackBar(message: 'Medical survey details saved successfully',title: translate(Get.context!).success);
      FocusScope.of(Get.context!).unfocus();
    } catch (e) {
      Get.back();
      print(e.toString() + 'medical');
      BaseOverlays().showSnackBar(message: e.toString(), title: "Error");
    }
  }

  getMedicalRecordList() async {
    try {
      loading.value = true;
      var response =
          await BaseAPI().get(url: 'medicalRecord/get-all');
      medicalRecordList.clear();
      medicalRecordList.addAll((response?.data["data"] as List).map((e) => MedicalRecord.fromJson(e)).toList());
    } catch (e) {
      print(e.toString() + 'medical');
      BaseOverlays().showSnackBar(message: e.toString(), title: "Error");
    } finally {
      loading.value = false;
    }
  }

  addMedicalRecord() async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    try {
      if (!medicalRecordFormKey.currentState!.validate()) return;
      BaseOverlays().showLoader();
      Map<String, dynamic> data = {
        'title': medicalRecordTitle.text,
        'description': medicalRecordDescription.text,
        'date': medicalRecordDate.text,
        'user': userId,
      };
      if (medicalRecordFile.text.isNotEmpty) {
        File file = File(medicalRecordFile.text);
        data['document'] = await dio.MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        );
      }
      var response = await BaseAPI().postFormDataMedical('medicalRecord/add',
        data,
      );
      medicalRecordList.add(MedicalRecord.fromJson(response.data["data"]));
      Get.back();
      Get.back();
      BaseOverlays().showSnackBar(message: 'Medical record added successfully',title: translate(Get.context!).success);
      getMedicalRecordList();
    } catch (e) {
      print(e.toString() + 'medical');
      Get.back();
      Get.back();
      BaseOverlays().showSnackBar(message: e.toString(), title: "Error");
    } finally {
      // clear form
      medicalRecordTitle.clear();
      medicalRecordDescription.clear();
      medicalRecordDate.clear();
      medicalRecordFile.clear();
    }
  }

  getMedicalSurvey() async {
    final String userId = await BaseSharedPreference().getString(SpKeys().userId);
    try {
      loading(true);
      var response = await BaseAPI().get(url: 'registerStar/get_medical_survey/${userId}');
      MedicalSurvey medicalSurvey = MedicalSurvey.fromJson(response?.data["data"]);
      prefill(medicalSurvey);
    } catch (e) {
      print(e.toString() + 'medical');
    } finally {
      loading(false);
      getMedicalRecordList();
    }
  }

  prefill(MedicalSurvey medicalSurvey) {
    try {
      loading(true);
      // medical survey details
      medicalSurveyId.value = medicalSurvey.sId ?? '';
      // if (medicalSurvey != null) {
      //   for (var i = 0;
      //       i < medicalSurvey!.disease!.infection!.length;
      //       i++) {
      //     Infection infection =
      //         medicalSurvey!.disease!.infection![i];
      //     diseases.value?.infection![i] = DiseaseData(
      //       active: infection.isDisease,
      //       document: infection.diseaseDocument,
      //       name: infection.name,
      //       sId: infection.diseaseId,
      //     );
      //   }
      // }

      if (medicalSurvey.dieases?.infection != null) {
        for (var i = 0; i < medicalSurvey.dieases!.infection!.length; i++) {
          if (i >= diseases.value!.infection!.length) break;
          Infection infection = medicalSurvey.dieases!.infection![i];
          diseases.value?.infection![i] = DiseaseData(
            active: infection.isDisease,
            document: infection.diseaseDocument,
            name: infection.name,
            sId: infection.diseaseId,
          );
        }
      }

      if (medicalSurvey.dieases?.condition != null) {
        for (var i = 0; i < medicalSurvey.dieases!.condition!.length; i++) {
          Infection infection = medicalSurvey.dieases!.condition![i];
          diseases.value?.condition![i] = DiseaseData(
            active: infection.isDisease,
            document: infection.diseaseDocument,
            name: infection.name,
            sId: infection.diseaseId,
          );
        }
      }

      if (medicalSurvey.dieases?.history != null) {
        for (var i = 0; i < (medicalSurvey.dieases?.history?.length??0); i++) {
          Infection infection = medicalSurvey.dieases!.history![i];
          diseases.value?.history?[i] = DiseaseData(
            active: infection.isDisease,
            document: infection.diseaseDocument,
            name: infection.name,
            sId: infection.diseaseId,
          );
        }
      }
      if (medicalSurvey.accessories != null) {
        selectedCurrentlyUsingList.addAll(medicalSurvey.accessories!);
      }

      familyHistoryController?.text = medicalSurvey.familyHistroy ?? '';
      isMedicalExmined.value = medicalSurvey.isConsentMedical ?? true;
      isPresentinExam.value = medicalSurvey.isPresentMedicalExam ?? true;
      isAllergic1.value = medicalSurvey.isAllergic ?? true;
      allergicMedicineController?.text = medicalSurvey.allergiName ?? '';
      if (medicalSurvey.vaccinationDose != null) {
        for (var i = 0; i < medicalSurvey.vaccinationDose!.length; i++) {
          VaccinationDose vaccinationDose = VaccinationDose.fromJson(
              decodeMapString(medicalSurvey.vaccinationDose![i]));
          int index = vaccinationDetailList
              .indexWhere((element) => element.key == vaccinationDose.key);
          if (index != -1) {
            vaccinationDetailList[index] = vaccinationDose;
          }
        }
      }

      childPhotoSocialMedia.value =
          medicalSurvey.isChildPhotoSocialMedia ?? true;
      childPhotoStarGallery.value =
          medicalSurvey.isChildPhotoStarGallery ?? true;
      notChildPhoto.value = medicalSurvey.isNotChildPhoto ?? true;
      isSchoolCanteenAllowed.value = medicalSurvey.isAllowCanteen ?? true;
      isAllergic.value = medicalSurvey.isAllergicFood ?? true;
      if (medicalSurvey.foods != null) {
        for (var i = 0; i < medicalSurvey.foods!.length; i++) {
          if (medicalSurvey.foods![i].isAllergic!) {
            selectedFoodList.add(foodList.firstWhere(
                (element) => element.name == medicalSurvey.foods![i].food));
          }
        }
      }
    } catch (e) {
      print(e.toString() + 'medical 1');
    } finally {
      loading(false);
    }
  }

  Map<String, dynamic> decodeMapString(String input) {
    // Remove the curly braces at the beginning and end of the string
    input = input.substring(1, input.length - 1);

    // Split the string into key-value pairs
    List<String> keyValuePairs = input.split(',');

    // Create an empty map
    Map<String, dynamic> resultMap = {};

    // Iterate over the key-value pairs
    for (String pair in keyValuePairs) {
      // Split each pair into key and value
      List<String> keyValue = pair.split(':');

      // Remove leading and trailing whitespaces from the key and value
      String key = keyValue[0].trim();
      String value = keyValue[1].trim();

      // Remove the quotes around the value
      value = value.replaceAll("'", "").trim();

      // Add the key-value pair to the map
      resultMap[key] = value;
    }

    return resultMap;
  }

  @override
  void onInit() {
    super.onInit();
    // starProfile = Get.arguments['starProfile'];
    getDiseases();
  }
}
