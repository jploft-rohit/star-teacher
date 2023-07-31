import 'dart:async';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:staff_app/constants-classes/color_constants.dart';
import 'package:staff_app/utility/base_utility.dart';


class IconProperty {
  final IconData? icon;
  final Color? color;
  final double? size;
  IconProperty({this.icon, this.color, this.size});
}

class CheckBoxProperty {
  final MouseCursor? mouseCursor;
  final Color? activeColor;
  final MaterialStateProperty<Color?>? fillColor;
  final Color? checkColor;
  final bool tristate;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final Color? focusColor;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final bool autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;
  static const double width = 18.0;
  CheckBoxProperty({
    this.tristate = false,
    this.mouseCursor,
    this.activeColor,
    this.fillColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus = false,
    this.shape,
    this.side,
  });
}

class DropDownTextField extends StatefulWidget {
  const DropDownTextField(
      {Key? key,
      this.controller,
      this.initialValue,
      required this.dropDownList,
      this.padding,
      this.textStyle,
      this.onChanged,
      this.validator,
      this.isEnabled = true,
      this.enableSearch = false,
      this.readOnly = true,
      this.dropdownRadius = 12,
      this.textFieldDecoration,
      this.dropDownIconProperty,
      this.dropDownItemCount = 6,
      this.searchFocusNode,
      this.textFieldFocusNode,
      this.searchAutofocus = false,
      this.searchDecoration,
      this.searchShowCursor,
      this.searchKeyboardType,
      this.listSpace = 0,
      this.clearOption = true,
      this.clearIconProperty,
      this.listPadding,
      this.listTextStyle,
      this.keyboardType,
      this.autovalidateMode})
      : assert(
          !(initialValue != null && controller != null),
          "you cannot add both initialValue and singleController,\nset initial value using controller \n\tEg: SingleValueDropDownController(data:initial value) ",
        ),
        assert(!(!readOnly && enableSearch),
            "readOnly!=true or enableSearch=true both condition does not work"),
        assert(
          !(controller != null &&
              !(controller is SingleValueDropDownController)),
          "controller must be type of SingleValueDropDownController",
        ),
        checkBoxProperty = null,
        isMultiSelection = false,
        singleController = controller,
        multiController = null,
        displayCompleteItem = false,
        submitButtonColor = null,
        submitButtonText = null,
        submitButtonTextStyle = null,
        super(key: key);
  const DropDownTextField.multiSelection(
      {Key? key,
      this.controller,
      this.displayCompleteItem = false,
      this.initialValue,
      required this.dropDownList,
      this.padding,
      this.textStyle,
      this.onChanged,
      this.validator,
      this.isEnabled = true,
      this.dropdownRadius = 12,
      this.dropDownIconProperty,
      this.textFieldDecoration,
      this.dropDownItemCount = 6,
      this.searchFocusNode,
      this.textFieldFocusNode,
      this.listSpace = 0,
      this.clearOption = true,
      this.clearIconProperty,
      this.submitButtonColor,
      this.submitButtonText,
      this.submitButtonTextStyle,
      this.listPadding,
      this.listTextStyle,
      this.checkBoxProperty,
      this.autovalidateMode})
      : assert(initialValue == null || controller == null,
            "you cannot add both initialValue and multiController\nset initial value using controller\n\tMultiValueDropDownController(data:initial value)"),
        assert(
          !(controller != null &&
              !(controller is MultiValueDropDownController)),
          "controller must be type of MultiValueDropDownController",
        ),
        multiController = controller,
        isMultiSelection = true,
        enableSearch = false,
        readOnly = true,
        searchAutofocus = false,
        searchKeyboardType = null,
        searchShowCursor = null,
        singleController = null,
        searchDecoration = null,
        keyboardType = null,
        // keyboardHeight = 0,
        super(key: key);

  ///single and multiple dropdown controller.
  ///It must be type of SingleValueDropDownController or MultiValueDropDownController.
  final dynamic controller;

  ///single dropdown controller,
  final SingleValueDropDownController? singleController;

  ///multi dropdown controller
  final MultiValueDropDownController? multiController;

