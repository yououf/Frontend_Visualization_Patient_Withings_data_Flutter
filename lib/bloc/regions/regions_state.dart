import 'package:DIH4CPS_APP/models/region.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RegionsState extends Equatable {
  const RegionsState();

  @override
  List<Object> get props => [];
}

class RegionsEmpty extends RegionsState {}

class RegionsLoading extends RegionsState {}

class RegionsLoaded extends RegionsState {
  final List<Region> regions;
  final String nameRegion;

  RegionsLoaded({@required this.regions, @required this.nameRegion})
      : assert(regions != null);

  @override
  List<Object> get props => [regions, nameRegion];
}

class RegionsError extends RegionsState {}
