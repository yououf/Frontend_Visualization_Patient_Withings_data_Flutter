import 'package:DIH4CPS_APP/style/linde_theme.dart';
import 'package:flutter/material.dart';

class MyAppHumidifierParameter extends StatelessWidget {
  final Function plusButtonFunction;
  final Function minusButtonFunction;

  final String setting;

  final int value;

  MyAppHumidifierParameter(
      {@required this.minusButtonFunction,
      @required this.plusButtonFunction,
      @required this.setting,
      @required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$setting: ",
            style: const TextStyle(
              fontSize: 25.0,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 40.0,
                child: FloatingActionButton(
                    heroTag: null,
                    backgroundColor: LindeTheme.appBarColor,
                    onPressed: minusButtonFunction,
                    child: const Text("-")),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  value.toString(),
                  style: const TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
              SizedBox(
                width: 40.0,
                child: FloatingActionButton(
                  heroTag: null,
                  backgroundColor: LindeTheme.appBarColor,
                  onPressed: plusButtonFunction,
                  child: const Text("+"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