  ///define the radius of dropdown List ,default value is 12
  final double dropdownRadius;

  ///initial value ,if it is null or not exist in dropDownList then it will not display value.
  final dynamic initialValue;

  ///dropDownList,List of dropdown values
  ///List<DropDownValueModel>
  final List<DropDownValueModel> dropDownList;

  ///function,called when value selected from dropdown.
  ///for single Selection Dropdown it will return single DropDownValueModel object,
  ///and for multi Selection Dropdown ,it will return list of DropDownValueModel object,
  final ValueSetter? onChanged;

  final bool isMultiSelection;

  final TextStyle? textStyle;

  final EdgeInsets? padding;

  ///override default textfield decoration
  final InputDecoration? textFieldDecoration;

  ///customize dropdown icon size and color
  final IconProperty? dropDownIconProperty;

  ///by setting isEnabled=false to disable textfield,default value true
  final bool isEnabled;

  final FormFieldValidator<String>? validator;

  ///by setting enableSearch=true enable search option in dropdown,as of now this feature enabled only for single selection dropdown
  final bool enableSearch;

  final bool readOnly;

  ///set displayCompleteItem=true, if you want show complete list of item in textfield else it will display like "number_of_item item selected"
  final bool displayCompleteItem;

  ///Maximum number of dropdown item to display,default value is 6
  final int dropDownItemCount;

  final FocusNode? searchFocusNode;
  final FocusNode? textFieldFocusNode;

  ///override default search decoration
  final InputDecoration? searchDecoration;

  ///override default search keyboard type,only applicable if enableSearch=true,
  final TextInputType? searchKeyboardType;

  ///by setting searchAutofocus=true to autofocus search textfield,only applicable if enableSearch=true,
  ///  ///default value is false
  final bool searchAutofocus;

  ///by setting searchShowCursor=false to hide cursor from search textfield,only applicable if enableSearch=true,
  final bool? searchShowCursor;

  ///by set clearOption=false to hide clear suffix icon button from textfield.
  final bool clearOption;

  ///customize Clear icon size and color
  final IconProperty? clearIconProperty;

  ///space between textfield and list ,default value is 0
  final double listSpace;

  ///dropdown List item padding
  final ListPadding? listPadding;

  ///multi dropdown submit button text
  final String? submitButtonText;

  ///multi dropdown submit button color
  final Color? submitButtonColor;

  ///multi dropdown submit button text style
  final TextStyle? submitButtonTextStyle;

  ///dropdown list item text style
  final TextStyle? listTextStyle;

  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;

  ///customize checkbox property
  final CheckBoxProperty? checkBoxProperty;

  @override
  _DropDownTextFieldState createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField>
    with TickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  late TextEditingController _cnt;
  late String _hintText;

