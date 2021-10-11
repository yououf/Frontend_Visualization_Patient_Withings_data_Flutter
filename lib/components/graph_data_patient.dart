import 'package:DIH4CPS_APP/components/button_bar.dart';
import 'package:DIH4CPS_APP/components/button_range_date.dart';
import 'package:DIH4CPS_APP/style/linde_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:DIH4CPS_APP/bloc/bloc.dart';

import 'package:DIH4CPS_APP/models/dih_data_patient.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyAppPatientEnvironmentGraph extends StatefulWidget {
  final String legend;
  final String dataType;
  final String unity;
  final bool hasTwoType;

  MyAppPatientEnvironmentGraph(
      {@required this.legend,
      @required this.dataType,
      @required this.unity,
      this.hasTwoType = true});

  @override
  _MyAppPatientEnvironmentGraphState createState() =>
      _MyAppPatientEnvironmentGraphState();
}

class _MyAppPatientEnvironmentGraphState
    extends State<MyAppPatientEnvironmentGraph> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: (MediaQuery.of(context).size.height) / 2.3,
        child: Card(
          child: Column(children: <Widget>[
            if (widget.hasTwoType)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyAppButtonBar(
                  buttonShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(color: Colors.black, width: 0.2)),
                  functionLeftButton: () {
                    context.read<EnvironmentalDataPatientBloc>().add(
                        GetInDoorEnvironmentalDataPatient(
                            idPatient: 1, dataType: widget.dataType));
                  },
                  functionRightButton: () {
                    context.read<EnvironmentalDataPatientBloc>().add(
                        GetOutDoorEnvironmentalDataPatient(
                            idPatient: 1, dataType: widget.dataType));
                  },
                  colorRightButton: LindeTheme.backGroundColor,
                  defaultColor: LindeTheme.backGroundColor,
                  changeColorWhenClicked: true,
                  changeColorWhenClickedAgain: false,
                  textLeftButton: "Intérieur",
                  textRightButton: "Extérieur",
                  takesAllSpaceAvailable: false,
                  spaceBetween: 0.0,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MyAppButtonRangeData(
                defaultColor: LindeTheme.test,
                buttonShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: Colors.black, width: 0.2)),
                colorLeftButton: null,
                functionLeftButton: () {
                  context.read<EnvironmentalDataPatientBloc>().add(
                      GetEnvironmentalDataPatient30Days(
                          idPatient: 1, dataType: widget.dataType));
                },
                functionMiddleButton: () {
                  context.read<EnvironmentalDataPatientBloc>().add(
                      GetEnvironmentalDataPatient90Days(
                          idPatient: 1, dataType: widget.dataType));
                },
                textMiddleButton: "3 mois",
                textLeftButton: "1 mois",
                colorMiddleButton: LindeTheme.test,
                colorRightButton: LindeTheme.test,
                functionRightButton: () {
                  context.read<EnvironmentalDataPatientBloc>().add(
                      GetEnvironmentalDataPatient180Days(
                          idPatient: 1, dataType: widget.dataType));
                },
                textRightButton: "6 mois",
              ),
            ),
            BlocBuilder<EnvironmentalDataPatientBloc,
                EnvironmentalDataPatientState>(builder: (context, state) {
              if (state is EnvironmentalDataPatientInitial) {
                context.watch<EnvironmentalDataPatientBloc>().add(
                    GetInDoorEnvironmentalDataPatient(
                        idPatient: 1, dataType: widget.dataType));
              }

              if (state is EnvironmentalDataPatientLoaded)
                return Expanded(
                  child: SfCartesianChart(
                      primaryYAxis:
                          NumericAxis(rangePadding: ChartRangePadding.round),
                      zoomPanBehavior: ZoomPanBehavior(
                          // Enables pinch zooming
                          enableDoubleTapZooming: true,
                          enablePinching: true),
                      primaryXAxis: DateTimeAxis(),
                      // Enable legend
                      legend: Legend(
                        position: LegendPosition.bottom,
                        isVisible: true,
                        // Border color and border width of legend
                      ),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<DataPatient, DateTime>>[
                        LineSeries<DataPatient, DateTime>(
                            name: widget.legend,
                            dataSource: state.listData,
                            xValueMapper: (DataPatient data, _) =>
                                data.measureDate,
                            yValueMapper: (DataPatient data, _) =>
                                data.valueData,
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: false))
                      ]),
                );

              if (state is EnvironmentalDataPatientLoading)
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CircularProgressIndicator(),
                );
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Erreur lors du chargement des données",
                  style: lindeNormalText,
                  textAlign: TextAlign.center,
                ),
              );
            }),
          ]),
        ),
      ),
    );
  }
}
