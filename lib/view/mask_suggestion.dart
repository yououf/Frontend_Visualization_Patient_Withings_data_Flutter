import 'package:DIH4CPS_APP/components/mask_history.dart';
import 'package:DIH4CPS_APP/style/style.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../bloc/bloc.dart';

class MyAppMaskSuggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<MaskHistoricBloc, MaskHistoricState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 8.0),
                    child: state is MaskHistoricLoaded
                        ? Text(
                            "Masque suggéré pour le patient " +
                                state.idPatient.toString(),
                            style: TextStyle(
                              fontSize: 23.0,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : null),
                state is MaskHistoricLoading
                    ? CircularProgressIndicator()
                    : state is MaskHistoricLoaded
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: HexColor("#F3F6F7"),
                              elevation: 10.0,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6.5,
                                      width: MediaQuery.of(context).size.width /
                                          3.2,
                                      child: HttpRequest.getImg(
                                          'img/masks/' +
                                              state.suggestedMask.id +
                                              ".png",
                                          "Masque " + state.suggestedMask.id),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          child: FittedBox(
                                            child: Text(
                                              state.suggestedMask.description,
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0,
                                              right: 8.0,
                                              left: 8.0),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text("Ref SAP: " +
                                              state.suggestedMask.id),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FittedBox(
                                            child: Text(
                                                "Fabricant: " +
                                                    state
                                                        .suggestedMask.provider,
                                                style:
                                                    TextStyle(fontSize: 14.0)),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Text("Impossible d'afficher le mask suggéré"),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    "Historique du patient",
                    style: TextStyle(fontSize: 23.0),
                  ),
                ),
                MyAppMaskHistory (),
                state is MaskHistoricLoaded
                    ? Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 40.0,
                                child: RaisedButton(
                                  onPressed: () {
                                    BlocProvider.of<SuggestedMaskBloc>(context)
                                        .add(RefusedSuggestedMaskEvent(
                                            refusedMaskId:
                                                state.suggestedMask.id,
                                            patientId: state.idPatient));
                                    Navigator.pushNamed(
                                        context, '/mask_selection');
                                  },
                                  child: Text(
                                    "Refuser",
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  color: Style.refuseButtonColor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 40.0,
                                child: RaisedButton(
                                  onPressed: () {
                                    BlocProvider.of<SuggestedMaskBloc>(context)
                                        .add(AcceptedSuggestedMaskEvent(
                                      mask: state.suggestedMask,
                                      patientId: state.idPatient,
                                    ));
                                    Navigator.pushNamed(
                                        context, '/mask_delivery');
                                  },
                                  child: Text(
                                    "Valider",
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  color: Style.validateButtonColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : State is MaskHistoricError
                        ? Text("Error")
                        : CircularProgressIndicator(),
              ],
            );
          },
        ),
        appBar: AppBar(
          title: Text("Patient : 22599"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image(
                  image: AssetImage(
                      'assets/images/linde_logo/Linde_plc_wordmark_white_sRGB.png')),
            )
          ],
        ),
      ),
    );
  }
}
