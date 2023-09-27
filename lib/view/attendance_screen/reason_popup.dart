import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/attendance_screen/attendance_screen_ctrl.dart';


class ReasonPopup extends StatefulWidget {
  final String id;
  const ReasonPopup({Key? key, required this.id}) : super(key: key);

  @override
  State<ReasonPopup> createState() => _ReasonPopupState();
}

class _ReasonPopupState extends State<ReasonPopup> {

  AttendanceScreenController controller = Get.find<AttendanceScreenController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.reasonController.value.clear();
    controller.selectedFile?.value = File("");
    controller.uploadController.value.clear();
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Dialog(
        insetPadding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white
          ),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatFlutterDateTime(flutterDateTime: DateTime.now()), style: Style.montserratMediumStyle().copyWith(fontSize: 15.sp),),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Form(
                  key: formKey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 8.h,
                          child: Text("${translate(context).reason}: ", style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),)),
                      Expanded(child: CustomTextField(
                        controller: controller.reasonController.value,
                        hintText: translate(context).type_here,
                        maxLine: 1,
                        validator: (val){
                          if(controller.reasonController.value.text.trim().isEmpty){
                            return "Please Enter Reason";
                          }
                          return null;
                        },
                      ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 2.h,
                // ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     SizedBox(
                //       width: 8.h,
                //         child: Text("Upload\nEvidence : ", style: Style.montserratBoldStyle().copyWith(fontSize: 15.sp),)),
                //     Expanded(
                //       child: BaseTextFormField(
                //         controller: controller.uploadController.value,
                //         hintText: translate(context).upload_file_or_photo,
                //         suffixIcon: "assets/images/upload_icon.svg",
                //         onTap: (){
                //               BaseOverlays().showMediaPickerDialog(
                //                   onCameraClick: () async {
                //                 BaseOverlays().dismissOverlay();
                //                 ImagePicker picker = ImagePicker();
                //                 await picker.pickImage(source: ImageSource.camera).then((value){
                //                   if (value != null) {
                //                     controller.selectedFile?.value = File(value.path);
                //                     controller.uploadController.value.text = value.path.split("/").last;
                //                   }
                //                  },
                //                 );
                //                },
                //               onGalleryClick: () async {
                //                 BaseOverlays().dismissOverlay();
                //                 ImagePicker picker = ImagePicker();
                //                 await picker.pickImage(source: ImageSource.gallery).then((value){
                //                   if (value != null) {
                //                     controller.selectedFile?.value = File(value.path);
                //                     controller.uploadController.value.text = value.path.split("/").last;
                //                   }
                //                 });
                //               },
                //                   onFilePick: (){
                //                     BaseOverlays().dismissOverlay();
                //                     pickFile().then((value) {
                //                       controller.selectedFile?.value = File(value);
                //                       controller.uploadController.value.text = (value.split("/").last);
                //                     });
                //                   }
                //           );
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 3.h),
                const Divider(),
                Center(
                  child: BaseButton(btnType: mediumButton,title: translate(context).submit_btn_txt, onPressed: (){
                    if (formKey.currentState?.validate()??false) {
                      Get.back();
                      controller.updateReasonStatus(id: widget.id);
                    }
                  },borderRadius: 20,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
