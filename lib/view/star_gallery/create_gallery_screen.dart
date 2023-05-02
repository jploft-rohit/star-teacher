import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_overlays.dart';
import 'package:staff_app/utility/base_views/base_textformfield.dart';
import 'package:staff_app/Utility/custom_dropdown_widget.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
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
  String? categoryInitial;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Star Gallery"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(scaffoldPadding),
          child: Column(
            children: [
              CustomDropDown(
                initialValue: categoryInitial,
                hintText: "Select Category",
                listData: ["Select Category", "School","Achievements","Events"],
                onChange: (value) {
                  setState(() {
                    categoryInitial=value;
                  });
                },
                isBackground: true,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 24,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                      color: ColorConstants.borderColor
                  ),
                ),
                margin: EdgeInsets.only(bottom: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomFilterDropDown(
                      initialValue: DummyLists.initialGrade,
                      hintText: 'Grade 3',
                      listData: DummyLists.gradeData,
                      onChange: (value) {
                        setState(() {
                          DummyLists.initialGrade = value;
                        });
                      },
                      icon: classTakenSvg,
                    ),
                    Container(
                      child: VerticalDivider(
                        width: 1,
                      ),
                      height: 5.5.h,
                      width: 2,
                    ),
                    CustomFilterDropDown(
                      initialValue: DummyLists.initialClass,
                      hintText: 'H1',
                      listData: DummyLists.classData,
                      onChange: (value) {
                        setState(() {
                          DummyLists.initialClass = value;
                        });
                      },
                      icon: classTakenSvg,
                    ),
                  ],
                ),
              ),
              ///
              BaseTextFormField(controller: titleController,hintText: "Title"),
              BaseTextFormField(controller: uploadController,hintText: "Upload Images & Video",suffixIcon: "assets/images/upload_icon.svg",
              onTap: (){
                BaseOverlays().showMediaPickerDialog();
              }),
              SizedBox(height: 3.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                        height: 110,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorConstants.primaryColor,),borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 10),
                              child: SvgPicture.asset("assets/images/school.svg",height: 70,width: 70,fit: BoxFit.scaleDown,),
                            ),
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Icon(Icons.close,size: 20,color: Color(0xFF929292),),
                            )
                          ],
                        ),
                      )),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Container(
                        height: 110,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorConstants.primaryColor,),borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 10),
                              child: SvgPicture.asset("assets/images/school.svg",height: 70,width: 70,fit: BoxFit.scaleDown,),
                            ),
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Icon(Icons.close,size: 20,color: Color(0xFF929292),),
                            )
                          ],
                        ),
                      )),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Container(
                        height: 110,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorConstants.primaryColor,),borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 10),
                              child: SvgPicture.asset("assets/images/school.svg",height: 70,width: 70,fit: BoxFit.scaleDown,),
                            ),
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Icon(Icons.close,size: 20,color: Color(0xFF929292),),
                            )
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(height: 3.h,),
              ///
              BaseButton(title: translate(context).submit_btn_txt, onPressed: (){},btnType: largeButton,),
            ],
          ),
        ),
      ),
    );
  }
}
