import 'package:flutter/material.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_textformfield.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class CreateGalleryScreen extends StatefulWidget {
  const CreateGalleryScreen({Key? key}) : super(key: key);

  @override
  State<CreateGalleryScreen> createState() => _CreateGalleryScreenState();
}

class _CreateGalleryScreenState extends State<CreateGalleryScreen> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController uploadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Star Gallery"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            children: [
              BaseTextFormField(controller: categoryController,isDropDown: true,hintText: "Select Category",),
              ///
              BaseTextFormField(controller: titleController,hintText: "Title"),
              BaseTextFormField(controller: uploadController,hintText: "Upload Images & Video",isDropDown: true,),
              ///
              BaseButton(title: translate(context).submit_btn_txt, onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
