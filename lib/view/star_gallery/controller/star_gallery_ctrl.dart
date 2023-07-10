import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staff_app/Utility/base_utility.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/backend/base_api.dart';
import 'package:dio/dio.dart'as dio;
import 'package:staff_app/backend/responses_model/base_success_response.dart';
import 'package:staff_app/backend/responses_model/class_response.dart';
import 'package:staff_app/backend/responses_model/class_section_response.dart';
import 'package:staff_app/backend/responses_model/star_gallery_category_response.dart';
import 'package:staff_app/backend/responses_model/star_gallery_response.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/storage/base_shared_preference.dart';
import 'package:staff_app/storage/sp_keys.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';

class StarGalleryCtrl extends GetxController{

  RxList<StarGalleryData>? list = <StarGalleryData>[].obs;
  RxBool isGalleryLoading = false.obs;
  RxInt selectedTabIndex = 0.obs;
  Rx<XFile>? image1 = XFile("").obs;
  Rx<XFile>? image2 = XFile("").obs;
  Rx<XFile>? image3 = XFile("").obs;
  RxList<XFile>? imagesList = <XFile>[].obs;
  RxString selectedCategoryId = "".obs;
  final formKey = GlobalKey<FormState>();
  Rx<ClassData> selectedClass = ClassData().obs;
  Rx<ClassSectionData> selectedClassSection = ClassSectionData().obs;
  Rx<TextEditingController> galleryCategoryController = TextEditingController().obs;
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> uploadController = TextEditingController().obs;
  Rx<TextEditingController> classController = TextEditingController().obs;
  Rx<TextEditingController> classSectionController = TextEditingController().obs;
  RxList<StarGalleryCategoryData>? starGalleryCategoryList = <StarGalleryCategoryData>[].obs;

  getData({required String type,required showLoader}) async {
    isGalleryLoading.value = true;
    list?.value = [];
    await BaseAPI().get(url: ApiEndPoints().getStarGallery,queryParameters: type.isNotEmpty ? {"type": type,"limit": 300} : null,showLoader: showLoader).then((value){
      isGalleryLoading.value = false;
      if (value?.statusCode ==  200) {
        list?.value = StarGalleryResponse.fromJson(value?.data).data??[];

      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
    isGalleryLoading.value = false;
  }

  createGallery() async {
    imagesList?.clear();
    if (formKey.currentState?.validate()??false) {
      if ((selectedClass.value.sId??"").toString().isNotEmpty) {
        if ((selectedClassSection.value.sId??"").toString().isNotEmpty) {
          if ((image1?.value.path??"").isNotEmpty) {
            imagesList?.add(image1!.value);
          }if((image2?.value.path??"").isNotEmpty){
            imagesList?.add(image2!.value);
          }if((image3?.value.path??"").isNotEmpty){
            imagesList?.add(image3!.value);
          }
          BaseSuccessResponse baseSuccessResponse = BaseSuccessResponse();
          String userId = await BaseSharedPreference().getString(SpKeys().userId);
          dio.FormData data = dio.FormData();
            data = dio.FormData.fromMap({
              "user": userId,
              "galleryCategory": selectedCategoryId.value,
              "class": selectedClass.value.sId.toString(),
              "section": selectedClassSection.value.sId.toString(),
              "title": titleController.value.text.trim(),
            });
            for (var file in imagesList??[]) {
              data.files.addAll([
                MapEntry("uploads", await dio.MultipartFile.fromFile(file.path, filename: file.name)),
              ]);
            }
          await BaseAPI().post(url: ApiEndPoints().createStarGallery,data: data).then((value){
            if (value?.statusCode ==  200) {
              Get.back();
              baseSuccessResponse = BaseSuccessResponse.fromJson(value?.data);
              BaseOverlays().showSnackBar(message: baseSuccessResponse.message??"",title: "Success");
              getData(type: selectedTabIndex.value == 0 ? "both" : selectedTabIndex.value == 1 ? "image" : "video", showLoader: true);
            }else{
              BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
            }
          });
        }else{
          baseToast(message: "Please select class section");
        }
      }else{
        baseToast(message: "Please select class");
      }
    }
  }

  getGalleryCategory() async {
    BaseAPI().get(url: ApiEndPoints().getStarGalleryCategory).then((value){
      if (value?.statusCode ==  200) {
        starGalleryCategoryList?.value = GalleryCategoryResponse.fromJson(value?.data).data??[];
      }else{
        BaseOverlays().showSnackBar(message: translate(Get.context!).something_went_wrong,title: "Error");
      }
    });
  }
  @override
  void dispose() {
    image1?.value = XFile("");
    image2?.value = XFile("");
    image3?.value = XFile("");
    imagesList?.clear();
    selectedCategoryId.value = "";
    selectedClass.value = ClassData();
    selectedClassSection.value = ClassSectionData();
    galleryCategoryController.value.clear();
    titleController.value.clear();
    uploadController.value.clear();
    classController.value.clear();
    classSectionController.value.clear();
    super.dispose();
  }
}