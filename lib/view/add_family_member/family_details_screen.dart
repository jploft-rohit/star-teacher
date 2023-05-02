import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_app_bar.dart';

import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/Utility/utility.dart';
import 'package:staff_app/language_classes/language_constants.dart';

class FamilyDetailsScreen extends StatefulWidget {
  const FamilyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FamilyDetailsScreen> createState() => _FamilyDetailsScreenState();
}

class _FamilyDetailsScreenState extends State<FamilyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Family Member"),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: double.infinity),
                buildInfoItems(translate(context).name, 'Salma Khan'),
                const SizedBox(height: 10),
                buildInfoItems(translate(context).relation, 'Mother'),
                const SizedBox(height: 10),
                buildInfoItems(translate(context).dob, '14/12/1997'),
                const SizedBox(height: 10),
                buildInfoItems(translate(context).mobile_no, '9314117117'),
                const SizedBox(height: 10),
                buildInfoItems(translate(context).upload_id, 'doc.pdf'),
                const SizedBox(height: 10),
                buildInfoItems(translate(context).expiry_date, '15/10/2020'),
              ],
            ),
          ),
        ),
      )
    );
  }
  Widget buildInfoItems(String title,String description, [icon]) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: Style.montserratRegularStyle().copyWith(color: BaseColors.textBlackColor, fontSize: 14.sp),
        children: <TextSpan>[
          TextSpan(text: description, style: Style.montserratBoldStyle().copyWith(color: BaseColors.primaryColor, fontSize: 14.sp, height: 1.2)),
        ],
      ),
    );
  }
}
