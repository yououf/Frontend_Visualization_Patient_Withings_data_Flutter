import 'package:DIH4CPS_APP/bloc/bloc.dart';
import 'package:DIH4CPS_APP/models/measures.dart';
import 'package:DIH4CPS_APP/style/linde_theme.dart';
import 'package:flutter/material.dart';
import 'package:DIH4CPS_APP/components/button_range_date.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyAppPpcDataGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: (MediaQuery.of(context).size.height) / 2.1,
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyAppButtonRangeData(
                  colorMiddleButton: LindeTheme.backGroundColor,
                  colorRightButton: LindeTheme.backGroundColor,
                  defaultColor: LindeTheme.test,
                  buttonShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(color: Colors.black, width: 0.2)),
                  colorLeftButton: null,
                  textLeftButton: "Observance",
                  textMiddleButton: "IAH",
                  textRightButton: "Fuite",
                  functionLeftButton: () => context
                      .read<PpcDataBloc>()
                      .add(GetCompliance(idPatient: 22599)),
                  functionMiddleButton: () =>
                      context.read<PpcDataBloc>().add(GetIAH(idPatient: 22599)),
                  functionRightButton: () => context
                      .read<PpcDataBloc>()
                      .add(GetLeakage(idPatient: 22599)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyAppButtonRangeData(
                  colorMiddleButton: LindeTheme.test,
                  colorRightButton: LindeTheme.test,
                  defaultColor: LindeTheme.test,
                  buttonShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(color: Colors.black, width: 0.2)),
                  colorLeftButton: null,
                  textLeftButton: "7 jours",
                  textMiddleButton: "30 jours",
                  textRightButton: "90 jours",
                  functionLeftButton: () => context
                      .read<PpcDataBloc>()
                      .add(GetPPCDataPatient7Days(idPatient: 22599)),
                  functionMiddleButton: () => context
                      .read<PpcDataBloc>()
                      .add(GetPPCDataPatient30Days(idPatient: 22599)),
                  functionRightButton: () => context
                      .read<PpcDataBloc>()
                      .add(GetPPCDataPatient90Days(idPatient: 22599)),
                ),
              ),
              BlocBuilder<PpcDataBloc, PpcDataState>(builder: (context, state) {
                if (state is PpcDataInitial) {
                  context
                      .watch<PpcDataBloc>()
                      .add(GetCompliance(idPatient: 22599));
                }
                if (state is PpcDataLoading) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (state is PpcDataLoaded) {
                  return Expanded(
                    child: SfCartesianChart(
                        trackballBehavior: TrackballBehavior(
                            // Enables the trackball
                            enable: true,
                            tooltipSettings: InteractiveTooltip(
                                enable: true, color: Colors.red)),
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
                        series: <ChartSeries<Measure, DateTime>>[
                          LineSeries<Measure, DateTime>(
                              name: state.dataType,
                              dataSource: state.listMeasure,
                              xValueMapper: (Measure data, _) =>
                                  data.measRecordDt,
                              yValueMapper: (Measure data, _) => data.value,
                              // Enable data label
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: false))
                        ]),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Erreur lors de l'affichage du graphe",textAlign: TextAlign.center,)),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
