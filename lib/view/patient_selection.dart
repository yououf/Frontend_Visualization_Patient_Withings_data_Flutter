import 'package:DIH4CPS_APP/components/patient_selection_card.dart';
import 'package:DIH4CPS_APP/components/technician_trip.dart';
import 'package:DIH4CPS_APP/style/linde_theme.dart';
import 'package:DIH4CPS_APP/utils/http_requests/http_request.dart';
import 'package:flutter/material.dart';

class MyAppPatientSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            child: Text("In progress"),
          ),
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: HttpRequest.getImg(
                    'img/linde_logo/Linde_plc_wordmark_white_sRGB.png',
                    "Logo Linde")),
          ],
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAppPatientSelectionCard(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text("Tournée pour le: 21/09/2020", style: lindeDarkText),
            ),
            MyAppTechnicianTrip(),
          ],
        ),
      ),
    );
  }
}