  late bool _isExpanded;
  OverlayEntry? _entry;
  OverlayEntry? _entry2;
  OverlayEntry? _barrierOverlay;
  final _layerLink = LayerLink();
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  List<bool> _multiSelectionValue = [];
  // late String selectedItem;
  late double _height;
  late List<DropDownValueModel> _dropDownList;
  late int _maxListItem;
  late double _searchWidgetHeight;
  late FocusNode _searchFocusNode;
  late FocusNode _textFieldFocusNode;
  late bool _isOutsideClickOverlay;
  late bool _isScrollPadding;
  final int _duration = 150;
  late Offset _offset;
  late bool _searchAutofocus;
  late bool _isPortrait;
  late double _listTileHeight;
  late double _keyboardHeight;
  late TextStyle _listTileTextStyle;
  late ListPadding _listPadding;
  @override
  void initState() {
    _cnt = TextEditingController();
    _keyboardHeight = 450;
    _searchAutofocus = false;
    _isScrollPadding = false;
    _isOutsideClickOverlay = false;
    _searchFocusNode = widget.searchFocusNode ?? FocusNode();
    _textFieldFocusNode = widget.textFieldFocusNode ?? FocusNode();
    _isExpanded = false;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _duration),
    );
    _heightFactor = _controller.drive(_easeInTween);
    _searchWidgetHeight = 60;
    _hintText = "Select Star";
    _searchFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus &&
          !_textFieldFocusNode.hasFocus &&
          _isExpanded &&
          !widget.isMultiSelection) {
        _isExpanded = !_isExpanded;
        hideOverlay();
      }
    });
    _textFieldFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus &&
          !_textFieldFocusNode.hasFocus &&
          _isExpanded) {
        _isExpanded = !_isExpanded;
        hideOverlay();
        if (!widget.readOnly &&
            widget.singleController?.dropDownValue?.name != _cnt.text) {
          setState(() {
            _cnt.clear();
          });
        }
      }
    });

    for (int i = 0; i < widget.dropDownList.length; i++) {
      _multiSelectionValue.add(false);
    }

    ///initial value load
    if (widget.initialValue != null) {
      _dropDownList = List.from(widget.dropDownList);
      if (widget.isMultiSelection) {
        for (int i = 0; i < widget.initialValue.length; i++) {
          print("widget.initialValue[i].trim()");
          print(widget.initialValue[i].trim());
          for(int i=0;i<_dropDownList.length;i++)
            {
              print("_dropDownList[i].name.trim()");
              print(_dropDownList[i].name.trim());
            }
          var index = _dropDownList.indexWhere((element) =>
              element.name.trim() == widget.initialValue[i].trim());
          print("index");
          print(index);
          if (index != -1) {
            _multiSelectionValue[index] = true;
          }
        }
        int count =
            _multiSelectionValue.where((element) => element).toList().length;

        _cnt.text = (count == 0
            ? ""
            : widget.displayCompleteItem
                ? widget.initialValue.join(",")
                : "$count item selected");
      } else {
        var index = _dropDownList.indexWhere(
            (element) => element.name.trim() == widget.initialValue.trim());

        if (index != -1) {
          _cnt.text = widget.initialValue;
        }
      }
    }
    updateFunction();
    super.initState();
  }

  Size _textWidgetSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  updateFunction({DropDownTextField? oldWidget}) {
    Function eq = const DeepCollectionEquality().equals;
    _dropDownList = List.from(widget.dropDownList);
    _listPadding = widget.listPadding ?? ListPadding();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isMultiSelection) {
        if (oldWidget != null && !eq(oldWidget.dropDownList, _dropDownList)) {
          _multiSelectionValue = [];
          _cnt.text = "";
          for (int i = 0; i < _dropDownList.length; i++) {
            _multiSelectionValue.add(false);
          }
        }
        // if (widget.isForceMultiSelectionClear &&
        //     _multiSelectionValue.isNotEmpty) {
        //   _multiSelectionValue = [];
        //   _cnt.text = "";
        //   for (int i = 0; i < _dropDownList.length; i++) {
        //     _multiSelectionValue.add(false);
        //   }
        // }

        // if (widget.multiController != null) {
        //   List<DropDownValueModel> multiCnt = [];
        //   for (int i = 0; i < dropDownList.length; i++) {
        //     if (multiSelectionValue[i]) {
        //       multiCnt.add(dropDownList[i]);
        //     }
        //   }
        //   widget.multiController!
        //       .setDropDown(multiCnt.isNotEmpty ? multiCnt : null);
        // }

        if (widget.multiController != null) {
          if (oldWidget != null &&
              oldWidget.multiController!.dropDownValueList != null) {}
          if (widget.multiController!.dropDownValueList != null) {
            _multiSelectionValue = [];
            for (int i = 0; i < _dropDownList.length; i++) {
              _multiSelectionValue.add(false);
            }
            for (int i = 0;
                i < widget.multiController!.dropDownValueList!.length;
                i++) {
              var index = _dropDownList.indexWhere((element) =>
                  element == widget.multiController!.dropDownValueList![i]);
              if (index != -1) {
                _multiSelectionValue[index] = true;
              }
            }
            int count = _multiSelectionValue
                .where((element) => element)
                .toList()
                .length;
            _cnt.text = (count == 0
                ? ""
                : widget.displayCompleteItem
                    ? widget.initialValue.join(",")
                    : "$count item selected");
          } else {
            _multiSelectionValue = [];
            _cnt.text = "";
            for (int i = 0; i < _dropDownList.length; i++) {
              _multiSelectionValue.add(false);
            }
          }
        }
      } else {
        if (widget.singleController != null) {
          if (widget.singleController!.dropDownValue != null) {
            _cnt.text = widget.singleController!.dropDownValue!.name;
          } else {
            _cnt.clear();
          }
        }
      }

      _listTileTextStyle =
          (widget.listTextStyle ?? Theme.of(context).textTheme.titleMedium)!;
      _listTileHeight =
          _textWidgetSize("dummy Text", _listTileTextStyle).height +
              _listPadding.top +
              _listPadding.bottom;
      _maxListItem = widget.dropDownItemCount;

      _height = (!widget.isMultiSelection
              ? (_dropDownList.length < _maxListItem
                  ? _dropDownList.length * _listTileHeight
                  : _listTileHeight * _maxListItem.toDouble())
              : _dropDownList.length < _maxListItem
                  ? _dropDownList.length * _listTileHeight
                  : _listTileHeight * _maxListItem.toDouble()) +
          10;
    });
  }

  @override
  void didUpdateWidget(covariant DropDownTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateFunction(oldWidget: oldWidget);
  }

  @override
  void dispose() {
    if (widget.searchFocusNode == null) _searchFocusNode.dispose();
    if (widget.textFieldFocusNode == null) _textFieldFocusNode.dispose();
    _cnt.dispose();
    super.dispose();
  }

  clearFun() {
    if (_isExpanded) {
      _isExpanded = !_isExpanded;
      hideOverlay();
    }
    _cnt.clear();
    if (widget.isMultiSelection) {
      if (widget.multiController != null) {
        widget.multiController!.setDropDown(null);
      }
      if (widget.onChanged != null) {
        widget.onChanged!([]);
      }

      _multiSelectionValue = [];
      for (int i = 0; i < _dropDownList.length; i++) {
        _multiSelectionValue.add(false);
      }
    } else {
      if (widget.singleController != null) {
        widget.singleController!.setDropDown(null);
      }
      if (widget.onChanged != null) {
        widget.onChanged!("");
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        if (!isKeyboardVisible && _isExpanded && _isScrollPadding) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            shiftOverlayEntry2to1();
          });
        }
        return CompositedTransformTarget(
          link: _layerLink,
          child: TextFormField(
            controller: _cnt,
            textAlign: TextAlign.start,
            focusNode: _textFieldFocusNode,
            keyboardType: widget.keyboardType,
            autovalidateMode: widget.autovalidateMode,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(fontSize: 15.sp, color: Color(0xFF000000)),
            enabled: widget.isEnabled,
            readOnly: widget.readOnly,
            onTap: () {
              _searchAutofocus = widget.searchAutofocus;
              if (!_isExpanded) {
                if (_dropDownList.isNotEmpty) {
                  _showOverlay();
                }
              } else {
                if (widget.readOnly) hideOverlay();
              }
            },
            validator: (value) =>
                widget.validator != null ? widget.validator!(value) : null,
            decoration: widget.textFieldDecoration != null?
              widget.textFieldDecoration
                :
            InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                isDense: true,
                labelStyle: Theme.of(context)
                    .inputDecorationTheme
                    .hintStyle
                    ?.copyWith(fontSize: 15.sp, color: Color(0xFF000000)),
                hintStyle: Theme.of(context)
                    .inputDecorationTheme
                    .hintStyle
                    ?.copyWith(fontSize: 15.sp, color: Color(0xFF000000)),
                hintText: "Select Days",
                prefix: SizedBox(width: 15,),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorConstants.borderColor
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorConstants.borderColor
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorConstants.borderColor
                    )
                ),
                fillColor: Color(0xFFFCFCFC),
                filled: true,
                suffixIconConstraints: BoxConstraints(minWidth: 35),
              suffixIcon: Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: Colors.black,
              )

            ),
          ),
        );
      },
    );
  }

  Future<void> _showOverlay() async {
    _controller.forward();
    _isExpanded = true;
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    _offset = renderBox.localToGlobal(Offset.zero);
    double posFromTop = _offset.dy;
    double posFromBot = MediaQuery.of(context).size.height - posFromTop;

    double dropdownListHeight = _height +
        (widget.enableSearch ? _searchWidgetHeight : 0) +
        widget.listSpace;
    double ht = dropdownListHeight + 120;
    if (_searchAutofocus &&
        !(posFromBot < ht) &&
        posFromBot < _keyboardHeight &&
        !_isScrollPadding &&
        _isPortrait) {
      _isScrollPadding = true;
    }
    _isOutsideClickOverlay = _isScrollPadding ||
        (widget.readOnly &&
            dropdownListHeight >
                (posFromTop - MediaQuery.of(context).padding.top - 15) &&
            posFromBot < ht);
    final double topPaddingHeight = _isOutsideClickOverlay
        ? (dropdownListHeight -
            (posFromTop - MediaQuery.of(context).padding.top - 15))
        : 0;

    final double htPos = posFromBot < ht
        ? size.height - 100 + topPaddingHeight
        : _isScrollPadding
            ? size.height - (_keyboardHeight - posFromBot)
            : size.height;
    if (_isOutsideClickOverlay) {
      _openOutSideClickOverlay(context);
    }
    _entry = OverlayEntry(
      builder: (context) => Positioned(
          width: size.width,
          child: CompositedTransformFollower(
              targetAnchor: posFromBot < ht
                  ? Alignment.bottomCenter
                  : Alignment.topCenter,
              followerAnchor: posFromBot < ht
                  ? Alignment.bottomCenter
                  : Alignment.topCenter,
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(
                0,
                posFromBot < ht
                    ? htPos - widget.listSpace
                    : htPos + widget.listSpace,
              ),
              child: AnimatedBuilder(
                animation: _controller.view,
                builder: buildOverlay,
              ))),
    );
    _entry2 = OverlayEntry(
      builder: (context) => Positioned(
          width: size.width,
          child: CompositedTransformFollower(
              targetAnchor: Alignment.bottomCenter,
              followerAnchor: Alignment.bottomCenter,
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(
                0,
                htPos,
              ),
              child: AnimatedBuilder(
                animation: _controller.view,
                builder: buildOverlay,
              ))),
    );
    overlay.insert(_isScrollPadding ? _entry2! : _entry!);
  }

  _openOutSideClickOverlay(BuildContext context) {
    final overlay2 = Overlay.of(context);
    _barrierOverlay = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return GestureDetector(
        onTap: () {
          hideOverlay();
        },
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.transparent,
        ),
      );
    });
    overlay2.insert(_barrierOverlay!);
  }

  void hideOverlay() {
    if (!_isScrollPadding) {}
    _controller.reverse().then<void>((void value) {
      if (_entry != null && _entry!.mounted) {
        _entry?.remove();
        _entry = null;
      }
      if (_entry2 != null && _entry2!.mounted) {
        _entry2?.remove();
        _entry2 = null;
      }

      if (_barrierOverlay != null && _barrierOverlay!.mounted) {
        _barrierOverlay?.remove();
        _barrierOverlay = null;
        _isOutsideClickOverlay = false;
      }
      _isScrollPadding = false;
      _isExpanded = false;
    });
    _textFieldFocusNode.unfocus();
  }

  void shiftOverlayEntry1to2() {
    _entry?.remove();
    _entry = null;
    if (_barrierOverlay != null && _barrierOverlay!.mounted) {
      _barrierOverlay?.remove();
      _barrierOverlay = null;
      _isOutsideClickOverlay = false;
    }
    _isScrollPadding = true;
    _showOverlay();
    _textFieldFocusNode.requestFocus();

    Future.delayed(Duration(milliseconds: _duration), () {
      _searchFocusNode.requestFocus();
    });
  }

  void shiftOverlayEntry2to1() {
    _searchAutofocus = false;
    _entry2?.remove();
    _entry2 = null;
    if (_barrierOverlay != null && _barrierOverlay!.mounted) {
      _barrierOverlay?.remove();
      _barrierOverlay = null;
      _isOutsideClickOverlay = false;
    }
    _controller.reset();
    _isScrollPadding = false;
    _showOverlay();
    _textFieldFocusNode.requestFocus();
  }

  Widget buildOverlay(context, child) {
    return ClipRect(
      child: Align(
        heightFactor: _heightFactor.value,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius:
                //     BorderRadius.all(Radius.circular(widget.dropdownRadius)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: MultiSelection(
                    buttonTextStyle: widget.submitButtonTextStyle,
                    buttonText: widget.submitButtonText,
                    buttonColor: widget.submitButtonColor,

                    // buttonColor: ColorConstants.white,
                    height: _height,
                    listTileHeight: _listTileHeight,
                    list: _multiSelectionValue,
                    dropDownList: _dropDownList,
                    listTextStyle: _listTileTextStyle,
                    listPadding: _listPadding,
                    onChanged: (val) {
                      print("ASBHASBDHKASD $val");
                      _isExpanded = !_isExpanded;
                      _multiSelectionValue = val;
                      print("val");
                      print(val);
                      List<DropDownValueModel> result = [];
                      List completeList = [];
                      for (int i = 0;
                          i < _multiSelectionValue.length;
                          i++) {
                        if (_multiSelectionValue[i]) {
                          result.add(_dropDownList[i]);
                          completeList.add(_dropDownList[i].name);
                        }
                      }
                      int count = _multiSelectionValue
                          .where((element) => element)
                          .toList()
                          .length;

                      _cnt.text = (count == 0
                          ? ""
                          : widget.displayCompleteItem
                              ? completeList.join(",")
                              : "$count item selected");
                      if (widget.multiController != null) {
                        widget.multiController!
                            .setDropDown(result.isNotEmpty ? result : null);
                      }
                      if (widget.onChanged != null) {
                        widget.onChanged!(result);
                      }

                      hideOverlay();

                      setState(() {});
                    },
                    checkBoxProperty: CheckBoxProperty(
                        checkColor: ColorConstants.primaryColor,fillColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                        if (states
                            .contains(MaterialState.selected)) {
                          return Color(0xFFF7F7F7);
                        }
                        return  Color(0xFFF7F7F7);
                      },
                    ),side: MaterialStateBorderSide.resolveWith(
                          (Set<MaterialState> states) {
                        if (states
                            .contains(MaterialState.selected)) {
                          return BorderSide(
                            color: ColorConstants.primaryColor,);
                        }
                        return BorderSide(
                            color: ColorConstants.primaryColor);
                      },
                    ),shape: RoundedRectangleBorder(
                        borderRadius: getCustomBorderRadius(4)
                    )),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class MultiSelection extends StatefulWidget {
  const MultiSelection(
      {Key? key,
      required this.onChanged,
      required this.dropDownList,
      required this.list,
      required this.height,
      this.buttonColor,
      this.buttonText,
      this.buttonTextStyle,
      required this.listTileHeight,
      required this.listPadding,
      this.listTextStyle,
      this.checkBoxProperty})
      : super(key: key);
  final List<DropDownValueModel> dropDownList;
  final ValueSetter onChanged;
  final List<bool> list;
  final double height;
  final Color? buttonColor;
  final String? buttonText;
  final TextStyle? buttonTextStyle;
  final double listTileHeight;
  final TextStyle? listTextStyle;
  final ListPadding listPadding;
  final CheckBoxProperty? checkBoxProperty;

  @override
  _MultiSelectionState createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<bool> multiSelectionValue = [];
  List<bool> multiSelection = [];

  @override
  void initState() {
    multiSelectionValue = List.from(widget.list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: Scrollbar(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: widget.dropDownList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: widget.listTileHeight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: widget.listPadding.bottom,
                          top: widget.listPadding.top),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child:addText(widget.dropDownList[index].name, 15, Colors.black, FontWeight.w400)
                                      // Text(
                                      //     widget.dropDownList[index].name,
                                      //     style: widget.listTextStyle),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Checkbox(
                            value: multiSelectionValue[index],
                            onChanged: (value) {
                              print("akdgjhasgdjhas $value");
                              print("akdgjhasgdjhas $index");
                              if (value != null) {
                                setState(() {
                                  multiSelectionValue[index] = value;
                                  List<bool> multiSelectionValues = [];
                                  for(int i=0;i<multiSelectionValue.length;i++)
                                    {
                                      if(multiSelectionValue[i])
                                        {
                                          print("multiSelectionValue[i]");
                                          print(multiSelectionValue[i]);
                                          multiSelectionValues.add(multiSelectionValue[i]);
                                        }
                                    }
                                 //widget.onChanged(multiSelectionValues);
                                });
                              }
                            },
                            tristate:
                                widget.checkBoxProperty?.tristate ?? false,
                            mouseCursor: widget.checkBoxProperty?.mouseCursor,
                            activeColor: widget.checkBoxProperty?.activeColor,
                            fillColor: widget.checkBoxProperty?.fillColor,
                            checkColor: widget.checkBoxProperty?.checkColor,
                            focusColor: widget.checkBoxProperty?.focusColor,
                            hoverColor: widget.checkBoxProperty?.hoverColor,
                            overlayColor: widget.checkBoxProperty?.overlayColor,
                            splashRadius: widget.checkBoxProperty?.splashRadius,
                            materialTapTargetSize:
                                widget.checkBoxProperty?.materialTapTargetSize,
                            visualDensity:
                                widget.checkBoxProperty?.visualDensity,
                            focusNode: widget.checkBoxProperty?.focusNode,
                            autofocus:
                                widget.checkBoxProperty?.autofocus ?? false,
                            shape: widget.checkBoxProperty?.shape,
                            side: widget.checkBoxProperty?.side,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only( top: 1.h, bottom: 1.h),
              child: InkWell(
                onTap: () => widget.onChanged(multiSelectionValue),
                child: Container(
                  height: widget.listTileHeight * 0.7,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
                  decoration: BoxDecoration(
                      color: ColorConstants.primaryColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5))),
                  child: Align(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: addText("Submit", 16, Colors.white, FontWeight.normal)
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DropDownValueModel extends Equatable {
  final String name;
  final dynamic value;

  ///as of now only added for multiselection dropdown
  // final String? toolTipMsg;

  const DropDownValueModel({
    required this.name,
    required this.value,
  });

  factory DropDownValueModel.fromJson(Map<String, dynamic> json) =>
      DropDownValueModel(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
  @override
  List<Object> get props => [name, value];
}

class SingleValueDropDownController extends ChangeNotifier {
  DropDownValueModel? dropDownValue;
  SingleValueDropDownController({DropDownValueModel? data}) {
    setDropDown(data);
  }
  setDropDown(DropDownValueModel? model) {
    dropDownValue = model;
    notifyListeners();
  }

  clearDropDown() {
    dropDownValue = null;
    notifyListeners();
  }
}

class MultiValueDropDownController extends ChangeNotifier {
  List<DropDownValueModel>? dropDownValueList;
  MultiValueDropDownController({List<DropDownValueModel>? data}) {
    setDropDown(data);
  }
  setDropDown(List<DropDownValueModel>? modelList) {
    if (modelList != null && modelList.isNotEmpty) {
      List<DropDownValueModel> list = [];
      for (DropDownValueModel item in modelList) {
        if (!list.contains(item)) {
          list.add(item);
        }
      }
      dropDownValueList = list;
    } else {
      dropDownValueList = null;
    }
    notifyListeners();
  }

  clearDropDown() {
    dropDownValueList = null;
    notifyListeners();
  }
}

class ListPadding {
  double top;
  double bottom;
  ListPadding({this.top = 15, this.bottom = 15});
}

class KeyboardVisibilityBuilder extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    bool isKeyboardVisible,
  ) builder;
  const KeyboardVisibilityBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);
  @override
  _KeyboardVisibilityBuilderState createState() =>
      _KeyboardVisibilityBuilderState();
}

class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilder>
    with WidgetsBindingObserver {
  var _isKeyboardVisible = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) => widget.builder(
        context,
        _isKeyboardVisible,
      );
}
