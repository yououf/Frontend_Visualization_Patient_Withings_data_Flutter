import 'package:DIH4CPS_APP/bloc/bloc.dart';
import 'package:DIH4CPS_APP/style/linde_theme.dart';
import 'package:DIH4CPS_APP/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'button_bar.dart';

class MyAppPatientDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: (MediaQuery.of(context).size.height) / 2.5,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (BuildContext context, state) {
                if (state is DashboardEmpty)
                  context
                      .watch<DashboardBloc>()
                      .add(GetDashboard(patientId: 1));
                if (state is DashboardError)
                  return Text("Erreur lors de la récupération des données");
                if (state is DashboardLoaded)
                  return Expanded(
                    child: ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: state.patientData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.patientData[index].description + ":",
                                  style: lindeDarkTextNormal,
                                ),
                                Text(
                                    state.patientData[index].valueData
                                            .toString() +
                                        " " +
                                        state.patientData[index].unity,
                                    style: lindeDarkTextNormal),
                              ],
                            ),
                          );
                        }),
                  );
                else
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
              }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyAppButtonBar(
                    takesAllSpaceAvailable: true,
                    colorLeftButton: LindeTheme.appBarColor,
                    colorRightButton: Style.validateButtonColor,
                    functionLeftButton: () =>
                        Navigator.pushNamed(context, '/patient_environment'),
                    functionRightButton: null,
                    textLeftButton: "Informations",
                    textRightButton: "Interprétation"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
