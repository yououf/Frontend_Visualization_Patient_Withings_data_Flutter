import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:DIH4CPS_APP/models/region.dart';

abstract class RegionsEvent extends Equatable {
  const RegionsEvent();
}

class FetchRegions extends RegionsEvent {
  final String typeNameRegion;
  final String region;

  const FetchRegions({@required this.typeNameRegion, @required this.region});

  @override
  List<Object> get props => [typeNameRegion];
}

class ChangeRegionSelected extends RegionsEvent {
  final String region;
  final List<Region> listRegions;

  const ChangeRegionSelected(
      {@required this.region, @required this.listRegions});

  @override
  List<Object> get props => [region, listRegions];
}
