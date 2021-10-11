import 'package:DIH4CPS_APP/components/button_bar.dart';
import 'package:DIH4CPS_APP/components/drawer_home_page_patient.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';
import 'package:DIH4CPS_APP/components/graph_data_patient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:DIH4CPS_APP/bloc/bloc.dart';
import 'package:DIH4CPS_APP/services/repository.dart';
import 'package:DIH4CPS_APP/style/style.dart';
import 'package:DIH4CPS_APP/style/linde_theme.dart';

class MyAppPatientEnvironment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Patient: 22599"),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: HttpRequest.getImg(
                      'img/linde_logo/Linde_plc_wordmark_white_sRGB.png',
                      "Logo Linde")),
            ],
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  "Humidité",
                  style: lindeDarkText,
                ),
              ),
              BlocProvider<EnvironmentalDataPatientBloc>(
                create: (BuildContext context) => EnvironmentalDataPatientBloc(
                    repository: DataPatientRepository()),
                child: MyAppPatientEnvironmentGraph(
                    unity: "%", dataType: "humidity", legend: "Humidité en %"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  "Température",
                  style: lindeDarkText,
                ),
              ),
              BlocProvider<EnvironmentalDataPatientBloc>(
                create: (BuildContext context) => EnvironmentalDataPatientBloc(
                    repository: DataPatientRepository()),
                child: MyAppPatientEnvironmentGraph(
                  dataType: "temperature",
                  unity: "°C",
                  legend: "Température en °C",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  "Niveau de Co2",
                  style: lindeDarkText,
                ),
              ),
              BlocProvider<EnvironmentalDataPatientBloc>(
                create: (BuildContext context) => EnvironmentalDataPatientBloc(
                    repository: DataPatientRepository()),
                child: MyAppPatientEnvironmentGraph(
                  unity: "ppm",
                  dataType: "co2_level",
                  legend: "Niveau de co2 intérieur en ppm",
                  hasTwoType: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  "Bruit",
                  style: lindeDarkText,
                ),
              ),
              BlocProvider<EnvironmentalDataPatientBloc>(
                create: (BuildContext context) => EnvironmentalDataPatientBloc(
                    repository: DataPatientRepository()),
                child: MyAppPatientEnvironmentGraph(
                  unity: "dB",
                  dataType: "noise",
                  legend: "Bruit intérieur en dB",
                  hasTwoType: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  "Pression absolue",
                  style: lindeDarkText,
                ),
              ),
              BlocProvider<EnvironmentalDataPatientBloc>(
                create: (BuildContext context) => EnvironmentalDataPatientBloc(
                    repository: DataPatientRepository()),
                child: MyAppPatientEnvironmentGraph(
                  unity: "mBar",
                  dataType: "pressure",
                  legend: "Pression absolue intérieure en mBar",
                  hasTwoType: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: MyAppButtonBar(
                    colorLeftButton: LindeTheme.appBarColor,
                    spaceBetween: 3.0,
                    colorRightButton: Style.validateButtonColor,
                    functionLeftButton: () => Navigator.pop(context),
                    functionRightButton: () => print("Interprétation"),
                    textLeftButton: "Retour",
                    textRightButton: "Interprétation"),
              ),
            ],
          )),
    );
  }
}
