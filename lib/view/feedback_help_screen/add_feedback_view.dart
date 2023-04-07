import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_dropdown.dart';
import 'package:staff_app/Utility/base_textformfield.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';

class AddFeedbackView extends StatefulWidget {
  final bool isUpdating;
  const AddFeedbackView({Key? key, this.isUpdating = false}) : super(key: key);

  @override
  State<AddFeedbackView> createState() => _AddFeedbackViewState();
}

class _AddFeedbackViewState extends State<AddFeedbackView> {
  TextEditingController feedBackController = TextEditingController();
  TextEditingController toWhoController = TextEditingController();
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
      appBar: BaseAppBar(title: widget.isUpdating ? "Edit Feedback & Help" : "Feedback & Help"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            children: [
              BaseDropDown(),
              BaseTextFormField(
                controller: feedBackController,
                hintText: "Type",
                isDropDown: true,
                dropDownValue: feedBackController.text,
                onChanged: (newValue){
                  setState(() {
                    feedBackController.text = newValue.toString();
                  });},
                items: DummyLists().list1.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                }).toList(),
              ),
              BaseTextFormField(
                controller: toWhoController,
                hintText: "To who",
                isDropDown: true,
                dropDownValue: toWhoController.text,
                onChanged: (newValue){
                  setState(() {
                    toWhoController.text = newValue.toString();
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
    if (widget.isUpdating) {
      feedBackController.text = "Feedback";
      toWhoController.text = "Application";
      titleController.text = "Can improve the Speed";
      messageController.text = "Hi, I'm facing some issues with the application's speed..it's not working as fast as I expect.";
      uploadFilePhotoController.text = "doc.pdf";
    }
  }
}
