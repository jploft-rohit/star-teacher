import 'dart:io' as Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/transportation_location_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/utility/google_map.dart';
import 'package:staff_app/view/transportation_screen/controller/transportation_screen_ctrl.dart';

class ChangeAddressScreen extends StatefulWidget {
  final bool? isUpdating;
  final ChangeLocationRequestData? data;
  const ChangeAddressScreen({Key? key, this.isUpdating, this.data}) : super(key: key);

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {

  TransportationScreenCtrl controller = Get.find<TransportationScreenCtrl>();
  String? longtitude, latitude;

  @override
  void initState() {
    super.initState();
    controller.setData(isUpdating: widget.isUpdating,data: widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: translate(context).change_location),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Obx(()=>
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/location1.svg"),
                      SizedBox(width: 1.w),
                      Text(translate(context).find_on_map, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),)
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintTextColor: Colors.grey.shade500,
                          fillColor: BaseColors.txtFieldTextColor,
                          textInputType: TextInputType.streetAddress,
                          controller: controller.addressLocationController.value,
                          hintText: translate(context).type_your_location,
                          hintTxtSize: 14.sp,
                          onTap: (){
                              FocusScope.of(Get.context!).requestFocus(new FocusNode());
                              Get.to(MapUiBody())?.then((value){
                                Map<String, dynamic> addressData = value;
                                controller.addressLocationController.value.text=addressData['address'];
                                controller.latitudeController.value.text = addressData['latitude'].toString();
                                controller.longitudeController.value.text = addressData['longtitude'].toString();
                              });
                          },
                          readOnly: true,
                          borderColor: Colors.transparent,
                          validator: (val){
                            if(controller.addressLocationController.value.text.isEmpty){
                              return "Please Enter Type Location";
                            }
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                            FocusScope.of(Get.context!).requestFocus(new FocusNode());
                            Get.to(MapUiBody())?.then((value){
                              Map<String, dynamic> addressData = value;
                              controller.addressLocationController.value.text=addressData['address'];
                              controller.latitudeController.value.text = addressData['latitude'].toString();
                              controller.longitudeController.value.text = addressData['longtitude'].toString();
                            });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 15.sp, left: 15.sp),
                          child: SvgPicture.asset(mapSvg,fit: BoxFit.cover,height: 3.h,),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: BaseColors.txtFiledBorderColor,
                    height: 0.0,
                    endIndent: 40.sp,
                    indent: 15.sp,
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(translate(context).sector, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                            SizedBox(
                              height: .5.h,
                            ),
                            CustomTextField(
                              hintTextColor: Colors.grey.shade500,
                              fillColor: BaseColors.txtFieldTextColor,
                              controller: controller.sectorController.value,
                              hintText: "Dubai",
                              textInputType: TextInputType.streetAddress,
                              borderRadius: 3.0,
                              validator: (val){
                                if(controller.sectorController.value.text.isEmpty){
                                  return "Please Enter Sector Name";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(translate(context).area, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                            SizedBox(height: .5.h),
                            CustomTextField(
                              hintTextColor: Colors.grey.shade500,
                              fillColor: BaseColors.txtFieldTextColor,
                              controller: controller.areaController.value,
                              hintText: "Jumeriah",
                              textInputType: TextInputType.streetAddress,
                              borderRadius: 3.0,
                              validator: (val){
                                if(controller.areaController.value.text.isEmpty){
                                  return "Please Enter Area Name";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(translate(context).street, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                            SizedBox(height: .5.h),
                            CustomTextField(
                              hintTextColor: Colors.grey.shade500,
                              fillColor: BaseColors.txtFieldTextColor,
                              controller: controller.streetController.value,
                              textInputType: TextInputType.streetAddress,
                              hintText: "53 B",
                              borderRadius: 3.0,
                              validator: (val){
                                if(controller.streetController.value.text.isEmpty){
                                  return "Please Enter Street Name";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(translate(context).building_villa, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                            SizedBox(height: .5.h),
                            CustomTextField(
                              hintTextColor: Colors.grey.shade500,
                              fillColor: BaseColors.txtFieldTextColor,
                              controller: controller.buildingController.value,
                              hintText: "KM Tower A",
                              textInputType: TextInputType.streetAddress,
                              borderRadius: 3.0,
                              validator: (val){
                                if(controller.buildingController.value.text.isEmpty){
                                  return "Please Enter Building Name";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(translate(context).flat_villa_no, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                            SizedBox(height: .5.h),
                            CustomTextField(
                              hintTextColor: Colors.grey.shade500,
                              fillColor: BaseColors.txtFieldTextColor,
                              controller: controller.flatController.value,
                              hintText: "#123456",
                              textInputType: TextInputType.streetAddress,
                              borderRadius: 3.0,
                              validator: (val){
                                if(controller.flatController.value.text.isEmpty){
                                  return "Please Enter Flat Name";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(translate(context).landmark, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                            SizedBox(
                              height: .5.h,
                            ),
                            CustomTextField(
                              hintTextColor: Colors.grey.shade500,
                              fillColor: BaseColors.txtFieldTextColor,
                              controller: controller.landmarkController.value,
                              hintText: "Jumeriah",
                              borderRadius: 3.0,
                              textInputType: TextInputType.streetAddress,
                              validator: (val){
                                if(controller.landmarkController.value.text.isEmpty){
                                  return "Please Enter Landmark Name";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${translate(context).mobile_no}.", style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                            SizedBox(height: 0.5.h),
                            CustomTextField(
                              hintTextColor: Colors.grey.shade500,
                              fillColor: BaseColors.txtFieldTextColor,
                              controller: controller.mobileController.value,
                              hintText: "0503664321",
                              textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                              borderRadius: 3.0,
                              textInputType: TextInputType.phone,
                              validator: (val){
                                if(controller.mobileController.value.text.isEmpty){
                                  return "Please Enter Mobile Number";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${translate(context).landline_no}.", style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                            SizedBox(height: .5.h),
                            CustomTextField(
                              hintTextColor: Colors.grey.shade500,
                              fillColor: BaseColors.txtFieldTextColor,
                              controller: controller.landlineController.value,
                              hintText: "043674882",
                              borderRadius: 3.0,
                              textInputType: TextInputType.phone,
                              textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                              validator: (val){
                                if(controller.landlineController.value.text.isEmpty){
                                  return "Please Enter Landline Number";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(translate(context).flat_villa_photo, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
                      SizedBox(height: .5.h),
                      BaseTextFormField(
                        controller: controller.uploadController.value,
                        hintText: translate(context).upload_file_or_photo,
                        suffixIcon: "assets/images/upload_icon.svg",
                        onTap: (){
                          BaseOverlays().showMediaPickerDialog(onCameraClick: () async {
                            BaseOverlays().dismissOverlay();
                            ImagePicker picker = ImagePicker();
                            await picker.pickImage(source: ImageSource.camera).then((value){
                              if (value != null) {
                                controller.selectedFile?.value = Platform.File(value.path);
                                controller.uploadController.value.text = value.path.split("/").last;
                              }
                            },
                            );
                          },
                              onGalleryClick: () async {
                                BaseOverlays().dismissOverlay();
                                ImagePicker picker = ImagePicker();
                                await picker.pickImage(source: ImageSource.gallery).then((value){
                                  if (value != null) {
                                    controller.selectedFile?.value = Platform.File(value.path);
                                    controller.uploadController.value.text = value.path.split("/").last;
                                  }
                                });
                              }
                          );
                        },
                      ),
                      SizedBox(height: 0.5.h),
                      Text("${translate(context).photo_uploaded} 132KB", style: TextStyle(color: Color(0xff1C6BA4),fontSize: 13.sp),),
                      SizedBox(height: 5.h),
                      Center(child: BaseButton(title: translate(context).send_request, onPressed: (){
                        if (widget.isUpdating??false) {
                          controller.updateLocation(id: widget.data?.sId??"");
                        }else{
                          controller.createLocation();
                        }
                      },btnType: largeButton))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
