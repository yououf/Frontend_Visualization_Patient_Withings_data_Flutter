import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LindeTheme {
  /// Default constructor
  LindeTheme();

  ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: HexColor('E3EBEF'),
        primaryColor: HexColor('005591'),
        accentColor: HexColor('00A0E1'),
        fontFamily: 'LindeDaxFont',
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          buttonColor: HexColor('00A0E1'),
          hoverColor: HexColor('007AB9'),
          highlightColor: HexColor('007AB9'),
          disabledColor: HexColor('D3D6D6'),
          splashColor: HexColor('007AB9'),
        ),
      );

  static final HexColor darkColor = HexColor('6E7878');

  static final HexColor appBarColor = HexColor('005591');

  static final HexColor backGroundColor = HexColor('E3EBEF');

  static final HexColor test = HexColor('#F8FAFB');

  static final HexColor grey = HexColor('#DCE6EB');

  static final HexColor blueGrey = HexColor('#A2B9C8');
}

TextStyle lindeTitle = TextStyle(
  fontFamily: 'LindeDaxFont',
  color: HexColor('005591'),
  fontSize: 30,
);

TextStyle lindeSubtitle = TextStyle(
  fontFamily: 'LindeDaxFont',
  fontWeight: FontWeight.bold,
  color: HexColor('005591'),
  fontSize: 25,
);

TextStyle lindeNormalText = TextStyle(
  fontFamily: 'LindeDaxFont',
  fontWeight: FontWeight.bold,
  color: HexColor('005591'),
  fontSize: 16,
);

TextStyle lindeDarkText = TextStyle(
  fontFamily: 'LindeDaxFont',
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

TextStyle lindeDarkTextNormal = TextStyle(
  fontFamily: 'LindeDaxFont',
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

TextStyle lindeBoldText = TextStyle(
  fontFamily: 'LindeDaxFont',
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

TextStyle lindeLongText = TextStyle(
    fontFamily: 'LindeDaxFont',
    color: HexColor('6E7878'),
    fontWeight: FontWeight.bold,
    fontSize: 20);
