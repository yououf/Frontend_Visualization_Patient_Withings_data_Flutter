import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class GraphEvent extends Equatable {
  const GraphEvent();
}

class FetchGraphRegion extends GraphEvent {
  final String regionName;
  final DateTime beginDate;
  final DateTime endDate;

  const FetchGraphRegion(
      {@required this.regionName,
      @required this.beginDate,
      @required this.endDate});

  @override
  List<Object> get props => [regionName, beginDate, endDate];
}

class FetchGraphPatient extends GraphEvent {
  final int idPatient;
  final DateTime beginDate;
  final DateTime endDate;

  const FetchGraphPatient(
      {@required this.idPatient,
      @required this.beginDate,
      @required this.endDate});

  @override
  List<Object> get props => [idPatient, beginDate, endDate];
}
