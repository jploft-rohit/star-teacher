import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';
import 'package:staff_app/utility/base_views/base_button.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/custom_text_field.dart';
import 'package:staff_app/Utility/images_icon_path.dart';
import 'package:staff_app/Utility/sizes.dart';
import 'package:staff_app/utility/base_utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';
import 'package:staff_app/view/search_screen/controller/search_screen_ctrl.dart';
import 'package:staff_app/view/sos/sos_scanQR.dart';

import '../Dashboard_screen/dashboard_screen_ctrl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchCtrl = TextEditingController();
  DashboardScreenCtrl ctrl = Get.find<DashboardScreenCtrl>();
  SearchScreenCtrl controller = Get.find<SearchScreenCtrl>();
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
            // Obx((){
            //   return controller.selectedIndex.value == 0
            //       ? GridView.builder(
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemCount: controller.fmoImageList.length,
            //       padding: EdgeInsets.zero,
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 3,
            //           crossAxisSpacing: 10,
            //           mainAxisExtent: 42,
            //       ),
            //       itemBuilder: (context, index) =>
            //           GestureDetector(
            //             onTap: () {
            //               controller.selectedFMOPos.value = index;
            //               controller.update();
            //               setState((){});
            //               if (index == 1) {
            //                 Get.to(ScanQrCodeScreen());
            //               }
            //             },
            //             child: Obx(() {
            //               return Container(
            //                 height: 40,
            //                 // padding: const EdgeInsets.symmetric(horizontal: 9),
            //                 decoration: BoxDecoration(
            //                     color: controller.selectedFMOPos.value == index
            //                         ? BaseColors.backgroundColor
            //                         : BaseColors.white,
            //                     boxShadow: [getBoxShadow()],
            //                     border: controller.selectedFMOPos.value == index
            //                         ? Border.all(
            //                           color: BaseColors.primaryColor, width: 1.5)
            //                         : null,
            //                     borderRadius: BorderRadius.circular(10.0)),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                   // crossAxisAlignment: CrossAxisAlignment.center,
            //                   children: [
            //                     Container(
            //                       padding: const EdgeInsets.all(2),
            //                       decoration: BoxDecoration(
            //                           border: Border.all(
            //                               color: BaseColors.white, width: 2),
            //                           shape: BoxShape.circle,
            //                           boxShadow: [getBoxShadow()],
            //                           color: controller.selectedFMOPos.value == index
            //                               ? BaseColors.primaryColor
            //                               : BaseColors.borderColor
            //                       ),
            //                       child: Icon(Icons.check, color: BaseColors.white,
            //                           size: 17.sp),
            //                     ),
            //                     Obx(() => SvgPicture.asset(controller.fmoImageList[index],height: 30,color: controller.selectedFMOPos.value==index ? BaseColors.primaryColor:Colors.black,))
            //                   ],
            //                 ),
            //               );
            //             }),
            //           ))
            //       : const SizedBox();
            // }),
            // SizedBox(
            //   height: 2.h,
            // ),
            CustomTextField(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: SvgPicture.asset(searchSvg, color: Colors.grey[500], height: 20.0,),
              ),
              onChanged: (val){
                controller.searchedList.clear();
                print("value$val");
                if(val.isEmpty){
                  controller.searchedList.clear();
                  controller.searchedList.refresh();
                }else{
                  controller.modulesList.forEach((element) {
                    if (element.title.toLowerCase().contains(val.toString().toLowerCase())) {
                      controller.searchedList.add(element);
                      controller.searchedList.refresh();
                    }
                  });
                }
              },
              maxLine: 1,
              borderColor: BaseColors.borderColor,
              controller: searchCtrl,
              hintText: translate(context).search,
              suffixIcon: controller.selectedFMOPos.value == 2 ? const SizedBox() : Padding(
                padding: const EdgeInsetsDirectional.only(end: 10.0),
                child: SvgPicture.asset(controller.fmoImageList[controller.selectedFMOPos.value],color: BaseColors.primaryColor,),
              ),
            ),
            SizedBox(height: 3.h),
            Text(translate(context).search_results, style: Style.montserratBoldStyle().copyWith(fontSize: 17.sp),),
            SizedBox(height: 2.h),
            Expanded(
              child: Obx(()=>ListView.builder(
                  itemCount: controller.searchedList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 20.h),
                  itemBuilder: (context, index) {
                    return buildTile(title: controller.searchedList[index].title, onPressed: controller.searchedList[index].onTap);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTile({required String title, required Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: BaseButton(btnType: buttonIcon,title: title, onPressed: onPressed,showNextIcon: true,),
    );
  }
}
