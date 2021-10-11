import 'package:charts_flutter/flutter.dart' as charts;
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class GraphState extends Equatable {
  const GraphState();

  @override
  List<Object> get props => [];
}

class GraphStateEmpty extends GraphState {
  final String beginText;

  GraphStateEmpty({@required this.beginText});

  @override
  List<Object> get props => [beginText];
}

class GraphStateLoading extends GraphState {}

class GraphStateLoadedPatient extends GraphState {
  final List<charts.Series> seriesListPatient;
  final List<charts.Series> seriesListRegion;
  final int idPatient;
  final String regionName;

  GraphStateLoadedPatient(
      {@required this.seriesListPatient,
      @required this.idPatient,
      @required this.regionName,
      @required this.seriesListRegion})
      : assert(seriesListPatient != null);

  @override
  List<Object> get props =>
      [seriesListPatient, idPatient, seriesListRegion, regionName];
}

class GraphStateLoadedRegion extends GraphState {
  final List<charts.Series> seriesListScore;
  final List<charts.Series> seriesListAhi;
  final List<charts.Series> seriesListCompliance;
  final List<charts.Series> seriesListLeakage;
  final String regionName;

  GraphStateLoadedRegion(
      {@required this.seriesListScore,
      @required this.regionName,
      @required this.seriesListAhi,
      @required this.seriesListCompliance,
      @required this.seriesListLeakage});

  @override
  List<Object> get props => [
        seriesListScore,
        regionName,
        seriesListAhi,
        seriesListCompliance,
        seriesListLeakage
      ];
}

class RegionGraphStateError extends GraphState {
  final String errorText;

  RegionGraphStateError({@required this.errorText});

  @override
  List<Object> get props => [errorText];
}
