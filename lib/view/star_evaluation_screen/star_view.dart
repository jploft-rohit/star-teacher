// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:staff_app/utility/base_views/base_app_bar.dart';
// import 'package:staff_app/utility/base_views/base_button.dart';
//
//
// import 'package:staff_app/utility/base_views/base_colors.dart';
// import 'package:staff_app/utility/base_views/base_type_search.dart';
// import 'package:staff_app/Utility/custom_text_field.dart';
// import 'package:staff_app/Utility/images_icon_path.dart';
// import 'package:staff_app/utility/base_utility.dart';
// import 'package:staff_app/language_classes/language_constants.dart';
// import 'package:staff_app/view/splash_screen/controller/base_ctrl.dart';
// import 'package:staff_app/view/star_evaluation_screen/star_evaluation_screen_ctrl.dart';
// import 'package:staff_app/view/star_evaluation_screen/star_rating_popup.dart';
// import '../../Utility/sizes.dart';
//
// class StarView extends StatefulWidget {
//   const StarView({Key? key}) : super(key: key);
//
//   @override
//   State<StarView> createState() => _StarViewState();
// }
//
// class _StarViewState extends State<StarView> {
//   StarEvaluationScreenCtrl getController = Get.put(StarEvaluationScreenCtrl());
//   TextEditingController searchCtrl = TextEditingController();
//   BaseCtrl baseCtrl = Get.find<BaseCtrl>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const BaseAppBar(title: "Star Rating"),
//       body: Obx(()=>Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             children: [
//               BaseTypeSearch(searchController: searchCtrl),
//               Row(
//                 // mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   // addText("21 of 60 selected", 15.sp, Colors.black54, FontWeight.w400),
//                   Row(
//                     children: [
//                       Obx(() => Checkbox(
//                         checkColor: BaseColors.primaryColor,
//                         activeColor: Colors.transparent,
//                         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                         value: getController.isChecked.value,
//                         visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
//                         side: MaterialStateBorderSide.resolveWith((states) => const BorderSide(
//                             width: 1.0,
//                             color: BaseColors.primaryColor
//                         )),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(3),
//                             side: const BorderSide(color: BaseColors.primaryColor)
//                         ),
//                         onChanged: (bool? value) {
//                           controller.manualList?.forEach((element) {
//                             element.isSelected = controller.isSelectAll.value == false ? true : false;
//                           });
//                           // getController.isChecked.value = value??false;
//                           // if (value??false) {
//                           //   baseCtrl.starsList.asMap().forEach((key, value) {
//                           //     baseCtrl.starsList[key]['isSelected'].value = true;
//                           //   });
//                           // }else{
//                           //   baseCtrl.starsList.asMap().forEach((key, value) {
//                           //     baseCtrl.starsList[key]['isSelected'].value = false;
//                           //   },
//                           //  );
//                           // }
//                         },
//                        ),
//                       ),
//                       Text(translate(context).select_all, style: Style.montserratMediumStyle().copyWith(color: BaseColors.greyColor, fontSize: 15.sp),),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: baseCtrl.starsList?.length??0,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 10.0),
//                       child: GestureDetector(
//                         onTap: (){
//                           // baseCtrl.starsList[index]['isSelected'].value = !baseCtrl.starsList[index]['isSelected'].value;
//                           // baseCtrl.starsList.any((element) => element['isSelected'] == true);
//                           //   if (baseCtrl.starsList.any((element) => element['isSelected'] == false)) {
//                           //     getController.isChecked.value = false;
//                           //   }else{
//                           //     getController.isChecked.value = true;
//                           //   }
//                         },
//                         child: Row(
//                           children: [
//                             Obx(() => Container(
//                               // padding: const EdgeInsets.symmetric(horizontal: 9),
//                               decoration: BoxDecoration(
//                                   color: (baseCtrl.starsList?[index].isSelected??false)
//                                       ? BaseColors.backgroundColor
//                                       : BaseColors.borderColor,
//                                   boxShadow: [getLightBoxShadow()],
//                                   border: (baseCtrl.starsList?[index].isSelected??false)
//                                       ? Border.all(
//                                       color: BaseColors.primaryColor, width: 1.5)
//                                       : Border.all(
//                                       color: Colors.transparent, width: 1.5),
//                                   borderRadius: BorderRadius.circular(30.0)),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: BaseColors.white, width: 1.5),
//                                     shape: BoxShape.circle,
//                                     boxShadow: [getBoxShadow()],
//                                     color: (baseCtrl.starsList?[index].isSelected??false)
//                                         ? BaseColors.primaryColor
//                                         : BaseColors.borderColor
//                                 ),
//                                 child: Center(
//                                   child: Icon(Icons.check, color: BaseColors.white,
//                                       size: 16.sp),
//                                 ),
//                               ),
//                             )),
//                             SizedBox(
//                               width: 2.w,
//                             ),
//                             Obx(() => Expanded(
//                               child: Container(
//                                 padding: EdgeInsets.all(10.sp),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     border: Border.all(
//                                         color: (baseCtrl.starsList?[index].isSelected??false)
//                                             ? BaseColors.primaryColor
//                                             : BaseColors.borderColor
//                                     )
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 15.sp, right: 15.sp),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: BaseColors.primaryColor
//                                         ),
//                                         borderRadius: BorderRadius.circular(15.0),
//                                       ),
//                                       child: SvgPicture.asset(manSvg),
//                                     ),
//                                     SizedBox(
//                                       width: 2.w,
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.all(10.sp),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           addText(baseCtrl.starsList?[index].user?.name??"", 16.sp, BaseColors.primaryColor, FontWeight.w700),
//                                           SizedBox(height: 1.h),
//                                           Row(
//                                             children: [
//                                               addText("ID: ", 14.sp, BaseColors.textBlackColor, FontWeight.w700),
//                                               addText("#${baseCtrl.starsList?[index].studentId??""}", 14.sp, BaseColors.primaryColor, FontWeight.w700),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 1.h),
//               BaseButton(title: "RATE STAR", onPressed: (){
//                 showGeneralDialog(
//                   context: context,
//                   pageBuilder: (context, animation, secondaryAnimation) {
//                     return const StarRatingPopup();
//                   },
//                 );
//               },btnType: mediumLargeButton,borderRadius: 20,),
//               // Row(
//               //   children: [
//               //     Expanded(
//               //       child: BaseButton(title: translate(context).give_stars.toUpperCase(), onPressed: (){
//               //         showGeneralDialog(
//               //           context: context,
//               //           pageBuilder: (context, animation, secondaryAnimation) {
//               //             return const StarRatingPopup();
//               //           },
//               //         );
//               //       }, rightMargin: 2.w),
//               //     ),
//               //     Expanded(
//               //       child: BaseButton(leftMargin: 2.w,title: translate(context).record_needs.toUpperCase(), onPressed: (){
//               //         showGeneralDialog(
//               //           context: context,
//               //           pageBuilder: (context, animation, secondaryAnimation) {
//               //             return SuccessDialogScreen(msg: translate(context).points_added_successfully,);
//               //           },
//               //         );
//               //       },btnWidth: 40.w,),
//               //     ),
//               //   ],
//               // ),
//               SizedBox(height: 1.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget starEvaluationFilter(){
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15.0),
//         border: Border.all(
//             color: BaseColors.borderColor
//         ),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Flexible(
//                 flex: 1,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0,),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(classTakenSvg,height: 15,),
//                       SizedBox(
//                         width: 2.w,
//                       ),
//                       Text("School", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
//                       const Spacer(),
//                       const Icon(
//                         Icons.arrow_drop_down,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 1,
//                 height: 25,
//                 color: BaseColors.borderColor,
//               ),
//               Flexible(
//                 flex: 1,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(classTakenSvg,height: 15,),
//                       SizedBox(
//                         width: 2.w,
//                       ),
//                       Text("Grade 3", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
//                       const Spacer(),
//                       const Icon(
//                         Icons.arrow_drop_down,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const Divider(height: 0.0,),
//           Row(
//             children: [
//               Flexible(
//                 flex: 1,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0,),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(classTakenSvg,height: 15,),
//                       SizedBox(
//                         width: 2.w,
//                       ),
//                       Text("H1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
//                       const Spacer(),
//                       const Icon(
//                         Icons.arrow_drop_down,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 1,
//                 height: 25,
//                 color: BaseColors.borderColor,
//               ),
//               Flexible(
//                 flex: 1,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(jobDetailSvg,height: 15,),
//                       SizedBox(
//                         width: 2.w,
//                       ),
//                       Text("Term 1", style: Style.montserratMediumStyle().copyWith(fontWeight: FontWeight.w600, fontSize: 15.sp),),
//                       const Spacer(),
//                       const Icon(
//                         Icons.arrow_drop_down,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const Divider(height: 0.0,),
//           CustomTextField(
//             controller: searchCtrl,
//             hintText: translate(context).search_by_id,
//             hintTextColor: BaseColors.textLightGreyColor,
//             borderColor: Colors.transparent,
//             contentPadding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
//             prefixIcon: const Padding(
//               padding: EdgeInsets.only(left: 10.0, right: 10.0),
//               child: Icon(
//                 Icons.search,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
