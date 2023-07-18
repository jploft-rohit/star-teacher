import 'package:flutter/material.dart';
import 'package:staff_app/utility/base_views/base_colors.dart';

class BaseCartAddButton extends StatelessWidget {
  final Function() onIncrement;
  final Function() onDecrement;
  final int quantity;

  const BaseCartAddButton({super.key, required this.onIncrement, required this.onDecrement, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF8F4E9),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffC19444))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(visible: quantity > 0,child: GestureDetector(onTap: onIncrement,child: Icon(Icons.add))),
          GestureDetector(
              onTap: (){
                print("Hello");
                if (quantity < 1) {
                  quantity + 1;
                }
              },
              child: Text(quantity < 1 ? "+ Add" : quantity.toString(),style: TextStyle(color: BaseColors.primaryColor,fontWeight: FontWeight.bold))),
          Visibility(visible: quantity > 0,child: GestureDetector(onTap: onDecrement,child: Icon(Icons.remove))),
        ],
      ),
    );
  }
}
