// import 'package:DIH4CPS_APP/models/dih_data_patient.dart';
// import 'package:DIH4CPS_APP/models/time_series.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// List<charts.Series<TimeSeries, DateTime>> getListSeries(
//     List<List<DataPatient>> listMeasure, List<String> legends) {
//   List<List<TimeSeries>> listTimeSeries =
//       new List<List<TimeSeries>>(listMeasure.length);

//   List<charts.Series<TimeSeries, DateTime>> listGraph =
//       new List<charts.Series<TimeSeries, DateTime>>();

//   for (int i = 0; i < listMeasure.length; i++) {
//     listTimeSeries[i] = new List<TimeSeries>();

//     for (int j = 0; j < listMeasure[i].length; j++) {
//       var graphPoint = new TimeSeries(
//           DateTime.parse(listMeasure[i][j].measureDate),
//           listMeasure[i][j].valueData);
//       listTimeSeries[i].add(graphPoint);
//     }

//     listGraph.add(charts.Series<TimeSeries, DateTime>(
//       id: legends[i],
//       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//       domainFn: (TimeSeries sleepScore, _) => sleepScore.time,
//       measureFn: (TimeSeries sleepScore, _) => sleepScore.value,
//       data: listTimeSeries[i],
//     ));
//   }

//   return listGraph;
// }
