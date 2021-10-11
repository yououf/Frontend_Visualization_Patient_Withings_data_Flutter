import 'package:DIH4CPS_APP/bloc/bloc.dart';
import 'package:DIH4CPS_APP/style/linde_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAppDrawerHomePagePatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Image(image: AssetImage('assets/images/linde_logo/LINDE_LOGO.jpg')),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Configuration des consommables",
                  style: lindeSubtitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 20.0, right: 8.0),
                child: Text(
                  "Filtres",
                  style: lindeDarkText,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context
                      .read<MaskHistoricBloc>()
                      .add(FetchMaskHistoric(patientId: 22599));
                  Navigator.pushNamed(context, '/mask_suggestion');
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 20.0, right: 8.0),
                  child: Text(
                    "Masque",
                    style: lindeDarkText,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/humidifier');
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 20.0, right: 8.0),
                  child: Text(
                    "Humidificateur",
                    style: lindeDarkText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Configuration de la PPC",
                  style: lindeSubtitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 20.0, right: 8.0),
                child: Text(
                  "Ramp",
                  style: lindeDarkText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 20.0, right: 8.0),
                child: Text(
                  "Paramètre de comfort",
                  style: lindeDarkText,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            color: HexColor('007AB9'),
            onPressed: () => Navigator.pushNamed(context, '/patient_selection'),
            child: Text(
              "Changer de patient",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ],
    ));
  }
}
