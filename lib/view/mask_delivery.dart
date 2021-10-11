import 'package:DIH4CPS_APP/components/app_bar.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:DIH4CPS_APP/bloc/bloc.dart';

class MyAppMaskDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<SuggestedMaskBloc, SuggestedMaskState>(
            builder: (context, state) {
          if (state is SuggestedMaskLoaded) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Masque " +
                        state.maskName +
                        " validée avec succès pour le patient: " +
                        state.patientId,
                    style: TextStyle(fontSize: 23.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Flex(direction: Axis.horizontal, children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: HttpRequest.getImg(
                          'img/masks/' + state.maskId + ".png",
                          "Masque " + state.maskName),
                    )
                  ]),
                ),
                Spacer(),
                Flexible(
                  fit: FlexFit.loose,
                  child: RaisedButton(
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context, "/home_page", (Route<dynamic> route) => false),
                    child: Text("Revenir à l'accueil"),
                  ),
                )
              ],
            );
          }
          if (state is SuggestedMaskLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Erreur lors de la validation du masque",
                  style: TextStyle(fontSize: 23.0),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                Flexible(
                  fit: FlexFit.loose,
                  child: RaisedButton(
                    onPressed: () => Navigator.pushNamed(context, '/home_page'),
                    child: Text("Revenir à l'accueil"),
                  ),
                )
              ],
            ),
          );
        }),
        appBar: MyAppBar(
          title: Text("Masque validation"),
          appBar: AppBar(),
        ),
      ),
    );
  }
}
