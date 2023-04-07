import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen_ctrl.dart';
import 'package:staff_app/view/lost_or_found_screen/lost_or_found_view.dart';

class AddToDoNote extends StatefulWidget {
  const AddToDoNote({Key? key}) : super(key: key);

  @override
  State<AddToDoNote> createState() => _AddToDoNoteState();
}

class _AddToDoNoteState extends State<AddToDoNote> {
  NotebookScreenCtrl ctrl = Get.put(NotebookScreenCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: "Add Note"),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 4.0,
              children: List.generate(ctrl.colorList.length, (index) {
                return Obx(() => InkWell(
                  onTap: (){
                    ctrl.selectedColor.value = index;
                  },
                  child: Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(int.tryParse("0xff${ctrl.colorList[index]}")!),
                    ),
                    child: ctrl.selectedColor.value == index ? SvgPicture.asset("assets/images/selected_color_img.svg", fit: BoxFit.scaleDown,) : SizedBox(),
                  ),
                ));
              }),
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(controller: TextEditingController(), hintText: "Title", borderRadius: 4.0, fillColor: BaseColors.txtFieldTextColor,),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(controller: TextEditingController(), hintText: "Type here..", borderRadius: 4.0, fillColor: BaseColors.txtFieldTextColor,maxLine: 3,),
            SizedBox(
              height: 1.h,
            ),
            InkWell(
              onTap: (){
                ctrl.isChecked.value = !ctrl.isChecked.value;
              },
              child: Row(
                children: [
                  // Checkbox(value: ctrl.isChecked.value, onChanged: (value){
                  //   ctrl.isChecked.value  = value!;
                  // },
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(50.0)
                  //   ),
                  //   activeColor: CustomColors.primaryColor,
                  //   visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  // ),
                  GetBuilder<NotebookScreenCtrl>(
                    builder: (ctrl) {
                      return InkWell(
                        onTap: (){
                          ctrl.isChecked.value = !ctrl.isChecked.value;
                          ctrl.update();
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          // padding: const EdgeInsets.symmetric(horizontal: 9),
                          decoration: BoxDecoration(
                              color: ctrl.isChecked.value == true
                                  ? BaseColors.backgroundColor
                                  : BaseColors.borderColor,
                              boxShadow: [getLightBoxShadow()],
                              border: ctrl.isChecked.value == true
                                  ? Border.all(
                                  color: BaseColors.primaryColor, width: 1.5)
                                  : Border.all(
                                  color: Colors.transparent, width: 1.5),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: BaseColors.white, width: 1.5),
                                shape: BoxShape.circle,
                                boxShadow: [getBoxShadow()],
                                color: ctrl.isChecked.value == true
                                    ? BaseColors.primaryColor
                                    : BaseColors.borderColor
                            ),
                            child: Center(
                              child: Icon(Icons.check, color: BaseColors.white,
                                  size: 16.sp),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  addText("Set Reminder", 14.sp, BaseColors.textBlackColor, FontWeight.w400)
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(child: BaseButton(title: "SUBMIT", onPressed: (){
              Get.back();
            }))
          ],
        ),
      ),
    );
  }
}
