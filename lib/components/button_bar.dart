import 'package:flutter/material.dart';

class MyAppButtonBar extends StatefulWidget {
  final Function functionLeftButton;
  final Function functionRightButton;

  final String textLeftButton;
  final String textRightButton;

  final RoundedRectangleBorder buttonShape;

  Color colorLeftButton;
  Color colorRightButton;

  final Color colorOnClicked;
  final Color defaultColor;

  final double heightButtons;
  final double spaceBetween;

  final bool takesAllSpaceAvailable;
  final bool changeColorWhenClicked;
  final bool changeColorWhenClickedAgain;

  MyAppButtonBar(
      {@required this.functionLeftButton,
      @required this.functionRightButton,
      @required this.textLeftButton,
      @required this.textRightButton,
      this.colorRightButton,
      this.colorLeftButton,
      this.takesAllSpaceAvailable = true,
      this.heightButtons = 40.0,
      this.changeColorWhenClicked = false,
      this.changeColorWhenClickedAgain = true,
      this.spaceBetween = 8.0,
      this.buttonShape,
      this.colorOnClicked,
      this.defaultColor}) {
    if (changeColorWhenClicked) {
      colorLeftButton = this.colorOnClicked;
      colorRightButton = this.defaultColor;
    }
  }

  @override
  _MyAppButtonBarState createState() => _MyAppButtonBarState();
}

class _MyAppButtonBarState extends State<MyAppButtonBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.takesAllSpaceAvailable //Left button
            ? Expanded(
                child: _getButton(false),
              )
            : _getButton(false),
        widget.takesAllSpaceAvailable //Right button
            ? Expanded(
                child: _getButton(true),
              )
            : _getButton(true),
      ],
    );
  }

  Widget _getButton(bool isRightButton) {
    return Padding(
      padding: isRightButton
          ? EdgeInsets.only(left: widget.spaceBetween / 2)
          : EdgeInsets.only(right: widget.spaceBetween / 2),
      child: SizedBox(
        height: widget.heightButtons,
        child: RaisedButton(
          onPressed: () {
            if (widget.changeColorWhenClicked) {
              setState(() {
                if (isRightButton) {
                  if (widget.changeColorWhenClickedAgain) {
                    if (widget.colorRightButton == widget.colorOnClicked) {
                      widget.colorRightButton = widget.defaultColor;
                    } else {
                      widget.colorRightButton = widget.colorOnClicked;
                      widget.colorLeftButton = widget.defaultColor;
                    }
                  } else {
                    widget.colorRightButton = widget.colorOnClicked;
                    widget.colorLeftButton = widget.defaultColor;
                  }
                } else {
                  if (widget.changeColorWhenClickedAgain) {
                    if (widget.colorLeftButton == widget.colorOnClicked)
                      widget.colorLeftButton = widget.defaultColor;
                    else {
                      widget.colorRightButton = widget.defaultColor;
                      widget.colorLeftButton = widget.colorOnClicked;
                    }
                  } else {
                    widget.colorRightButton = widget.defaultColor;
                    widget.colorLeftButton = widget.colorOnClicked;
                  }
                }
              });
            }
            if (isRightButton)
              widget.functionRightButton();
            else
              widget.functionLeftButton();
          },
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              isRightButton ? widget.textRightButton : widget.textLeftButton,
              style: TextStyle(fontSize: 17.0),
            ),
          ),
          color:
              isRightButton ? widget.colorRightButton : widget.colorLeftButton,
          shape: widget.buttonShape,
        ),
      ),
    );
  }
}
