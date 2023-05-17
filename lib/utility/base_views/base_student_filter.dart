import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_filter_dropdown.dart';
import 'package:staff_app/Utility/dummy_lists.dart';
import 'package:staff_app/Utility/filter_textformfield.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/constants-classes/color_constants.dart';

class BaseStudentFilter extends StatefulWidget {

  final double? bottomMargin, topMargin, rightMargin, leftMargin;
  const BaseStudentFilter({Key? key, this.bottomMargin, this.topMargin, this.rightMargin, this.leftMargin}) : super(key: key);

  @override
  State<BaseStudentFilter> createState() => _BaseStudentFilterState();
}

class _BaseStudentFilterState extends State<BaseStudentFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.bottomMargin??2.h,top: widget.topMargin??0,right: widget.rightMargin??0,left: widget.leftMargin??0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ColorConstants.borderColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFilterDropDown(
                initialValue: DummyLists.initialSchool, hintText: 'School',
                listData: DummyLists.schoolData, onChange: (value) {
                setState(() {
                  DummyLists.initialSchool=value;
                });
              },icon: classTakenSvg,),
              Container(
                height: 35,
                width: 1,
                child: VerticalDivider(
                  width: 1,
                )
              ),
              CustomFilterDropDown(
                initialValue: DummyLists.initialGrade, hintText: 'Grade 1',
                listData: DummyLists.gradeData, onChange: (value) {
                setState(() {
                  DummyLists.initialGrade=value;
                });
              },icon: classTakenSvg),
            ],
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFilterDropDown(
                initialValue: DummyLists.initialClass, hintText: 'H1',
                listData: DummyLists.classData, onChange: (value) {
                setState(() {
                  DummyLists.initialClass=value;
                });
              },icon: classTakenSvg,),
              Container(child: VerticalDivider(width: 1,),height: 4.h,width: 1,),
              CustomFilterDropDown(
                initialValue: DummyLists.initialTerm, hintText: 'Term 1',
                listData: DummyLists.termData, onChange: (value) {
                setState(() {
                  DummyLists.initialTerm=value;
                });
              },icon: classTakenSvg,),
            ],
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          FilterTextFormField(onChange: (String val) {},
            hintText: "Search Star,ID...",
            keyBoardType: TextInputType.name,
          ),
        ],
      ),
    );
  }
}
