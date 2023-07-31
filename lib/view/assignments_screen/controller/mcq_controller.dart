
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:staff_app/backend/responses_model/e_library_questions_response.dart';
import 'package:staff_app/backend/responses_model/worksheet_list_response.dart';
import 'package:staff_app/backend/responses_model/worksheet_question_list.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class WorkSheetController extends GetxController with GetSingleTickerProviderStateMixin {
  BaseCtrl baseCtrl = Get.find<BaseCtrl>();
  final formKey = GlobalKey<FormState>();
  late TabController tabController;
  RxString selectSchoolController = ''.obs;
  String selectedSchoolId = "";
  RxInt tabControllerPos = 0.obs;
  RxList<Datum>? worksheetList = <Datum>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoading1 = false.obs;
  final data = Rxn<WorksheetQuestionData?>();
  final eLibraryQuestionResponse = Rxn<ELibraryQuestionData?>();
  TextToSpeech tts = TextToSpeech();
  final selectedFMOPos = (-1).obs;
  PageController pageController = PageController();
  List<Map<String, dynamic>> pendingAssignmentList = [
    {
      "question": "How often do you get a health\ncheckup?",
      "type": "ans",
      "ans": [
        "A. Once in 3 months",
        "B. Once in 6 months",
        "C. Once a year",
        "D. Only when needed",
        "E. Never get it done",
        "F. Other (If Other ask to describe)",
      ],
    },
    {
      "question": "What do you say about your\noverall health?",
      "type": "ans",
      "ans": [
        "A. Having Good Physical Health",
        "B. Moderately physically impaired",
        "C. Severely physically impaired",
        "D. Totally physically impaired",
      ],
    },
    {
      "question": "Do you have any chronic\ndiseases?",
      "type": "ans",
      "ans": [
        "A. Yes",
        "B. No",
      ],
    },
    {
      "question":
      "How healthy do you consider\nyourself on a scale of 1 to 10?",
      "type": "write",
      "ans": [],
    },
    {
      "question": "Are you habitual to drugs\nand alcohol?",
      "type": "ans",
      "ans": [
        "A. Yes to both",
        "B. Only to drugs",
        "C. Only to alcohol",
        "D. I am not habituated to either",
      ],
    },
  ];
  TextEditingController answerController = TextEditingController();

  var selectedWorkSheetId = "";
  var selectedOption = "";
  var selectedOptionList  = [].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    selectSchoolController.value = baseCtrl.schoolListData.data?.data?[0].name ?? "";
    selectedSchoolId = baseCtrl.schoolListData.data?.data?[0].sId ?? "";
  }

  // function for get video thumbnail
  getThumbnail(String url)async{
    final fileName = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.WEBP,
      maxHeight: 64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
      quality: 75,
    );
    return fileName;
  }

  // api function for get worksheet Questions list
  Future getWorksheetQuestionList({bool? showLoader,required String id}) async {
    isLoading1.value = true;
    await BaseAPI().get(url: ApiEndPoints().getAssignmentQuestionList+"/${id}", showLoader: showLoader,showErrorSnackbar: false).then((value) {
      isLoading1.value = false;
      if (value?.statusCode == 200) {
        data.value = WorksheetQuestionList.fromJson(value?.data).data;
      } else {
        // BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
    });
  }

  Future getELibraryQuestion({bool? showLoader,required String id}) async {
    isLoading1.value = true;
    await BaseAPI().get(url: ApiEndPoints().getELibraryQuestions+"/${id}", showLoader: showLoader,showErrorSnackbar: false).then((value) {
      isLoading1.value = false;
      if (value?.statusCode == 200) {
        eLibraryQuestionResponse.value = ELibraryQuestionResponse.fromJson(value?.data).data;
      } else {
        // BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
    });
  }

  // api function to Evaluate question

  Future evaluateQuestion(String assignmentId, String questionId, String questionType,String isSubmit) async {
    Map<String, dynamic> data = {
      "assignmentSheet": assignmentId,
      "assignmentQuestion": questionId,
      "isSubmit":isSubmit
    };
    if(questionType == 'subjective'){
      data["answer"] = answerController.text;
    }
    if(questionType == 'objective'){
      data["answerOption"] = selectedOptionList[0];
    }
    if(questionType == 'multipleSelect'){
      data["multiOption[]"] = selectedOptionList;
    }
    print("------evaluateQuestion-------->"+data.toString());
    // if (mUploadDoc.value.path != "") {
    //   data["document"] = await dio.MultipartFile.fromFile(mUploadDoc.value.path, filename: mUploadDoc.value.path.split('/').last);
    // }
    await BaseAPI().postFormData(ApiEndPoints().evaluateQuestion, data, "post", showLoader: true).then((value) {
      if (value.statusCode == 200) {
        // print(value);
        // mUploadDoc.value = File("");
        BaseOverlays().showSnackBar(message: "Added Successfully", title: translate(Get.context!).success);
      } else {
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong, title: "Error");
      }
    });
  }
}