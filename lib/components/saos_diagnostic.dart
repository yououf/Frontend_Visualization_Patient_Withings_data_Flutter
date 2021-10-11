import 'package:DIH4CPS_APP/style/linde_theme.dart';
import 'package:DIH4CPS_APP/style/style.dart';
import 'package:flutter/material.dart';

import 'button_bar.dart';

class MyAppSaosDiagnostic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: null,
                  child: Text("1 semaine"),
                ),
                RaisedButton(
                  onPressed: null,
                  child: Text("6 mois"),
                ),
                RaisedButton(onPressed: null, child: Text("1 an")),
                RaisedButton(onPressed: null, child: Text("4 an")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sp02" + ":",
                    style: lindeDarkTextNormal,
                  ),
                  Text("3", style: lindeDarkTextNormal),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Position préférentiel" + ":",
                    style: lindeDarkText,
                  ),
                  Text("Sur le dos", style: lindeDarkTextNormal),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ronflement" + ":",
                    style: lindeDarkText,
                  ),
                  Text("50 db", style: lindeDarkTextNormal),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rythme cardiaque" + ":",
                    style: lindeDarkText,
                  ),
                  Text("78 bpm", style: lindeDarkTextNormal),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyAppButtonBar(
                  takesAllSpaceAvailable: true,
                  colorLeftButton: LindeTheme.appBarColor,
                  colorRightButton: Style.validateButtonColor,
                  functionLeftButton: () => print("To implement"),
                  functionRightButton: () => print("To implement"),
                  textLeftButton: "Informations",
                  textRightButton: "Interprétation"),
            ),
          ],
        ),
      ),
    );
  }
}
