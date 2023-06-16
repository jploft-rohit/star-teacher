import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/sos/sos_warden_view.dart';

import '../../Utility/sizes.dart';

class AskForHelpView extends StatefulWidget {
  const AskForHelpView({Key? key}) : super(key: key);

  @override
  State<AskForHelpView> createState() => _AskForHelpViewState();
}

class _AskForHelpViewState extends State<AskForHelpView> {
  TextEditingController commentController = TextEditingController();
  List helpOptions = [
    {
      "id": 0,
      "value": true,
      "title": translate(Get.context!).im_stuck_at_my_location,
    },
    {
      "id": 1,
      "value": false,
      "title": translate(Get.context!).medical_help,
    },
    {
      "id": 2,
      "value": false,
      "title": translate(Get.context!).someone_is_stuck_at_report_location,
    }
  ];

  TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: BaseAppBar(title: translate(context).ask_for_help),
        body: Container(
            padding: EdgeInsets.all(15.sp),
            child: ListView(
              children: [
                CustomTextField(
                  prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SvgPicture.asset("assets/images/circle2017.svg")
                  ),controller: searchCtrl, hintText: translate(context).select_location_LAB_H2, suffixIcon: GestureDetector(
                  onTap: (){
                    showNFCDialog(context, "");
                  },
                    child: SizedBox(
                      height: 26,
                      width: 30,
                      child: SvgPicture.asset(nfcSvg)),
                  ),
                  fillColor: BaseColors.txtFieldTextColor,
                ),
                SizedBox(height: 2.2.h),
                ...List.generate(
                    helpOptions.length,
                    (index) => GestureDetector(
                          onTap: () {
                            helpOptions.forEach((element) {
                              element['value'] = false;
                            });
                            helpOptions[index]['value'] =
                                !helpOptions[index]['value'];
                            setState(() {});
                            print("object::::::" +
                                helpOptions[index]['value'].toString());
                          },
                          child: Container(
                            height: 38,
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 5),
                            decoration: BoxDecoration(
                                // color: CustomColors.backgroundColor,
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    color: BaseColors.primaryColor)),
                            // padding: marginSymetric(1.2.h, 0.8.h),
                            child: Row(
                              children: [
                                Text(
                                    helpOptions[index]['title'],
                                    style: Style.montserratRegularStyle().copyWith(fontSize: 16.sp,
                                        color: BaseColors.primaryColor,
                                        fontWeight:FontWeight.w400),),
                                Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: helpOptions[index]['value'] == true?BaseColors.white :BaseColors.white,
                                          width: 2),
                                      shape: BoxShape.circle,
                                      boxShadow: [helpOptions[index]['value'] == true?getBoxShadow():const BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      )],
                                      color: helpOptions[index]['value'] == true
                                          ? BaseColors.primaryColor
                                          : BaseColors.white,),
                                  child: Icon(
                                    Icons.check,
                                    color: BaseColors.white,
                                    size: 15.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                BaseTextFormField(
                  topMargin: 2.8.h,
                  controller: commentController,
                  hintText: translate(context).add_comment,
                  maxLine: 3,
                  bottomMargin: 4.h,
                ),
                Center(
                  child: BaseButton(title: translate(context).notify.toUpperCase(), onPressed: (){
                    Get.back();
                  },btnType: largeButton,)
                )
              ],
            )));
  }
}
