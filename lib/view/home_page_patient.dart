import 'package:DIH4CPS_APP/bloc/bloc.dart';
import 'package:DIH4CPS_APP/components/drawer_home_page_patient.dart';
import 'package:DIH4CPS_APP/components/patient_dashboard.dart';
import 'package:DIH4CPS_APP/components/ppc_data_graph.dart';
import 'package:DIH4CPS_APP/components/saos_diagnostic.dart';
import 'package:DIH4CPS_APP/services/data_patient_repository.dart';
import 'package:DIH4CPS_APP/services/patient_repository.dart';

import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:DIH4CPS_APP/style/linde_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyAppDrawerHomePagePatient(),
        appBar: AppBar(
          title: BlocBuilder<PatientBloc, PatientState>(
            builder: (context, state) {
              if (state is PatientLoaded) {
                return FittedBox(
                    child: Text("Patient: " + state.idPatient.toString()),
                    fit: BoxFit.scaleDown, );
              } else
                return Text("Patient: null");
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image(
                  image: AssetImage(
                      'assets/images/linde_logo/Linde_plc_wordmark_white_sRGB.png')),
            )
          ],
        ),
        body: ListView(
          physics: ScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                "Informations Patient",
                style: lindeDarkText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width) / 2.5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                HttpRequest.getImg(
                                  'img/humidifiers/RESMED_humidifier.png',
                                  "PPC",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Philips Dreamstation + humidificateur",
                                    style: lindeNormalText,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "10",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Jours sans données",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: (MediaQuery
                                  .of(context)
                                  .size
                                  .width) / 2.5,
                              child: Column(
                                children: [
                                  HttpRequest.getImg(
                                    'img/masks/H022119IB3.png',
                                    "Masque",
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Joyce One Taille M",
                                      style: lindeNormalText,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "10",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Interventions depuis 2 ans",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                "Bénéfice de la PPC",
                style: lindeDarkText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 8.0, right: 8.0, top: 45.0),
                            child: Text(
                              "IAH Résiduel: ",
                              style: lindeDarkTextNormal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "IMC: ",
                              style: lindeDarkTextNormal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Eosworth Score: ",
                              style: lindeDarkTextNormal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Durée moyenne de sommeil: ",
                                style: lindeDarkTextNormal),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Avant > Après",
                              style: TextStyle(
                                fontFamily: 'LindeDaxFont',
                                color: HexColor('005591'),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "3 > 1",
                              style: lindeDarkTextNormal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "28 > 4",
                              style: lindeDarkTextNormal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "10 > 15",
                              style: lindeDarkTextNormal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "3 > 7",
                              style: lindeDarkTextNormal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                "Données de la PPC",
                style: lindeDarkText,
              ),
            ),
            BlocProvider<PpcDataBloc>(
              create: (context) => PpcDataBloc(repository: PatientRepository()),
              child: MyAppPpcDataGraph(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                "Diagnostique du SAOS",
                style: lindeDarkText,
              ),
            ),
            MyAppSaosDiagnostic(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                "Environnement Patient (DashBoard)",
                style: lindeDarkText,
              ),
            ),
            BlocProvider(
                create: (BuildContext context) =>
                    DashboardBloc(repository: DataPatientRepository()),
                child: MyAppPatientDashBoard()),
          ],
        ),
      ),
    );
  }
}
