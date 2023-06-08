import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/view/worksheet/create_worksheet/create_question_2_screen.dart';

class CreateQuestion1 extends StatefulWidget {
  const CreateQuestion1({Key? key}) : super(key: key);

  @override
  State<CreateQuestion1> createState() => _CreateQuestion1State();
}

class _CreateQuestion1State extends State<CreateQuestion1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Create Worksheet"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Question: 1",style: TextStyle(fontSize: 18),),
              BaseTextFormField(
                topMargin: 2.h,
                controller: TextEditingController(),
                hintText: "Question Type",
                isDropDown: true,
                suffixIcon: "assets/images/ic_down.svg",
                onTap: (){
                },
              ),
              BaseTextFormField(controller: TextEditingController(),hintText: "Upload Image(Optional)",suffixIcon: "assets/images/upload_icon.svg",
                  onTap: (){
                    BaseOverlays().showMediaPickerDialog();
                  }),
              BaseTextFormField(controller: TextEditingController(),hintText: "Upload Video(Optional)",suffixIcon: "assets/images/upload_icon.svg",
                  onTap: (){
                    BaseOverlays().showMediaPickerDialog();
                  }),
              BaseTextFormField(
                controller: TextEditingController(),
                hintText: "Question 1",
              ),
              Row(
                children: [
                  Expanded(
                    child: BaseTextFormField(
                      rightMargin: 20,
                      controller: TextEditingController(),
                      hintText: "Option 1",
                    ),
                  ),
                  SvgPicture.asset("assets/images/ic_delete.svg",height: 25,width: 25)
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: BaseTextFormField(
                      rightMargin: 20,
                      controller: TextEditingController(),
                      hintText: "Option 2",
                    ),
                  ),
                  SvgPicture.asset("assets/images/ic_delete.svg",height: 25,width: 25)
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: BaseTextFormField(
                      rightMargin: 20,
                      controller: TextEditingController(),
                      hintText: "Option 3",
                    ),
                  ),
                  SvgPicture.asset("assets/images/ic_delete.svg",height: 25,width: 25)
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: BaseTextFormField(
                      rightMargin: 20,
                      controller: TextEditingController(),
                      hintText: "Option 4",
                    ),
                  ),
                  SvgPicture.asset("assets/images/ic_delete.svg",height: 25,width: 25)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(child: BaseButton(title: "Save & Next", onPressed: (){},isActive: false,rightMargin: 10,)),
                    Expanded(child: BaseButton(title: "Post", onPressed: (){
                      Get.to(CreateQuestion2());
                    },leftMargin: 10)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
