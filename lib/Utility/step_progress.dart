import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/Utility/custom_colors.dart';
import 'package:staff_app/Utility/utility.dart';

import 'sizes.dart';

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

class StepProgressView extends StatelessWidget {
  final double _width;
  double? height;
  double? btnWidth;
  double? textSize;
  final List<String> _titles;
  final List<String> _statuses;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = const Color(0xFFE6EEF3);
  final double lineWidth = 3.0;

  StepProgressView(
      {Key? key,
        this.height,
        this.btnWidth,
        this.textSize,
      required int curStep,
      required List<String> titles,
      required double width,
      required Color color,
      required List<String> statuses})
      : _titles = titles,
        _curStep = curStep,
        _width = width,
        _statuses = statuses,
        _activeColor = color,
        assert(width > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _width,
        child: Column(
          children: <Widget>[
            Row(
              children: _iconViews(),
            ),
          ],
        ));
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, icon) {
      var circleColor = (_curStep > i) ? _activeColor : _inactiveColor;
      list.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 25,
              alignment: Alignment.center,
              child: Text(_statuses[i], style: Style.montserratBoldStyle().copyWith(color: CustomColors.textBlackColor, fontSize: textSize ?? stepperTitleTs),textAlign: TextAlign.center,),
            ),
            const SizedBox(
              height: 5,
            ),
            _titles.elementAt(i) != ""
                ? Container(
                    width: height ?? 25.0,
                    height: btnWidth ?? 25.0,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(22.0)),
                        border: Border.all(
                          color:  CustomColors.white,
                          width: 2.0,
                        ),
                        boxShadow: [getBoxShadow()],
                        color: circleColor),
                    child: const Icon(
                      Icons.check,
                      color:  CustomColors.white,
                      size: 12.0,
                    ),
                  )
                : Container(
                    width: 15.0,
                    height: 15.0,
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(22.0)),
                        boxShadow: [getBoxShadow()],
                        color: Color(0xFFD9D9D9)),
                  ),
            const SizedBox(
              height: 5,
            ),
            Row(
                    children: [
                      Text(_titles.elementAt(i), style: Style.montserratBoldStyle().copyWith(color: CustomColors.textLightGreyColor, fontSize: textSize ?? stepperSubTitleTs),textAlign: TextAlign.center,),
                    ],
                  )
          ],
        ),
      );

      //line between icons
      if (i != _titles.length - 1) {
        list.add(Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: MySeparator(color:  CustomColors.textLightGreyColor),
          ),
        ));
      }
    });

    return list;
  }
}
