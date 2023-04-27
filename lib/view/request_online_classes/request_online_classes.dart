import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_textformfield.dart';


import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class RequestOnlineClasses extends StatefulWidget {
  final bool isUpdating;
  const RequestOnlineClasses({Key? key,this.isUpdating = false}) : super(key: key);

  @override
  State<RequestOnlineClasses> createState() => _RequestOnlineClassesState();
}

class _RequestOnlineClassesState extends State<RequestOnlineClasses> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isUpdating) {
      setData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.screenBackgroundColor,
      appBar: BaseAppBar(title: widget.isUpdating ? "Online Class Edit" : translate(context).online_class_request),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Custom_DropDown(
              initialValue: DummyLists.initialSchool,
              hintText: "Select School",
              listData:DummyLists.schoolData,
              onChange: (value) {
                setState(() {
                  DummyLists.initialSchool=value;
                });
              },
              topPadding: 5,
              bottomPadding: 5,
              icon: Icon(Icons.arrow_drop_down,color: Color(0xFFC4C4C4),size: 25,),
            ),
            SizedBox(
              height: 2.h,
            ),
            BaseTextFormField(
                controller: fromDateController,
                title: "${translate(context).from_date}:",
                prefixIcon: calenderDateSvg,
                hintText: "dd/mm/yyyy",
                keyboardType: TextInputType.datetime,
                onTap: (){selectDate(context);},
            ),
            BaseTextFormField(
              controller: toDateController,
              title: "${translate(context).to_date}:",
              prefixIcon: calenderDateSvg,
              hintText: "dd/mm/yyyy",
              keyboardType: TextInputType.datetime,
              onTap: (){selectDate(context);},
            ),
            BaseTextFormField(
              controller: reasonController,
              title: "${translate(context).reason}:",
              hintText: "Type here...",
            ),
            SizedBox(
              height: 5.h,
            ),
            BaseButton(title: translate(context).submit_btn_txt, onPressed: (){
              Get.back();
            },btnType: largeButton,),
          ],
        ),
      ),
    );
  }

  setData(){
    fromDateController.text = "12/05/23";
    toDateController.text = "19/05/23";
    reasonController.text = "Fever";
  }
}
