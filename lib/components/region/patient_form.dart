import 'package:DIH4CPS_APP/style/style.dart';
import 'package:DIH4CPS_APP/utils/date_format.dart';

import '../../bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppPatientForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientFormBloc, PatientFormState>(
        builder: (context, state) {
      if (state is PatientFormStateLoading) {
        return Container(
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                onChanged: (String idPatient) {
                  BlocProvider.of<PatientFormBloc>(context).add(
                    AddElementPatient(
                      patientId: int.parse(idPatient),
                      beginDate: state.beginDate,
                      endDate: state.endDate,
                    ),
                  );
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'ID patient',
                  labelText: 'Id Patient',
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    child: TextButton(
                        onPressed: () async {
                          DateTime beginDate = await showDatePicker(
                            context: context,
                            locale: const Locale("fr", "FR"),
                            initialDate: DateTime(2020, 09, 29),
                            firstDate: DateTime(DateTime.now().year - 1),
                            lastDate: DateTime(2020, 09, 29),
                          );
                          if (beginDate == null) beginDate = state.beginDate;
                          BlocProvider.of<PatientFormBloc>(context).add(
                            AddElementPatient(
                              patientId: state.patientId,
                              beginDate: beginDate,
                              endDate: state.endDate,
                            ),
                          );
                        },
                        child: Text(
                          "Début: " + FormatDate.formatter.format(state.beginDate),
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  Card(
                    child: TextButton(
                        onPressed: () async {
                          DateTime endDate = await showDatePicker(
                            context: context,
                            locale: const Locale("fr", "FR"),
                            initialDate: DateTime(2020, 09, 29),
                            firstDate: DateTime(DateTime.now().year - 1),
                            lastDate: DateTime(2020, 09, 29),
                          );
                          if (endDate == null) endDate = state.endDate;
                          BlocProvider.of<PatientFormBloc>(context).add(
                            AddElementPatient(
                              patientId: state.patientId,
                              beginDate: state.beginDate,
                              endDate: endDate,
                            ),
                          );
                        },
                        child: Text(
                          "Fin: " + FormatDate.formatter.format(state.endDate),
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      color: Style.refuseButtonColor,
                      onPressed: () => Navigator.pop(context),
                      child: Text("Retour"),
                    ),
                    RaisedButton(
                      color: Style.validateButtonColor,
                      onPressed: () {
                        BlocProvider.of<PatientFormBloc>(context).add(
                          FormValidatedPatient(
                            beginDate: state.beginDate,
                            endDate: state.endDate,
                            patientId: state.patientId,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: Text("Valider"),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      } else if (state is PatientFormStateLoaded) {
        BlocProvider.of<PatientFormBloc>(context).add(
          AddElementPatient(
            beginDate: state.beginDate,
            endDate: state.endDate,
            patientId: state.patientId,
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

void showPopUpPatient(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Container(
          height: 300,
          margin: const EdgeInsets.only(top: 20),
          child: MyAppPatientForm(),
        ),
      );
    },
  );
}
