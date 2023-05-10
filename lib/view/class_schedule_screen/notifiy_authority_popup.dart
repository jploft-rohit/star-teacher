import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';
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
                    const Text(""),
                    Text(translate(context).notify_admin, style: Style.montserratBoldStyle().copyWith(fontSize: 18.sp, color: Colors.black),),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.close, color: Colors.black,),)
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
                      return GestureDetector(
                        onTap: (){
                          for(var i in list){
                            i['isSelected'] = false;
                          }
                          list[index]['isSelected'] = !list[index]['isSelected'];
                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          padding: EdgeInsets.all(14.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: BaseColors.primaryColor)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(list[index]['title'], style: Style.montserratMediumStyle().copyWith(color: BaseColors.primaryColor, fontSize: 17.sp),),
                              Checkbox(
                                visualDensity: const VisualDensity(vertical: -4),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                side: const BorderSide(color: Colors.transparent),
                                activeColor: BaseColors.primaryColor,
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
                  child: BaseButton(borderRadius: 100,btnType: mediumButton,title: translate(context).submit_btn_txt, onPressed: (){
                    print((list.length-3).toString());
                      Get.back();
                      if (list.last['isSelected']) {
                        showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation) {
                          return const RescheduleClassPopup();
                        },);
                      }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
