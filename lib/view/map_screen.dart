// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:staff_app/utility/base_views/base_app_bar.dart';
//
// import 'package:staff_app/utility/base_views/base_colors.dart';
// import 'package:staff_app/language_classes/language_constants.dart';
//
// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: BaseColors.white,
//       appBar: const BaseAppBar(title: "Location"),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Card(
//                 child: ClipRRect(
//                   child: Image.asset(
//                     "assets/images/mapimage.png",
//                     fit: BoxFit.fill,
//                     height: 75.h,
//                     width: 100.w,
//                   ),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//               ),
//               SizedBox(height :4.h),
//               // BaseButton(
//               //     child: addText(
//               //         'Change Route'.toUpperCase(),
//               //         getNormalTextFontSIze(),
//               //         CustomColors.primaryColor,
//               //         FontWeight.w500),
//               //     onTap: () {
//               //       Get.back();
//               //     }),
//               // spaceheight(4.h)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
