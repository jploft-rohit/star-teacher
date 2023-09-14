import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/view/schedule_meeting_screen/controller/schedule_meeting_screen_ctrl.dart';

class MeetingCancelReasonPopup extends StatefulWidget {
  final String id;
  final bool? isUpdating;
  const MeetingCancelReasonPopup({Key? key, required this.id, this.isUpdating}) : super(key: key);

  @override
  State<MeetingCancelReasonPopup> createState() => _MeetingCancelReasonPopupState();
}

class _MeetingCancelReasonPopupState extends State<MeetingCancelReasonPopup> {
  TextEditingController commentCtrl = TextEditingController();
  ScheduleMeetingScreenCtrl controller = Get.find<ScheduleMeetingScreenCtrl>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    Text(""),
                    Text((widget.isUpdating??false) ? "Update Reason" : "Meeting Cancel Reason", style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp, color: Colors.black),),
                    GestureDetector(
                      onTap: (){Get.back();},
                      child: Icon(Icons.close, color: Colors.black))
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Form(
                  key: formKey,
                  child: CustomTextField(
                    controller: commentCtrl,
                    hintText: "Type here...",
                    maxLine: 3,
                    validator: (val){
                      if ((val??"").isEmpty) {
                        return "Please enter cancel reason";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: BaseButton(title: "SUBMIT", onPressed: (){
                    if (formKey.currentState?.validate()??false) {
                      controller.updateStatus(id: widget.id, type: "cancelled",reason: commentCtrl.text.trim());
                    }
                  },btnType: mediumButton,borderRadius: 20,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
