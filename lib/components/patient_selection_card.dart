import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:DIH4CPS_APP/bloc/bloc.dart';
import 'package:DIH4CPS_APP/style/style.dart';

class MyAppPatientSelectionCard extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientBloc, PatientState>(
        builder: (BuildContext context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            "Entrez le numéro TRC du patient",
                            style: TextStyle(fontSize: 19.0),
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Icon(Icons.wb_incandescent),
                          onTap: () => _buildAboutDialog(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _textFieldController,
                  autofocus: false,
                  decoration: InputDecoration(
                    errorText:
                        (state is PatientError) ? "Patient introuvable" : null,
                    prefixIcon: Icon(Icons.accessibility),
                    hintText: "TRC_ID Patient ",
                    labelText: "Id Patient ",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  onChanged: (String idPatient) {
                    context.read<PatientBloc>().add(
                          AddIdPatient(
                            idPatient: int.parse(idPatient),
                          ),
                        );
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                child: (state is PatientLoading)
                    ? SizedBox(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: RaisedButton(
                          color: Style.validateButtonColor,
                          onPressed: () {
                            context.read<PatientBloc>().add(FetchPatient(
                                  idPatient: state.idPatient,
                                ));
                          },
                          child: Text(
                            "Valider",
                            style: TextStyle(fontSize: 22.0),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is PatientLoaded) {
        _textFieldController.clear();
        Navigator.pushNamed(context, '/home_page');
      }
    });
  }

  void _buildAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      //context: _scaffoldKey.currentContext,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20.0),
          title: const Text(
            'Informations',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23.0,
            ),
          ),
          content: Container(
            child: SingleChildScrollView(
              child: Text(
                "",
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          actions: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Fermer",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
