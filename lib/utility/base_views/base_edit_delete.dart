import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';

class BaseEditDelete extends StatelessWidget {
  final Function()? onEditProceed, onDeleteProceed;
  final String editTitle, deleteTitle;
  final String? heading;
  final bool? showDeleteViewIcons;
  const BaseEditDelete({Key? key, this.onEditProceed, this.onDeleteProceed, required this.editTitle, required this.deleteTitle, this.heading, this.showDeleteViewIcons = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(visible: (heading??"").isNotEmpty,child: Text(heading??"", style: TextStyle(fontSize: 16.sp, color: BaseColors.textBlackColor, fontWeight: FontWeight.w700))),
        Visibility(visible: (heading??"").isNotEmpty,child: Spacer()),
        BaseIcons().edit(title: "Are you sure you want to edit this "+(editTitle)+".",onRightButtonPressed: onEditProceed,rightMargin: 2.5.w, leftMargin: 2.5.w),
        BaseIcons().delete(title: "Are you sure you want to delete this "+(deleteTitle)+".",onRightButtonPressed: onDeleteProceed,leftMargin: 2.5.w),
      ],
    );
  }
}
