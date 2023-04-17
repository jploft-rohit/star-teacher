import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_floating_action_button.dart';
import 'package:staff_app/Utility/base_toggle_tab_bar.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/base_dialogs.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/library_screen/notebook_screen/add_todo_note.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_detail_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen_ctrl.dart';

class NoteBookScreen extends StatefulWidget {
  const NoteBookScreen({Key? key}) : super(key: key);

  @override
  State<NoteBookScreen> createState() => _NoteBookScreenState();
}

class _NoteBookScreenState extends State<NoteBookScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const BaseAppBar(title: "Notebook"),
        // floatingActionButton: BaseFloatingActionButton(
        //   onTap: () {Get.to(const AddToDoNote());},
        //   title: 'Add Note',
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                buildStarsView()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStarsView() {
    return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: BaseColors.borderColor
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                        child: Row(
                          children: [
                            SvgPicture.asset(classTakenSvg,height: 15,),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text("Grade 3", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_drop_down,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 25,
                      color: BaseColors.borderColor,
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(classTakenSvg,height: 15,),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text("H1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_drop_down,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 0.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                  child: Row(
                    children: [
                      SvgPicture.asset(jobDetailSvg,height: 15,),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text("Term 1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_drop_down,
                      )
                    ],
                  ),
                ),
                const Divider(height: 0.0),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: translate(context).search_by_id,
                  borderColor: Colors.transparent,
                  hintTextColor: BaseColors.textLightGreyColor,
                  contentPadding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          ListView.builder(
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Get.to(const NotebookDetailScreen());
                },
                child: Container(
                  padding: EdgeInsets.all(15.sp),
                  margin: const EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: BaseColors.borderColor)
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: BaseColors.primaryColor)
                        ),
                        child: SvgPicture.asset(girlSvg, height: 6.h,),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sania", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 15.sp),),
                          SizedBox(
                            height: .2.h,
                          ),
                          Container(
                            width: 30.w,
                            height: 1,
                            color: BaseColors.borderColor,
                          ),
                          SizedBox(
                            height: .2.h,
                          ),
                          Text("#562665", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                          SizedBox(
                            height: .2.h,
                          ),
                          Container(
                            width: 30.w,
                            height: 1,
                            color: BaseColors.borderColor,
                          ),
                          SizedBox(
                            height: .2.h,
                          ),
                          Row(
                            children: [
                              Text("Last Comment Date : ", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                              Text("25/07/2022", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                            ],
                          ),
                          SizedBox(
                            height: .2.h,
                          ),
                          Container(
                            width: 30.w,
                            height: 1,
                            color: BaseColors.borderColor,
                          ),
                          SizedBox(
                            height: .2.h,
                          ),
                          Row(
                            children: [
                              Text("Total Notes : ", style: Style.montserratMediumStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),),
                              Text("35", style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );}
}

class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Colors.black,
      ),
    );
  }
}
