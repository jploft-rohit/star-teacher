import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class ReportLostFoundScreen extends StatefulWidget {
  final bool isUpdating;
  const ReportLostFoundScreen({Key? key,this.isUpdating = false}) : super(key: key);

  @override
  State<ReportLostFoundScreen> createState() => _ReportLostFoundScreenState();
}

class _ReportLostFoundScreenState extends State<ReportLostFoundScreen> {
  TextEditingController schoolController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController whereController = TextEditingController();
  TextEditingController uploadController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: widget.isUpdating ? "Lost & Found" : "Report Lost & Found"),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(translate(context).school, style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg, color: Colors.transparent,),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            readOnly: true,
                            controller: schoolController,
                            fillColor: CustomColors.txtFieldTextColor,
                            hintText: "",
                            borderRadius: 5.0,
                            suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(translate(context).title, style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg, color: Colors.transparent,),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: titleController,
                            hintText: "",
                            fillColor: CustomColors.txtFieldTextColor,
                            borderRadius: 5.0,

                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text("Found Date", style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: dateController,
                            readOnly: true,
                            onTap: (){
                              selectDate(context);
                            },
                            fillColor: CustomColors.txtFieldTextColor,
                            hintText: "",
                            borderRadius: 5.0,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(translate(context).where, style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg, color: Colors.transparent,),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: whereController,
                            fillColor: CustomColors.txtFieldTextColor,
                            hintText: "",
                            borderRadius: 5.0,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(translate(context).upload_photo, style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(calenderDateSvg, color: Colors.transparent,),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: CustomTextField(
                            controller: uploadController,
                            hintText: "",
                            fillColor: CustomColors.txtFieldTextColor,
                            borderRadius: 5.0,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: SvgPicture.asset("assets/images/upload_icon.svg",),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            // SizedBox(
            //   height: 2.h,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Flexible(
            //       flex: 1,
            //       child: Text(translate(context).id_expiry_date, style: Style.montserratBoldStyle().copyWith(fontSize: 16.sp, color: CustomColors.textBlackColor),),
            //     ),
            //     Flexible(
            //       flex: 3,
            //       child: Container(
            //         child: Row(
            //           children: [
            //             SvgPicture.asset(calenderDateSvg,),
            //             SizedBox(
            //               width: 2.w,
            //             ),
            //             Expanded(
            //               child: CustomTextField(
            //                 controller: idExpiryController,
            //                 onTap: (){
            //                   selectDate(context);
            //                 },
            //                 readOnly: true,
            //                 hintText: "dd/mm/yyyy",
            //                 fillColor: CustomColors.txtFieldTextColor,
            //                 borderRadius: 5.0,
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(height: 5.h),
            BaseButton(title: widget.isUpdating ? translate(context).update : translate(context).submit_btn_txt, onPressed: (){
              Get.back();
            })
          ],
        ),
      ),
    );
  }
  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: CustomColors.primaryColor,
              ),
            ),
            child: child!,
          );
        },
        initialDate: DateTime.now(),
        firstDate: DateTime(1600, 8),
        lastDate: DateTime.now()
    ).then((picked){

    });
  }
  setData(){
    if(widget.isUpdating){
      schoolController.text = "Ignite Public School";
      titleController.text = "Found a book in the computer lab.";
      dateController.text = "14/12/1997";
      whereController.text = "9342343245";
      uploadController.text = "doc.pdf";
    }
  }
}
