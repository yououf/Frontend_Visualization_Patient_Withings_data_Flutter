import 'package:flutter/material.dart';

class MyAppButtonRangeData extends StatefulWidget {
  final Function functionLeftButton;
  final Function functionMiddleButton;
  final Function functionRightButton;

  final String textLeftButton;
  final String textMiddleButton;
  final String textRightButton;

  final RoundedRectangleBorder buttonShape;

  Color colorLeftButton;
  Color colorMiddleButton;
  Color colorRightButton;

  final Color defaultColor;

  final double heightButtons;

  MyAppButtonRangeData(
      {@required this.functionLeftButton,
      @required this.functionRightButton,
      @required this.textLeftButton,
      @required this.textRightButton,
      @required this.functionMiddleButton,
      @required this.textMiddleButton,
      this.colorLeftButton,
      this.colorMiddleButton,
      this.colorRightButton,
      this.heightButtons = 40.0,
      this.buttonShape,
      this.defaultColor});

  @override
  _MyAppButtonBarState createState() => _MyAppButtonBarState();
}

class _MyAppButtonBarState extends State<MyAppButtonRangeData> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.0,
          child: RaisedButton(
            shape: widget.buttonShape,
            color: widget.colorLeftButton,
            onPressed: () {
              setState(() {
                widget.colorRightButton = widget.defaultColor;
                widget.colorMiddleButton = widget.defaultColor;
                widget.colorLeftButton = null;
              });
              widget.functionLeftButton();
            },
            child: FittedBox(
              child:
                  Text(widget.textLeftButton, style: TextStyle(fontSize: 16.0)),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: 40.0,
          child: RaisedButton(
              shape: widget.buttonShape,
              color: widget.colorMiddleButton,
              onPressed: () {
                setState(() {
                  widget.colorRightButton = widget.defaultColor;
                  widget.colorLeftButton = widget.defaultColor;
                  widget.colorMiddleButton = null;
                });
                widget.functionMiddleButton();
              },
              child: FittedBox(
                  child: Text(
                    widget.textMiddleButton,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  fit: BoxFit.contain)),
        ),
        SizedBox(
          height: 40.0,
          child: RaisedButton(
            shape: widget.buttonShape,
            color: widget.colorRightButton,
            onPressed: () {
              setState(() {
                widget.colorMiddleButton = widget.defaultColor;
                widget.colorRightButton = null;
                widget.colorLeftButton = widget.defaultColor;
              });
              widget.functionRightButton();
            },
            child: FittedBox(
              child: Text(widget.textRightButton,
                  style: TextStyle(fontSize: 16.0)),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
