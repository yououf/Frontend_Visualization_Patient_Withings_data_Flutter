import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegionFormEvent extends Equatable {
  const RegionFormEvent();
}

class AddElement extends RegionFormEvent {
  final String regionName;
  final DateTime beginDate;
  final DateTime endDate;

  const AddElement({this.regionName, this.beginDate, this.endDate});

  @override
  List<Object> get props => [];
}

class FormValidated extends RegionFormEvent {
  final String regionName;
  final DateTime beginDate;
  final DateTime endDate;

  const FormValidated(
      {@required this.regionName,
      @required this.beginDate,
      @required this.endDate});

  @override
  List<Object> get props => [regionName, beginDate, endDate];
}
