import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/base_app_bar.dart';
import 'package:staff_app/Utility/base_button.dart';

import 'package:staff_app/Utility/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/assignments_screen/assignment_screen.dart';
import 'package:staff_app/view/library_screen/notebook_screen/notebook_screen.dart';
import 'package:staff_app/view/search_screen/search_screen_ctrl.dart';
import 'package:staff_app/view/star_attendance_screen/star_attendance_screen.dart';
import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen.dart';

import '../Dashboard_screen/dashboard_screen_ctrl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchCtrl = TextEditingController();
  DashboardScreenCtrl ctrl = Get.find<DashboardScreenCtrl>();
  SearchScreenCtrl controller = Get.put(SearchScreenCtrl());
  List<String> list = [
    "Stars Attendance",
    "Stars Evaluation",
    "Assignments",
    "Notebook",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: translate(context).search,
          onBackPressed: (){
             ctrl.bottomNavigationKey.currentState?.setPage(2);
          }),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx((){
              return controller.selectedIndex.value == 0 ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.fmoImageList.length,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 42
                  ),
                  itemBuilder: (context, index) =>
                      GestureDetector(
                        onTap: () {
                          controller.selectedFMOPos.value = index;
                          controller.update();
                        },
                        child: Obx(() {
                          return Container(
                            height: 40,
                            // padding: const EdgeInsets.symmetric(horizontal: 9),
                            decoration: BoxDecoration(
                                color: controller.selectedFMOPos.value == index
                                    ? BaseColors.backgroundColor
                                    : BaseColors.white,
                                boxShadow: [getBoxShadow()],
                                border: controller.selectedFMOPos.value == index
                                    ? Border.all(
                                    color: BaseColors.primaryColor, width: 1.5)
                                    : null,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: BaseColors.white, width: 2),
                                      shape: BoxShape.circle,
                                      boxShadow: [getBoxShadow()],
                                      color: controller.selectedFMOPos.value == index
                                          ? BaseColors.primaryColor
                                          : BaseColors.borderColor
                                  ),
                                  child: Icon(Icons.check, color: BaseColors.white,
                                      size: 17.sp),
                                ),
                                Obx(() => SvgPicture.asset(controller.fmoImageList[index],height: 30,color: controller.selectedFMOPos.value==index ? BaseColors.primaryColor:Colors.black,))
                              ],
                            ),
                          );
                        }),
                      )) : const SizedBox();
            }),
            SizedBox(
              height: 2.h,
            ),
            GetBuilder<SearchScreenCtrl>(
              builder: (controller) {
                return CustomTextField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: SvgPicture.asset(searchSvg, color: Colors.grey[500], height: 20.0,),
                  ),
                  borderColor: BaseColors.borderColor,
                  controller: searchCtrl,
                  hintText: translate(context).search,
                  suffixIcon: controller.selectedFMOPos.value == 2 ? const SizedBox() : Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10.0),
                    child: SvgPicture.asset(controller.fmoImageList[controller.selectedFMOPos.value],color: BaseColors.primaryColor,),
                  ),
                );
              },
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(translate(context).search_results, style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp),),
            SizedBox(
              height: 2.h,
            ),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(onTap: (){
                  if(index == 0){
                    Get.to(const StarAttendanceScreen());
                  }
                  if(index == 1){
                    Get.to(const StarEvaluationScreen());
                  }
                  if(index == 2){
                    Get.to(const AssignmentScreen());
                  }
                  if(index == 3){
                    Get.to(const NoteBookScreen());
                  }
                },child: buildTile(list[index]));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildTile(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: BaseButton(btnType: buttonIcon,title: title, onPressed:null,showNextIcon: true,),
    );
  }
}
