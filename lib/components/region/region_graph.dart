import 'package:DIH4CPS_APP/models/time_series.dart';

import '../../bloc/bloc.dart';

import 'package:DIH4CPS_APP/models/measures.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraphBloc, GraphState>(builder: (context, state) {
      if (state is GraphStateEmpty) {
        return Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                state.beginText,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        );
      } else if (state is GraphStateLoadedPatient) {
        return new charts.TimeSeriesChart(state.seriesListPatient,
            animate: true,
            dateTimeFactory: const charts.LocalDateTimeFactory(),
            behaviors: [
              new charts.SeriesLegend(
                position: charts.BehaviorPosition.top,
                horizontalFirst: false,
                desiredMaxRows: 2,
                outsideJustification:
                    charts.OutsideJustification.middleDrawArea,
                entryTextStyle: charts.TextStyleSpec(fontSize: 20),
              ),
              new charts.ChartTitle(
                  "Score du sommeil pour le patient " +
                      state.idPatient.toString(),
                  behaviorPosition: charts.BehaviorPosition.bottom,
                  titleOutsideJustification: charts.OutsideJustification.start,
                  innerPadding: 18),
            ]);
      } else if (state is GraphStateLoadedRegion) {
        return new charts.TimeSeriesChart(state.seriesListScore,
            animate: true,
            dateTimeFactory: const charts.LocalDateTimeFactory(),
            behaviors: [
              new charts.SeriesLegend(
                position: charts.BehaviorPosition.top,
                horizontalFirst: false,
                desiredMaxRows: 2,
                outsideJustification:
                    charts.OutsideJustification.middleDrawArea,
                entryTextStyle: charts.TextStyleSpec(fontSize: 20),
              ),
              new charts.ChartTitle(
                  "Score du sommeil pour la région " + state.regionName,
                  behaviorPosition: charts.BehaviorPosition.bottom,
                  titleOutsideJustification: charts.OutsideJustification.start,
                  innerPadding: 18),
            ]);
      } else if (state is RegionGraphStateError) {
        return Center(
          child: Text(state.errorText),
        );
      }

      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  static List<charts.Series<TimeSeries, DateTime>> createSampleData(
    List<Measure> measuresPatient,
    List<Measure> measuresRegion,
  ) {
    List<TimeSeries> dataPatient = List<TimeSeries>();
    List<TimeSeries> dataRegion = List<TimeSeries>();

    for (int i = 0; i < measuresPatient.length; i++) {
      var graphPoint = new TimeSeries(
          measuresPatient[i].measRecordDt, measuresPatient[i].value);

      dataPatient.add(graphPoint);
    }

    for (int i = 0; i < measuresRegion.length; i++) {
      var graphPoint = new TimeSeries(
          measuresRegion[i].measRecordDt, measuresRegion[i].value);

      dataRegion.add(graphPoint);
    }

    return [
      new charts.Series<TimeSeries, DateTime>(
        id: 'Score du sommeil du patient',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeries sleepScore, _) => sleepScore.time,
        measureFn: (TimeSeries sleepScore, _) => sleepScore.value,
        data: dataPatient,
      ),
      new charts.Series<TimeSeries, DateTime>(
        id: 'Score du sommeil de la region',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeries sleepScore, _) => sleepScore.time,
        measureFn: (TimeSeries sleepScore, _) => sleepScore.value,
        data: dataRegion,
      ),
    ];
  }

  static List<charts.Series<TimeSeries, DateTime>> createSampleRegion(
      List<Measure> measuresRegion,
      List<Measure> regionsAhi,
      List<Measure> regionsCompliance,
      List<Measure> regionsLeakage) {
    List<TimeSeries> dataRegion = List<TimeSeries>();
    List<TimeSeries> dataRegionAhi = List<TimeSeries>();
    List<TimeSeries> dataLeakage = List<TimeSeries>();
    List<TimeSeries> dataCompliance = List<TimeSeries>();

    for (int i = 0; i < measuresRegion.length; i++) {
      var graphPoint = new TimeSeries(
          measuresRegion[i].measRecordDt, measuresRegion[i].value);

      dataRegion.add(graphPoint);
    }

    for (int i = 0; i < regionsAhi.length; i++) {
      var graphPoint =
          new TimeSeries(regionsAhi[i].measRecordDt, regionsAhi[i].value);

      dataRegionAhi.add(graphPoint);
    }

    for (int i = 0; i < regionsCompliance.length; i++) {
      var graphPoint = new TimeSeries(
          regionsCompliance[i].measRecordDt, regionsCompliance[i].value);

      dataCompliance.add(graphPoint);
    }

    for (int i = 0; i < regionsLeakage.length; i++) {
      var graphPoint = new TimeSeries(
          regionsLeakage[i].measRecordDt, regionsLeakage[i].value);

      dataLeakage.add(graphPoint);
    }

    return [
      new charts.Series<TimeSeries, DateTime>(
        id: 'Score du sommeil',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeries sleepScore, _) => sleepScore.time,
        measureFn: (TimeSeries sleepScore, _) => sleepScore.value,
        data: dataRegion,
      ),
      new charts.Series<TimeSeries, DateTime>(
        id: 'Fuite masque',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeries sleepScore, _) => sleepScore.time,
        measureFn: (TimeSeries sleepScore, _) => sleepScore.value,
        data: dataLeakage,
      ),
      new charts.Series<TimeSeries, DateTime>(
        id: 'Observance',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (TimeSeries sleepScore, _) => sleepScore.time,
        measureFn: (TimeSeries sleepScore, _) => sleepScore.value,
        data: dataCompliance,
      ),
      new charts.Series<TimeSeries, DateTime>(
        id: 'IAH',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (TimeSeries sleepScore, _) => sleepScore.time,
        measureFn: (TimeSeries sleepScore, _) => sleepScore.value,
        data: dataRegionAhi,
      ),
    ];
  }
}
