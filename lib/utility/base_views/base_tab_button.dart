import 'package:flutter/material.dart';
import 'package:staff_app/utility/base_views/base_button.dart';

class BaseTabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final String type;
  const BaseTabButton({Key? key, required this.title, required this.isSelected,this.type="toggle"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: BaseButton(
        title: title,
        onPressed: null,
        verticalPadding: 0,
        isActive: isSelected,isToggle: isSelected,
        btnType: type,
        removeHorizontalPadding: true,
      ),
    );
  }
}
