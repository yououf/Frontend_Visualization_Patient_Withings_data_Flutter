import 'package:DIH4CPS_APP/models/region.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RegionsZipCodesState extends Equatable {
  const RegionsZipCodesState();

  @override
  List<Object> get props => [];
}

class RegionsZipCodesStateEmpty extends RegionsZipCodesState {}

class RegionsZipCodesStateLoading extends RegionsZipCodesState {}

class RegionsZipCodesStatesLoaded extends RegionsZipCodesState {
  final List<RegionZipCodesIdName> regionZipCodesIdName;
  final String typeName;

  RegionsZipCodesStatesLoaded(
      {@required this.regionZipCodesIdName, @required this.typeName})
      : assert(regionZipCodesIdName != null);

  @override
  List<Object> get props => [regionZipCodesIdName, typeName];
}

class RegionsZipCodesStatesError extends RegionsZipCodesState {}
