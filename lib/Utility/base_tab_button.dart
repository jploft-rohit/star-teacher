import 'package:flutter/material.dart';
import 'package:staff_app/Utility/base_button.dart';

class BaseTabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  const BaseTabButton({Key? key, required this.title, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.only(right: 6),
        child: BaseButton(title: title,onPressed: null,verticalPadding: 0,removeHorizontalPadding: true,isActive: isSelected,isToggle: isSelected),
      ),
    );
  }
}
