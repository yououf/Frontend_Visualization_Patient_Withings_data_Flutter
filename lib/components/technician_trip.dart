import 'package:DIH4CPS_APP/style/linde_theme.dart';
import 'package:DIH4CPS_APP/utils/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:DIH4CPS_APP/bloc/bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAppTechnicianTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientSelectionBloc, PatientSelectionState>(
      builder: (context, state) {
        if (state is PatientSelectionInitial) {
          context
              .watch<PatientSelectionBloc>()
              .add(FetchTechnicianTrip(technicianId: 1251));
        }
        if (state is PatientSelectionLoaded) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.listInterventions.length,
                    itemBuilder: (context, index) {
                      List<String> dateTripSplit = FormatDate.formatter5
                          .format(state.listInterventions[index].forecastedDate)
                          .split(" ");
                      return GestureDetector(
                          onTap: () {
                            context.read<PatientSelectionBloc>().add(
                                PickPatient(
                                    patientId: state
                                        .listInterventions[index].patientId));
                            context.read<PatientBloc>().add(FetchPatient(
                                idPatient:
                                    state.listInterventions[index].patientId));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color:
                                  state.listInterventions[index].hasBeenClicked
                                      ? LindeTheme.blueGrey
                                      : LindeTheme.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Patient n°: ",
                                              style: lindeTitle,
                                            ),
                                            Text(
                                                state.listInterventions[index]
                                                    .patientId
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'LindeDaxFont',
                                                  color: HexColor('005591'),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Heure : " +
                                                  dateTripSplit[0] +
                                                  " ",
                                              style: lindeLongText,
                                            ),
                                            Text(dateTripSplit[1],
                                                style: TextStyle(
                                                  fontFamily: 'LindeDaxFont',
                                                  color: HexColor('005591'),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Mr Jean Dupont",
                                          style: lindeLongText,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.arrow_forward_ios),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    }),
              ),
            ),
          );
        }
        if (state is PatientSelectionLoading) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Erreur lors de la récupération de la tournée",
              textAlign: TextAlign.justify, style: lindeDarkTextNormal),
        );
      },
    );
  }
}
