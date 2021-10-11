import 'package:DIH4CPS_APP/components/button_bar.dart';
import 'package:DIH4CPS_APP/components/humidifier/humidifier_parameter.dart';
import 'package:DIH4CPS_APP/style/linde_theme.dart';
import 'package:DIH4CPS_APP/style/style.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:DIH4CPS_APP/bloc/bloc.dart';

class MyAppHumidifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<HumidifierBloc, HumidifierState>(
            builder: (context, state) {
          if (state is HumidifierEmpty) {
            context
                .watch<HumidifierBloc>()
                .add(FetchPatientData(patientId: 22599));
          }
          if (state is HumidifierLoading) {
            return const Center(
              child: const CircularProgressIndicator(),
            );
          }
          if (state is HumidifierSucced) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Patient: " + state.patientId.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        Stack(alignment: Alignment.center, children: [
                          Container(
                            height: 150.0,
                            width: 150.0,
                            child: HttpRequest.getImg(
                                'img/humidifiers/' +
                                    state.lastCpap.provNameStr +
                                    "_humidifier.png",
                                "Humidificateur " + state.lastCpap.provNameStr),
                          ),
                          SizedBox(
                            height: 50.0,
                            width: 50.0,
                            child: state is HumidifierSuggested
                                ? HttpRequest.getImg(
                                    'img/icones/validate.png',
                                    "Humidificateur " +
                                        state.lastCpap.provNameStr)
                                : HttpRequest.getImg(
                                    'img/icones/refuse.png',
                                    "Humidificateur " +
                                        state.lastCpap.provNameStr),
                          ),
                        ]),
                        Container(
                          child: Text(""),
                        )
                      ],
                    ),
                  ),
                  if (state is HumidifierSuggested)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Paramètres d'humidificateur:",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  if (state is HumidifierSuggested)
                    Card(
                      child: Column(
                        children: [
                          MyAppHumidifierParameter(
                            minusButtonFunction: () => context
                                .read<HumidifierBloc>()
                                .add(MinusTemperature()),
                            plusButtonFunction: () => context
                                .read<HumidifierBloc>()
                                .add(PlusTemperature()),
                            setting: "Température tube",
                            value: state.settingTemp,
                          ),
                          MyAppHumidifierParameter(
                            minusButtonFunction: () => context
                                .read<HumidifierBloc>()
                                .add(MinusHumidifier()),
                            plusButtonFunction: () => context
                                .read<HumidifierBloc>()
                                .add(PlusHumidifier()),
                            setting: "Humidificateur",
                            value: state.settingHumidifier,
                          ),
                        ],
                      ),
                    )
                  else
                    Text(
                      state.textDescription,
                      style: const TextStyle(
                        fontSize: 23.0,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: const Text(
                      "Données environnementales:",
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  Card(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.environmentalData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.environmentalData[index].description +
                                        ":",
                                    style: lindeDarkTextNormal,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        state.environmentalData[index].valueData
                                            .toString(),
                                        style: lindeDarkTextNormal,
                                      ),
                                      Text(state.environmentalData[index].unity,
                                          style: lindeDarkTextNormal),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: SizedBox(
                                          height: 30.0,
                                          width: 30.0,
                                          child: HttpRequest.getImg(
                                              'img/icones/validate.png',
                                              "Masque " +
                                                  state.lastCpap.provNameStr),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          })),
                  Spacer(),
                  MyAppButtonBar(
                    colorLeftButton: Style.refuseButtonColor,
                    colorRightButton: Style.validateButtonColor,
                    functionLeftButton: () =>
                        _buildAboutDialog(context, false, state.patientId),
                    functionRightButton: () =>
                        _buildAboutDialog(context, true, null),
                    textLeftButton: "Refuser",
                    textRightButton: "Valider",
                  ),
                ],
              ),
            );
          }
          return state is HumidifierError
              ? Text(state.textError)
              : Text("Error");
        }),
        appBar: AppBar(
          title: Text("Humidificateur"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image(
                  image: AssetImage(
                      'assets/images/linde_logo/Linde_plc_wordmark_white_sRGB.png')),
            )
          ],
          centerTitle: true,
        ),
      ),
    );
  }

  Future<void> _buildAboutDialog(
      BuildContext context, bool isValidate, int idPatient) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Validation',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Êtes-vous sur de votre choix ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
              MyAppButtonBar(
                takesAllSpaceAvailable: true,
                colorLeftButton: Style.refuseButtonColor,
                colorRightButton: Style.validateButtonColor,
                functionLeftButton: () => Navigator.pop(context),
                functionRightButton: () {
                  if (isValidate) {
                    context.read<HumidifierBloc>().add(ValidateHumidifier());
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home_page", (Route<dynamic> route) => false);
                  } else {
                    context.read<HumidifierBloc>().add(RefuseHumidifier());
                    context
                        .read<HumidifierQuestionsBloc>()
                        .add(FetchQuestion(patientId: idPatient));
                    Navigator.pushNamed(context, '/humidifier_questions');
                  }
                },
                textLeftButton: "Refuser",
                textRightButton: "Valider",
              ),
            ],
          ),
        );
      },
    );
  }
}
