import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_dropdown.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';


import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/base_utility.dart';

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
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            children: [
              BaseDropDown(),
              BaseTextFormField(
                controller: helpController,
                hintText: "Help",
                isDropDown: true,
                dropDownValue: helpController.text,
                onChanged: (newValue){
                  setState(() {
                    helpController.text = newValue.toString();
                  });},
                items: DummyLists().list1.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                }).toList(),
              ),
              BaseTextFormField(
                controller: helpOptionController,
                hintText: "Select the help options",
                isDropDown: true,
                dropDownValue: helpOptionController.text,
                onChanged: (newValue){
                  setState(() {
                    helpOptionController.text = newValue.toString();
                  });},
                items: DummyLists().list1.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                }).toList(),
              ),
              BaseTextFormField(
                controller: titleController,
                hintText: "Title",
              ),
              BaseTextFormField(
                controller: messageController,
                maxLine: 4,
                hintText: "Message",
              ),
              BaseTextFormField(
                controller: uploadFilePhotoController,
                hintText: "Upload file or Photo",
                suffixIcon: "assets/images/upload_icon.svg",
                bottomMargin: 3.h,
                onTap: (){},
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
