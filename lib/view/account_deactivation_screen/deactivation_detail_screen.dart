import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/backend/responses_model/my_profile_response.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_image_network.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/account_deactivation_screen/controller/account_deactivation_controller.dart';
import 'package:staff_app/view/my_profile_screen/controller/my_profile_ctrl.dart';

class DeactivationDetailScreen extends StatefulWidget {
  final DeactivateData? data;
  final String? qrCode, bloodType;
  const DeactivationDetailScreen({Key? key, this.data, this.qrCode, this.bloodType}) : super(key: key);

  @override
  State<DeactivationDetailScreen> createState() => _DeactivationDetailScreenState();
}

class _DeactivationDetailScreenState extends State<DeactivationDetailScreen> {
  TextEditingController dateCtrl = TextEditingController();
  AccountDeactivationController controller = Get.put(AccountDeactivationController());
  MyProfileCtrl myProfileController = Get.find<MyProfileCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).deactivation_details),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: BaseColors.borderColor)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: BaseColors.primaryColor),
                          ),
                          child: BaseImageNetwork(
                            link: myProfileController.response.value.data?.profilePic??"",
                            concatBaseUrl: true,
                            borderRadius: 10,
                            errorWidget: SvgPicture.asset(manSvg),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(myProfileController.response.value.data?.name??"N/A", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                              const Divider(
                                color: BaseColors.borderColor,
                                height: 8.0,
                                thickness: 1.0,
                              ),
                              Text('#${myProfileController.response.value.data?.emirateId??"N/A"}', style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                              const Divider(
                                color: BaseColors.borderColor,
                                height: 8.0,
                                thickness: 1.0,
                              ),
                              buildInfoItems(translate(context).blood_type, myProfileController.response.value.data?.bloodType??"N/A"),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            const SizedBox(height: 5),
                            Container(
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: BaseColors.backgroundColor,
                                  // boxShadow: [getDeepBoxShadow()],
                                  border: Border.all(
                                      color: BaseColors.primaryColor,
                                      width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 1, vertical: 4,
                                ),
                                child: Center(
                                  child: Text(
                                    translate(context).deactivated.toUpperCase(),
                                    style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 12.sp),),
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: (){
                                  showScanQrDialogue(context, false,data: widget.qrCode??"");
                                },child: QrImage(
                              data: widget.qrCode??"",
                              version: QrVersions.auto,
                              size: 70,
                              gapless: false,
                            ),
                           ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: buildInfoItems(translate(context).deactivation_date, formatBackendDate(widget.data?.deactivatedUser?.createdAt??"")),),
                        ),
                        Container(
                          height: 20,
                          width: 1,
                          color: BaseColors.borderColor,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: buildInfoItems(translate(context).time, getFormattedTime(widget.data?.deactivatedUser?.createdAt??"")),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Text(translate(context).deactivation_reason, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
              SizedBox(height: .5.h),
              Text(widget.data?.deactivationReason??"", style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, height: 1.5),),
              SizedBox(height: 2.h),
              Text(translate(context).required_evidence, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
              SizedBox(
                height: .5.h,
              ),
              Text(widget.data?.requiredEvidance??"", style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, height: 1.5),),
              SizedBox(
                height: 2.h,
              ),
              const Divider(),
              SizedBox(
                height: 1.h,
              ),
              Text(translate(context).note_for_activation_please_upload_the_required_evidence, style: Style.montserratRegularStyle().copyWith(fontSize: 13.sp, height: 1.5, color: BaseColors.textLightGreyColor),),
              SizedBox(
                height: 1.h,
              ),
              Text(translate(context).medical_certificate, style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    flex: 2,
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          CustomTextField(controller: controller.dateController, hintText: "yyyy/mm/mm - hh:mm", borderRadius: 3.0,
                          readOnly: true,
                            onTap: (){
                              showDatePicker(
                                  context: context,
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: BaseColors.primaryColor,
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1600, 8),
                                  lastDate: DateTime((DateTime.now().year+50),1,1),
                              ).then((picked){
                                if (picked != null) {
                                  controller.dateController.text = "${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')} - ${DateFormat.Hms().format(DateTime.now())}";
                                  controller.selectedDateTime.value = "${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')} ${DateFormat.Hms().format(DateTime.now())}";
                                }
                              });
                            },
                            validator: (val){
                              if ((val??"").isEmpty) {
                                return "Please Select Date";
                              }
                              return null;
                            },
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: SvgPicture.asset(calenderDateSvg),
                          ),),
                          SizedBox(height: 1.h),
                          CustomTextField(controller: controller.messageController,
                            hintText: "Your Message", borderRadius: 3.0,
                            suffixIcon: Padding(padding: const EdgeInsets.only(left: 10.0, right: 10.0), child: SvgPicture.asset("assets/images/tick_img.svg")),
                            validator: (val){
                            if ((val??"").isEmpty) {
                              return "Please Enter Message";
                            }
                            return null;
                            },
                          ),
                          SizedBox(height: 1.h),
                          CustomTextField(controller: controller.uploadController, hintText: translate(context).upload_file, borderRadius: 3.0,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: SvgPicture.asset("assets/images/upload_icon.svg"),
                            ),
                            validator: (val){
                              if ((val??"").isEmpty) {
                                return "Please Select File";
                              }
                              return null;
                            },
                            onTap: (){
                              BaseOverlays().showMediaPickerDialog(onCameraClick: () async {
                                BaseOverlays().dismissOverlay();
                                ImagePicker picker = ImagePicker();
                                    await picker.pickImage(source: ImageSource.camera,imageQuality: 50).then((value){
                                      if (value != null) {
                                        controller.selectedFile?.value = File(value.path);
                                        controller.uploadController.text = value.path.split("/").last;
                                      }
                                    },
                                    );
                                  },
                                  onGalleryClick: () async {
                                    BaseOverlays().dismissOverlay();
                                    ImagePicker picker = ImagePicker();
                                    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50).then((value){
                                      if (value != null) {
                                        controller.selectedFile?.value = File(value.path);
                                        controller.uploadController.text = value.path.split("/").last;
                                      }
                                    });
                                  }
                              );
                            },
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Text("Medical_Sania.jpeg", style: Style.montserratMediumStyle().copyWith(fontSize: 14.sp),),
                        Text("${translate(context).photo_uploaded}\n132KB", style: Style.montserratMediumStyle().copyWith(fontSize: 14.sp, color: const Color(0xff1C6BA4)),textAlign: TextAlign.center,),
                        SizedBox(height: 2.h)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 3.h),
              Center(child: BaseButton(
                  removeHorizontalPadding: true,
                  title: translate(context).request_for_activation,
                  onPressed: (){
                    controller.sendActivationRequest(deactivateData: widget.data);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
