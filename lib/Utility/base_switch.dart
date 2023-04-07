import 'package:flutter/material.dart';
import 'package:staff_app/Utility/base_colors.dart';

class BaseSwitch extends StatefulWidget {
  final bool value;
  final Color enableColor;
  final Color enableSwitchColor;
  final Color disableColor;
  final double width;
  final double height;
  final double switchHeight;
  final double switchWidth;
  final ValueChanged<bool> onChanged;

  const BaseSwitch({
    required Key key,
    required this.value,
    required this.enableColor,
    required this.enableSwitchColor,
    required this.disableColor,
    required this.width,
    required this.height,
    required this.switchHeight,
    required this.switchWidth,
    required this.onChanged})
      : super(key: key);

  @override
  _BaseSwitchState createState() => _BaseSwitchState();
}

class _BaseSwitchState extends State<BaseSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft :Alignment.centerRight).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear));
  }



  @override
  void dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
          },
          child: Container(
            width: widget.width ?? 48.0,
            height: widget.height ?? 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: widget.value ? Border.all(color: BaseColors.primaryColor) : null,
              color: _circleAnimation.value ==  Alignment.centerLeft ? widget.disableColor : widget.enableColor,),
            child: Padding(padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child:  Container(
                alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: widget.switchWidth ?? 20.0,
                  height: widget.switchHeight ?? 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: widget.value ? widget.enableSwitchColor : BaseColors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}