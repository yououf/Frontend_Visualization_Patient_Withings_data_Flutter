import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class RegionFormState extends Equatable {
  const RegionFormState();

  @override
  List<Object> get props => [];
}

class RegionFormStateEmpty extends RegionFormState {}

class RegionFormStateLoading extends RegionFormState {
  final String regionName;
  final DateTime beginDate;
  final DateTime endDate;

  const RegionFormStateLoading({this.regionName, this.endDate, this.beginDate});

  @override
  List<Object> get props => [regionName, beginDate, endDate];
}

class RegionFormStateLoaded extends RegionFormState {
  final String regionName;
  final DateTime beginDate;
  final DateTime endDate;

  const RegionFormStateLoaded(
      {@required this.regionName,
      @required this.endDate,
      @required this.beginDate});

  @override
  List<Object> get props => [regionName, beginDate, endDate];
}
