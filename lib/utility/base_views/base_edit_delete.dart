import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';
import 'package:staff_app/utility/base_views/base_icons.dart';

class BaseEditDelete extends StatelessWidget {
  final Function()? onEditProceed, onDeleteProceed, onSaveProceed;
  final String editTitle, deleteTitle;
  final String? heading;
  final TextEditingController? deleteReasonController;
  final bool? showDeleteViewIcons,showSaveIcon,showDeleteReason;
  final GlobalKey<FormState>? formKey;
  const BaseEditDelete({Key? key, this.onEditProceed, this.onDeleteProceed, required this.editTitle, required this.deleteTitle, this.heading, this.showDeleteViewIcons = false, this.showSaveIcon, this.showDeleteReason, this.deleteReasonController, this.formKey, this.onSaveProceed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(visible: (heading??"").isNotEmpty,child: Text(toBeginningOfSentenceCase(heading??"N/A")??"N/A", style: TextStyle(fontSize: 16.sp, color: BaseColors.textBlackColor, fontWeight: FontWeight.w700))),
        Visibility(visible: (heading??"").isNotEmpty,child: Spacer()),
        Visibility(visible: (showSaveIcon??false), child: BaseIcons().save(title: "Are you sure you want to save this "+(editTitle)+".",onRightButtonPressed: onSaveProceed,rightMargin: 2.5.w, leftMargin: 2.5.w)),
        Visibility(visible: editTitle.isNotEmpty,child: BaseIcons().edit(title: "Are you sure you want to edit this "+(editTitle)+".",onRightButtonPressed: onEditProceed,rightMargin: 2.5.w, leftMargin: 2.5.w)),
        Visibility(visible: deleteTitle.isNotEmpty, child: BaseIcons().delete(title: (showDeleteReason??false) ? deleteTitle : "Are you sure you want to delete this "+(deleteTitle)+".",onRightButtonPressed: onDeleteProceed,leftMargin: 2.5.w,showDeleteReason: showDeleteReason, deleteReasonController: deleteReasonController,formKey: formKey)),
      ],
    );
  }
}
