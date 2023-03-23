import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/custom_app_bar.dart';
import 'package:staff_app/Utility/custom_button.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/utility.dart';

class AddHelpView extends StatefulWidget {
  final bool isUpdating;
  const AddHelpView({Key? key, this.isUpdating = false}) : super(key: key);

  @override
  State<AddHelpView> createState() => _AddHelpViewState();
}

class _AddHelpViewState extends State<AddHelpView> {
  TextEditingController helpController = TextEditingController();
  TextEditingController helpOptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController uploadFilePhotoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: widget.isUpdating ? "Edit Feedback & Help" : "Feedback & Help"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 8.0),
                decoration: BoxDecoration(
                  color: CustomColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: CustomColors.borderColor
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ignite Public School", style: Style.montserratRegularStyle().copyWith(color: Colors.black, fontSize: 16.sp),),
                    const Icon(Icons.arrow_drop_down, color: Color(0xffC4C4C4),size: 35.0,)
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomTextField(
                controller: TextEditingController(),
                fillColor: CustomColors.txtFieldTextColor,
                hintText: "Help",
                borderRadius: 5.0,
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 6.0),
                  child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: TextEditingController(),
                fillColor: CustomColors.txtFieldTextColor,
                hintText: "Select the help options",
                borderRadius: 5.0,
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 6.0),
                  child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,size: 25.0,),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: TextEditingController(),
                fillColor: CustomColors.txtFieldTextColor,
                hintText: "Title",
                borderRadius: 5.0,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: TextEditingController(),
                maxLine: 4,
                hintText: "Message",
                borderRadius: 8.0,
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                controller: TextEditingController(),
                fillColor: CustomColors.txtFieldTextColor,
                hintText: "Upload file or Photo",
                borderRadius: 5.0,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SvgPicture.asset("assets/images/upload_icon.svg",),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              BaseButton(title: "SUBMIT", onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
  setData(){
    // if(widget.isUpdating){
    //   helpController.text = "Help";
    //   helpOptionController.text = "Hello";
    //   titleController.text = "Hello";
    // }
  }
}
