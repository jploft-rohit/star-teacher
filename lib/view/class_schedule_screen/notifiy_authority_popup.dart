import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/class_schedule_screen/reschedule_class_popup.dart';

class NotifyAuthorityPopup extends StatefulWidget {
  const NotifyAuthorityPopup({Key? key}) : super(key: key);

  @override
  State<NotifyAuthorityPopup> createState() => _NotifyAuthorityPopupState();
}

class _NotifyAuthorityPopupState extends State<NotifyAuthorityPopup> {
  List<Map<String, dynamic>> list = [
    {
      "title":translate(Get.context!).i_will_be_absent,
      "isSelected":true,
    },
    {
      "title":translate(Get.context!).i_will_be_late,
      "isSelected":false,
    },
    {
      "title":translate(Get.context!).swap_this_class,
      "isSelected":false,
    },
    {
      "title":translate(Get.context!).reschedule,
      "isSelected":false,
    },
  ];

  TextEditingController reasonCtrl = TextEditingController();
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
                    Text(translate(context).notify_admin, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.close, color: Colors.black,),)
                  ],
                ),
                  SizedBox(
                    height: 1.h,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          for(var i in list){
                            i['isSelected'] = false;
                          }
                          list[index]['isSelected'] = !list[index]['isSelected'];
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 8.0),
                          padding: EdgeInsets.all(14.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: CustomColors.primaryColor)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(list[index]['title'], style: Style.montserratMediumStyle().copyWith(color: CustomColors.primaryColor, fontSize: 17.sp),),
                              Checkbox(
                                visualDensity: VisualDensity(vertical: -4),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                side: BorderSide(color: Colors.transparent),
                                activeColor: CustomColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                value: list[index]['isSelected'],
                                onChanged: (value){
                                  for(var i in list){
                                    i['isSelected'] = false;
                                  }
                                  list[index]['isSelected'] = !list[index]['isSelected'];
                                  setState(() {});
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  CustomTextField(controller: reasonCtrl, hintText: translate(context).reason, maxLine: 3,),
                SizedBox(
                  height: 3.h,
                ),

                Center(
                  child: CustomButton(text: translate(context).submit_btn_txt, onPressed: (){
                      Get.back();
                      showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation) {
                        return RescheduleClassPopup();
                      },);
                  }, btnWidth: 30.w,borderRadius: 50.0,btnHeight: 40,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
