import 'package:flutter/material.dart';

class MyAppDropDownButton extends StatefulWidget {
  final List<String> values;
  final TextStyle style;
  final Function parentAction;
  final Widget underline;
  final String defaultValue;

  const MyAppDropDownButton(
      {Key key,
      @required this.values,
      this.style,
      this.parentAction,
      this.underline,
      this.defaultValue})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppDropDownButtonState(defaultValue);
}

class MyAppDropDownButtonState extends State<MyAppDropDownButton> {
  String _dropdownValue;
  final String defaultValue;

  MyAppDropDownButtonState(this.defaultValue) {
    _dropdownValue = defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _dropdownValue,
      onChanged: (String newValue) {
        _dropdownValue = newValue;
        widget.parentAction(_dropdownValue);
      },
      style: widget.style,
      underline: widget.underline,
      items: widget.values.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: Card(
              child: Text(value),
            ));
      }).toList(),
    );
  }
}
