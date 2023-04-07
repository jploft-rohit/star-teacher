import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';
import 'package:staff_app/Utility/base_textformfield.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class AddFamilyMemberScreen extends StatefulWidget {
  final bool isUpdating;
  const AddFamilyMemberScreen({Key? key, required this.isUpdating}) : super(key: key);

  @override
  State<AddFamilyMemberScreen> createState() => _AddFamilyMemberScreenState();
}

class _AddFamilyMemberScreenState extends State<AddFamilyMemberScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController idExpiryController = TextEditingController();

  @override
  void initState() {
    if(widget.isUpdating){
      setData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(title: widget.isUpdating ? translate(context).update_family_member : translate(context).add_family_member),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            BaseTextFormField(
              controller: nameController,
              title: "${translate(context).name}:",
              hintText: "Type here...",
            ),
            BaseTextFormField(
              controller: relationController,
              title: "${translate(context).relation}:",
              hintText: translate(context).choose,
              isDropDown: true,
              dropDownValue: relationController.text,
              onChanged: (newValue){
                setState(() {
                  relationController.text = newValue.toString();
                });},
                items: DummyLists().list1.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: addText(value, 16.sp, Colors.black, FontWeight.w400),);
                }).toList(),
            ),
            BaseTextFormField(
              controller: dobController,
              title: "${translate(context).dob}:",
              prefixIcon: calenderDateSvg,
              hintText: "dd/mm/yyyy",
              keyboardType: TextInputType.datetime,
              onTap: (){selectDate(context);},
            ),
            BaseTextFormField(
              controller: mobileController,
              title: "${translate(context).mobile_number}:",
              hintText: translate(context).mobile_number,
              keyboardType: TextInputType.phone,
            ),
            BaseTextFormField(
              controller: idController,
              title: "${translate(context).upload_id}:",
              hintText: translate(context).upload_id,
              suffixIcon: 'assets/images/upload_icon.svg',
              onTap: (){},
            ),
            BaseTextFormField(
              controller: idExpiryController,
              title: "${translate(context).id_expiry_date}:",
              prefixIcon: calenderDateSvg,
              hintText: "dd/mm/yyyy",
              keyboardType: TextInputType.datetime,
              onTap: (){selectDate(context);},
            ),
            const Spacer(),
            BaseButton(title: translate(context).submit_btn_txt, onPressed: (){
              Get.back();
            })
          ],
        ),
      ),
    );
  }

  setData(){
    nameController.text = "Rohit Sharma";
    relationController.text = "Father";
    dobController.text = "15/10/1999";
    mobileController.text = "9897686878";
    idController.text = "rohit.doc";
    idExpiryController.text = "15/10/2023";
  }
}
